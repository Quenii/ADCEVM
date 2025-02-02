#include "RegAccess.hpp"
#include "RegAccessItem.h"
#include "gkhy/mfcminus/Win32App.hpp"

#include <QFileDialog>
#include <QSignalMapper>
#include <QStandardItemModel>
#include <QShortcut>

RegAccess::RegAccess(QWidget *parent, Qt::WFlags flags)
: QWidget(parent, flags)
, m_currentStep(-1)
, m_bEnable_SlotRegAccessItemStateChanged(true)
{
	setupUi(this);

	//QWidget* widget = new QWidget(scrollArea);	
	QVBoxLayout* layout = new QVBoxLayout(groupBoxRegAcessItems);

	QSignalMapper* signalMapper = new QSignalMapper(this);

	for (int i = 0; i < 16; ++i)
	{ 
		RegAccessItem* widget = new RegAccessItem(groupBoxRegAcessItems);
		widget->labelNo->setText(QString("%1").arg(i));
		widget->setMinimumSize(QSize(0, 20));
		widget->setMaximumSize(QSize(16777215, 16777215));
		layout->addWidget(widget);

		connect(widget->checkBox, SIGNAL(stateChanged(int)), signalMapper, SLOT(map()));
		signalMapper->setMapping(widget->checkBox, widget);	
		m_regAccessItems.push_back(widget);
	}

	connect(signalMapper, SIGNAL(mapped(QWidget*)),
		this, SLOT(slotRegAccessItemStateChanged(QWidget*)));

	QSpacerItem* verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

	layout->addItem(verticalSpacer);

	m_settings.beginGroup("RegAccess");

	readSettings(m_settings);
}

RegAccess::~RegAccess()
{
	writeSettings(m_settings);
	m_settings.endGroup();
}

void RegAccess::on_pushButtonResetCircuit_clicked()
{
	AdcBoard* board = AdcBoard::instance();

	//board->writeReg(0xFFFF, 0xFFFF);  //reset
	//gkhy::MfcMinus::Win32App::sleep(sbResetTime->value());
	//
	//board->writeReg(0xFFFF, 0x0000);  //dereset
	//gkhy::MfcMinus::Win32App::sleep(200);

	uint t = sbResetTime->value();
	board->writeReg(0x1000, 0x000D);
	board->writeReg(0x1000, 0x000C);  //jad14p1  reset
	gkhy::MfcMinus::Win32App::sleep(t);

	t = sbResetDelay->value();
	board->writeReg(0x1000, 0x0001);
	gkhy::MfcMinus::Win32App::sleep(t);
	board->writeReg(0x1000, 0x0003);
	gkhy::MfcMinus::Win32App::sleep(200);
	board->writeReg(0x1000, 0x000B);  //release SPI module rst
}

void RegAccess::on_pushButtonOpenScan_clicked()
{
	AdcBoard* board = AdcBoard::instance();

	//board->writeReg(0x1000, 0x0007);  //release jtag module rst
	//gkhy::MfcMinus::Win32App::sleep(1000);
	//board->writeReg(0x1001, 0x0000);  //start a open jtag op
	//gkhy::MfcMinus::Win32App::sleep(1000);
	//board->writeReg(0x1000, 0x000B);  //release SPI module rst
	//gkhy::MfcMinus::Win32App::sleep(200);

	board->writeReg(0x1000, 0x0001);  //release ADC rst
	gkhy::MfcMinus::Win32App::sleep(1000);
	board->writeReg(0x1000, 0x0003);  //release tri rst
	gkhy::MfcMinus::Win32App::sleep(1000);
	board->writeReg(0x1000, 0x0007);  //release jtag module rst
	gkhy::MfcMinus::Win32App::sleep(1000);
	board->writeReg(0x1001, 0x0000);  //start a open jtag op
	gkhy::MfcMinus::Win32App::sleep(1000);
	board->writeReg(0x1000, 0x000B);  //release SPI module rst
	gkhy::MfcMinus::Win32App::sleep(200);
}

void RegAccess::on_pushButtonAutoExec_clicked()
{	
	back2Top();
	while(nextStep() > 0);
}

void RegAccess::slotRegAccessItemStateChanged(QWidget* widget)
{
	if (!m_bEnable_SlotRegAccessItemStateChanged) 
		return ;

	RegAccessItem* item = dynamic_cast<RegAccessItem*>(widget);
	if (! item)	
		return ;

	m_bEnable_SlotRegAccessItemStateChanged = false;

	int curr = item->labelNo->text().toInt();
	for (int i = 0; i < m_regAccessItems.count(); ++i)
	{
		if (i < curr)
			m_regAccessItems[i]->checkBox->setCheckState(Qt::Checked);
		else if (i > curr)		
			m_regAccessItems[i]->checkBox->setCheckState(Qt::Unchecked);		
	}	

	m_bEnable_SlotRegAccessItemStateChanged = true;
}

// void RegAccess::on_sbSampleRate_valueChanged()
// {
// 
// 	AdcBoard* board = AdcBoard::instance();
// 
// 	board->changeSampleRate( sbSampleRate->value() );
// }

void RegAccess::on_pushButtonStep_clicked()
{
	nextStep();	
}

void RegAccess::on_pushButtonBack2Top_clicked()
{
	back2Top();
}

void RegAccess::back2Top()
{
	m_currentStep = -1;

	for (int i = 0; i < m_regAccessItems.count(); ++i)
	{
		RegAccessItem* item = m_regAccessItems[i];
		item->showArrow(false);
	}
}

int RegAccess::nextStep()
{
	AdcBoard* board = AdcBoard::instance();

	if (m_currentStep >= m_regAccessItems.count() - 1)
		return 0;

	RegAccessItem* lastItem = m_currentStep >= 0 ? m_regAccessItems[m_currentStep] : 0;

	m_currentStep++;

	RegAccessItem* item = m_regAccessItems[m_currentStep];
	if (item->checkBox->checkState() != Qt::Checked)
		return 0;

	bool okay = false;

	switch (item->cbOperation->currentIndex())
	{
	case 0: // no op
		break;

	case 1: // read
		{
			unsigned short addr = item->lineEditAddr->text().toInt(0, 16);;
			unsigned short val;
			okay = board->readReg24b(addr, val);
			if (okay)
			{
				item->lineEditValue->setText(QString("%1").arg(val, 0, 16));
			}		
		}

		break;

	case 2: // write
		{
			unsigned short addr = item->lineEditAddr->text().toInt(0, 16);;
			unsigned short val = item->lineEditValue->text().toInt(0, 16);
			okay = board->writeReg24b(addr, val);
		}
		break;

	default:
		break;
	}

	gkhy::MfcMinus::Win32App::sleep(10);
	
	if (!okay) return -1;

	if (lastItem) lastItem->showArrow(false);
	item->showArrow(true);

	return 1;
}

void RegAccess::readSettings(QSettings& settings)
{
	RegAccessItemData itemData;
	for (int i = 0; i < m_regAccessItems.count(); ++i)
	{
		RegAccessItem* item = m_regAccessItems[i];

		settings.beginGroup(QString("%1").arg(i));

		itemData.checked = settings.value("checked", false).toBool();
		itemData.operation = settings.value("operation", 0).toUInt();
		itemData.addr = settings.value("addr", 0).toUInt();
		itemData.value = settings.value("value", 0).toUInt();		

		settings.endGroup();

		item->setUiData(itemData);
	}
}

void RegAccess::writeSettings(QSettings& settings)
{
	RegAccessItemData itemData;

	for (int i = 0; i < m_regAccessItems.count(); ++i)
	{
		RegAccessItem* item = m_regAccessItems[i];

		item->UiData(itemData);

		settings.beginGroup(QString("%1").arg(i));

		settings.setValue("checked", itemData.checked);
		settings.setValue("operation", itemData.operation);
		settings.setValue("addr", itemData.addr);
		settings.setValue("value", itemData.value);		

		settings.endGroup();

		item->setUiData(itemData);
	}
}

void RegAccess::on_pushButtonSaveSettings_clicked()
{
	QString fileName = QFileDialog::getSaveFileName(this,
		tr("Load Settings"), "./", tr("Settings File (*.ini)"));

	if (!fileName.isEmpty()) 
	{
		QSettings settings(fileName,  QSettings::IniFormat);

		// write to the specified settings file.
		writeSettings(settings);		
	}
}

void RegAccess::on_pushButtonReadSettings_clicked()
{
	QString fileName = QFileDialog::getOpenFileName(this,
		tr("Load Settings"), "./", tr("Settings File (*.ini)"));

	if (!fileName.isEmpty()) 
	{
		QSettings settings(fileName,  QSettings::IniFormat);

		// read from the specified settings file.
		readSettings(settings);

		// write to registry
		writeSettings(m_settings);
	}
}