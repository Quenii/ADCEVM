#include "DacAnalyzerSettings.h"

static const char* dacTypeSettingsKey = "DacTypeSettings";

DacAnalyzerSettings::DacAnalyzerSettings(void)
{
}

DacAnalyzerSettings::~DacAnalyzerSettings(void)
{
}

void DacAnalyzerSettings::setDacTypeSettings(const DacTypeSettings& val)
{
	m_s.setValue(dacTypeSettingsKey, val);
}

DacTypeSettings DacAnalyzerSettings::dacTypeSettings() const
{
	return m_s.value(dacTypeSettingsKey).value<DacTypeSettings>();
}
