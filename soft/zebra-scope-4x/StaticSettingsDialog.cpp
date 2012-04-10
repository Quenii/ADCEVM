#include "StaticSettingsDialog.h"
#include "dacanalyzersettings.h"

StaticSettingsDialog::StaticSettingsDialog(bool noise, QWidget *parent)
	: QDialog(parent)
{
	setupUi(this);
	for (int i = 0; i < 31; ++i)
	{
		comboBoxNumpt->addItem(QString("%1").arg(i+2));
	}
	loadSettings();

	if (noise)
	{
		labl_6->setText(QString::fromLocal8Bit("�뽫�ź���������ջ�ӵأ�Ȼ����ȷ����ʼ���ԡ�"));
		this->setWindowTitle(QString::fromLocal8Bit("����ͳ�Ʋ�������"));
	}
	else
	{
		labl_6->setText(
			QString::fromLocal8Bit("����˵����12bit ADC�Ƽ�4M������ȣ�\
									<br>14bit ADC�Ƽ�8M������ȣ�\
									<br>16bit ADC�Ƽ�32M���     "));
	}
}

StaticSettingsDialog::~StaticSettingsDialog()
{

}



void StaticSettingsDialog::loadSettings()
{
//	lineEditNumpt->setText(QString("%1").arg(settings.numpt));
	settings = m_analyzer.staticTestSettings();
	comboBoxNumpt->setCurrentIndex(settings.numpt - 2);
	doubleSpinVpp->setValue(settings.vpp);
	doubleSpinVT->setValue(settings.vt);
}

void StaticSettingsDialog::accept()
{
//	settings.numpt = lineEditNumpt->text().toInt();
	
	settings.numpt = comboBoxNumpt->currentIndex() + 2;
	settings.vpp = doubleSpinVpp->value();
	settings.vt = doubleSpinVT->value();
	m_analyzer.setStaticTestSettings(settings);
	QDialog::accept();
	
}


