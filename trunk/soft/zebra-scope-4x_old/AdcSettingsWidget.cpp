#include "AdcSettingsWidget.h"
#include "AdcSettingsDialog.h"
#include "DacAnalyzerSettings.h"
#include "AdcBoard.hpp"

inline QString conv_to_string(const unsigned int& e) 
{
	switch (e)
	{
	case 0:
		return "Offset";
	case 1:
		return "Complement";
	case 2:
		return "Gray";
	default:
		return "";
	}
}

AdcSettingsWidget::AdcSettingsWidget(QWidget *parent)
	: QWidget(parent)
{
	ui.setupUi(this);
	reloadSettings(true);
}

AdcSettingsWidget::~AdcSettingsWidget()
{

}

void AdcSettingsWidget::reloadSettings(bool initValue)
{
	AdcTypeSettings val;
	if (initValue)
	{
		AdcAnalyzerSettings settings;
		val = settings.storedAdcTypeSettings(QString::fromLocal8Bit("1.8V ADC"));
		if (!val.initialized)
		{
			val.va = 1.8f;
			val.vd = 1.8f;
		}

		AdcBoard::instance()->setAdcSettings(val);
	}
	else
	{
		val = AdcAnalyzerSettings().adcTypeSettings();
	}

	ui.adcTypeLineEdit->setText(val.adcType);
	ui.vaDoubleLineEdit->setText(QString("%L1").arg(val.va));
	ui.vdDoubleLineEdit->setText(QString("%L1").arg(val.vd));
	ui.bitCountLineEdit->setText(QString("%1").arg(val.bitcount));
	ui.vppLineEdit->setText(QString("%L1").arg(val.vpp));
	ui.codingLineEdit->setText(conv_to_string(val.coding));
}

void AdcSettingsWidget::on_pushButtonChangeSettings_clicked()
{
	AdcSettingsDialog dlg;
	//dlg.setSettings(m_settings);
	if (QDialog::Accepted  == dlg.exec())
	{
		reloadSettings(false);
	}
}

//void AdcSettingsWidget::setSettings(const AdcSettings& settings)
//{
//	m_settings = settings;
//
//	adcTypeLineEdit->setText(settings.adcType);
//
//	vaDoubleLineEdit->setText(QString("%1").arg(settings.va));
//	vdDoubleLineEdit->setText(QString("%1").arg(settings.vd));
//	bitCountLineEdit->setText(QString("%1").arg(settings.bitcount));
//	vppLineEdit->setText(QString("%1").arg(settings.vpp * 2));
//	codingLineEdit->setText(conv_to_string((AdcCoding)settings.coding));
//}
//
//void AdcSettingsWidget::settings(AdcSettings& settings)
//{
//	settings = m_settings;
//}
