#ifndef COMPASS_H
#define COMPASS_H

#include <QObject>
#include <QByteArray>
#include <QGeoCoordinate>
using namespace QtMobility;
struct COMPASSCMD
{
    QByteArray cmdword;
    unsigned short len;
    uint addr;
    QByteArray params;
    unsigned char cksum;
};

class QextSerialPort;
class Compass : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(Compass);

private:
    Compass(QObject *parent = 0);
public:
    static Compass *instance(QextSerialPort *term);
    bool getMessage(QByteArray& msg, const QByteArray &hdr);
    bool getLocation();
    bool getSensorData();
    bool getID(uint& id);
    int getRFPower();
    bool sendMessage(const uint &adr, QByteArray& msg);

    void sendCommand(COMPASSCMD& cmd);

signals:

public slots:
private:
    QByteArray buffer;
    QextSerialPort *term;

    uint hostID;
    QByteArray rfPower;
    
};

#endif // COMPASS_H
