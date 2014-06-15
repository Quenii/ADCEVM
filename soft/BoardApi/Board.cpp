#include <windows.h>
#include <qmath.h>
#include <vector>
#include <Dbt.h>
#include <QDebug>
#include <QString>
#include <QEvent>
#include <QList>
#include <QTimer>
#include <QThread>

#include "CyAPI.h"
#include "Board.h"

#pragma comment(lib, "CyAPI.lib")
#ifdef _DEBUG
	#pragma comment(lib, "qtmaind.lib") 
	#pragma comment(lib, "QtCored4.lib")
	#pragma comment(lib, "QtGuid4.lib")
#else
	#pragma comment(lib, "qtmain.lib") 
	#pragma comment(lib, "QtCore4.lib")
	#pragma comment(lib, "QtGui4.lib")
#endif

using namespace std;


class QThreadL : public QThread
{
public:
	static void msleep (unsigned long msecs)
	{
		QThread::msleep(msecs);
	}
};

static void msleep (unsigned long msecs)
{
	QThreadL::msleep(msecs);
}


class DummyWidget : public QWidget
{
	Q_OBJECT

public:
	DummyWidget(QWidget* parent = 0, Qt::WindowFlags f = 0 );

protected:
	bool winEvent(MSG * message, long * result);

signals:
	void devChanged();

private:
	bool bPnP_Arrival;
	bool bPnP_DevNodeChange;
	bool bPnP_Removal;
};

#include "Board.moc"

DummyWidget::DummyWidget(QWidget* parent /*= 0*/, Qt::WindowFlags f /*= 0*/ ) : QWidget(parent, f) 
{
	bPnP_Arrival = false;
	bPnP_DevNodeChange = false;
	bPnP_Removal = false;
	QTimer::singleShot(0, this, SIGNAL(devChanged()));	
}

bool DummyWidget::winEvent(MSG * message, long * result)
{	
	if (message->message == WM_DEVICECHANGE) {
		// Tracks DBT_DEVICEARRIVAL followed by DBT_DEVNODES_CHANGED
		if (message->wParam == DBT_DEVICEARRIVAL) {
			bPnP_Arrival = true;
			bPnP_DevNodeChange = false;
		}
		// Tracks DBT_DEVNODES_CHANGED followed by DBT_DEVICEREMOVECOMPLETE
		if (message->wParam == DBT_DEVNODES_CHANGED) {
			bPnP_DevNodeChange = true;
			bPnP_Removal = false;
		}
		if (message->wParam == DBT_DEVICEREMOVECOMPLETE) {
			bPnP_Removal = true;
			PDEV_BROADCAST_HDR bcastHdr = (PDEV_BROADCAST_HDR) message->lParam;
			if (bcastHdr->dbch_devicetype == DBT_DEVTYP_HANDLE) {
				PDEV_BROADCAST_HANDLE pDev = (PDEV_BROADCAST_HANDLE) message->lParam;
				/*if (pDev->dbch_handle == USBDevice->DeviceHandle())
				USBDevice->Close();*/
			}
		}
		// If DBT_DEVNODES_CHANGED followed by DBT_DEVICEREMOVECOMPLETE
		if (bPnP_Removal && bPnP_DevNodeChange) {
			//Sleep(10);
			//DisplayDevices();
			bPnP_Removal = false;
			bPnP_DevNodeChange = false;
			//msleep(10);
			emit devChanged();
		}
		// If DBT_DEVICEARRIVAL followed by DBT_DEVNODES_CHANGED
		if (bPnP_DevNodeChange && bPnP_Arrival) {
			//DisplayDevices();
			bPnP_Arrival = false;
			bPnP_DevNodeChange = false;
			emit devChanged();
		}
	}
	return false;
}

Board::Board(QObject* parent /* = 0 */) 
: QObject(parent)
, pi(3.141592653589793f)
, usbDev(0)
{
	widget = new DummyWidget();
	bool okay = connect(widget, SIGNAL(devChanged()), this, SLOT(devChanged()));
	Q_ASSERT(okay);
	usbDev = new CCyUSBDevice((HANDLE)(widget->winId()));
}

Board::~Board()
{
	if (usbDev)
	{
		delete usbDev;
		usbDev = 0;
	}

	if (widget)
	{
		delete widget;
		widget = 0;
	}
}

void Board::devChanged()
{
	QList<BoardInfo> devList;
	if (!(usbDev->DeviceCount()))
	{
		devList.clear();
	}
	for (int i = 0; i < usbDev->DeviceCount(); ++i)
	{
		if (usbDev->Open(i))
		{
			BoardInfo info;
			info.usbAddr = i;
			info.devName = QString(usbDev->DeviceName);
			info.infName = QString(usbDev->FriendlyName);
			devList.push_back(info);
		}
	}

	emit devListChanged(devList);
}


bool Board::open(int usbAddr)
{	
	if (!(usbDev && usbDev->Open((UCHAR)usbAddr)))
		return false;

	initAdcDac();

	return true;
}

void Board::close()
{
	if (usbDev && usbDev->IsOpen())
	{
		usbDev->Close();
	}
}

bool Board::isOpen()
{
	return (usbDev && usbDev->IsOpen()) ? true : false;
}

bool Board::writeIOCmd(unsigned short addr, bool dirRead, unsigned short data, bool reg)
{	
	if (! usbDev->BulkOutEndPt)
		return false;

	if (bulkIOBuff.size() < 4) bulkIOBuff.resize(4);

	bulkIOBuff[0] = 0xbc95;
	bulkIOBuff[1] = reg ? (0x8000 | addr) : (0x7FFF & addr);  //reg_soace = 1; low is addr;
	bulkIOBuff[2] = dirRead ?  (0x8000 | data) : (0x7FFF & data);  
	bulkIOBuff[3] = data;
	long llen = 4 * sizeof(unsigned short);
	if (!usbDev->BulkOutEndPt->XferData((UCHAR*)&bulkIOBuff[0], llen))
		return false;

	return true;
}

bool Board::writeReg(unsigned short addr, unsigned short val)
{
	if (writeIOCmd(addr, false, val))
		return true;
	else
		return false;
}
bool readSpi(unsigned short addr,unsigned short& val)
{
	return true;
}
bool writeSpi(unsigned short addr,unsigned short val)
{
	return true;
}
bool Board::readReg(unsigned short addr, unsigned short &val)
{
	if ((!usbDev->BulkInEndPt) || (!usbDev->BulkOutEndPt))
		return false;

	long b2Read = packet_size * 2;
	long w2Read = packet_size;
	if (bulkIOBuff.size() < w2Read) bulkIOBuff.resize(w2Read);

	if (!writeIOCmd(addr, true, w2Read))
		return false;

	long bRead = b2Read;
	if (!usbDev->BulkInEndPt->XferData((unsigned char*)&bulkIOBuff[0], bRead))
		return false;

	if (b2Read != bRead)
		return false;
	val = bulkIOBuff[0];
	return true;
}

bool Board::readPacket(unsigned short addr, unsigned short *buf)
{
	if ((!usbDev->BulkInEndPt) || (!usbDev->BulkOutEndPt))
		return false;

	long b2Read = packet_size * 2;
	long w2Read = packet_size;
	if (bulkIOBuff.size() < w2Read) bulkIOBuff.resize(w2Read);

	if (!writeIOCmd(addr, true, w2Read, false))
		return false;

	long bRead = b2Read;
	if (!usbDev->BulkInEndPt->XferData((unsigned char*)&bulkIOBuff[0], bRead))
		return false;

	if (b2Read != bRead)
		return false;
	memcpy(buf, &bulkIOBuff[0], b2Read);
	return true;
}

bool Board::read(unsigned short addr, unsigned short *buf, unsigned int len)
{	
	long b2Read = (len * sizeof(unsigned short) + 511) / 512 * 512;
	long w2Read = b2Read / 2;
	long p2Read = b2Read / 512;
	if (bulkIOBuff.size() < w2Read) bulkIOBuff.resize(w2Read);

	for (int i=0; i<p2Read; ++i)
	{	
		writeReg(addr+1, packet_size);
		readPacket(addr, buf+i*packet_size);
	}

	return true;
}

bool Board::initAdcDac()
{
	writeReg(DAC_BASE+1, 0x60); //init ltc2656, Select Internal Reference (Power-Up Reference)
	writeReg(DAC_BASE, 0);
	msleep(10);

	writeReg(ADC_BASE, 0xA000); //init
	msleep(10);
	writeReg(ADC_BASE, 0xA204); //short conversion, binary, internal clock, internal reference
	msleep(10);

	return true;
}
bool Board::setDacValue(unsigned short ch, unsigned short val)
{
	unsigned short reg = 0;
	reg = 0 | 0x30 | (ch & 0xF);
	writeReg(DAC_BASE+1, reg);
	writeReg(DAC_BASE, val);
	msleep(10);
	return true;
}
bool Board::adcValue(unsigned short ch, unsigned short &val)
{
	writeReg(ADC_BASE, ch<<12);
	writeReg(ADC_BASE, ch<<12);
	msleep(10);
	readReg(ADC_BASE, val);	
	msleep(10);
	return true;
}
float Board::voltage(unsigned short ch)
{
	unsigned short reg = 0;
	adcValue(ch, reg);
	return (float)reg / (1<<16) * 4.0 * 2.0;
}

float Board::current(unsigned short ch)
{
	unsigned short reg = 0;
	adcValue(ch, reg);
	return (float)reg / (1<<16) * 4.0 * 1000; //in mA
}
int Board::setVoltage(int adcChannel, int dacChannel, float v)
{
	int fine = 256;
	int coarse = 32;
	int regValue;
	int i;
	for (i=coarse; i>0; --i)
	{
		regValue = i*65535/coarse;
		setDacValue(dacChannel, regValue);
		msleep(1);
		float t = voltage(adcChannel);
		qDebug() << "Coarse: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
		if (t >= v)
			break;
	}
	for (int j=i*fine/coarse; j<fine; ++j)
	{
		regValue = j*65535/fine;
		setDacValue(dacChannel, regValue);
		msleep(1);
		float t = voltage(adcChannel);
		qDebug() << "Fine: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
		if ( abs(t - v) <= 0.02)
			break;
	}
	return regValue;

}
float Board::frequency(void)
{
	unsigned short val;
	readReg(FREQ_REG, val);	

	return val*4096;

}

//bool Board::write(unsigned short addr, const unsigned short *buf, unsigned int len)
//{	
//	//FOR DAC DYNAMIC TEST
//	if (! usbDev->BulkOutEndPt)
//		return false;
//
//	if (bulkIOBuff.size() < len*4 ) bulkIOBuff.resize(len*4);
//
//	for (int i=0; i<len; ++i)
//	{
//		bulkIOBuff[4*i+0] = 0xbc95;
//		bulkIOBuff[4*i+1] = addr;
//		bulkIOBuff[4*i+2] = 0x00FF;
//		bulkIOBuff[4*i+3] = buf[i];
//	}
//	long llen = len * 4 * sizeof(unsigned short);
//	if (!usbDev->BulkOutEndPt->XferData((UCHAR*)&bulkIOBuff[0], llen))
//		return false;
//
//	return true;
//}

//bool Board::readReg24b(unsigned short addr,unsigned short& val)
//{
//	unsigned short w1 = (addr & 0xFF) << 8;
//	unsigned short w2 = (addr & 0xFF00) >> 8 | 0x80;
//	unsigned short r;
//	if (!writeReg(0x1002, w1))
//		return false;
//
//	msleep(100);
//
//	if (!writeReg(0x1003, w2))
//		return false;
//
//	msleep(300);
//
//	readReg(0x1002, val);
//
//	return 	true;
//}
//
//bool Board::writeReg24b(unsigned short addr,unsigned short val)
//{
//	unsigned short w1 = ((addr & 0xFF) << 8) | (val & 0xFF);
//	unsigned short w2 = (addr & 0xFF00) >> 8;
//	return (writeReg(0x1002, w1)  && writeReg(0x1003, w2));
//}
//
//unsigned short Board::getAdcData(unsigned short ch)
//{
//	const int ADC_ADDR = 9;
//	const int cnt = 5;
//	unsigned short regs[cnt] = {0};
//	unsigned short min = 0xffff;
//	unsigned short max = 0;
//	int sum = 0;
//
//	writeReg(ADC_ADDR, 0xA204);  //select 3548, work at default mode
//	writeReg(ADC_ADDR, 0xA400);  //select 3548, work at default mode
//
//	writeReg(ADC_ADDR, 0xb000);  //select 3548, read out 7th channel volage
//	readReg(ADC_ADDR, regs[0]);
//
//	do 
//	{
//		writeReg(ADC_ADDR, ch<<12);  //select 3548, select 7th channel
//		writeReg(ADC_ADDR, ch<<12);  //select 3548, select 7th channel
//		writeReg(ADC_ADDR, 0xe000);  //select 3548, read out 7th channel volage
//		writeReg(ADC_ADDR, 0xe000);  //select 3548, read out 7th channel volage
//		readReg(ADC_ADDR, regs[0]);
//		msleep(30);
//	} while (regs[0] == 0xFFFF);
//
//	for (int i=0; i<cnt; ++i)
//	{
//		writeReg(9, ch);  //select 3548, select 7th channel
//		writeReg(9, ch);  //select 3548, select 7th channel
//		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
//		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
//		readReg(0x0009, regs[i]);
//		if (regs[i] >= 0xfff0)
//		{
//			msleep(30);
//			qDebug() << "Bizarre valued!" << endl;
//		}
//		sum += regs[i];
//		min = regs[i] < min ? regs[i] : min;
//		max = regs[i] > max ? regs[i] : max;
//	}
//	sum = sum - min - max;
//	return unsigned short(sum/(cnt-2));
//}
//
//float Board::getVoltage(unsigned short ch)
//{
//	unsigned short reg = 0;
//	reg = getAdcData(ch);
//	return (float(reg>>2)) * 4 / 16384;
//}
//
//float Board::getCurrent(unsigned short ch)
//{
//	unsigned short reg = 0;
//	reg = getAdcData(ch);
//	return (float(reg>>2)) * 500 * 4 / 16384;
//}
//

