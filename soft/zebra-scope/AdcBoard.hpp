#pragma once

#include <QObject>
#include <QString>
#include <QList>
#include <QWidget>
#include <vector>
#include <QSettings>

#include "../BoardApi/Board.h"
#include "AdcBoardTypes.hpp"
#include "dacanalyzersettings.h"

class CCyUSBDevice;
class DummyWidget;
class QObject;
class QEvent;

#define VDADDR 0x3FFF
#define VAADDR 0x7FFF
class AdcBoard : public Board
{
	Q_OBJECT

private:
	static AdcBoard* _inst;

public:
	static AdcBoard* instance() 
	{
		if (!_inst)
		{
			_inst = new AdcBoard(0);
		}

		return _inst;
	}

public:	
	virtual ~AdcBoard();

private:
	AdcBoard(QObject* parent = 0);
	Q_DISABLE_COPY(AdcBoard);

public:
	bool setAdcSettings(const AdcTypeSettings& adcSettings);
	//bool setSignalSettings(const SignalSettings& signalSettings);	

	//void adcSettings(AdcSettings& adcSettings) { adcSettings = m_adcSettings; }
	//void signalSettings(SignalSettings& signalSettings) { signalSettings = m_signalSettings; }	
	//void powerStatus(PowerStatus& powerStatus);

	//bool setStaticSettings(const StaticSettings& staticSettings);	
	//void staticSettings(StaticSettings& staticSettings) { staticSettings = m_staticSettings; }	


	void setDynamicOn(bool on = true);
	bool isRunning();
	void staticTest();
	const AdcBoardReport& reportRef() { return report; }
	bool clocked();

protected:
	void timerEvent (QTimerEvent * event);

private:
	void Convert(TimeDomainReport&, float, float, std::vector<unsigned short>&);
	void updateXaxis(float fs);
	bool readPowerMonitorData(PowerStatus& powerStatus);

signals:
	void boardReport(const AdcBoardReport& report);
	void powerMonitorDataUpdated(const PowerStatus& data);

private:
	AdcBoardReport report;
	AdcAnalyzerSettings m_analyzer;
	AdcTypeSettings m_adc;
	SignalSettings m_signal;
	StaticTestSettings m_static;

	//AdcSettings m_adcSettings;
	//SignalSettings m_signalSettings;
	//StaticSettings m_staticSettings;
	int m_timerIdDyn;
	int m_timerIdPower;
    float pi;
};


