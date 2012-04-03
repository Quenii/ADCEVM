#include "qtermdatahandler.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"
#include "SerialTypes.hpp"
#include "QGasInfo.h"

#include <QTimer>
#include <QNmeaPositionInfoSource>
#include <QByteArray>

#include <math.h>

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

    if (!term->open(QIODevice::ReadWrite))
    {
        delete term;
        delete gps;
        return false;
    }

    if (!gps->open(QIODevice::ReadOnly))
    {
        delete gps;
        //!!please input current location;
    }

    timer = new QTimer();
    timer->start(100);
    m_bRunning = true;
    return true;
}

void QTermDataHandler::stop()
{
    if (gps->isOpen())
        gps->close();
    term->close();

    delete timer;
    m_bRunning = false;
}

void QTermDataHandler::timerEvent(QTimerEvent *event)
{
    static int ID, CNT;
    ID ++;
    CNT ++;

    if (term->isOpen())
        term->write(QString("Get%1").arg(ID).toLatin1());

    if (term->bytesAvailable()) {
        ValidateMsg( term->readAll() );
    }

    if (CNT == 10 && gps->bytesAvailable())
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
                item.ch = 0;
                item.location = QGeoCoordinate(lat, lng);
                emit newData(item);
                break;
            }
        }
        CNT = 0;
    }

    if (ID == TERMIDMAX)
        ID = 0;
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
    if (msg.at(2) <= TERMIDMAX)
        item.ch = msg.at(2);
    else
        return;

    QGasInfo h2s(0.05703125f);
    QGasInfo so2(0.07564296520423600605143721633888f);
    QGasInfo fel(0.038124285169653069004956157072055f, 0x05c0);

    item.h2s = h2s.Deduce(buffer[20]*256 + buffer[21]);
    item.so2 = so2.Deduce(buffer[18]*256 + buffer[19]);
    item.fel = fel.Deduce(buffer[22]*256 + buffer[23]);


}
