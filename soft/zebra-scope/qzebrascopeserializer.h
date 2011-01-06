#ifndef QZEBRASCOPESERVALIZER_H
#define QZEBRASCOPESERVALIZER_H

#include "AdcBoardTypes.hpp"

#include <QFile>
#include <vector>

class QZebraScopeServalizer : public QFile
{
	Q_OBJECT

public:
	QZebraScopeServalizer(const QString &name, QObject *parent = 0)
	~QZebraScopeServalizer();

public:
	void seralize(const PowerStatus& data);
	bool deserialize(PowerStatus& data);

	void serialize(const TimeDomainReport& data);
	bool deserialize(TimeDomainReport& data);

	void serialize(const FreqDomainReport& data);
	bool deserialize(FreqDomainReport& data);

	template<typename T>
	void serialize(const T& data) 
	{ 
		write((const char*)&data, sizeof(T)); 
	}

	template<typename T>
	bool deserialize(T& data) 
	{
		if (bytesAvailable() < sizeof(T))
			return false;
		read((char*)&data, sizeof(T)); 

		return true;
	}

	template<typename T>
	void seralize(const std::vector<T> data)
	{
		seralize<qint64>(data.size());
		if (data.size() > 0)
		{
			write(&data[0], data.size() * sizeof(T));
		}
	}

	template<typename T>
	bool deseralize(std::vector<T> data)
	{		
		qint64 size = 0;
		if (!deseralize<qint64>(size))
			return false;

		data.resize(size);		
		if (data.size() > 0)
		{
			read(&data[0], data.size() * sizeof(T));
		}

		return true;
	}

private:
	
};

#endif // QZEBRASCOPESERVALIZER_H
