#include "qzebrascopeservalizer.h"

QZebraScopeServalizer::QZebraScopeServalizer(const QString &name, QObject *parent /* = 0 */())
	: QFile(name, parent)
{

}

QZebraScopeServalizer::~QZebraScopeServalizer()
{

}


template<typename T>
void QZebraScopeServalizer<T>::seralize(const std::vector<T> data)
{
	qint64 si
	write(data)
}

template<typename T>
void QZebraScopeServalizer<T>::deseralize(std::vector<T> data)
{

}

void QZebraScopeServalizer::seralize(const PowerStatus& data) 
{
	write((const char*)data, sizeof(data));
}

bool QZebraScopeServalizer::deserialize(PowerStatus& data)
{
	if (bytesAvailable() < sizeof(data))
		return false;

	read((char*)data, sizeof(data));
}

void QZebraScopeServalizer::serialize(const TimeDomainReport& data)
{
}

bool deserialize(TimeDomainReport& data)
{
}


