#pragma once

#include "qextserialport.h"
#include "qgeocoordinate.h"


#include <QString>
#include <queue>
#include <QMetaType>
#include <QSettings>
#include <QFile>
#include <QDataStream>
#include <QVariant>

using namespace QtMobility;

enum ApplicationModes
{
    Receive,
    Review
};

struct GpsInfo
{
    bool valid;
    float latitude;
    float longitude;
    float deltaX;
    float deltaY;
};

struct GasInfo
{
    std::queue<float> h2s;
    std::queue<float> so2;
    std::queue<float> fel;

    float h2s_peak;
    float so2_peak;
    float fel_peak;

    QString latitude;
    QString longitude;
};
struct GasInfoItem
{
    int ch;

    float h2s;
    float so2;
    float fel;

    QString latitude; // why?
    QString longitude; // why?
    QString distance; // why?

    QGeoCoordinate location;
};

struct SerialPortInfo
{
    QString name;
    int BaudRate;
    int DataBits;
    int FlowControl;
    int Parity;
    int StopBits;
        quint64 Timeout_Millisec;
    int mode;

    operator QVariant() const {    return QVariant::fromValue(*this); }
};

Q_DECLARE_METATYPE(SerialPortInfo);

inline QDataStream& operator<<(QDataStream& out, const SerialPortInfo& val)
{    
    out << val.name;
    out << val.BaudRate;
    out << val.DataBits;
    out << val.FlowControl;
    out << val.Parity;
    out << val.StopBits;
    out << val.Timeout_Millisec;
    out << val.mode;

    return out;
}


inline QDataStream& operator>>(QDataStream& in, SerialPortInfo& val)
{
    in >> val.name;
    in >> val.BaudRate;
    in >> val.DataBits;
    in >> val.FlowControl;
    in >> val.Parity;
    in >> val.StopBits;
    in >> val.Timeout_Millisec;
    in >> val.mode;

    return in;
}

