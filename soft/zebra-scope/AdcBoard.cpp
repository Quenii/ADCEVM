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
#include <algorithm>

#include "AdcBoard.hpp"
#include "dacanalyzersettings.h"
#include "gkhy/mfcminus/Win32App.hpp"
#include "./3rdparty/m2c/c/include/m2c.h"
#include "./include/gkhy/qplotlib/qscope.hpp"
#include "inldnl_c.h"
#include "histplot.h"

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
	scope->plot(&data[0], min(16384, data.size()));
	scope->show();
	scope->resize(640, 480);

	/*bool ok = QObject::connect(qApp, SIGNAL(aboutToQuit()), scope, SLOT(deleteLater()));
	Q_ASSERT(ok);
	*/
}

AdcBoard* AdcBoard::_inst = 0;
AdcBoard::AdcBoard(QObject* parent /* = 0 */) 
: pi(3.141592653589793f)
, m_timerIdDyn(0)
, m_timerIdPower(0)
{
	open();
	float fs = m_analyzer.signalSettings().clockFreq;
	if (fs <= 0) fs = 1e8;
	updateXaxis(fs);
	initTestParas();
	report.fdReport.Spectrum.resize(buffer_cnt);

	if (!m_timerIdPower)
	{
		m_timerIdPower = startTimer(2000);
	}
}

AdcBoard::~AdcBoard()
{
}

void AdcBoard::initTestParas()
{
	FreqDomainReport &fdRpt = report.fdReport;
	fdRpt.DynamicPara.clear();
	fdRpt.DualTonePara.clear();
	Parameter para;

	para.index = 0;
	para.name = QString::fromLocal8Bit("Fin1_Freq");
	para.unit = QString::fromLocal8Bit("MHz");
	fdRpt.DualTonePara.push_back(para);
	para.index = 1;
	para.name = QString::fromLocal8Bit("Fin1_Input(dB)");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DualTonePara.push_back(para);

	para.index = 2;
	para.name = QString::fromLocal8Bit("Fin2_Freq");
	para.unit = QString::fromLocal8Bit("MHz");
	fdRpt.DualTonePara.push_back(para);
	para.index = 3;
	para.name = QString::fromLocal8Bit("Fin2_Input(dB)");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DualTonePara.push_back(para);

	para.index = 4;
	para.name = QString::fromLocal8Bit("SFDR");
	para.unit = QString::fromLocal8Bit("dBc");
	fdRpt.DualTonePara.push_back(para);
	para.index = 5;
	para.name = QString::fromLocal8Bit("SFDR_dBFS");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DualTonePara.push_back(para);

	para.index = 6;
	para.name = QString::fromLocal8Bit("IMD2_Worst");
	para.unit = QString::fromLocal8Bit("dBc");
	fdRpt.DualTonePara.push_back(para);
	para.index = 7;
	para.name = QString::fromLocal8Bit("IMD2_W_dBFS");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DualTonePara.push_back(para);

	para.index = 8;
	para.name = QString::fromLocal8Bit("IMD3_Worst");
	para.unit = QString::fromLocal8Bit("dBc");
	fdRpt.DualTonePara.push_back(para);
	para.index = 9;
	para.name = QString::fromLocal8Bit("IMD3_W_dBFS");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DualTonePara.push_back(para);

	para.index = 0;
	para.name = QString::fromLocal8Bit("Freq");
	para.unit = QString::fromLocal8Bit("MHz");
	fdRpt.DynamicPara.push_back(para);
	para.index = 1;
	para.name = QString::fromLocal8Bit("Input(dB)");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DynamicPara.push_back(para);
	para.index = 2;
	para.name = QString::fromLocal8Bit("Input(Vpp)");
	para.unit = QString::fromLocal8Bit("V");
	fdRpt.DynamicPara.push_back(para);

	para.index = 3;
	para.name = QString::fromLocal8Bit("SNR");
	para.unit = QString::fromLocal8Bit("dBc");
	fdRpt.DynamicPara.push_back(para);
	para.index = 4;
	para.name = QString::fromLocal8Bit("SNR_dBFS");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DynamicPara.push_back(para);
	para.index = 5;
	para.name = QString::fromLocal8Bit("SFDR");
	para.unit = QString::fromLocal8Bit("dBc");
	fdRpt.DynamicPara.push_back(para);
	para.index = 6;
	para.name = QString::fromLocal8Bit("SFDR_dBFS");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DynamicPara.push_back(para);

	para.index = 7;
	para.name = QString::fromLocal8Bit("ENOB");
	para.unit = QString::fromLocal8Bit("Bit");
	fdRpt.DynamicPara.push_back(para);
	para.index = 8;
	para.name = QString::fromLocal8Bit("ENOB_dBFS");
	para.unit = QString::fromLocal8Bit("Bit");
	fdRpt.DynamicPara.push_back(para);

	para.index = 9;
	para.name = QString::fromLocal8Bit("Pn");
	para.unit = QString::fromLocal8Bit("dBFS");
	fdRpt.DynamicPara.push_back(para);

	for (int i = 0; i < 9; ++ i)
	{
		para.index = 10 + i;
		para.name = QString::fromLocal8Bit("HD%1").arg(i+2);
		para.unit = QString::fromLocal8Bit("dBFS");
		fdRpt.DynamicPara.push_back(para);

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
		m_adc = m_analyzer.adcTypeSettings();
		m_signal = m_analyzer.signalSettings();
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
#ifndef NOBOARD
	if (!isOpen())
	{
		open();
	}
	if (!isOpen())
	{
		QMessageBox::warning(NULL, QString::fromLocal8Bit("��̬����"), 
			QString::fromLocal8Bit("�����豸ʧ�ܣ�����Ӳ�����ã�"), 
			QMessageBox::Ok, QMessageBox::Ok);
		setDynamicOn(false);
		return ;
	}
	clocked();

#endif

	if (event->timerId() == m_timerIdPower)
	{
		PowerStatus& powerStatus = report.powerStatus;
		readPowerMonitorData(powerStatus);
		emit powerMonitorDataUpdated(powerStatus);
		return;
	}

	TimeDomainReport& tdReport = report.tdReport;
	float vpp = m_adc.vpp;
	float max = 1 << 15;
	if (buff.size() < buffer_cnt*2)
		buff.resize(buffer_cnt*2);

#ifndef NOBOARD
	if (isOpen())
	{
		writeReg(0x2002, 0);
		writeReg(0xFFFF, 0x0001);  //reset
		writeReg(0xFFFF, 0x0000);  //dereset
		writeReg(0x1004, 0xFFFF);  //stor 1M
		Sleep(200);	

		unsigned short* p = &buff[0];
		bool okay = read(0x1005, &buff[0], buffer_cnt);
		Q_ASSERT(okay);
		okay = read(0x1005, &buff[0+buffer_cnt], buffer_cnt);
		Q_ASSERT(okay);
	}
#else  //generate sine wave
	float fs = m_signal.clockFreq;
	float fc = m_signal.signalFreq;
	int dither = (float)rand() * 8.0f / RAND_MAX;
	int offset = rand();
	for (int i=0; i<buff.size(); ++i)
	{
		buff[i] = ((int)(qSin(2*pi*i*fc/fs+offset)*max)) >> 2;
		if (m_signal.dualToneTest)
		{
			buff[i] += ((int)(qSin(2*pi*i*m_signal.signalIIFreq/fs+offset)*max)) >> 2;
		}
	}
#endif //NOBOARD
	Convert(tdReport, max, vpp, buff);
	tdReport.samples[0] = tdReport.samples[1];

	tdReport.max = *max_element(tdReport.samples.begin(), tdReport.samples.end());
	tdReport.min = *min_element(tdReport.samples.begin(), tdReport.samples.end());

	FreqDomainReport& fdReport = report.fdReport;
	fdReport.dualTone = m_signal.dualToneTest;

	if (fdReport.Spectrum.size() < tdReport.samples.size()/2)
	{	
		fdReport.Spectrum.resize(tdReport.samples.size()/2);
	}

#if defined(MATLAB) 
	calc_dynam_params(tdReport.samples, m_adc.bitcount, fdReport);

#elif defined(MATCOM) 
	int freq_detect = m_signal.freqDetect ? 1 : 2;
	SpanSettings settings = m_analyzer.spanSettings();

	if (!m_signal.dualToneTest)
	{
		calc_dynam_params(tdReport.samples, m_signal.clockFreq, m_adc.bitcount, fdReport, 
			m_adc.vpp, freq_detect, m_signal.signalFreq, settings.dc, settings.spur, settings.signal);
	}
	else
	{
		calc_dynam_params(tdReport.samples, m_signal.clockFreq, m_adc.bitcount, fdReport, 
			m_adc.vpp, freq_detect, m_signal.signalFreq, m_signal.signalIIFreq, 
			settings.dc, settings.spur, settings.signal);

		if (fdReport.DualTonePara[1].value < -40 
			|| fdReport.DualTonePara[3].value < -40
			|| abs(fdReport.DualTonePara[1].value - fdReport.DualTonePara[3].value) > 30
			|| abs(fdReport.DualTonePara[0].value - fdReport.DualTonePara[2].value) > 3
			|| abs(fdReport.DualTonePara[0].value - fdReport.DualTonePara[2].value) < 0.1)
		{
			QMessageBox::warning(NULL, QString::fromLocal8Bit("˫������"), 
				QString::fromLocal8Bit("�źŷ��Ȳ�����˫������������ȷ�ϣ�1���ź�1���ź�2���ȱ������-40dBFS��2��2���źž���ֵ֮��С��30dB��\nϵͳ�����뵥������ģʽ!"), 
				QMessageBox::Ok, QMessageBox::Ok);

			m_signal.dualToneTest = false;
		}
	}
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

		tdReport.samples[i] = short(buff[i]) * vpp / max / 2/* / (1<<t)*/;
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
		if (!writeReg(5, regValue)) //����VIO = VD, VIO�޷���أ��ʲ��ܲ���setVoltage
			return false;
		if (!writeReg(6, 0x0004))  //ִ�� ͨ��E
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
	//QString fileName = QString("%1-%2").arg(
	//	QDate::currentDate().toString("yyMMdd"),
	//	QTime::currentTime().toString("hhmmss"));

	//static char txtBuffer[20];
	//QString fileNameTxt = QDir( QApplication::applicationDirPath() ).filePath(fileName+".txt");
	//QFile fileTxt( fileNameTxt );
	//fileTxt.open(QIODevice::WriteOnly);
	//QDataStream outTxt(&fileTxt);   // we will serialize the data into the file
	
	m_static = m_analyzer.staticTestSettings();
	m_adc = m_analyzer.adcTypeSettings();
	
	vector<unsigned short> buff;
	if (buff.size() < buffer_cnt)
		buff.resize(buffer_cnt);

	int numpt = m_static.numpt * 1024 * 1024;
	vector<int> samples;

#ifndef NOBOARD
	unsigned short mask = (1<<16) - (1<<(16-m_adc.bitcount));
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
				samples.push_back(int(short(buff[k])));
				//sprintf_s(txtBuffer, "%d\r\n", short(buff[k]));
				//outTxt.writeRawData(txtBuffer, QString(txtBuffer).size());
			}
			if (!m_static.noise)
			{
				if (lowerOverCount < 5 || upperOverCount < 5)
				{
					QMessageBox::warning(NULL, QString::fromLocal8Bit("��̬����"), 
						QString::fromLocal8Bit("�źŷ�ֵ̫�ͣ����ʵ������ź�Դ������ʣ�"), 
						QMessageBox::Ok, QMessageBox::Ok);

					return;
				}
			}
		}
	}
#else // NOBOARD

	QString fileNameSim;
	if (m_static.noise)
	{
		fileNameSim = ("noise.txt");
	}
	else
	{
		fileNameSim = ("111110-140158.txt");
	}
	
	QFile file(fileNameSim);
	for (int i=0; i<m_static.numpt/8; ++i)
	{
		if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
			Q_ASSERT(false);

		QTextStream in(&file);
		while (!in.atEnd()) {
			QString line = in.readLine();
			samples.push_back(line.toInt());
		}
		file.close();
	}

#endif // NOBOARD

	//fileTxt.close();

	Q_ASSERT(samples.size() >= numpt);

	vector<double> inl(1<<m_adc.bitcount);
	vector<double> dnl(inl.size());
	vector<double> histogram(inl.size());
	vector<int> histogram_i(inl.size());

	int indexLeft = 0;
	int indexRight = 0;
	int indexMax = 0;

	if (m_static.noise)
	{
		noise_c(&samples[0], numpt, m_adc.bitcount, histogram_i, indexMax, indexLeft, indexRight);
		size_t histSize = indexRight-indexLeft+1;
		histogram.resize(histSize);

		for (int i=0; i<histSize; ++i)
		{
			histogram[i] = histogram_i[i+indexLeft];
		}
	}
	else
	{
		inldnl_c(&samples[0], m_adc.bitcount, numpt, 0, m_static.vpp, 
			0, m_static.vt, inl, dnl, histogram_i, indexLeft, indexRight);
		for (int i=0; i<histogram_i.size(); ++i)
		{
			histogram[i] = histogram_i[i];
		}
		inl[0] = 0;
		dnl[0] = 0;
		plot(inl, "INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE",0 ,0);
		plot(dnl, "DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE",0 ,0);
	}

	HistPlot* histPlot = new HistPlot(0); 
	histPlot->setWindowTitle(QString::fromLocal8Bit("���Խ��"));
	histPlot->resize(640, 480);
	histPlot->setValueHist(histogram);
	histPlot->show();	
	qDebug() << "Adc board thread Id: " << QThread::currentThreadId ();

}

