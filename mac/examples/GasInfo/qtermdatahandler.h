#ifndef QTERMDATAHANDLER_H
#define QTERMDATAHANDLER_H

#include <QObject>

class GasInfoItem;
class QextSerialPort;

class QTermDataHandler : public QObject
{
    Q_OBJECT
public:
    bool start();
    void stop();
    bool isRunning()    {   return m_bRunning;  }

    static QTermDataHandler * instance();
    Q_DISABLE_COPY(QTermDataHandler)
signals:
    //void MainWindow::addData(const GasInfoItem& item);
    void newData(GasInfoItem& item);

public slots:

protected:
    void timerEvent(QTimerEvent *);
    
private:
    QTermDataHandler(QObject *parent = 0);
    bool m_bRunning;

    QextSerialPort *gps;
    QextSerialPort *term;

};

#endif // QTERMDATAHANDLER_H
