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

}

void SignalSettingsWidget::settings(SignalSettings& settings)
{

}