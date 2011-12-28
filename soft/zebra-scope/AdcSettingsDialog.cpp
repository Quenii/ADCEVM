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
	adcTypeComboBox->addItems(m_adcTypeList);

	const AdcTypeSettings& val = AdcAnalyzerSettings().adcTypeSettings();
	adcTypeComboBox->setCurrentIndex(m_adcTypeList.indexOf(val.adcType));

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

	vaDoubleSpinBox->setValue(val.va);
	vdDoubleSpinBox->setValue(val.vd);
	bitCountSpinBox->setValue(val.bitcount);
	codingComboBox->setCurrentIndex(val.coding);
	vppLineEdit->setText(QString("%1").arg(val.vpp));

	if (0 == adcTypeComboBox->currentIndex())
	{
		vaDoubleSpinBox->setReadOnly(false);
		vdDoubleSpinBox->setReadOnly(false);
	}
	else
	{
		vaDoubleSpinBox->setReadOnly(true);
		vdDoubleSpinBox->setReadOnly(true);
	}

}

void AdcSettingsDialog::accept()
{
	AdcTypeSettings val;

	val.adcType = adcTypeComboBox->currentText();
	// should remember index;
	val.bitcount = bitCountSpinBox->text().toInt();
	val.va = vaDoubleSpinBox->text().toFloat();
	val.vd = vdDoubleSpinBox->text().toFloat();
	val.vpp = vppLineEdit->text().toFloat();
	val.coding = codingComboBox->currentIndex();

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
