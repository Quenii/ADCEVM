#include "StaticSettingsDialog.h"

StaticSettingsDialog::StaticSettingsDialog(QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	
	codingComboBox->addItems(QStringList() << tr("Offset") << tr("Complement") << tr("Gray"));

}

StaticSettingsDialog::~StaticSettingsDialog()
{

}



void StaticSettingsDialog::setSettings(const StaticSettings& settings)
{
	staticTypeLineEdit->setText(settings.staticType);

	vaDoubleSpinBox->setValue(settings.va);
	vdDoubleSpinBox->setValue(settings.vd);
	bitCountSpinBox->setValue(settings.bitcount);
	vppLineEdit->setText(QString("%1").arg(settings.vpp * 2));
	codingComboBox->setCurrentIndex(settings.coding);
	phaseLineEdit->setText(QString("%1").arg(settings.phase));
}

void StaticSettingsDialog::settings(StaticSettings& settings)
{
	QLocale c(QLocale::C);

	settings.adcType = adcTypeLineEdit->text();
	settings.va = vaDoubleSpinBox->value();
	settings.vd = vdDoubleSpinBox->value();
	settings.bitcount = bitCountSpinBox->value();
	settings.vpp = c.toFloat( vppLineEdit->text() ) / 2;
	settings.coding = (AdcCoding) codingComboBox->currentIndex();
	settings.phase = c.toFloat( phaseLineEdit->text() );
}


