#pragma once

#include <QString>
#include <QMetaType>
#include <QDataStream>
#include <QVariant>


enum TestMode
{
	StaticTest,
	DynamicTest,
    DualtoneTest
};

struct StaticTestSettings
{
	int averageLevel;
	int nplc;
	int left;
	int right;
	int vl;
	float vh;
	int currentVal;
	int stopVal;
	int dir;
	int gain;
	int mode;  

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(StaticTestSettings);

inline QDataStream& operator<<(QDataStream& out, const StaticTestSettings& val)
{
	out << val.averageLevel;
	out << val.nplc;
	out << val.left;
	out << val.right;
	out << val.vh;
	out << val.vl;
	out << val.currentVal;
	out << val.stopVal;
	out << val.dir;
	out << val.gain;
	out << val.mode;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, StaticTestSettings& val)
{
	in >> val.averageLevel;
	in >> val.nplc;
	in >> val.left;
	in >> val.right;
	in >> val.vh;
	in >> val.vl;
	in >> val.currentVal;
	in >> val.stopVal;
	in >> val.dir;
	in >> val.gain;
	in >> val.mode;

	return in;
}

/////////////////////////////////////////////////////
struct DynamicTestSettings
{
	float vpp;
	int bitCount;
	float signalFreq;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(DynamicTestSettings);

inline QDataStream& operator<<(QDataStream& out, const DynamicTestSettings& val)
{
	out << val.vpp;
	out << val.bitCount;
	out << val.signalFreq;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, DynamicTestSettings& val)
{
	in >> val.vpp;
	in >> val.bitCount;
	in >> val.signalFreq;

	return in;
}

///////////////////////////////////////////////////////
struct InstTestSettings
{
	int wait;
	int high;
	int low;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(InstTestSettings);

inline QDataStream& operator<<(QDataStream& out, const InstTestSettings& val)
{
	out << val.wait;
	out << val.high;
	out << val.low;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, InstTestSettings& val)
{
	in >> val.wait;
	in >> val.high;
	in >> val.low;

	return in;
}

/////////////////////////////////REG ACCESS/////////////
struct RegAccessSettings
{
	int gpio;
	int resetLevel;
	int resetTime;
	int resetDelay;
	int spiBitWidth;
	
	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(RegAccessSettings);

inline QDataStream& operator<<(QDataStream& out, const RegAccessSettings& val)
{
	out << val.gpio;
	out << val.resetLevel;
	out << val.resetTime;
	out << val.resetDelay;
	out << val.spiBitWidth;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, RegAccessSettings& val)
{
	in >> val.gpio;
	in >> val.resetLevel;
	in >> val.resetTime;
	in >> val.resetDelay;
	in >> val.spiBitWidth;

	return in;
}


//////////////////////////////////////////////
struct PowerMonitorData
{
	float va;
	float vd;
	float ia;
	float id;
	float p;
};


struct DacTypeSettings
{
	QString type;
	float va;
	float vd;
	int bitCount;
	float refVolt;
	float clockFreq;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(DacTypeSettings);


inline QDataStream& operator<<(QDataStream& out, const DacTypeSettings& val)
{
	out << val.type;
	out << val.va;
	out << val.vd;
	out << val.bitCount;
	out << val.refVolt;
	out << val.clockFreq;	

	return out;
}

inline QDataStream& operator>>(QDataStream& in, DacTypeSettings& val)
{
	in >> val.type;
	in >> val.va;
	in >> val.vd;
	in >> val.bitCount;
	in >> val.refVolt;
	in >> val.clockFreq;	

	return in;
}

/////////////////////////////////////////////////////
struct DualtoneTestSettings
{
	int bitCount;
	float signalFreq;
	float signalFreq2;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(DualtoneTestSettings);

inline QDataStream& operator<<(QDataStream& out, const DualtoneTestSettings& val)
{
	out << val.bitCount;
	out << val.signalFreq;
	out << val.signalFreq2;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, DualtoneTestSettings& val)
{
	in >> val.bitCount;
	in >> val.signalFreq;
	in >> val.signalFreq2;

	return in;
}

