#include "locationmanager.h"

// QGraphicsTextItem

#include <QtDebug>

LocationManager::LocationManager(QObject *parent, QGraphicsGeoMap* map)
    : QObject(parent)
    , m_map(map)
{

}

void LocationManager::addLocation(int id, QGeoCoordinate location)
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
        if (marker->coordinate() == location) // no need to update
            return ;
    }
    else
    {
        marker = new DeviceTextMarker(id);
        /*QString name = (id == 0) ? "Host" : QString("Terminal %1").arg(id);
        marker->setName(name);
*/
        m_map->addMapObject(marker);
        m_markers.insert(id, marker);
    }

    marker->setCoordinate(location);
    if (id == 0)
    {
        m_map->setCenter(location);
    }
}

void LocationManager::clearLocations()
{
    m_map->clearMapObjects();
    m_markers.clear();
}
