#include "DacAnalyzerSettings.h"
#include "AdcBoardTypes.hpp"

#include <QStringList>
#include <QPoint>

static const char* adcTypeSettingsKey = "AdcTypeSettings";
static const char* storedAdcTypeSettingsKey = "StoredAdcTypeSettings";
static const char* staticTestSettingsKey = "StaticTestSettings";
static const char* signalSettingsKey = "SignalSettings";
static const char* regAccessSettingsKey = "RegAccess";
static const char* spanSettingsKey = "SpanSettings";

static const char* powerMonitorPoskey = "PowerMonitorPos";
static const char* powerMonitorVisibleKey = "PowerMonitorVisible";
static const char* mdiSubWindowGroupKey = "MdiSubWindow";

AdcAnalyzerSettings::AdcAnalyzerSettings(QObject * parent /* = 0  */) 
: QSettings(parent)
{
}

AdcAnalyzerSettings::AdcAnalyzerSettings(const QString & fileName, Format format, QObject * parent /* = 0  */)
: QSettings(fileName, format, parent)
{
}

AdcAnalyzerSettings::~AdcAnalyzerSettings(void)
{
}

bool AdcAnalyzerSettings::powerMonitorWidgetVisible() const
{
	return value(powerMonitorVisibleKey).toBool();
}

void AdcAnalyzerSettings::setPowerMonitorWidgetVisible(const bool& val)
{
	setValue(powerMonitorVisibleKey, val);

}

QPoint AdcAnalyzerSettings::powerMonitorWidgetPos() const
{
	return value(powerMonitorPoskey).toPoint();
}

void AdcAnalyzerSettings::setPowerMonitorWidgetPos(const QPoint& val)
{
	setValue(powerMonitorPoskey, val);
}
/////////////////////////////////
void AdcAnalyzerSettings::setAdcTypeSettings(const AdcTypeSettings& val)
{
	setValue(adcTypeSettingsKey, val);
}

AdcTypeSettings AdcAnalyzerSettings::adcTypeSettings() const
{
	return value(adcTypeSettingsKey).value<AdcTypeSettings>();
}
//////////////////////////////
void AdcAnalyzerSettings::setStoredAdcTypeSettings(const AdcTypeSettings& val)
{
	QString key = QString("%1/%2").arg(storedAdcTypeSettingsKey).arg(val.adcType);
	setValue(key, val);
}

AdcTypeSettings AdcAnalyzerSettings::storedAdcTypeSettings(const QString& adcType) const
{
	QString key = QString("%1/%2").arg(storedAdcTypeSettingsKey).arg(adcType);
	return value(key).value<AdcTypeSettings>();
}

////////////////////////////////
void AdcAnalyzerSettings::setStaticTestSettings(const StaticTestSettings& val)
{
	setValue(staticTestSettingsKey, val);
}

StaticTestSettings AdcAnalyzerSettings::staticTestSettings() const
{
	return value(staticTestSettingsKey).value<StaticTestSettings>();
}

/////////////////////////////////
void AdcAnalyzerSettings::setSignalSettings(const SignalSettings& val)
{
	setValue(signalSettingsKey, val);
}

SignalSettings AdcAnalyzerSettings::signalSettings() const
{
	return value(signalSettingsKey).value<SignalSettings>();
}

///////////////////////////////////
void AdcAnalyzerSettings::setRegAccessSettings(const RegAccessSettings& val)
{
	setValue(regAccessSettingsKey, val);
}

RegAccessSettings AdcAnalyzerSettings::regAccessSettings() const
{
	return value(regAccessSettingsKey).value<RegAccessSettings>();
}

void AdcAnalyzerSettings::setSpanSettings(const SpanSettings& val)
{
	setValue(spanSettingsKey, val);
}

SpanSettings AdcAnalyzerSettings::spanSettings() const
{
	return value(spanSettingsKey).value<SpanSettings>();
}

//void AdcAnalyzerSettings::setMdiSubWindowStatus(const QString& title, const QByteArray& ba)
//{
//	setValue(QString("%1/%2").arg(mdiSubWindowGroupKey).arg(title), ba);
//}
//
//QByteArray AdcAnalyzerSettings::mdiSubWindowStatus(const QString& title) const
//{
//	return value(QString("%1/%2").arg(mdiSubWindowGroupKey).arg(title)).toByteArray();
//}