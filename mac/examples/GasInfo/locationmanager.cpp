#include "locationmanager.h"

// QGraphicsTextItem

#include <QtDebug>

LocationManager::LocationManager(QObject *parent, QGraphicsGeoMap* map)
    : QObject(parent)
    , m_map(map)
{

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
    foreach(QGeoMapObject* obj, m_map->mapObjects())
    {
        box = box.united(obj->boundingBox());
    }

    m_map->fitInViewport(box, false);
}

void LocationManager::clearLocations()
{
    m_map->clearMapObjects();
    m_markers.clear();
}
