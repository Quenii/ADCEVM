#pragma once

#include "types.h"

#include <QSettings>

class DacAnalyzerSettings
{
public:
	DacAnalyzerSettings(void);
	virtual ~DacAnalyzerSettings(void);

public:
	DacTypeSettings dacTypeSettings() const;
	void setDacTypeSettings(const DacTypeSettings& val);
	
	DacTypeSettings storedDacTypeSettings(const QString& dacType) const;
	void setStoredDacTypeSettings(const DacTypeSettings& val);
	
	StaticTestSettings staticTestSettings() const;
	void setStaticTestSettings(const StaticTestSettings& val);

	DynamicTestSettings dynamicTestSettings() const;
	void setDynamicTestSettings(const DynamicTestSettings& val);

	DualtoneTestSettings dualtoneTestSettings() const;
	void setDualtoneTestSettings(const DualtoneTestSettings& val);

	InstTestSettings instTestSettings() const;
	void setInstTestSettings(const InstTestSettings& val);

	RegAccessSettings regAccessSettings() const;
	void setRegAccessSettings(const RegAccessSettings& val);

	float clockFreq() const;
	void setClockFreq(const float& val);
	
	QPoint powerMonitorWidgetPos() const;
	void setPowerMonitorWidgetPos(const QPoint& val);

	bool powerMonitorWidgetVisible() const;
	void setPowerMonitorWidgetVisible(const bool& val);

	void DacAnalyzerSettings::setDacTypeList(const QStringList& val);
	QStringList DacAnalyzerSettings::DacTypeList() const;

private:
	QSettings m_s;
};
