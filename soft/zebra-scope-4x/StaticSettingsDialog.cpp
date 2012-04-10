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
		labl_6->setText(QString::fromLocal8Bit("请将信号输入端悬空或接地，然后点击确定开始测试。"));
		this->setWindowTitle(QString::fromLocal8Bit("噪声统计参数设置"));
	}
	else
	{
		labl_6->setText(
			QString::fromLocal8Bit("设置说明：12bit ADC推荐4M以上深度，\
									<br>14bit ADC推荐8M以上深度，\
									<br>16bit ADC推荐32M深度     "));
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


