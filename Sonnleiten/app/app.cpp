#include <QDebug>
#include "app.h"
#include "Board.h"

#define adc_va	7
#define adc_vd	3
#define adc_vio 0
#define adc_ia	4
#define adc_id	1

#define dac_va	2
#define dac_vd	0
#define dac_vio 4

app::app(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	unsigned short buffer[1024];
	ui.setupUi(this);
	float v;

	Board * pBoard = new Board;

	pBoard->open();

	unsigned short reg = 0;
	pBoard->writeReg(1, 1234);
	pBoard->readReg(1, reg);

	//pBoard->readReg(10, reg);

	pBoard->initAdcDac();

	int adc_reg = pBoard->setVoltage(adc_va, dac_va, 2.9f);
	adc_reg = pBoard->setVoltage(adc_vd, dac_vd, 2.2f);
	adc_reg = pBoard->setVoltage(adc_vio, dac_vio, 1.8f);

	for (int i=40; i<128; ++i)
	{
		pBoard->setDacValue(0, (128-i)*0x1FF);
		v = pBoard->voltage(3);

		qDebug() << (128-i)*0x1FF << ", " << v;
	}

	v = pBoard->current(4);
	v = pBoard->current(4);

	for (int i=0; i<64; ++i)
	{
		pBoard->setDacValue(0, (64-i)*0x3ff);
		if (pBoard->voltage(3) > 3.30f)
		{
			v = pBoard->current(1);
			break;
		}
	}

	for (int i=0; i<64; ++i)
	{
		pBoard->setDacValue(2, (64-i)*0x3ff);
		if (pBoard->voltage(7) > 2.30f)
		{
			v = pBoard->current(4);
			break;
		}
	}

	v = pBoard->voltage(0);

//
//	for (int i=0; i<5; ++i)
//	{
//		pBoard->writeReg(100, 0x100);
//
//		pBoard->read(100+1, buffer, 0x100);	
//	}
//
//
//	pBoard->writeReg(1, 1234);
//	pBoard->readReg(1, reg);
//
//	pBoard->readReg(100, reg);
//	pBoard->writeReg(1, 1234);
//
//	for (int i=0; i<5; ++i)
//	{
//		pBoard->writeReg(100, 0x100);
//
//		pBoard->read(100+1, buffer, 0x100);	
//	}



}

app::~app()
{

}
