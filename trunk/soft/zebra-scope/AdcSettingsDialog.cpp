#include "AdcSettingsDialog.h"
#include "dacanalyzersettings.h"
#include "AdcBoard.hpp"

AdcSettingsDialog::AdcSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	
	codingComboBox->addItems(QStringList() << tr("Offset") << tr("Complement") << tr("Gray"));

	m_adcTypeList << QString::fromLocal8Bit("自定义型号ADC")
		<< QString::fromLocal8Bit("1.8V ADC")
		<< QString::fromLocal8Bit("2.5V ADC")
		<< QString::fromLocal8Bit("3.3V ADC");
	ui.adcTypeComboBox->addItems(m_adcTypeList);

	const AdcTypeSettings& val = AdcAnalyzerSettings().adcTypeSettings();
	ui.adcTypeComboBox->setCurrentIndex(m_adcTypeList.indexOf(val.adcType));

}

AdcSettingsDialog::~AdcSettingsDialog()
{

}

void AdcSettingsDialog::loadSettings(const QString& type)
{
	//	const AdcTypeSettings& val = AdcAnalyzerSettings().adcTypeSettings();
	AdcAnalyzerSettings settings;
	AdcTypeSettings val;

	// load stored settings.
	val = settings.storedAdcTypeSettings(type);

	ui.vaDoubleSpinBox->setValue(val.va);
	ui.vdDoubleSpinBox->setValue(val.vd);
	ui.bitCountSpinBox->setValue(val.bitcount);
	ui.codingComboBox->setCurrentIndex(val.coding);
	ui.vppLineEdit->setText(QString("%1").arg(val.vpp));

	if (0 == ui.adcTypeComboBox->currentIndex())
	{
		ui.vaDoubleSpinBox->setReadOnly(false);
		ui.vdDoubleSpinBox->setReadOnly(false);
	}
	else
	{
		ui.vaDoubleSpinBox->setReadOnly(true);
		ui.vdDoubleSpinBox->setReadOnly(true);
	}

}

void AdcSettingsDialog::accept()
{
	AdcTypeSettings val;

	val.adcType = ui.adcTypeComboBox->currentText();
	// should remember index;
	val.bitcount = ui.bitCountSpinBox->text().toInt();
	val.va = ui.vaDoubleSpinBox->text().toFloat();
	val.vd = ui.vdDoubleSpinBox->text().toFloat();
	val.vpp = ui.vppLineEdit->text().toFloat();
	val.coding = ui.codingComboBox->currentIndex();

	AdcAnalyzerSettings s;

	s.setAdcTypeSettings(val);

	// set to stored settings.
	s.setStoredAdcTypeSettings(val);

	AdcBoard::instance()->setAdcSettings(val);

	QDialog::accept();

}

void AdcSettingsDialog::on_adcTypeComboBox_currentIndexChanged(const QString& type)
{
	// refresh UI.
	loadSettings(type);
}

//void AdcSettingsDialog::setSettings(const AdcSettings& settings)
//{
//	adcTypeLineEdit->setText(settings.adcType);
//
//	vaDoubleSpinBox->setValue(settings.va);
//	vdDoubleSpinBox->setValue(settings.vd);
//	bitCountSpinBox->setValue(settings.bitcount);
//	vppLineEdit->setText(QString("%1").arg(settings.vpp * 2));
//	codingComboBox->setCurrentIndex(settings.coding);
//}
//
//void AdcSettingsDialog::settings(AdcSettings& settings)
//{
//	QLocale c(QLocale::C);
//
//	settings.adcType = adcTypeLineEdit->text();
//	settings.va = vaDoubleSpinBox->value();
//	settings.vd = vdDoubleSpinBox->value();
//	settings.bitcount = bitCountSpinBox->value();
//	settings.vpp = c.toFloat( vppLineEdit->text() ) / 2;
//	settings.coding = (AdcCoding) codingComboBox->currentIndex();
//}
//
//
