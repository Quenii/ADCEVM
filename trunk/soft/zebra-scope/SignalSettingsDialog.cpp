#include "SignalSettingsDialog.h"
#include <QLocale>

SignalSettingsDialog::SignalSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	loadSettings();
}

SignalSettingsDialog::~SignalSettingsDialog()
{

}

void SignalSettingsDialog::accept()
{
//	m_static = m_analyzer.staticTestSettings();
	
	m_static.freqDetect = signalDetectCheckBox->checkState() == 2 ? true : false;
	m_static.clockFreq = clockFreqMHzLineEdit->text().toFloat() * 1e6;
	m_static.clockPower = clockPowerLineEdit->text().toFloat();
	m_static.signalFreq = signalFreqLineEdit->text().toFloat() * 1e6;
	m_static.signalPower = signalPowerLineEdit->text().toFloat();
	m_static.dualToneTest = dualToneTestCheckBox->checkState() == 2 ? true : false;
	m_static.signalIIFreq = signalIIFreqLineEdit->text().toFloat() * 1e6;
	m_static.signalIIPower = signalIIPowerLineEdit->text().toFloat();
	m_static.initialized = true;
	m_analyzer.setSignalSettings(m_static);
	loadSettings();
	QDialog::accept();
}


void SignalSettingsDialog::loadSettings()
{
	m_static = m_analyzer.signalSettings();

	if (m_static.initialized)
	{
		signalDetectCheckBox->setCheckState(m_static.freqDetect ? Qt::Checked : Qt::Unchecked);
		clockFreqMHzLineEdit->setText(QString("%L1").arg(m_static.clockFreq / 1e6, 0, 'f', 6));
		clockPowerLineEdit->setText(QString("%L1").arg(m_static.clockPower, 0, 'f', 1));
		signalFreqLineEdit->setText(QString("%L1").arg(m_static.signalFreq / 1e6, 0, 'f', 6));
		signalPowerLineEdit->setText(QString("%L1").arg(m_static.signalPower, 0, 'f', 1));
		dualToneTestCheckBox->setCheckState(m_static.dualToneTest ? Qt::Checked : Qt::Unchecked);
		if (!m_static.dualToneTest)
		{
			signalIIFreqLineEdit->setEnabled(false);
			signalIIPowerLineEdit->setEnabled(false);
		}
		else
		{
			signalIIFreqLineEdit->setEnabled(true);
			signalIIPowerLineEdit->setEnabled(true);
		}

		signalIIFreqLineEdit->setText(QString("%L1").arg(m_static.signalIIFreq / 1e6, 0, 'f', 6));
		signalIIPowerLineEdit->setText(QString("%L1").arg(m_static.signalIIPower, 0, 'f', 1));
	}
	else
	{
		signalDetectCheckBox->setCheckState(Qt::Checked);
	}
	

}


void SignalSettingsDialog::on_dualToneTestCheckBox_stateChanged( int state )
{
	if (state == Qt::Checked)
	{
		signalIIFreqLineEdit->setEnabled(true);
		signalIIPowerLineEdit->setEnabled(true);
	}
	else
	{
		signalIIFreqLineEdit->setEnabled(false);
		signalIIPowerLineEdit->setEnabled(false);
	}

	
}

//void SignalSettingsDialog::settings(SignalSettings& settings)
//{
//	bool ok;
//	QLocale c(QLocale::C);
//
//	settings.signalFreq = c.toFloat(signalFreqLineEdit->text());
//	settings.signalPower = c.toFloat(signalPowerLineEdit->text());
//	settings.clockFreq  = c.toFloat(clockFreqMHzLineEdit->text()) * 1e6;
//}
//
//void SignalSettingsDialog::setSettings(const SignalSettings& settings)
//{
//
//	signalFreqLineEdit->setText(QString("%L1").arg(settings.signalFreq, 0, 'f', 1));
//	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower, 0, 'f', 1));
//	clockFreqMHzLineEdit->setText(QString("%L1").arg(settings.clockFreq / 1e6, 0, 'f', 1));
//}
