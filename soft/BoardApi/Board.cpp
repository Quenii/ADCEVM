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

bool Board::read(unsigned short addr, unsigned short *buf, unsigned int len)
{	
	if (! usbDev->BulkOutEndPt)
		return false;

	long b2Read = (len * sizeof(unsigned short) + 511) / 512 * 512;
	long w2Read = b2Read / 2;
	if (bulkIOBuff.size() < w2Read) bulkIOBuff.resize(w2Read);

	if (!writeIOCmd(addr, true, w2Read))
	{
		return false;
	}

	long bRead = b2Read;
	if (!usbDev->BulkInEndPt->XferData((unsigned char*)&bulkIOBuff[0], bRead))
		return false;

	if (b2Read != bRead)
	{
		return false;
	}

	memcpy(buf, &bulkIOBuff[0], len * sizeof(unsigned short));

	return true;
}

bool Board::write(unsigned short addr, const unsigned short *buf, unsigned int len)
{	
	//FOR DAC DYNAMIC TEST
	if (! usbDev->BulkOutEndPt)
		return false;

	if (bulkIOBuff.size() < len*4 ) bulkIOBuff.resize(len*4);

	for (int i=0; i<len; ++i)
	{
		bulkIOBuff[4*i+0] = 0xbc95;
		bulkIOBuff[4*i+1] = addr;
		bulkIOBuff[4*i+2] = 0x00FF;
		bulkIOBuff[4*i+3] = buf[i];
	}
	long llen = len * 4 * sizeof(unsigned short);
	if (!usbDev->BulkOutEndPt->XferData((UCHAR*)&bulkIOBuff[0], llen))
		return false;

	return true;
}
bool Board::writeIOCmd(unsigned short addr, bool dirRead, unsigned short data)
{	
	if (! usbDev->BulkOutEndPt)
		return false;

	if (bulkIOBuff.size() < 4) bulkIOBuff.resize(4);

	bulkIOBuff[0] = 0xbc95;
	bulkIOBuff[1] = addr;
	bulkIOBuff[2] = dirRead ?  0xFF00 : 0x00FF;
	bulkIOBuff[3] = data;
	long llen = 4 * sizeof(unsigned short);
	if (!usbDev->BulkOutEndPt->XferData((UCHAR*)&bulkIOBuff[0], llen))
		return false;

	return true;
}

bool Board::readReg(unsigned short addr, unsigned short &val)
{
	static unsigned short temp[1024];

	if ( !read(addr, temp, 1024) )
	{
		return false;
	}
	val = temp[0];
	return true;
}

bool Board::writeReg(unsigned short addr, unsigned short val)
{
	if (!writeIOCmd(addr, false, val))
	{
		return false;
	}

	return true;
}

bool Board::readReg24b(unsigned short addr,unsigned short& val)
{
	unsigned short w1 = (addr & 0xFF) << 8;
	unsigned short w2 = (addr & 0xFF00) >> 8 | 0x80;
	unsigned short r;
	if (!writeReg(0x1002, w1))
		return false;

	msleep(100);

	if (!writeReg(0x1003, w2))
		return false;

	msleep(300);

	readReg(0x1002, val);

	return 	true;
}

bool Board::writeReg24b(unsigned short addr,unsigned short val)
{
	unsigned short w1 = ((addr & 0xFF) << 8) | (val & 0xFF);
	unsigned short w2 = (addr & 0xFF00) >> 8;
	return (writeReg(0x1002, w1)  && writeReg(0x1003, w2));
}

unsigned short Board::getAdcData(unsigned short ch)
{
	const int cnt = 5;
	unsigned short regs[cnt] = {0};
	unsigned short min = 0xffff;
	unsigned short max = 0;
	int sum = 0;

	writeReg(9, 0xA400);  //select 3548, work at default mode
	writeReg(9, 0xA400);  //select 3548, work at default mode
	do 
	{
		writeReg(9, ch);  //select 3548, select 7th channel
		writeReg(9, ch);  //select 3548, select 7th channel
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
		readReg(0x0009, regs[0]);
		msleep(30);
	} while (regs[0] == 0xFFFF);

	for (int i=0; i<cnt; ++i)
	{
		writeReg(9, ch);  //select 3548, select 7th channel
		writeReg(9, ch);  //select 3548, select 7th channel
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
		readReg(0x0009, regs[i]);
		if (regs[i] >= 0xfff0)
		{
			msleep(30);
			qDebug() << "Bizarre valued!" << endl;
		}
		sum += regs[i];
		min = regs[i] < min ? regs[i] : min;
		max = regs[i] > max ? regs[i] : max;
	}
	sum = sum - min - max;
	return unsigned short(sum/(cnt-2));
}

float Board::getVoltage(unsigned short ch)
{
	unsigned short reg = 0;
	reg = getAdcData(ch);
	return (float(reg>>2)) * 4 / 16384;
}

float Board::getCurrent(unsigned short ch)
{
	unsigned short reg = 0;
	reg = getAdcData(ch);
	return (float(reg>>2)) * 500 * 4 / 16384;
}

int Board::setVoltage(int adcChannel, int dacChannel, float v)
{
	int fine = 800;
	int coarse = 60;
	int regValue;
	int i;
	for (int i=0; i<10; ++i)
	{
		if (!writeReg(5, 32768))
			return false;
		if (!writeReg(6, dacChannel))  //执行 通道A
			return false;
	}
	for (i=coarse; i>0; --i)
	{
		regValue = i*65535/coarse;
		if (!writeReg(5, regValue))
			return false;
		if (!writeReg(6, dacChannel))  //执行 通道A
			return false;
		msleep(1);
		float t = getVoltage(adcChannel);
		qDebug() << "Coarse: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
		if (t >= v)
			break;
	}
	for (int j=i*fine/coarse; j<fine; ++j)
	{
		regValue = j*65535/fine;
		if (!writeReg(5, regValue))
			return false;
		if (!writeReg(6, dacChannel))  //执行 通道A
			return false;
		msleep(1);
		float t = getVoltage(adcChannel);
		qDebug() << "Fine: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
		if ( abs(t - v) <= 0.005)
			break;
	}
	return regValue;

}
