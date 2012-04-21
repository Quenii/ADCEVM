#ifndef COMPASS_H
#define COMPASS_H

#include <QObject>
class QGeoCoordinate;
class Compass : public QObject
{
    Q_OBJECT
public:
    explicit Compass(QObject *parent = 0);
    
    QByteArray getMessage();
    QGeoCoordinate getLocation();

    uint getID();
    void sendCommand();

signals:

public slots:
    
};

#endif // COMPASS_H
