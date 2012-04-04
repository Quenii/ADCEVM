#ifndef LOCATIONMANAGER_H
#define LOCATIONMANAGER_H

#include "qgraphicsgeomap.h"
#include "Marker.h"
#include "QGeoMapTextObject.h"
#include "QGeoMapGroupObject.h"

#include <QObject>
#include <QHash>


class DeviceTextMarker : public QGeoMapGroupObject
{
public:
    explicit DeviceTextMarker(int id)
        : QGeoMapGroupObject()
        , m_id(id)
        , m_bAlarm(false)
        , m_text(new QGeoMapTextObject())
        , m_marker(new Marker((id == 0) ? Marker::MyLocationMarker : Marker::SearchMarker))

    {
        if (m_id == 0)
            m_text->setText(QString::fromLocal8Bit("主站"));
        else
            m_text->setText(QString::fromLocal8Bit("%1号终端").arg(m_id));

        addChildObject(m_text);
        addChildObject(m_marker);
    }

public:
    void setCoordinate(const QGeoCoordinate& location, bool bAlarm = false)
    {
        if (m_marker->coordinate()!= location)
        {
            m_text->setCoordinate(location);
            m_text->setAlignment(Qt::AlignCenter);
            m_text->setOffset(QPoint(m_text->boundingBox().width() / 2, m_text->boundingBox().height() + 20));

            m_marker->setCoordinate(location);
        }


        if (m_id != 0 && m_bAlarm != bAlarm)
        {
            m_bAlarm = bAlarm;
            m_marker->setMarkerType(bAlarm? Marker::WaypointMarker : Marker::SearchMarker);
        }

    }

    void setText(const QString& str)
    {

    }

    QGeoCoordinate coordinate()
    {
        return m_marker->coordinate();
    }

private:
    int m_id;
    bool m_bAlarm;
    QGeoMapTextObject* m_text;
    Marker* m_marker;
};


class LocationManager : public QObject
{
    Q_OBJECT
public:
    explicit LocationManager(QObject *parent, QGraphicsGeoMap* map);
    
signals:

    
public slots:
    // id: 0 for Host, >0 for terminals.
    void addLocation(int id, QGeoCoordinate location, bool bAlarm = false);
    void clearLocations();

private:
    QGraphicsGeoMap* m_map;
    QHash<int, DeviceTextMarker*> m_markers;
};

#endif // LOCATIONMANAGER_H
