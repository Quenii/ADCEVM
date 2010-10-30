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
	dlg.setSettings(m_settings);
	if (QDialog::Accepted  == dlg.exec())
	{
		dlg.settings(m_settings);
		setSettings(m_settings);
		emit settingsChanged();
	}
}

void SignalSettingsWidget::setSettings(const SignalSettings& settings)
{
	m_settings = settings;

	signalFreqLineEdit->setText(QString("%1").arg(settings.signalFreq));
	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower));
	clockFreqLineEdit->setText(QString("%1").arg(settings.clockFreq));
}

void SignalSettingsWidget::settings(SignalSettings& settings)
{
	settings = m_settings;
}