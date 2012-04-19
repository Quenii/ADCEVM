#include "QGasInfo.h"

QGasInfo::QGasInfo(float k, int min) :
k(k), min(min)
{
}

QGasInfo::~QGasInfo(void)
{
}

float QGasInfo::Deduce(int raw, float delta)
{
#ifdef BYPASS
	return (float)raw;
#endif // BYPASS

	int result;
	result = raw < min ? min : raw;
	result = result > max ? max : result;

	return k*((float)result-min)+delta;
}
