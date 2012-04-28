#include "gasinfosettings.h"

#include <QApplication>
#include <QDir>
#include <QPoint>
#include <QSize>
#include <QtDebug>

static const char* mainWindowGeometryKey = "mainWindow/geometry";
static const char* mainWindowStateKey = "mainWindow/state";

static const char* scanIntervalKey = "option/scanInterval";
static const char* maxTermCountKey = "option/maxTermCount";
static const char* dataFolderKey = "option/dataFolder";
static const char* archivePeriodKey = "option/archivePeriod";
static const char* activeIntervalKey = "option/activeInterval";
static const char* defaultHostLocationKey = "option/defaulHostLocation";

static const char* h2sAlarmThresKey = "option/h2sAlarmThres";
static const char* so2AlarmThresKey = "option/so2AlarmThres";
static const char* felAlarmThresKey = "option/felAlarmThres";
static const char* o2AlarmThresKey = "option/o2AlarmThres";
static const char* coAlarmThresKey = "option/coAlarmThres";

static const char* serialPortInfoKey = "communication/serialPortInfo";
static const char* gpsPortInfoKey = "communication/gpsPortInfo";


static QString terminalAlarmWindowOpenKey(int id)
{
    return QString("state/Terminal %1/alarmWindowOpen").arg(id);
}

///////////////////////////////////////////////////////////////////////////


static ApplicationModes g_applicationMode = Receive;

///////////////////////////////////////////////////////////////////////////


GasInfoSettings::GasInfoSettings(QObject *parent) :
    QSettings(parent)
{

}


void GasInfoSettings::setValue(const QString & key, const QVariant & value)
{
    Hash* h = reg();
    if (h->contains(key))
    {
        (*h)[key] = value;
    }

    QSettings::setValue(key, value);
}



bool GasInfoSettings::terminalAlarmWindowOpenF(int id)
{
    QString key = terminalAlarmWindowOpenKey(id);

    Hash* h = reg();

    if (!h->contains(key))
    {
        (*h)[key] = false;
    }

     return   (*h)[key].toBool();
}

void GasInfoSettings::setTerminalAlermWindowOpen(int id, bool bOpen)
{
    QString key = terminalAlarmWindowOpenKey(id);
    Hash* h = reg();
    (*h)[key] = bOpen;
}

double GasInfoSettings::h2sAlarmThres() const
{
    return value(h2sAlarmThresKey).toDouble();
}

double GasInfoSettings::h2sAlarmThresF()
{
    Hash* h = reg();
    if (!h->contains(h2sAlarmThresKey))
    {
        GasInfoSettings settings;
        (*h)[h2sAlarmThresKey] = settings.h2sAlarmThres();
    }

    return  (*h)[h2sAlarmThresKey].toDouble();
}

void GasInfoSettings::setH2sAlarmThres(double val)
{
    setValue(h2sAlarmThresKey, val);
}


double GasInfoSettings::so2AlarmThresF()
{
    Hash* h = reg();
    if (!h->contains(so2AlarmThresKey))
    {
        GasInfoSettings settings;
        (*h)[so2AlarmThresKey] = settings.so2AlarmThres();
    }

    return  (*h)[so2AlarmThresKey].toDouble();
}

double GasInfoSettings::so2AlarmThres()
{
    return value(so2AlarmThresKey).toDouble();
}

void GasInfoSettings::setSo2AlarmThres(double val)
{
    setValue(so2AlarmThresKey, val);
}

double GasInfoSettings::felAlarmThresF()
{
    Hash* h = reg();
    if (!h->contains(felAlarmThresKey))
    {
        GasInfoSettings settings;
        (*h)[felAlarmThresKey] = settings.felAlarmThres();
    }

    return  (*h)[felAlarmThresKey].toDouble();
}

double GasInfoSettings::felAlarmThres()
{
    return value(felAlarmThresKey).toDouble();
}

void GasInfoSettings::setFelAlarmThres(double val)
{
    setValue(felAlarmThresKey, val);
}
//////////////////////////////////////////////
double GasInfoSettings::o2AlarmThresF()
{
    Hash* h = reg();
    if (!h->contains(o2AlarmThresKey))
    {
        GasInfoSettings settings;
        (*h)[o2AlarmThresKey] = settings.o2AlarmThres();
    }

    return  (*h)[o2AlarmThresKey].toDouble();
}

double GasInfoSettings::o2AlarmThres()
{
    return value(o2AlarmThresKey).toDouble();
}

void GasInfoSettings::setO2AlarmThres(double val)
{
    setValue(o2AlarmThresKey, val);
}
////////////////////////////
double GasInfoSettings::coAlarmThresF()
{
    Hash* h = reg();
    if (!h->contains(coAlarmThresKey))
    {
        GasInfoSettings settings;
        (*h)[coAlarmThresKey] = settings.coAlarmThres();
    }

    return  (*h)[coAlarmThresKey].toDouble();
}

double GasInfoSettings::coAlarmThres()
{
    return value(coAlarmThresKey).toDouble();
}

void GasInfoSettings::setCoAlarmThres(double val)
{
    setValue(coAlarmThresKey, val);
}

///////////////////////////////////////
QGeoCoordinate GasInfoSettings::defaultHostLocation() const
{
    QByteArray ba = value(defaultHostLocationKey).toByteArray();
    QDataStream in(&ba, QIODevice::ReadOnly);
    QGeoCoordinate location;

    in >> location;

    if (!location.isValid())
        return QGeoCoordinate(39.903924, 116.391432, 0);
    else
        return location;
}

void GasInfoSettings::setDefaultHostLocation(const QGeoCoordinate& location)
{
    QByteArray ba;
    QDataStream out(&ba, QIODevice::WriteOnly);
    out << location;

    setValue(defaultHostLocationKey, ba);
}

int GasInfoSettings::activeIntervalF()
{
    Hash* h = reg();
    if (!h->contains(activeIntervalKey))
    {
        GasInfoSettings settings;
        (*h)[activeIntervalKey] = settings.activeInterval();
    }

    return  (*h)[activeIntervalKey].toInt();
}

int GasInfoSettings::activeInterval()
{
    return value(activeIntervalKey).toInt();
}

void GasInfoSettings::setActiveInternal(int seconds)
{
    setValue(activeIntervalKey, seconds);
}


ApplicationModes GasInfoSettings::applicationModeF()
{
    return g_applicationMode;
}

void GasInfoSettings::setApplicationMode(ApplicationModes mode)
{
    g_applicationMode = mode;
}

uint GasInfoSettings::archivePeriodF()
{
    Hash* h = reg();
    if (!h->contains(archivePeriodKey))
    {
        (*h)[archivePeriodKey] = GasInfoSettings().archivePeriod();
    }

    return (*h)[archivePeriodKey].toInt();
}

uint GasInfoSettings::archivePeriod()
{
    return value(archivePeriodKey, 24 * 60).toInt();
}


void GasInfoSettings::setArchivePeriod(uint seconds)
{
    setValue(archivePeriodKey, seconds);
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

SerialPortInfo GasInfoSettings::gpsPortInfo() const
{
    return value(gpsPortInfoKey).value<SerialPortInfo>();
}

void GasInfoSettings::setGpsPortInfo(const SerialPortInfo& val)
{
    setValue(gpsPortInfoKey, val);

}
QString GasInfoSettings::dataFolder() const
{
    QString appDir = qApp->applicationDirPath();
    QString defaultDir = QDir(appDir).filePath("../data");
    defaultDir = QDir(defaultDir).absolutePath();

    return value(dataFolderKey, defaultDir).toString();
}

void GasInfoSettings::setdataFolder(const QString& dir)
{
    setValue(dataFolderKey, dir);
}

void GasInfoSettings::setWindowPos(const QString& windowTitle, const QPoint& pos)
{
    QString posKey = QString("%1/pos").arg(windowTitle);
    setValue(posKey, pos);
}

QPoint GasInfoSettings::windowPos(const QString& windowTitle) const
{
    QString posKey = QString("%1/pos").arg(windowTitle);
    return value(posKey, QPoint(0, 0)).toPoint();
}

void GasInfoSettings::setWindowSize(const QString& windowTitle, const QSize& size)
{
    QString sizeKey = QString("%1/size").arg(windowTitle);
    setValue(sizeKey, size);
}

QSize GasInfoSettings::windowSize(const QString& windowTitle) const
{
    QString sizeKey = QString("%1/size").arg(windowTitle);
    return value(sizeKey, QSize(200, 200)).toSize();
}

uint GasInfoSettings::scanInterval()
{
    return value(scanIntervalKey, 60).toUInt();
}

void GasInfoSettings::setScanInterval(uint seconds)
{
    setValue(scanIntervalKey, seconds);
}

uint GasInfoSettings::maxTermCount()
{
    return value(maxTermCountKey, 64).toUInt();
}

void GasInfoSettings::setMaxTermCount(uint n)
{
    setValue(maxTermCountKey, n);
}
