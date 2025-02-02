#include "locationmanager.h"
#include "mapswidget.h"
// QGraphicsTextItem
#include "markerdialog.h"

#include <QtDebug>
#include <QMacStyle>

LocationManager::LocationManager(QObject *parent, QGraphicsGeoMap* map)
    : QObject(parent)
    , m_map(map)
{

}

QList<DeviceTextMarker*>LocationManager::markers() const
{
    return m_markers.values();
}

void LocationManager::addLocation(const GasInfoItem &item, const MapsWidget *widget, bool bAlarm)
{
    QGeoCoordinate location = item.location;
    int id = item.ch;

    if (!location.isValid())
    {
        qDebug() << "In LocationManager::addLocation(...): invalid QGeoCoordinate is passed in.";
        return ;
    }

    DeviceTextMarker* marker = 0;
    if (m_markers.contains(id))
    {
        marker = m_markers[id];
    }
    else
    {
        marker = new DeviceTextMarker(id);

        connect(widget, SIGNAL(markerClicked(Marker*)),
            this, SLOT(showMarkerDialog(Marker*)));

        m_map->addMapObject(marker);
        m_markers.insert(id, marker);
    }

    marker->setMarkerProperties(item, bAlarm);
    autoFit(true);
}

void LocationManager::addLocation(QGeoCoordinate location)
{
    if (!location.isValid())
    {
        qDebug() << "In LocationManager::addLocation(...): invalid QGeoCoordinate is passed in.";
        return ;
    }
    int id = HOSTID;
    DeviceTextMarker* marker = 0;
    if (m_markers.contains(id))
    {
        marker = m_markers[id];
    }
    else
    {
        marker = new DeviceTextMarker(id);
        m_map->addMapObject(marker);
        m_markers.insert(id, marker);
    }

    marker->setCoordinate(location);
    m_map->setCenter(location);

    autoFit(true);
}

void LocationManager::autoFit(bool keepCenter)
{
    QGeoBoundingBox box;
    foreach(QGeoMapObject* obj, markers())
    {
        if (!box.isValid())
            box = obj->boundingBox();
        else
            box = box.united(obj->boundingBox());
    }

    m_map->ensureVisible(m_map->boundingRect());

    m_map->fitInViewport(box, keepCenter); // true to maintain the center of the map.
}

void LocationManager::clearLocations()
{
    m_map->clearMapObjects();
    m_markers.clear();
}


void LocationManager::showMarkerDialog(Marker* marker)
{
    qDebug() << "showMarkerDialog() called";

    QString str;
    QGeoCoordinate loc = marker->coordinate();
    str += tr("Latitude: %1<br>").arg(coordinateFloatToQString(loc.latitude()));
    str += tr("Longitude: %1<br><br>").arg(coordinateFloatToQString(loc.longitude()));

    MarkerDialogWidget *w =
            new MarkerDialogWidget( tr("Terminal Location"),
                                    str, 0, 0 );
    w->show();
}

QString LocationManager::coordinateFloatToQString(float f)
{
    QString str;
    int t = f;
    f = (f-t)*60.0;
    t = t*100 + f;
    str += tr("%1° ").arg(t);
    f = (f-(t>100 ? t-100 : t))*60.0;
    t = f;
    str += tr("%1' ").arg(t);
    f = (f-t)*60.0;
    t = f;
    str += tr("%1\"").arg(t);
    return str;

}
