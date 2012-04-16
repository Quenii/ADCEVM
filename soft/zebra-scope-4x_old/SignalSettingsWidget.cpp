#include "SignalSettingsWidget.h"
#include "SignalSettingsDialog.h"
#include "AdcBoard.hpp"

SignalSettingsWidget::SignalSettingsWidget(QWidget *parent)
	: QWidget(parent)
{
	setupUi(this);
	reloadSettings();
}

SignalSettingsWidget::~SignalSettingsWidget()
{

}

void SignalSettingsWidget::on_pushButtonChangeSettings_clicked()
{
	SignalSettingsDialog dlg;
	if (QDialog::Accepted  == dlg.exec())
	{
		reloadSettings();
	}
}

void SignalSettingsWidget::reloadSettings()
{
	AdcAnalyzerSettings s;
	SignalSettings settings = s.signalSettings();
	signalFreqLineEdit->setText(QString("%L1").arg(settings.signalFreq / 1e6, 0, 'f', 6));
	clockFreqMHzLineEdit->setText(QString("%L1").arg(settings.clockFreq / 1e6, 0, 'f', 6));
	if (settings.dualToneTest)
	{
		signalIIFreqLineEdit->setText(QString("%L1").arg(settings.signalIIFreq / 1e6, 0, 'f', 6));
	}
	else
	{
		signalIIFreqLineEdit->setText(QString("---.------"));
	}
	
	AdcBoard::instance()->updateXaxis(settings.clockFreq);
}
