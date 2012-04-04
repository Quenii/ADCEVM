#ifndef QTERMDATAHANDLER_H
#define QTERMDATAHANDLER_H

#include <QObject>

#define TERMIDMAX   64
#define MSGLEN      24

class GasInfoItem;
class QextSerialPort;
class QTimer;
class QByteArray;

class QTermDataHandler : public QObject
{
    Q_OBJECT
public:
    bool start();
    void stop();
    bool isRunning()    {   return m_bRunning;  }

    double nmeaDegreesToDecimal(double);
    void ValidateMsg(QByteArray);
    void parseMsg(QByteArray msg);

    static QTermDataHandler * instance();
    Q_DISABLE_COPY(QTermDataHandler)
signals:
    //void MainWindow::addData(const GasInfoItem& item);
    void newData(GasInfoItem& item);
    void newMsg(QByteArray& msg);

public slots:

//protected:
    void update(/*QTimerEvent **/);
    
private:
    QTermDataHandler(QObject *parent = 0);
    bool m_bRunning;

    QextSerialPort *gps;
    QextSerialPort *term;

    QTimer *timer;

    QByteArray buffer;

};

#endif // QTERMDATAHANDLER_H
