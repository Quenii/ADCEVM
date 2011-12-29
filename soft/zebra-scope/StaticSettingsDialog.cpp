#include "StaticSettingsDialog.h"
#include "dacanalyzersettings.h"

StaticSettingsDialog::StaticSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	for (int i = 0; i < 31; ++i)
	{
		comboBoxNumpt->addItem(QString("%1").arg(i+2));
	}
	loadSettings();
}

StaticSettingsDialog::~StaticSettingsDialog()
{

}



void StaticSettingsDialog::loadSettings()
{
//	lineEditNumpt->setText(QString("%1").arg(settings.numpt));
	settings = m_analyzer.staticTestSettings();
	comboBoxNumpt->setCurrentIndex(settings.numpt - 2);
	doubleSpinVpp->setValue(settings.vpp);
	doubleSpinVT->setValue(settings.vt);
}

void StaticSettingsDialog::accept()
{
//	settings.numpt = lineEditNumpt->text().toInt();
	
	settings.numpt = comboBoxNumpt->currentIndex() + 2;
	settings.vpp = doubleSpinVpp->value();
	settings.vt = doubleSpinVT->value();
	m_analyzer.setStaticTestSettings(settings);
	QDialog::accept();
	
}


