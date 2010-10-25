#include "SignalSettingsDialog.h"

SignalSettingsDialog::SignalSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
}

SignalSettingsDialog::~SignalSettingsDialog()
{

}

void SignalSettingsDialog::setSettings(const SignalSettings& settings)
{
	signalFreqLineEdit->setText(QString("%1").arg(settings.signalFreq));
	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower));
	clockFreqLineEdit->setText(QString("%1").arg(settings.clockFreq));
}

void SignalSettingsDialog::settings(SignalSettings& settings)
{
	settings.clockFreq = clockFreqLineEdit->text().toFloat();
	settings.signalFreq = signalFreqLineEdit->text().toFloat();
	settings.signalPower = signalPowerLineEdit->text().toFloat();
}
