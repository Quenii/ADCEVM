#include "DacAnalyzerSettings.h"
#include "AdcBoardTypes.hpp"

#include <QStringList>
#include <QPoint>

static const char* adcTypeSettingsKey = "AdcTypeSettings";
static const char* storedAdcTypeSettingsKey = "StoredAdcTypeSettings";
static const char* staticTestSettingsKey = "StaticTestSettings";
static const char* signalSettingsKey = "SignalSettings";
static const char* regAccessSettingsKey = "RegAccess";

static const char* powerMonitorPoskey = "PowerMonitorPos";
static const char* powerMonitorVisibleKey = "PowerMonitorVisible";

AdcAnalyzerSettings::AdcAnalyzerSettings(void)
{
}

AdcAnalyzerSettings::~AdcAnalyzerSettings(void)
{
}

bool AdcAnalyzerSettings::powerMonitorWidgetVisible() const
{
	return m_s.value(powerMonitorVisibleKey).toBool();
}

void AdcAnalyzerSettings::setPowerMonitorWidgetVisible(const bool& val)
{
	m_s.setValue(powerMonitorVisibleKey, val);

}

QPoint AdcAnalyzerSettings::powerMonitorWidgetPos() const
{
	return m_s.value(powerMonitorPoskey).toPoint();
}

void AdcAnalyzerSettings::setPowerMonitorWidgetPos(const QPoint& val)
{
	m_s.setValue(powerMonitorPoskey, val);
}
/////////////////////////////////
void AdcAnalyzerSettings::setAdcTypeSettings(const AdcTypeSettings& val)
{
	m_s.setValue(adcTypeSettingsKey, val);
}

AdcTypeSettings AdcAnalyzerSettings::adcTypeSettings() const
{
	return m_s.value(adcTypeSettingsKey).value<AdcTypeSettings>();
}
//////////////////////////////
AdcTypeSettings AdcAnalyzerSettings::storedAdcTypeSettings(const QString& adcType) const
{
	QString key = QString("%1/%2").arg(storedAdcTypeSettingsKey).arg(adcType);
	return m_s.value(key).value<AdcTypeSettings>();
}

void AdcAnalyzerSettings::setStoredAdcTypeSettings(const AdcTypeSettings& val)
{
	QString key = QString("%1/%2").arg(storedAdcTypeSettingsKey).arg(val.adcType);
	m_s.setValue(key, val);
}

////////////////////////////////
void AdcAnalyzerSettings::setStaticTestSettings(const StaticTestSettings& val)
{
	m_s.setValue(staticTestSettingsKey, val);
}

StaticTestSettings AdcAnalyzerSettings::staticTestSettings() const
{
	return m_s.value(staticTestSettingsKey).value<StaticTestSettings>();
}

/////////////////////////////////
void AdcAnalyzerSettings::setSignalSettings(const SignalSettings& val)
{
	m_s.setValue(signalSettingsKey, val);
}

SignalSettings AdcAnalyzerSettings::signalSettings() const
{
	return m_s.value(signalSettingsKey).value<SignalSettings>();
}

///////////////////////////////////
void AdcAnalyzerSettings::setRegAccessSettings(const RegAccessSettings& val)
{
	m_s.setValue(regAccessSettingsKey, val);
}

RegAccessSettings AdcAnalyzerSettings::regAccessSettings() const
{
	return m_s.value(regAccessSettingsKey).value<RegAccessSettings>();
}


