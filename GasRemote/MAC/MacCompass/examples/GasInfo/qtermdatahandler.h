#ifndef QTERMDATAHANDLER_H
#define QTERMDATAHANDLER_H

#include <QObject>
#include <QMap>
#include "compass.h"

#define MSGLEN      24

class GasInfoItem;
class QextSerialPort;
class QTimer;
class QByteArray;

class QTermDataHandler : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(QTermDataHandler)

public:
    bool start();
    void stop();
    bool isRunning()    {   return m_bRunning;  }

    double nmeaDegreesToDecimal(double);
    void ValidateMsg(QByteArray);
    void parseMsg(QByteArray msg, QByteArray addr);

    void sendAlarm(int ch, bool on = true);

    static QTermDataHandler * instance();


signals:
    void newMsg(QByteArray& msg);
    void newData(const GasInfoItem& item);
    void compassOK(bool ok);
public slots:

//protected:
    void update(/*QTimerEvent **/);
    void query();
private:
    QTermDataHandler(QObject *parent = 0);
    bool m_bRunning;

    QextSerialPort *gps;
    QextSerialPort *term;

    QTimer *timer, *timerReceiver;
    QByteArray buffer;
    Compass* compass;

    uint maxID;

    bool bLocationValid;

    QMap<int, int> addrs;

};

#endif // QTERMDATAHANDLER_H
