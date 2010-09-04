#include "RegAccess.hpp"
#include "RegAccessItem.h"
#include "gkhy/mfcminus/Win32App.hpp"

#include <QSignalMapper>
#include <QStandardItemModel>
#include <QShortcut>

RegAccess::RegAccess(QWidget *parent, Qt::WFlags flags)
	: QWidget(parent, flags)
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


}

RegAccess::~RegAccess()
{
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
	board->writeReg(0x1000, 0x000C);  //kad5514 reset
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
	AdcBoard* board = AdcBoard::instance();

	for (int i = 0; i < m_regAccessItems.count(); ++i)
	{
		RegAccessItem* item = m_regAccessItems[i];

		if (item->checkBox->checkState() != Qt::Checked)
		{
			continue;
		}
		
		switch (item->cbOperation->currentIndex())
		{
		case 0: // no op
			break;

		case 1: // read
			{
				unsigned short addr = item->lineEditAddr->text().toInt(0, 16);;
				unsigned short val;
				if (board->readReg24b(addr, val))
				{
					item->lineEditValue->setText(QString("%1").arg(val, 0, 16));
				}		
			}

			break;

		case 2: // write
			{
				unsigned short addr = item->lineEditAddr->text().toInt(0, 16);;
				unsigned short val = item->lineEditValue->text().toInt(0, 16);
				board->writeReg24b(addr, val);
			}
			break;

		default:
			break;
		}
		gkhy::MfcMinus::Win32App::sleep(10);
	}

}

void RegAccess::slotRegAccessItemStateChanged(QWidget* widget)
{
	RegAccessItem* item = dynamic_cast<RegAccessItem*>(widget);
	if (item)
	{
		int curr = item->labelNo->text().toInt();
		int toCheck = (Qt::Checked == item->checkBox->checkState());

		if ( curr >= 1 && toCheck )
		{
			m_regAccessItems[curr - 1]->checkBox->setCheckState(Qt::Checked);
		}

	}	
}

void RegAccess::on_sbSampleRate_valueChanged()
{

	AdcBoard* board = AdcBoard::instance();

	board->changeSampleRate( sbSampleRate->value() );
}