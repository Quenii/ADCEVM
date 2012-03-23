#include "serialsettings.h"
#include "SerialTypes.hpp"

#include <QStringList>
#include <QPoint>

static const char* serialPortInfoKey = "SerialPortInfo";

SerialSettings::SerialSettings(QObject * parent /* = 0  */) 
: QSettings(parent)
{
}

SerialSettings::SerialSettings(const QString & fileName, Format format, QObject * parent /* = 0  */)
: QSettings(fileName, format, parent)
{
}

SerialSettings::~SerialSettings(void)
{
}

SerialPortInfo SerialSettings::serialPortInfo() const
{
	return value(serialPortInfoKey).value<SerialPortInfo>();
}

void SerialSettings::setSerialPortInfo(const SerialPortInfo& val)
{
	setValue(serialPortInfoKey, val);

}
