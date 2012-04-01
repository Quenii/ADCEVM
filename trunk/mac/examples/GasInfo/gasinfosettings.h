#ifndef GASINFOSETTINGS_H
#define GASINFOSETTINGS_H

#include "SerialTypes.hpp"

#include <QSettings>

class GasInfoSettings : public QSettings
{
    Q_OBJECT
public:
    explicit GasInfoSettings(QObject *parent = 0);

public:

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
        
    QString  dataFolder() const;
    void setdataFolder(const QString& dir);

signals:
    
public slots:
    
};

#endif // GASINFOSETTINGS_H
