#include "qtermdatahandler.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"
#include "SerialTypes.hpp"
#include "QGasInfo.h"
#include "compass.h"

#include <QTimer>
//#include <QNmeaPositionInfoSource>
#include <QByteArray>
#include <QDebug>

#include <math.h>

#define REALDATA 1
uint addr[] =
{
    0x040014,
    0x040014
};
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

    term = new QextSerialPort(termPortInfo.name, termSettings, QextSerialPort::Polling);

    if ((!term->open(QIODevice::ReadWrite)) && REALDATA)
    {
        delete term;
        return false;
    }

    compass = Compass::instance(term);

//    uint hostID = 0;
//    compass->getID(hostID);
//    compass->getRFPower();

//    QGeoCoordinate loc;
//    compass->getLocation(loc);

//    QByteArray dst;// = 0x03D1AE;
//    dst[0] = 0x03; dst[1] = 0xD1; dst[2] = 0xAE;
//    QByteArray msg = "Help me! Compass 1!";
//    compass->sendMessage(dst, msg);

//    term->close();
//    delete term;
//    return false;

    timer = new QTimer(this);
    bool ok = connect(timer, SIGNAL(timeout()), this, SLOT(query()));
    Q_ASSERT(ok);

    timerReceiver = new QTimer(this);
    ok = connect(timer, SIGNAL(timeout()), this, SLOT(update()));
    Q_ASSERT(ok);

    maxID = s.maxTermCount();
    uint t = s.scanInterval();
    timer->start(t * 1000); //in seconds
    timerReceiver->start(t / 2 * 1000);

    m_bRunning = true;
    return true;
}

void QTermDataHandler::stop()
{
    term->close();

    timer->stop();
    delete timer;
    m_bRunning = false;
}
void QTermDataHandler::query()
{
    static uint ID = 0;

    if(!REALDATA)
    {
        GasInfoItem item;
        item.ch = ID;
        item.fel = ID*1;
        item.h2s = ID*2;
        item.so2 = ID*3;
        item.o2 = ID*4;
        item.co = ID*5;
        if (ID == 3)
        {
            item.location = QGeoCoordinate(40, 116.3);
            GasInfoItem life;
            life.ch = 91;
            life.fel = life.ch + 1;
            life.location = QGeoCoordinate(40.1, 116.3);
            emit(newData(life));
        }
        emit(newData(item));
    }

    if (term->isOpen() && ID < maxID)
    {
        QByteArray msg = "Get" + (char)ID;
        compass->sendMessage(addr[ID], msg);
    }

    ID ++;
    if (ID == maxID)
    {
        ID = 0;
        compass->getLocation();
    }
}

void QTermDataHandler::update(/*QTimerEvent *event*/)
{
    QByteArray msg;
    if (compass->getMessage(msg, QByteArray("$DWXX")))
    {
        double lat = 0.0, lng = 0.0;
        lng = msg[18] + double(msg[19])/60.0 + double(msg[20])/3600.0;
        lat = msg[22] + double(msg[23])/60.0 + double(msg[24])/3600.0;
        qDebug() << QString("Got location message, lat: %1, lng: %2").arg(lat).arg(lng);
        QGeoCoordinate loc(lat, lng);
        GasInfoItem item;
        item.location = loc;
        item.ch = HOSTID;
        emit(newData(item));
    }

    if (compass->getMessage(msg, QByteArray("$TXXX")))
    {
        parseMsg(msg.mid(18));
        qDebug() << msg.mid(18);
    }

    int power = compass->getRFPower();
    if (power == 1)
    {
        emit(compassOK(true));
    }
    else if (power == 0)
    {
        emit(compassOK(false));
    }

    if (compass->getMessage(msg, QByteArray("$FKXX")))
    {
        //simply dump the FKXX
        ;
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
    if (msg.size() < 32)
        return;

    GasInfoItem item;
    if (msg.at(2) <= maxID && msg.at(2) >= 0)
        item.ch = msg.at(2);
    else
        return;

    memcpy(&item.h2s, msg.data()+12, 4);
    memcpy(&item.so2, msg.data()+16, 4);
    memcpy(&item.fel, msg.data()+20, 4);
    memcpy(&item.o2, msg.data()+24, 4);
    memcpy(&item.co, msg.data()+28, 4);
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
    {
        QByteArray msg;
        if (on)
        {
            //term->write(QByteArray("WNG") + (char)ch);
            msg = "WNG";
        }else
        {
            //term->write(QByteArray("OFF") + (char)ch);
            msg = "OFF";
        }
        compass->sendMessage(addr[ch], msg);
    }
}
