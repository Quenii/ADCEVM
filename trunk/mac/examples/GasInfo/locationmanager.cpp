#include "locationmanager.h"

// QGraphicsTextItem

LocationManager::LocationManager(QObject *parent, QGraphicsGeoMap* map)
    : QObject(parent)
    , m_map(map)
{

}

void LocationManager::addLocation(int id, QGeoCoordinate location)
{
    Marker* marker = 0;
    if (m_markers.contains(id))
    {

        marker = m_markers[id];
    }
    else
    {
        marker = new Marker((id == 0) ? Marker::MyLocationMarker : Marker::SearchMarker);
        QString name = (id == 0) ? "Host" : QString("Terminal %1").arg(id);

        marker->setName(name);

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
