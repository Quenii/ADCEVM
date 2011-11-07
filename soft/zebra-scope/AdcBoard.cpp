#include <windows.h>
#include <qmath.h>
#include <vector>
#include <Dbt.h>
#include <QDebug>
#include <QString>
#include <QEvent>
#include <QList>
#include <QTimer>
#include <QSettings>
#include <QApplication>
#include <QDir>

#include "AdcBoard.hpp"
#include "CyAPI.h"
#include "gkhy/mfcminus/Win32App.hpp"
#include "QZebraScopeSettings.h"
#include "QZebraScopeSettings.h"

#ifdef _DEBUG
#endif // _DEBUG

#if defined(MATLAB)    //defined in AdcBoardTypes.hpp
#include "libalgo_wrapper.h"
#elif defined(MATCOM)
#include "libalgo_wrapper.h"
#else
#endif // MATLAB

#pragma comment(lib, "CyAPI.lib")

using namespace std;


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
			//gkhy::MfcMinus::Win32App::sleep(10);
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

AdcBoard* AdcBoard::_inst = 0;
AdcBoard::AdcBoard(QObject* parent /* = 0 */) 
: QObject(parent)
, pi(3.141592653589793f)
, m_timerIdDyn(0)
, m_timerIdPower(0)
{
	widget = new DummyWidget();
	bool okay = connect(widget, SIGNAL(devChanged()), this, SLOT(devChanged()));
	Q_ASSERT(okay);
	usbDev = new CCyUSBDevice((HANDLE)(widget->winId()));

	//m_settings.beginGroup("AdcBoard");

	QZebraScopeSettings settings;
	settings.adcSettings(m_adcSettings);
	settings.signalSettings(m_signalSettings);

	//setAdcSettings(m_adcSettings);
	//setSignalSettings(m_signalSettings);

	if (!m_timerIdPower)
	{
		m_timerIdPower = startTimer(2000);
	}
}

AdcBoard::~AdcBoard()
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

bool AdcBoard::isRunning()
{
	return m_timerIdDyn ? true : false;
}

void AdcBoard::setDynamicOn(bool on /* = true */)
{
	if (on && !m_timerIdDyn)
	{
		m_timerIdDyn = startTimer(500);
	}

	if (!on && m_timerIdDyn)
	{
		killTimer(m_timerIdDyn);
		m_timerIdDyn = 0;
	}
}

void AdcBoard::devChanged()
{
	QList<AdcBoardInfo> devList;
	if (!(usbDev->DeviceCount()))
	{
		devList.clear();
	}
	for (int i = 0; i < usbDev->DeviceCount(); ++i)
	{
		if (usbDev->Open(i))
		{
			AdcBoardInfo info;
			info.usbAddr = i;
			info.devName = QString(usbDev->DeviceName);
			info.infName = QString(usbDev->FriendlyName);
			devList.push_back(info);
		}
	}

	emit devListChanged(devList);
}

bool AdcBoard::open(int usbAddr)
{
	return usbDev->Open((UCHAR)usbAddr);
}

bool AdcBoard::read(unsigned short addr, unsigned short *buf, unsigned int len)
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

bool AdcBoard::write(unsigned short addr, unsigned short *buf, unsigned int len)
{	
	if (! usbDev->BulkOutEndPt)
		return false;

	if (bulkIOBuff.size() < len) bulkIOBuff.resize(len);
	float max = (1 << (m_adcSettings.bitcount - 1));

	float fs = m_signalSettings.clockFreq;
	float fc = m_signalSettings.signalFreq;

	for (int i=0; i<len/4; ++i)
	{
		bulkIOBuff[4*i+0] = 0xbc95;
		bulkIOBuff[4*i+1] = addr;
		bulkIOBuff[4*i+2] = 0x00FF;
		bulkIOBuff[4*i+3] = ((short)((qSin(2*pi*i*fc/fs)+1)*max));
	}
	long llen = len * sizeof(unsigned short);
	if (!usbDev->BulkOutEndPt->XferData((UCHAR*)&bulkIOBuff[0], llen))
		return false;

	return true;
}

bool AdcBoard::writeIOCmd(unsigned short addr, bool dirRead, unsigned short data)
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

bool AdcBoard::readReg(unsigned short addr, unsigned short &val)
{
	static unsigned short temp[1024];

	if ( !read(addr, temp, 1024) )
	{
		return false;
	}
	val = temp[0];
	return true;
}

bool AdcBoard::writeReg(unsigned short addr, unsigned short val)
{
	if (!writeIOCmd(addr, false, val))
	{
		return false;
	}

	return true;
}

bool AdcBoard::readReg24b(unsigned short addr,unsigned short& val)
{
	unsigned short w1 = (addr & 0xFF) << 8;
	unsigned short w2 = (addr & 0xFF00) >> 8 | 0x80;
	unsigned short r;
	if (!writeReg(0x1002, w1))
		return false;

	gkhy::MfcMinus::Win32App::sleep(100);

	if (!writeReg(0x1003, w2))
		return false;

	gkhy::MfcMinus::Win32App::sleep(300);

	unsigned short temp[1024];

	memset(temp, 0, sizeof(temp));
	if ( !read(0x1002, temp, 1024)  )
	{
		return false;
	}
	val = temp[0];

	return 	true;
}

bool AdcBoard::writeReg24b(unsigned short addr,unsigned short val)
{
	unsigned short w1 = ((addr & 0xFF) << 8) | (val & 0xFF);
	unsigned short w2 = (addr & 0xFF00) >> 8;
	return (writeReg(0x1002, w1)  && writeReg(0x1003, w2));
}

void AdcBoard::changeSampleRate(uint sampleFreq)
{

}

bool AdcBoard::clocked()
{
	static unsigned short watchdog;
	unsigned short t = 0;
	writeReg(0x2001, 0);
	readReg(0x2001, t);
	if(t && (t - watchdog))
	{
		return true;
	}
	
	return false;

}

void AdcBoard::timerEvent(QTimerEvent* event)
{
	//setAdcSettings(m_adcSettings);
	clocked();
	if (event->timerId() == m_timerIdPower)
	{
		PowerStatus& powerStatus = report.powerStatus;
		this->powerStatus(powerStatus);
		emit boardReport(report);
		return;
	}

	TimeDomainReport& tdReport = report.tdReport;

	float vpp = m_adcSettings.vpp;
	float max = (1 << (m_adcSettings.bitcount - 1));



	if (usbDev->IsOpen() && (usbDev->DeviceCount())/* && clocked() */)
	{
		writeReg(0x2002, 0);
		if (buff.size() < buffer_cnt)
			buff.resize(buffer_cnt);
		writeReg(0xFFFF, 0x0001);  //reset
		writeReg(0xFFFF, 0x0000);  //dereset
		//buff[512] = {0x0032};
		writeReg(0x1004, 0xFFFF);  //stor 1M
		Sleep(200);	

		unsigned short* p = &buff[0];
		bool okay = read(0x1005, &buff[0], buffer_cnt);
		Q_ASSERT(okay);
		okay = read(0x1005, &buff[0], buffer_cnt);
		Q_ASSERT(okay);
		Convert(tdReport, max, vpp);
	}
	else
	{
#ifdef _DEBUG

		float fs = m_signalSettings.clockFreq;
		float fc = m_signalSettings.signalFreq;
		

		int offset = rand();
		tdReport.samples.resize(buffer_cnt);
		tdReport.rawSamples.resize(tdReport.samples.size());
		for (int i = 0; i < tdReport.samples.size(); ++i)
		{
			tdReport.samples[i] = ((int)(qSin(2*pi*i*fc/fs+offset)*max))*vpp/max;
			tdReport.rawSamples[i] = ((int)(qSin(2*pi*i*fc/fs+offset)*max));
		}
#endif //_DEBUG
	}

	float fmin = vpp;
	float fmax = -vpp;
	for (int i = 0; i < tdReport.samples.size(); ++i )
	{
		float f = tdReport.samples[i];
		fmin = min(fmin, f);
		fmax = max(fmax, f);
	}

	tdReport.max = fmax;
	tdReport.min = fmin;

	FreqDomainReport& fdReport = report.fdReport;

	fdReport.Spectrum.resize(buffer_cnt/2);

#if defined(MATLAB) 
	calc_dynam_params(tdReport.samples, m_adcSettings.bitcount, fdReport);

#elif defined(MATCOM) 
	calc_dynam_params(tdReport.samples, m_adcSettings.bitcount, fdReport, m_adcSettings.vpp);
	

#else
	memcpy( &fdReport.Spectrum[0], &tdReport.samples[0], buffer_cnt/2);

#endif // MATLAB

	emit boardReport(report);
}
void AdcBoard::Convert(TimeDomainReport& tdReport, float max, float vpp)
{
	if (tdReport.samples.size()<buff.size())
	{
		tdReport.samples.resize(buff.size());
	}
	if (tdReport.rawSamples.size() != buff.size())
	{
		tdReport.rawSamples.resize(buff.size());
	}

	for (int i = 0; i < tdReport.samples.size(); ++i)
	{
		int t = 16-m_adcSettings.bitcount;

		if (m_adcSettings.coding == AdcCodingOffset)
		{
			buff[i] = buff[i] ^ 0x8000;
		}
		else if (m_adcSettings.coding == AdcCodingComplement)
		{
		}
		else
		{
			Q_ASSERT(false);
		}

		tdReport.samples[i] = short(buff[i]) * vpp / max / (1<<t);
		tdReport.rawSamples[i] = buff[i]; /* buff[i] >>t; */
	}
}

bool AdcBoard::setAdcSettings(const AdcSettings& adcSettings)
{	
	float vio = adcSettings.vd;
	unsigned short reg = 0;

	writeReg(9, 0xA400);  //select 3548, work at default mode
	writeReg(9, 0xA400);  //select 3548, work at default mode

	unsigned short regValue = setVoltage(0x3FFF, 0, adcSettings.vd);
	setVoltage(0x7FFF, 2, adcSettings.va);

	if (!writeReg(5, regValue)) //设置VIO = VD
		return false;
	if (!writeReg(6, 0x0004))  //执行 通道E
		return false;

	if (!writeReg(0xFFFF, 0xFFFF))  //reset
		return false;
	gkhy::MfcMinus::Win32App::sleep(10);

	if (!writeReg(0xFFFF, 0x0000))  //dereset
		return false;
	gkhy::MfcMinus::Win32App::sleep(200);

	//writeReg(0x1000, 0x000C);  //jad14p1 reset
	//gkhy::MfcMinus::Win32App::sleep(200);

	//writeReg(0x1000, 0x0003);

	if (!writeReg(0x1000, 0x000D)) return false;
	if (!writeReg(0x1000, 0x000C)) return false;  //jad14p1  reset
	gkhy::MfcMinus::Win32App::sleep(2);

	if (!writeReg(0x1000, 0x0001)) return false;
	gkhy::MfcMinus::Win32App::sleep(100);
	if (!writeReg(0x1000, 0x0003)) return false;
	gkhy::MfcMinus::Win32App::sleep(100);
	if (!writeReg(0x1000, 0x000B)) return false;

	m_adcSettings = adcSettings;
	//m_adcSettings.writeSettings(m_settings);
	QZebraScopeSettings settings;
	settings.setAdcSettings(m_adcSettings);

	return true;

}

bool AdcBoard::setSignalSettings(const SignalSettings& signalSettings)
{
	// change sampling frequency
	changeSampleRate(signalSettings.clockFreq);

	//todo: 1, add gpib code to specify the input signal/clock;

	float fs = signalSettings.clockFreq;
	TimeDomainReport &tdReport = report.tdReport;
	
	tdReport.xaxis.resize(buffer_cnt);

	for (int i = 0; i < tdReport.xaxis.size(); ++i)
	{
		tdReport.xaxis[i] = (float)i * (1e9 / fs);  //ns
	}

	FreqDomainReport& fdReport = report.fdReport;

	fdReport.xaxis.resize(buffer_cnt/2);
	float k = fs / 2 / (fdReport.xaxis.size()) / 1e6;

	for (int i = 0; i < fdReport.xaxis.size(); ++i)
	{
		fdReport.xaxis[i] = (float)i * k;
	}

	m_signalSettings = signalSettings;
	// m_signalSettings.writeSettings(m_settings);

	QZebraScopeSettings settings;
	settings.setSignalSettings(m_signalSettings);

	return true;
}

void AdcBoard::powerStatus(PowerStatus& powerStatus)
{
	unsigned short reg = 0;
	writeReg(9, 0xA400);  //select 3548, work at default mode
	writeReg(9, 0xA400);  //select 3548, work at default mode

	writeReg(9, 0x7FFF);  //select 3548, select 7th channel
	writeReg(9, 0x7FFF);  //select 3548, select 7th channel
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	readReg(0x0009, reg);
	powerStatus.va = (float(reg>>2)) * 4 / 16384;
	
	writeReg(9, 0x3FFF);  //select 3548, select 7th channel
	writeReg(9, 0x3FFF);  //select 3548, select 7th channel
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	readReg(0x0009, reg);
	powerStatus.vd = (float(reg>>2)) * 4 / 16384;

	writeReg(9, 0x4FFF);  //select 3548, select 7th channel
	writeReg(9, 0x4FFF);  //select 3548, select 7th channel
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	readReg(0x0009, reg);
	powerStatus.ia = (float(reg>>2)) * 500 * 4 / 16384;

	writeReg(9, 0x1FFF);  //select 3548, select 7th channel
	writeReg(9, 0x1FFF);  //select 3548, select 7th channel
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	writeReg(9, 0xeFFF);  //select 3548, read out 7th channel volage
	readReg(0x0009, reg);
	powerStatus.id = (float(reg>>2)) * 500 * 4 / 16384;

	powerStatus.power = powerStatus.va * powerStatus.ia + powerStatus.vd * powerStatus.id;

}

void AdcBoard::staticTest()
{
	//uncomment this section to send sine wave through dac;
	//writeReg(0x1004, 0);
	//if (buff.size() < buffer_cnt)
	//	buff.resize(buffer_cnt);
	//bool okay = write(0x1005, &buff[0], 20*1000*4);
	//writeReg(0x1006, 0);
	//writeReg(0x1007, 1);
	//return;


	QString fileNameDat = QDir( QApplication::applicationDirPath() ).filePath("file.dat");
	QFile fileDat( fileNameDat );
	fileDat.open(QIODevice::WriteOnly);
	QDataStream outDat(&fileDat);   // we will serialize the data into the file

	static char txtBuffer[20];
	QString fileNameTxt = QDir( QApplication::applicationDirPath() ).filePath("file.txt");
	QFile fileTxt( fileNameTxt );
	fileTxt.open(QIODevice::WriteOnly);
	QDataStream outTxt(&fileTxt);   // we will serialize the data into the file

	QZebraScopeSettings settings;
	settings.staticSettings(m_staticSettings);

	if (buff.size() < buffer_cnt)
		buff.resize(buffer_cnt);
	writeReg(0xFFFF, 0x0001);  //reset
	writeReg(0xFFFF, 0x0000);  //dereset
	writeReg(0x1004, 0xFFFF);  //fill the fifo

	Sleep(200);	

//	unsigned short* p = &buff[0];
	float vpp = m_adcSettings.vpp;
	float max = (1 << (m_adcSettings.bitcount - 1));
	//TimeDomainReport& tdReport = report.tdReport;

	for (int t=0; t<32; ++t)
	{
		bool okay = false;
		okay = read(0x1005, &buff[0], buffer_cnt);
		Q_ASSERT(okay);
		outDat.writeRawData((const char *)(&buff[0]), buffer_cnt * (sizeof(unsigned short)/sizeof(char)));

		//Convert(tdReport, max, vpp);
		for (int k=0; k<buff.size(); ++k)
		{
			if (m_adcSettings.coding == AdcCodingOffset)
			{
				buff[k] = buff[k] ^ 0x8000;
			}
			sprintf_s(txtBuffer, "%d\r\n", short(buff[k]));
			//QString a = QString(txtBuffer);
			//int m = a.size();
			outTxt.writeRawData(txtBuffer, QString(txtBuffer).size());
		}

	}
	fileTxt.close();
	fileDat.close();

}

int AdcBoard::setVoltage(int adcChannel, int dacChannel, float v)
{
	int fine = 600;
	int coarse = 100;
	unsigned short reg = 0;

	int regValue;

	for (int i=coarse; i>0; --i)
	{
		if (!writeReg(5, i*65535/coarse))
			return false;
		if (!writeReg(6, dacChannel))  //执行 通道A
			return false;
		writeReg(9, adcChannel);  //select 3548, select 7th channel
		writeReg(9, adcChannel);  //select 3548, select 7th channel
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel voltage
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel voltage
		readReg(0x0009, reg);
		if ((float(reg>>2)) * 4 / 16384 > v)
			break;
	}
	for (int i=0; i<fine; ++i)
	{
		regValue = i*65535/fine;
		if (!writeReg(5, regValue))
			return false;
		if (!writeReg(6, dacChannel))  //执行 通道A
			return false;
		writeReg(9, adcChannel);  //select 3548, select 7th channel
		writeReg(9, adcChannel);  //select 3548, select 7th channel
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel voltage
		writeReg(9, 0xeFFF);  //select 3548, read out 7th channel voltage
		readReg(0x0009, reg);
		if ((float(reg>>2)) * 4 / 16384 < v)
			break;

	}
	return regValue;

}