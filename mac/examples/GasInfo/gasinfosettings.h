#ifndef GASINFOSETTINGS_H
#define GASINFOSETTINGS_H

#include "SerialTypes.hpp"

#include <QSettings>
#include <QDateTime>
#include <QHash>
#include <QString>
#include <QVariant>

class GasInfoSettings : public QSettings
{
    Q_OBJECT

    typedef QHash<QString, QVariant> Hash;

public:
    explicit GasInfoSettings(QObject *parent = 0);

public: 

    void setValue(const QString & key, const QVariant & value);

    // the xxxF version of reading functions avoids multiple registry
    // access and enables very fast key access.
    //
    static ApplicationModes applicationModeF();
    static void setApplicationMode(ApplicationModes mode);

    static bool terminalAlarmWindowOpenF(int id);
    static void setTerminalAlermWindowOpen(int id, bool bOpen);

    // the returned period is in seconds.
    static int terminalAlarmMuteTimeF() { return 3 * 60; } // 3 minutes

    static double h2sAlarmThresF();
    double h2sAlarmThres() const;
    void setH2sAlarmThres(double val);

    static double so2AlarmThresF();
    double so2AlarmThres();
    void setSo2AlarmThres(double val);

    static double felAlarmThresF();
    double felAlarmThres();
    void setFelAlarmThres(double val);

    // in seconds
    static uint archivePeriodF();
    uint archivePeriod();
    void setArchivePeriod(uint seconds);

    static int activeIntervalF();
    int activeInterval();
    void setActiveInternal(int seconds);


public:

    QGeoCoordinate defaultHostLocation() const;
    void setDefaultHostLocation(const QGeoCoordinate& location);

    QByteArray mainWindowGeometry() const;
    void setMainWindowGeometry(const QByteArray& data);

    QByteArray mainWindowState() const;
    void setMainWindowState(const QByteArray& state);

    void setWindowPos(const QString& windowTitle, const QPoint& pos);
    QPoint windowPos(const QString& windowTitle) const;

    void setWindowSize(const QString& windowTitle, const QSize& size);
    QSize windowSize(const QString& windowTitle) const;

    SerialPortInfo serialPortInfo() const;
    void setSerialPortInfo(const SerialPortInfo& val);

    SerialPortInfo gpsPortInfo() const;
    void setGpsPortInfo(const SerialPortInfo& val);

    QString  dataFolder() const;
    void setdataFolder(const QString& dir);

signals:
    
public slots:

private:
    static Hash& reg(){ static Hash g_d; return g_d; }
};

#endif // GASINFOSETTINGS_H
