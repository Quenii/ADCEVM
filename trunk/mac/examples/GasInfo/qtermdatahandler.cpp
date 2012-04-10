#include "qtermdatahandler.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"
#include "SerialTypes.hpp"
#include "QGasInfo.h"

#include <QTimer>
//#include <QNmeaPositionInfoSource>
#include <QByteArray>

#include <math.h>

#define REALDATA 1

QTermDataHandler::QTermDataHandler(QObject *parent) :
    QObject(parent)
  , m_bRunning(false)
{
}
QTermDataHandler * QTermDataHandler::instance()
{
    static QTermDataHandler _instance;
    return &_instance;
}

bool QTermDataHandler::start()
{
    GasInfoSettings s;
    SerialPortInfo termPortInfo = s.serialPortInfo();
    SerialPortInfo gpsPortInfo = s.gpsPortInfo();

    PortSettings termSettings;
    termSettings.BaudRate = (BaudRateType)termPortInfo.BaudRate;
    termSettings.DataBits = (DataBitsType)termPortInfo.DataBits;
    termSettings.FlowControl = (FlowType)termPortInfo.FlowControl;
    termSettings.Parity = (ParityType)termPortInfo.Parity;
    termSettings.StopBits = (StopBitsType)termPortInfo.StopBits;
    termSettings.Timeout_Millisec = (long)termPortInfo.Timeout_Millisec;

    PortSettings gpsSettings;
    gpsSettings.BaudRate = (BaudRateType)gpsPortInfo.BaudRate;
    gpsSettings.DataBits = (DataBitsType)gpsPortInfo.DataBits;
    gpsSettings.FlowControl = (FlowType)gpsPortInfo.FlowControl;
    gpsSettings.Parity = (ParityType)gpsPortInfo.Parity;
    gpsSettings.StopBits = (StopBitsType)gpsPortInfo.StopBits;
    gpsSettings.Timeout_Millisec = (long)gpsPortInfo.Timeout_Millisec;

//    PortSettings gpsSettings = {BAUD9600, DATA_8, PAR_NONE, STOP_1, FLOW_OFF, 10};
    term = new QextSerialPort(termPortInfo.name, termSettings, QextSerialPort::Polling);
    gps = new QextSerialPort(gpsPortInfo.name, gpsSettings, QextSerialPort::Polling);

    if ((!term->open(QIODevice::ReadWrite)) && REALDATA)
    {
        delete term;
        delete gps;
        return false;
    }

    if ((!gps->open(QIODevice::ReadOnly)) && REALDATA)
    {
        delete gps;
        //!!please input current location;
    }

    timer = new QTimer(this);
    bool ok = connect(timer, SIGNAL(timeout()), this, SLOT(update()));
    Q_ASSERT(ok);

    timerGps = new QTimer(this);
    ok = connect(timerGps, SIGNAL(timeout()), this, SLOT(updateGps()));
    Q_ASSERT(ok);

    maxID = s.maxTermCount();
    timer->start(s.scanInterval());
    timerGps->start(950);
    m_bRunning = true;
    return true;
}

void QTermDataHandler::stop()
{
    if (gps->isOpen())
        gps->close();
    term->close();

    timer->stop();
    delete timer;
    m_bRunning = false;
}
void QTermDataHandler::updateGps()
{
    if (gps->bytesAvailable())
    {
        QByteArray baGps = gps->readAll();
        int j = 0;
        while(true)
        {
            if ((j = baGps.indexOf("$GPRMC", j)) != -1) {
                baGps = baGps.right(baGps.size() - j);
            }else{
                baGps.clear();
                break;
            }

            QList<QByteArray> baList = baGps.split(',');

            if (baList.size() >= 6 && baList.at(2).at(0) == 'A')
            {
                double lat = nmeaDegreesToDecimal( QString(baList.at(3)).toDouble() );
                double lng = nmeaDegreesToDecimal( QString(baList.at(5)).toDouble() );

                GasInfoItem item;
                item.ch = 127;
                item.location = QGeoCoordinate(lat, lng);
               // bool b = item.location.isValid();
                emit newData(item);
                break;
            }
        }
    }
}

void QTermDataHandler::update(/*QTimerEvent *event*/)
{
    static uint ID;
    if(!REALDATA)
    {
        GasInfoItem item;
        item.ch = ID;
        item.fel = ID*1;
        item.h2s = ID*2;
        item.so2 = ID*3;
        if (ID == 3)
        {
            item.location = QGeoCoordinate(40, 116.3);
        }
        emit(newData(item));
    }
    if (term->isOpen())
    {
        term->write(QByteArray("Get") + (char)ID);
    }
    ID ++;

    if (term->bytesAvailable()) {
        ValidateMsg( term->readAll() );
    }

    if (ID == maxID)
    {
        ID = 0;
    }
}

double QTermDataHandler::nmeaDegreesToDecimal(double nmeaDegrees)
{
    double deg;
    double min = 100.0 * modf(nmeaDegrees / 100.0, &deg);
    return deg + (min / 60.0);
}

void QTermDataHandler::ValidateMsg(QByteArray dat)
{
    buffer += dat;
    while(buffer.size() >= MSGLEN)
    {
        int j = 0;
        if ((j = buffer.indexOf("fw", j)) != -1) {
            buffer = buffer.right(buffer.size() - j);
        }else{
            buffer.clear();
        }

        if (buffer.size() >= MSGLEN)
        {
            parseMsg(buffer.left(MSGLEN));
            buffer = buffer.right(buffer.size()-MSGLEN);
        }
    }
}

void QTermDataHandler::parseMsg(QByteArray msg)
{   //ch    lat         lng
    //2     3456 789    abcde f
    //n     hhmm.mmm    hhhmm.mmm
    GasInfoItem item;
    if (msg.at(2) <= maxID && msg.at(2) >= 0)
        item.ch = msg.at(2);
    else
        return;

    memcpy(&item.h2s, msg.data()+12, 4);
    memcpy(&item.so2, msg.data()+16, 4);
    memcpy(&item.fel, msg.data()+20, 4);
    float flat, flng; double lat, lng;
    memcpy(&flat, msg.data()+4, 4);
    memcpy(&flng, msg.data()+8, 4);
    lat = flat; lng = flng;

    lat = nmeaDegreesToDecimal(lat); lng = nmeaDegreesToDecimal(lng);

    item.location = QGeoCoordinate(lat, lng);
    emit newData(item);
}

void QTermDataHandler::sendAlarm(int ch, bool on)
{
    if (term->isOpen())
        if (on)
            term->write(QByteArray("WNG") + (char)ch);
        else
            term->write(QByteArray("OFF") + (char)ch);
}
