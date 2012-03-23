#pragma once

#include "SerialTypes.hpp"

#include <QSettings>

class SerialSettings : public QSettings
{
public:
	SerialSettings(const QString & fileName, Format format, QObject * parent = 0 );
	SerialSettings(QObject * parent = 0 );
	virtual ~SerialSettings(void);

public:
	SerialPortInfo serialPortInfo() const;
	void setSerialPortInfo(const SerialPortInfo& val);

private:
	// QSettings m_s;
};
