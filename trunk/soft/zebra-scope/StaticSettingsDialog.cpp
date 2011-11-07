#include "StaticSettingsDialog.h"

StaticSettingsDialog::StaticSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);

}

StaticSettingsDialog::~StaticSettingsDialog()
{

}



void StaticSettingsDialog::setSettings(const StaticSettings& settings)
{
	lineEditNumpt->setText(QString("%1").arg(settings.numpt));
	doubleSpinVpp->setValue(settings.vpp);
	doubleSpinVT->setValue(settings.vt);
}

void StaticSettingsDialog::settings(StaticSettings& settings)
{
	QLocale c(QLocale::C);

	settings.numpt = lineEditNumpt->text().toInt();
	settings.vpp = doubleSpinVpp->value();
	settings.vt = doubleSpinVT->value();
}


