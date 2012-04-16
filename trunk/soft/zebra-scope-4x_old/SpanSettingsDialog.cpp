#include "SpanSettingsDialog.h"
#include "dacanalyzersettings.h"

SpanSettingsDialog::SpanSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	loadSettings();
}

SpanSettingsDialog::~SpanSettingsDialog()
{

}



void SpanSettingsDialog::loadSettings()
{
//	lineEditNumpt->setText(QString("%1").arg(settings.numpt));
	settings = m_analyzer.spanSettings();
	if (settings.initialized)
	{
		spinBoxDc->setValue(settings.dc);
		spinBoxSignal->setValue(settings.signal);
		spinBoxSpur->setValue(settings.spur);
	}
}

void SpanSettingsDialog::accept()
{
//	settings.numpt = lineEditNumpt->text().toInt();
	
	settings.dc = spinBoxDc->text().toUInt();
	settings.signal = spinBoxSignal->text().toUInt();
	settings.spur = spinBoxSpur->text().toUInt();
	settings.initialized = true;
	m_analyzer.setSpanSettings(settings);
	QDialog::accept();
	
}


