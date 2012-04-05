#include "locationmanager.h"

// QGraphicsTextItem

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

void LocationManager::addLocation(int id, QGeoCoordinate location, bool bAlarm)
{
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
        m_map->addMapObject(marker);
        m_markers.insert(id, marker);
    }

    marker->setCoordinate(location, bAlarm);
    if (id == 0)
    {
        m_map->setCenter(location);
    }


    QGeoBoundingBox box;
    foreach(QGeoMapObject* obj, markers())
    {
        if (!box.isValid())
            box = obj->boundingBox();
        else
            box = box.united(obj->boundingBox());
    }

    m_map->ensureVisible(m_map->boundingRect());

    m_map->fitInViewport(box, true); // true to maintain the center of the map.
}

void LocationManager::clearLocations()
{
    m_map->clearMapObjects();
    m_markers.clear();
}
