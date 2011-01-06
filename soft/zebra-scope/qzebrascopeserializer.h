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

	template<typename T>
	void seralize(const std::vector<T> data);

	template<typename T>
	void deseralize(std::vector<T> data);

	template<typename T>
	void serialize)()
private:
	
};

#endif // QZEBRASCOPESERVALIZER_H
