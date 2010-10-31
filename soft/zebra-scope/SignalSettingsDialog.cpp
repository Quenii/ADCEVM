#include "SignalSettingsDialog.h"

SignalSettingsDialog::SignalSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
}

SignalSettingsDialog::~SignalSettingsDialog()
{

}

void SignalSettingsDialog::settings(SignalSettings& settings)
{
	settings.signalFreq = signalFreqLineEdit->text().toFloat();
	settings.signalPower = signalPowerLineEdit->text().toFloat();
	settings.clockFreq  = clockFreqMHzLineEdit->text().toFloat() * 1e6;
}

void SignalSettingsDialog::setSettings(const SignalSettings& settings)
{
	signalFreqLineEdit->setText(QString("%1").arg(settings.signalFreq, 0, 'f', 1));
	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower, 0, 'f', 1));
	clockFreqMHzLineEdit->setText(QString("%1").arg(settings.clockFreq / 1e6, 0, 'f', 1));
}
