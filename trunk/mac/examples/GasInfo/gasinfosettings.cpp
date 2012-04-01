#include "gasinfosettings.h"

#include <QApplication>
#include <QDir>
#include <QPoint>
#include <QSize>


static const char* serialPortInfoKey = "SerialPortInfo";
static const char* dataFolderKey = "dataFolder";

static const char* mainWindowGeometryKey = "mainWindow/geometry";
static const char* mainWindowStateKey = "mainWindow/state";


GasInfoSettings::GasInfoSettings(QObject *parent) :
    QSettings(parent)
{

}

QByteArray GasInfoSettings::mainWindowGeometry() const
{
    return value(mainWindowGeometryKey).toByteArray();
}

void GasInfoSettings::setMainWindowGeometry(const QByteArray& data)
{
    setValue(mainWindowGeometryKey, data);
}

QByteArray GasInfoSettings::mainWindowState() const
{
    return value(mainWindowStateKey).toByteArray();
}

void GasInfoSettings::setMainWindowState(const QByteArray& state)
{
    setValue(mainWindowStateKey, state);
}

SerialPortInfo GasInfoSettings::serialPortInfo() const
{
    return value(serialPortInfoKey).value<SerialPortInfo>();
}

void GasInfoSettings::setSerialPortInfo(const SerialPortInfo& val)
{
    setValue(serialPortInfoKey, val);

}

QString GasInfoSettings::dataFolder() const
{
    QString appDir = qApp->applicationDirPath();
    QString defaultDir = QDir(appDir).filePath("../data");

    return value(dataFolderKey, defaultDir).toString();
}

void GasInfoSettings::setdataFolder(const QString& dir)
{
    setValue(dataFolderKey, dir);
}

void GasInfoSettings::setWindowPos(const QString& windowTitle, const QPoint& pos)
{
    QString posKey = QString("%1 pos").arg(windowTitle);
    setValue(posKey, pos);
}

QPoint GasInfoSettings::windowPos(const QString& windowTitle) const
{
    QString posKey = QString("%1 pos").arg(windowTitle);
    return value(posKey, QPoint(0, 0)).toPoint();
}

void GasInfoSettings::setWindowSize(const QString& windowTitle, const QSize& size)
{
    QString sizeKey = QString("%1 size").arg(windowTitle);
    setValue(sizeKey, size);
}

QSize GasInfoSettings::windowSize(const QString& windowTitle) const
{
    QString sizeKey = QString("%1 size").arg(windowTitle);
    return value(sizeKey, QSize(200, 200)).toSize();
}

