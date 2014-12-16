#include "DdsSettingsDialog.h"
#include <QLocale>

DdsSettingsDialog::DdsSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	loadSettings();
}

DdsSettingsDialog::~DdsSettingsDialog()
{

}

void DdsSettingsDialog::accept()
{
//	m_static = m_analyzer.staticTestSettings();
	m_static.type = comboBoxType->currentIndex();
	m_static.startFreq = clockStartMHzLineEdit->text().toFloat() * 1e6;
	m_static.stopFreq = clockStopMHzLineEdit->text().toFloat() * 1e6;
	m_static.stepFreq = clockStepMHzLineEdit->text().toFloat() * 1e6;
	m_static.clockPower = clockPowerLineEdit->text().toFloat();

	m_static.initialized = true;
	m_analyzer.setDdsSettings(m_static);
	loadSettings();
	QDialog::accept();
}


void DdsSettingsDialog::loadSettings()
{
	m_static = m_analyzer.ddsSettings();

	if (m_static.initialized)
	{
		comboBoxType->setCurrentIndex(m_static.type);
		clockStartMHzLineEdit->setText(QString("%L1").arg(m_static.startFreq / 1e6, 0, 'f', 6));
		clockStopMHzLineEdit->setText(QString("%L1").arg(m_static.stopFreq / 1e6, 0, 'f', 6));
		clockStepMHzLineEdit->setText(QString("%L1").arg(m_static.stepFreq / 1e6, 0, 'f', 6));
		clockPowerLineEdit->setText(QString("%L1").arg(m_static.clockPower, 0, 'f', 1));
		if (m_static.type == 0)
		{
			clockStopMHzLineEdit->setEnabled(false);
			clockStepMHzLineEdit->setEnabled(false);
		}
		else
		{
			clockStopMHzLineEdit->setEnabled(true);
			clockStepMHzLineEdit->setEnabled(true);
		}
	}
}
void DdsSettingsDialog::on_comboBoxType_currentIndexChanged( int index )
{
	if (index == 0)
	{
		clockStopMHzLineEdit->setEnabled(false);
		clockStepMHzLineEdit->setEnabled(false);
	}
	else
	{
		clockStopMHzLineEdit->setEnabled(true);
		clockStepMHzLineEdit->setEnabled(true);
	}
}

//void DdsSettingsDialog::on_dualToneTestCheckBox_stateChanged( int state )
//{
//	if (state == Qt::Checked)
//	{
//		signalIIFreqLineEdit->setEnabled(true);
//		signalIIPowerLineEdit->setEnabled(true);
//	}
//	else
//	{
//		signalIIFreqLineEdit->setEnabled(false);
//		signalIIPowerLineEdit->setEnabled(false);
//	}
//
//	
//}

//void DdsSettingsDialog::settings(DdsSettings& settings)
//{
//	bool ok;
//	QLocale c(QLocale::C);
//
//	settings.signalFreq = c.toFloat(signalFreqLineEdit->text());
//	settings.signalPower = c.toFloat(signalPowerLineEdit->text());
//	settings.clockFreq  = c.toFloat(clockFreqMHzLineEdit->text()) * 1e6;
//}
//
//void DdsSettingsDialog::setSettings(const DdsSettings& settings)
//{
//
//	signalFreqLineEdit->setText(QString("%L1").arg(settings.signalFreq, 0, 'f', 1));
//	signalPowerLineEdit->setText(QString("%1").arg(settings.signalPower, 0, 'f', 1));
//	clockFreqMHzLineEdit->setText(QString("%L1").arg(settings.clockFreq / 1e6, 0, 'f', 1));
//}
