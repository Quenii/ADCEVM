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
#include <QTime>
#include <QDate>
#include <QMessageBox>
#include <QThread>

#include "AdcBoard.hpp"
#include "dacanalyzersettings.h"
#include "gkhy/mfcminus/Win32App.hpp"
#include "./3rdparty/m2c/c/include/m2c.h"
#include "./include/gkhy/qplotlib/qscope.hpp"
#include "inldnl_c.h"

using namespace gkhy::QPlotLab;

#define NOBOARD 1

#ifdef _DEBUG
#endif // _DEBUG

#if defined(MATLAB)    //defined in AdcBoardTypes.hpp
#include "libalgo_wrapper.h"
#elif defined(MATCOM)
#include "libalgo_wrapper.h"
#else
#endif // MATLAB

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


static void plot(const std::vector<double>& data, const QString& title, double min, double max)
{
	QScope* scope = new QScope(0);
	scope->setWindowTitle(title);
	scope->plot(&data[0], 16384);
	scope->show();
	scope->resize(640, 480);
//	scope->adjust(min, max);

}


AdcBoard* AdcBoard::_inst = 0;
AdcBoard::AdcBoard(QObject* parent /* = 0 */) 
: pi(3.141592653589793f)
, m_timerIdDyn(0)
, m_timerIdPower(0)
{

// 	QZebraScopeSettings settings;
// //	settings.adcSettings(m_adcSettings);
// 	settings.signalSettings(m_signalSettings);

// 	setAdcSettings(m_adcSettings);
// 	setSignalSettings(m_signalSettings);

	float fs = m_analyzer.signalSettings().clockFreq;
	updateXaxis(fs);

	if (!m_timerIdPower)
	{
		m_timerIdPower = startTimer(2000);
	}
}

AdcBoard::~AdcBoard()
{
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

bool AdcBoard::readPowerMonitorData(PowerStatus& powerStatus)
{
	powerStatus.va = getVoltage(0x7FFF);
	powerStatus.vd = getVoltage(0x3FFF);
	powerStatus.ia = getCurrent(0x4FFF);
	powerStatus.id = getCurrent(0x1FFF);
	powerStatus.power = powerStatus.va * powerStatus.ia + powerStatus.vd * powerStatus.id;

	return true;
}

void AdcBoard::timerEvent(QTimerEvent* event)
{
	//setAdcSettings(m_adcSettings);
	clocked();
	if (event->timerId() == m_timerIdPower)
	{
		PowerStatus& powerStatus = report.powerStatus;
		readPowerMonitorData(powerStatus);
		emit powerMonitorDataUpdated(powerStatus);
		return;
	}

	TimeDomainReport& tdReport = report.tdReport;
	m_adc = m_analyzer.adcTypeSettings();
	float vpp = m_adc.vpp;
	float max = 1 << 15;

#ifndef NOBOARD

	vector<unsigned short> buff;
	buff.resize(buffer_cnt);

	if (usbDev->IsOpen() && (usbDev->DeviceCount())/* && clocked() */)
	{
		writeReg(0x2002, 0);
		if (buff.size() < buffer_cnt*2)
			buff.resize(buffer_cnt*2);
		writeReg(0xFFFF, 0x0001);  //reset
		writeReg(0xFFFF, 0x0000);  //dereset
		//buff[512] = {0x0032};
		writeReg(0x1004, 0xFFFF);  //stor 1M
		Sleep(200);	

		unsigned short* p = &buff[0];
		bool okay = read(0x1005, &buff[0], buffer_cnt);
		Q_ASSERT(okay);
		okay = read(0x1005, &buff[0+buffer_cnt], buffer_cnt);
		Q_ASSERT(okay);
		Convert(tdReport, max, vpp);
	}
	else
	{

	}

#else
	m_signal = m_analyzer.signalSettings();
	float fs = m_signal.clockFreq;
	float fc = m_signal.signalFreq;

	int offset = rand();
	tdReport.samples.resize(buffer_cnt*2);
	tdReport.rawSamples.resize(tdReport.samples.size());
	for (int i = 0; i < tdReport.samples.size(); ++i)
	{
		tdReport.samples[i] = ((int)(qSin(2*pi*i*fc/fs+offset)*max))*vpp/max;
		tdReport.rawSamples[i] = ((int)(qSin(2*pi*i*fc/fs+offset)*max));
	}

#endif //NOBOARD

//	tdReport.max = max_element(tdReport.samples.begin(), tdReport.samples.end());
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

	fdReport.Spectrum.resize(tdReport.samples.size()/2);

#if defined(MATLAB) 
	calc_dynam_params(tdReport.samples, m_adc.bitcount, fdReport);

#elif defined(MATCOM) 
	calc_dynam_params(tdReport.samples, m_adc.bitcount, fdReport, m_adc.vpp);
	

#else
	memcpy( &fdReport.Spectrum[0], &tdReport.samples[0], buffer_cnt);

#endif // MATLAB

	emit boardReport(report);
}
void AdcBoard::Convert(TimeDomainReport& tdReport, float max, float vpp, vector<unsigned short>& buff)
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
		int t = 16-m_adc.bitcount;

		if (m_adc.coding == AdcCodingOffset)
		{
			buff[i] = buff[i] ^ 0x8000;
		}
		else if (m_adc.coding == AdcCodingComplement)
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

bool AdcBoard::setAdcSettings(const AdcTypeSettings& adcSettings)
{	
	float vio = adcSettings.vd;
	unsigned short reg = 0;

	unsigned short regValue = setVoltage(VDADDR, 0, adcSettings.vd);
	setVoltage(VAADDR, 2, adcSettings.va);

	for (int i=0; i<5; ++i)
	{
		if (!writeReg(5, regValue)) //设置VIO = VD, VIO无法监控，故不能采用setVoltage
			return false;
		if (!writeReg(6, 0x0004))  //执行 通道E
			return false;
	}

	return true;
}

void AdcBoard::updateXaxis(float fs)
{
	TimeDomainReport &tdReport = report.tdReport;
	FreqDomainReport& fdReport = report.fdReport;

	tdReport.xaxis.resize(buffer_cnt*2);
	fdReport.xaxis.resize(buffer_cnt);

	for (int i = 0; i < tdReport.xaxis.size(); ++i)
	{
		tdReport.xaxis[i] = (float)i * (1e9 / fs);  //ns
	}

	float k = fs / 2 / (fdReport.xaxis.size()) / 1e6;

	for (int i = 0; i < fdReport.xaxis.size(); ++i)
	{
		fdReport.xaxis[i] = (float)i * k;
	}
}


void AdcBoard::staticTest()
{
	QString fileName = QString("%1-%2").arg(
		QDate::currentDate().toString("yyMMdd"),
		QTime::currentTime().toString("hhmmss"));

	static char txtBuffer[20];
	QString fileNameTxt = QDir( QApplication::applicationDirPath() ).filePath(fileName+".txt");
	QFile fileTxt( fileNameTxt );
	fileTxt.open(QIODevice::WriteOnly);
	QDataStream outTxt(&fileTxt);   // we will serialize the data into the file
	
	m_static = m_analyzer.staticTestSettings();
	
	vector<unsigned short> buff;
	if (buff.size() < buffer_cnt)
		buff.resize(buffer_cnt);

	int numpt = m_static.numpt * 1024 * 1024;
	vector<double> samples;

#ifndef NOBOARD
	unsigned short mask = (1<<16) - (1<<(16-m_adcSettings.bitcount));
	const int innerLoop = 32;

	for (int i=0; i<m_static.numpt*(32/innerLoop); ++i)
	{
		writeReg(0xFFFF, 0x0001);  //reset
		writeReg(0xFFFF, 0x0000);  //dereset
		writeReg(0x1004, 0xFFFF);  //fill the fifo

		Sleep(200);	

		float vpp = m_adc.vpp;
		float max = (1 << 15);

		for (int t=0; t<innerLoop; ++t)
		{
			bool okay = false;
			okay = read(0x1005, &buff[0], buffer_cnt);
			Q_ASSERT(okay);

			int upperOverCount = 0;
			int lowerOverCount = 0;

			for (int k=0; k<buff.size(); ++k)
			{
				if (m_adc.coding == AdcCodingOffset)
				{
					buff[k] = buff[k] ^ 0x8000;
				}
				if (((buff[k] ^ 0x8000) & mask) == mask)
				{
					upperOverCount ++;
				}
				if ((buff[k] ^ 0x8000) == 0)
				{
					lowerOverCount ++;
				}
				samples.push_back(double(short(buff[k])));
				sprintf_s(txtBuffer, "%d\r\n", short(buff[k]));
				outTxt.writeRawData(txtBuffer, QString(txtBuffer).size());
			}
			if (lowerOverCount < 5 || upperOverCount < 5)
			{
				QMessageBox::warning(NULL, QString::fromLocal8Bit("静态测试"), 
					QString::fromLocal8Bit("信号幅值太低，请适当增加信号源输出功率！"), 
					QMessageBox::Ok, QMessageBox::Ok);

				return;
			}
		}
	}
#else // NOBOARD

	QFile file("111110-140158.txt");
	
	for (int i=0; i<m_static.numpt/8; ++i)
	{
		if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
			Q_ASSERT(false);

		QTextStream in(&file);
		while (!in.atEnd()) {
			QString line = in.readLine();
			samples.push_back(line.toDouble());
		}

		file.close();
	}

#endif // NOBOARD

	fileTxt.close();

	Q_ASSERT(samples.size() >= numpt);

	vector<double> inl(1<<m_adc.bitcount);
	vector<double> dnl(inl.size());
	vector<double> histogram(inl.size());

	int indexLeft = 0;
	int indexRight = 0;

	//inldnl(&samples[0], m_adc.bitcount, numpt, 0, m_static.vpp, 
	//	0, m_static.vt, &inl[0], &dnl[0], &histogram[0], indexLeft, indexRight);

	vector<int> histogram_i(inl.size());
	inldnl_c(&samples[0], m_adc.bitcount, numpt, 0, m_static.vpp, 
		0, m_static.vt, inl, dnl, histogram_i, indexLeft, indexRight);

	plot(inl, "INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE",0 ,0);

	plot(dnl, "DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE",0 ,0);
	
}


//bool AdcBoard::setSignalSettings(const SignalSettings& signalSettings)
//{
//	// change sampling frequency
//	changeSampleRate(signalSettings.clockFreq);
//
//	//todo: 1, add gpib code to specify the input signal/clock;
//
//	float fs = signalSettings.clockFreq;
//
//	updateXaxis(fs);
//
//	m_signalSettings = signalSettings;
//	// m_signalSettings.writeSettings(m_settings);
//
//	QZebraScopeSettings settings;
//	settings.setSignalSettings(m_signalSettings);
//
//	return true;
//}


//int AdcBoard::setVoltage(int adcChannel, int dacChannel, float v)
//{
//	int fine = 800;
//	int coarse = 60;
//	int regValue;
//	int i;
//	for (int i=0; i<10; ++i)
//	{
//		if (!writeReg(5, 32768))
//			return false;
//		if (!writeReg(6, dacChannel))  //执行 通道A
//			return false;
//	}
//	for (i=coarse; i>0; --i)
//	{
//		regValue = i*65535/coarse;
//		if (!writeReg(5, regValue))
//			return false;
//		if (!writeReg(6, dacChannel))  //执行 通道A
//			return false;
//		msleep(1);
//		float t = getVoltage(adcChannel);
//		qDebug() << "Coarse: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
//		if (t >= v)
//			break;
//	}
//	for (int j=i*fine/coarse; j<fine; ++j)
//	{
//		regValue = j*65535/fine;
//		if (!writeReg(5, regValue))
//			return false;
//		if (!writeReg(6, dacChannel))  //执行 通道A
//			return false;
//		msleep(1);
//		float t = getVoltage(adcChannel);
//		qDebug() << "Fine: ch: " << adcChannel << "reg: " << regValue << "vol: " << t;
//		if ( abs(t - v) <= 0.005)
//			break;
//	}
//	return regValue;
//
//}
