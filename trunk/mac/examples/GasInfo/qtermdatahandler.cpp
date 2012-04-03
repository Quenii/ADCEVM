#include "qtermdatahandler.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"

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

    m_bRunning = true;
    return true;
}

void QTermDataHandler::stop()
{

}

void QTermDataHandler::timerEvent(QTimerEvent *event)
{


    //emit newData(item);
}
