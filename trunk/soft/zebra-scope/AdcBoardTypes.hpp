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
};

struct TimeDomainReport
{
	std::vector<float> samples;
	std::vector<float> xaxis;
	std::vector<unsigned short> rawSamples;
	float min;
	float max;	
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
	unsigned int numpt;
	float vpp;
	float vt;

	operator QVariant() const {	return QVariant::fromValue(*this); }	
};

Q_DECLARE_METATYPE(StaticTestSettings);

inline QDataStream& operator<<(QDataStream& out, const StaticTestSettings& val)
{
	out << val.numpt;
	out << val.vpp;
	out << val.vt;

	return out;
}

inline QDataStream& operator>>(QDataStream& in, StaticTestSettings& val)
{
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
////////////////////////////////////////////////////////

// struct AdcSettings
// {
// 	QString adcType;
// 	float va;
// 	float vd;
// 	unsigned int bitcount;
// 	float vpp;
// 	AdcCoding coding;
// 	float phase;

// 	AdcSettings()
// 	{
// 		adcType = "JAD14P1";
// 		va = 1.8f;
// 		vd = 1.8f;  
// 		bitcount = 14;
// 		vpp = .72f;
// 		coding = AdcCodingComplement;
// 		phase = 0;
// 	}

// 	void writeSettings(QSettings& settings) const
// 	{
// 		settings.beginGroup("AdcSettings");

// 		settings.setValue("Adc Type", adcType);
// 		settings.setValue("Va", va);
// 		settings.setValue("Vd", vd);
// 		settings.setValue("Bit Count", bitcount);
// 		settings.setValue("Vpp", vpp);
// 		settings.setValue("Coding", (int)coding);
// 		settings.setValue("Phase", phase);

// 		settings.endGroup();
// 	}

// 	void readSettings(QSettings& settings)
// 	{
// 		settings.beginGroup("AdcSettings");

// 		adcType = settings.value("Adc Type", adcType).toString();
// 		va = settings.value("Va", va).toString().toFloat();
// 		vd = settings.value("Vd", vd).toString().toFloat();
// 		bitcount = settings.value("Bit Count", bitcount).toString().toFloat();
// 		vpp = settings.value("Vpp", vpp).toString().toFloat();
// 		coding = (AdcCoding) settings.value("Coding", (int)coding).toInt();
// 		phase = settings.value("Phase", phase).toString().toFloat();

// 		settings.endGroup();

// 	}
// };


// struct SignalSettings
// {
// 	float clockFreq;
// 	float signalFreq;
// 	float signalPower;

// 	SignalSettings()
// 	{
// 		clockFreq = 100.0e6;
// 		signalFreq = 1.0e6;
// 		signalPower = -10; //dBm
// 	}

// 	void writeSettings(QSettings& settings) const
// 	{
// 		settings.beginGroup("SignalSettings");

// 		settings.setValue("Clock Freq", clockFreq);
// 		settings.setValue("Signal Freq", signalFreq);
// 		settings.setValue("Signal Power", signalPower);

// 		settings.endGroup();
// 	}

// 	void readSettings(QSettings& settings)
// 	{
// 		settings.beginGroup("SignalSettings");

// 		clockFreq = settings.value("Clock Freq", clockFreq).toString().toFloat();
// 		signalFreq = settings.value("Signal Freq", signalFreq).toString().toFloat();
// 		signalPower = settings.value("Signal Power", signalPower).toString().toFloat();

// 		settings.endGroup();
// 	}
// };


// struct StaticSettings
// {
// 	int numpt;
// 	float vpp;
// 	float vt;

// 	StaticSettings()
// 	{
// 		numpt = 8;
// 		vpp = 2.0f;
// 		vt = 2.0f;
// 	}

// 	void writeSettings(QSettings& settings) const
// 	{
// 		settings.beginGroup("StaticSettings");

// 		settings.setValue("Num of Points", numpt);
// 		settings.setValue("Vpp", vpp);
// 		settings.setValue("VT", vt);

// 		settings.endGroup();
// 	}

// 	void readSettings(QSettings& settings)
// 	{
// 		settings.beginGroup("StaticSettings");

// 		numpt = settings.value("Num of Points", numpt).toString().toInt();
// 		vpp = settings.value("Vpp", vpp).toString().toFloat();
// 		vt = settings.value("VT", vt).toString().toFloat();

// 		settings.endGroup();
// 	}
// };
