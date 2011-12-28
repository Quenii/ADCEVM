#include "StaticSettingsDialog.h"

StaticSettingsDialog::StaticSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	for (int i = 0; i < 31; ++i)
	{
		comboBoxNumpt->addItem(QString("%1").arg(i+2));
	}
}

StaticSettingsDialog::~StaticSettingsDialog()
{

}



void StaticSettingsDialog::setSettings(const StaticSettings& settings)
{
//	lineEditNumpt->setText(QString("%1").arg(settings.numpt));
	comboBoxNumpt->setCurrentIndex(settings.numpt - 2);
	doubleSpinVpp->setValue(settings.vpp);
	doubleSpinVT->setValue(settings.vt);
}

void StaticSettingsDialog::settings(StaticSettings& settings)
{
	QLocale c(QLocale::C);

//	settings.numpt = lineEditNumpt->text().toInt();
	settings.numpt = comboBoxNumpt->currentIndex() + 2;
	settings.vpp = doubleSpinVpp->value();
	settings.vt = doubleSpinVT->value();
}


