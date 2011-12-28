#include "DacAnalyzerSettings.h"

#include <QStringList>
#include <QPoint>

static const char* dacTypeSettingsKey = "DacTypeSettings";
static const char* storedDacTypeSettingsKey = "StoredDacTypeSettings";
static const char* staticTestSettingsKey = "StaticTestSettings";
static const char* dynamicTestSettingsKey = "DynamicTestSettings";
static const char* dualtoneTestSettingsKey = "DualtoneTestSettings";
static const char* instTestSettingsKey = "InstTestSettings";
static const char* regAccessSettingsKey = "RegAccess";

static const char* clockFreqKey = "ClockFreq";
static const char* powerMonitorPoskey = "PowerMonitorPos";
static const char* powerMonitorVisibleKey = "PowerMonitorVisible";
static const char* dacTypeListKey = "DacTypeList";

DacAnalyzerSettings::DacAnalyzerSettings(void)
{
}

DacAnalyzerSettings::~DacAnalyzerSettings(void)
{
}

bool DacAnalyzerSettings::powerMonitorWidgetVisible() const
{
	return m_s.value(powerMonitorVisibleKey).toBool();
}

void DacAnalyzerSettings::setPowerMonitorWidgetVisible(const bool& val)
{
	m_s.setValue(powerMonitorVisibleKey, val);

}


QPoint DacAnalyzerSettings::powerMonitorWidgetPos() const
{
	return m_s.value(powerMonitorPoskey).toPoint();
}

void DacAnalyzerSettings::setPowerMonitorWidgetPos(const QPoint& val)
{
	m_s.setValue(powerMonitorPoskey, val);
}
/////////////////////////////////
void DacAnalyzerSettings::setDacTypeSettings(const DacTypeSettings& val)
{
	m_s.setValue(dacTypeSettingsKey, val);
}

DacTypeSettings DacAnalyzerSettings::dacTypeSettings() const
{
	return m_s.value(dacTypeSettingsKey).value<DacTypeSettings>();
}
//////////////////////////////
DacTypeSettings DacAnalyzerSettings::storedDacTypeSettings(const QString& dacType) const
{
	QString key = QString("%1/%2").arg(storedDacTypeSettingsKey).arg(dacType);
	return m_s.value(key).value<DacTypeSettings>();
}

void DacAnalyzerSettings::setStoredDacTypeSettings(const DacTypeSettings& val)
{
	QString key = QString("%1/%2").arg(storedDacTypeSettingsKey).arg(val.type);
	m_s.setValue(key, val);
}

////////////////////////////////
void DacAnalyzerSettings::setStaticTestSettings(const StaticTestSettings& val)
{
	m_s.setValue(staticTestSettingsKey, val);
}

StaticTestSettings DacAnalyzerSettings::staticTestSettings() const
{
	return m_s.value(staticTestSettingsKey).value<StaticTestSettings>();
}

/////////////////////////////////
void DacAnalyzerSettings::setDynamicTestSettings(const DynamicTestSettings& val)
{
	m_s.setValue(dynamicTestSettingsKey, val);
}

DynamicTestSettings DacAnalyzerSettings::dynamicTestSettings() const
{
	return m_s.value(dynamicTestSettingsKey).value<DynamicTestSettings>();
}

/////////////////////////////////
void DacAnalyzerSettings::setDualtoneTestSettings(const DualtoneTestSettings& val)
{
	m_s.setValue(dualtoneTestSettingsKey, val);
}

DualtoneTestSettings DacAnalyzerSettings::dualtoneTestSettings() const
{
	return m_s.value(dualtoneTestSettingsKey).value<DualtoneTestSettings>();
}

//////////////////////////////////
void DacAnalyzerSettings::setInstTestSettings(const InstTestSettings& val)
{
	m_s.setValue(instTestSettingsKey, val);
}

InstTestSettings DacAnalyzerSettings::instTestSettings() const
{
	return m_s.value(instTestSettingsKey).value<InstTestSettings>();
}

///////////////////////////////////
void DacAnalyzerSettings::setRegAccessSettings(const RegAccessSettings& val)
{
	m_s.setValue(regAccessSettingsKey, val);
}

RegAccessSettings DacAnalyzerSettings::regAccessSettings() const
{
	return m_s.value(regAccessSettingsKey).value<RegAccessSettings>();
}


void DacAnalyzerSettings::setClockFreq(const float& val)
{
	m_s.setValue(clockFreqKey, val);
}

float DacAnalyzerSettings::clockFreq() const
{
	return m_s.value(clockFreqKey, 0).toFloat();
}

//void DacAnalyzerSettings::setDacTypeList(const QStringList& val)
//{
//	m_s.setValue(dacTypeListKey, val);
//}
//
//QStringList DacAnalyzerSettings::DacTypeList() const
//{
//	return m_s.value(dacTypeListKey, 0);
//}
