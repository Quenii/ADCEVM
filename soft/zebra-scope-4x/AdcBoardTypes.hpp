#pragma once

#include <QString>
#include <vector>
#include <QMetaType>
#include <QSettings>
#include <QFile>
#include <QDataStream>
#include <QVariant>


//#define MATLAB 1
#define MATCOM 2

struct AdcBoardInfo 
{
	int usbAddr;
	QString devName;
	QString infName;
};

enum AdcCoding 
{
	AdcCodingOffset = 0,
	AdcCodingComplement = 1,
	AdcCodingGray = 2		
};
inline QString conv_to_string(const AdcCoding& e) 
{
	switch (e)
	{
	case AdcCodingOffset:
		return "Offset";
	case AdcCodingComplement:
		return "Complement";
	case AdcCodingGray:
		return "Gray";
	default:
		return "";
	}
}

struct PowerStatus
{
	float va;
	float vd;
	float ia;
	float id;
	float power;
	float freq;
};

struct TimeDomainReport
{
	std::vector<float> samples;
	std::vector<float> xaxis;
	std::vector< int> rawSamples;
	std::vector<float> samplesQ;
	std::vector< int> rawSamplesQ;
	float min;
	float max;	
	float minQ;
	float maxQ;	
};

struct Parameter
{
	int index;
	QString name;
	float value;
	QString unit;
};

struct FreqDomainReport
{
	std::vector<float> Spectrum;
	std::vector<float> xaxis;
	bool dualTone;
	std::vector<Parameter> DynamicPara;
	std::vector<Parameter> DualTonePara;
	std::vector<int> markers;
};

struct Harmonics
{
	int marker;
	float value;
};

struct AdcBoardReport
{
	PowerStatus powerStatus;
	FreqDomainReport fdReport;
	TimeDomainReport tdReport;
};

struct AdcTypeSettings
{
	bool initialized;
	QString adcType;
	float va;
	float vd;
	unsigned int bitcount;
	float vpp;
	int coding;
	float phase;

	operator QVariant() const {	return QVariant::fromValue(*this); }
};

Q_DECLARE_METATYPE(AdcTypeSettings);

inline QDataStream& operator<<(QDataStream& out, const AdcTypeSettings& val)
{	
	out << val.initialized;
	out << val.adcType;
	out << val.va;
	out << val.vd;
	out << val.bitcount;
	out << val.vpp;
	out << val.coding;
	out << val.phase;

	return out;
}


inline QDataStream& operator>>(QDataStream& in, AdcTypeSettings& val)
{
	in >> val.initialized;
	in >> val.adcType;
	in >> val.va;
	in >> val.vd;
	in >> val.bitcount;
	in >> val.vpp;
	in >> val.coding;
	in >> val.phase;

	return in;
}

//////////////////////////////////////////////////////
struct StaticTestSettings
{
	bool noise;
	unsigned int numpt;
	float vpp;
	float vt;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(StaticTestSettings);

inline QDataStream& operator<<(QDataStream& out, const StaticTestSettings& val)
{
	out << val.noise;
	out << val.numpt;
	out << val.vpp;
	out << val.vt;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, StaticTestSettings& val)
{
	in >> val.noise;
	in >> val.numpt;
	in >> val.vpp;
	in >> val.vt;

	return in;
}
////////////////////////////////////////////////////////
struct SignalSettings
{
	bool initialized;
 	float clockFreq;
    float clockPower;
    bool freqDetect;
 	float signalFreq;
 	float signalPower;
    bool dualToneTest;
    float signalIIFreq;
    float signalIIPower;
	bool iq;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(SignalSettings);

inline QDataStream& operator<<(QDataStream& out, const SignalSettings& val)
{
	out << val.initialized;
 	out << val.clockFreq;
    out << val.clockPower;
    out << val.freqDetect;
 	out << val.signalFreq;
 	out << val.signalPower;
    out << val.dualToneTest;
    out << val.signalIIFreq;
    out << val.signalIIPower;
	out << val.iq;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, SignalSettings& val)
{
	in >> val.initialized;
 	in >> val.clockFreq;
    in >> val.clockPower;
    in >> val.freqDetect;
 	in >> val.signalFreq;
 	in >> val.signalPower;
    in >> val.dualToneTest;
    in >> val.signalIIFreq;
    in >> val.signalIIPower;
	in >> val.iq;

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

struct SpanSettings
{
	bool initialized;
	unsigned int dc;
	unsigned int signal;
	unsigned int spur;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(SpanSettings);

inline QDataStream& operator<<(QDataStream& out, const SpanSettings& val)
{
	out << val.initialized;
	out << val.dc;
	out << val.signal;
	out << val.spur;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, SpanSettings& val)
{
	in >> val.initialized;
	in >> val.dc;
	in >> val.signal;
	in >> val.spur;

	return in;
}

struct DdsSettings
{
	bool initialized;
	int type; //0 for single tone;
	float startFreq;
	float stopFreq;
	float stepFreq;
	float clockPower;
	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(DdsSettings);

inline QDataStream& operator<<(QDataStream& out, const DdsSettings& val)
{
	out << val.initialized;
	out << val.type;
	out << val.startFreq;
	out << val.stopFreq;
	out << val.stepFreq;
	out << val.clockPower;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, DdsSettings& val)
{
	in >> val.initialized;
	in >> val.type;
	in >> val.startFreq;
	in >> val.stopFreq;
	in >> val.stepFreq;
	in >> val.clockPower;

	return in;
}
////////////////////////////////////////////////////////
