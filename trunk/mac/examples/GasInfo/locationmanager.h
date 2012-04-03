#ifndef LOCATIONMANAGER_H
#define LOCATIONMANAGER_H

#include "qgraphicsgeomap.h"
#include "Marker.h"

#include <QObject>
#include <QHash>


class LocationManager : public QObject
{
    Q_OBJECT
public:
    explicit LocationManager(QObject *parent, QGraphicsGeoMap* map);
    
signals:

    
public slots:
    // id: 0 for Host, >0 for terminals.
    void addLocation(int id, QGeoCoordinate location);
    void clearLocations();

private:
    QGraphicsGeoMap* m_map;
    QHash<int, Marker*> m_markers;
};

#endif // LOCATIONMANAGER_H
