#pragma once

#include "boardapi_global.h"

#include <QObject>
#include <QString>
#include <QList>
#include <QWidget>
#include <vector>

class CCyUSBDevice;
class DummyWidget;
class QObject;
class QEvent;

struct BOARDAPI_EXPORT BoardInfo 
{
	int usbAddr;
	QString devName;
	QString infName;
};

class BOARDAPI_EXPORT Board : public QObject
{
	Q_OBJECT

public:
	Board(QObject* parent = 0);
	virtual ~Board();

private:	
	Q_DISABLE_COPY(Board);

public:
	bool open(int usbAddr = 0);
	void close();
	bool isOpen();

	bool readReg(unsigned short addr,unsigned short& val);
	bool writeReg(unsigned short addr,unsigned short val);

	bool readSpi(unsigned short addr,unsigned short& val);
	bool writeSpi(unsigned short addr,unsigned short val);

	bool initAdcDac();
	bool setDacValue(unsigned short ch, unsigned short val);
	bool adcValue(unsigned short ch, unsigned short &val);
	float voltage(unsigned short ch);
	float current(unsigned short ch);
	//bool readReg24b(unsigned short addr,unsigned short& val);
	//bool writeReg24b(unsigned short addr,unsigned short val);

	//unsigned short getAdcData(unsigned short ch);
	//float getVoltage(unsigned short ch);
	//float getCurrent(unsigned short ch);
	//int setVoltage(int adcChannel, int dacChannel, float v);

	//bool write(unsigned short addr, const unsigned short* buf, unsigned int len);
/*protected:*/	
	// len - number of unsigned-short's
	bool read(unsigned short addr, unsigned short* buf, unsigned int len);
	// len - number of unsigned-short's
	const static int buffer_cnt = 32 * 1024;
	const static int packet_size = 256;
	const float pi;

signals:
	void devListChanged(const QList<BoardInfo>& lst);


private:
	bool writeIOCmd(unsigned short addr, bool dirRead, unsigned short data);

private slots:
    void devChanged();

private:
	CCyUSBDevice* usbDev;
	DummyWidget* widget;
	std::vector<unsigned short> bulkIOBuff;

	const int static ADC_BASE = 100;
	const int static DAC_BASE = 102;
};

