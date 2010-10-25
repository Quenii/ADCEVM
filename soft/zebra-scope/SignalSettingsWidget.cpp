#include "SignalSettingsWidget.h"
#include "SignalSettingsDialog.h"

SignalSettingsWidget::SignalSettingsWidget(QWidget *parent)
	: QWidget(parent)
{
	setupUi(this);
}

SignalSettingsWidget::~SignalSettingsWidget()
{

}

void SignalSettingsWidget::on_pushButtonChangeSettings_clicked()
{
	SignalSettingsDialog dlg;
	if (QDialog::Accepted  == dlg.exec())
	{

	}
}

void SignalSettingsWidget::setSettings(const SignalSettings& settings)
{
	signalFreqLineEdit->setText(QString("%1").arg(settings.signalFreq));
	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower));
	clockFreqLineEdit->setText(QString("%1").arg(settings.clockFreq));
}

void SignalSettingsWidget::settings(SignalSettings& settings)
{
	settings.clockFreq = clockFreqLineEdit->text().toFloat();
	settings.signalFreq = signalFreqLineEdit->text().toFloat();
	settings.signalPower = signalPowerLineEdit->text().toFloat();
}