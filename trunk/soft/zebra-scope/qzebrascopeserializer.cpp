#include "qzebrascopeserializer.h

QZebraScopeServalizer::QZebraScopeServalizer(const QString &name, QObject *parent /* = 0 */())
	: QFile(name, parent)
{

}

QZebraScopeServalizer::~QZebraScopeServalizer()
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

	return true;
}

void QZebraScopeServalizer::serialize(const TimeDomainReport& data)
{
	serialize(data.samples);
	serialize(data.xaxis);
	serialize(data.rawSamples);
	serialize(data.min);
	serialize(data.max);
}

bool QZebraScopeServalizer::deserialize(TimeDomainReport& data)
{
	if (deserialize(data.samples) && 
		deserialize(data.xaxis) &&
		deserialize(data.rawSamples) &&
		deserialize(data.min) &&
		deserialize(data.max))
		return true;
	else
		return false;
}

void QZebraScopeServalizer::serialize(const FreqDomainReport& data)
{
	seralize(Spectrum);
	seralize(xaxis);
	seralize(A);
	seralize(AdB);
	seralize(SINAD);
	seralize(SNR);
	seralize(THD);
	seralize(SFDR);
	seralize(ENOB);
	seralize(HD);
}

bool QZebraScopeServalizer::deserialize(FreqDomainReport& data)
{
	if (deseralize(Spectrum) &&
		deseralize(xaxis) &&
		deseralize(A) &&
		deseralize(AdB) &&
		deseralize(SINAD) &&
		deseralize(SNR) &&
		deseralize(THD) &&
		deseralize(SFDR) &&
		deseralize(ENOB) &&
		deseralize(HD))
		return true;
	else 
		return false;
}

