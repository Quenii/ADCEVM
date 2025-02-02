#ifndef LOCATIONMANAGER_H
#define LOCATIONMANAGER_H

#include "qgraphicsgeomap.h"
#include "Marker.h"
#include "QGeoMapTextObject.h"
#include "QGeoMapGroupObject.h"
#include "SerialTypes.hpp"

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
        , m_marker(new Marker((id == HOSTID) ? Marker::MyLocationMarker : Marker::SearchMarker))

    {
        if (m_id == HOSTID)
            m_text->setText(tr("Host"));
        else
            m_text->setText(tr("Terminal %1").arg(m_id));

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


        if (m_id < LIFEBASE && m_bAlarm != bAlarm)
        {
            m_bAlarm = bAlarm;
            m_marker->setMarkerType(bAlarm? Marker::WaypointMarker : Marker::SearchMarker);
        }

    }

    void setMarkerProperties(const GasInfoItem& item, bool bAlarm = false)
    {
        setCoordinate(item.location, bAlarm);
        m_markerInfo.clear();
        m_markerInfo += tr("Terminal %1: <br><br>").arg(m_item.ch);
        m_markerInfo += tr("Latitude: %1<br>").arg(m_item.location.latitude());
        m_markerInfo += tr("Longitude: %1<br><br>").arg(m_item.location.longitude());
        m_markerInfo += tr("H2S: %1 ppm<br>").arg(m_item.h2s);
        m_markerInfo += tr("SO2: %1 ppm<br>").arg(m_item.so2);
        m_markerInfo += tr("FEL: %1 %<br>").arg(m_item.fel);
        m_markerInfo += tr("O2: %1 ppm<br>").arg(m_item.o2);
        m_markerInfo += tr("CO: %1 %").arg(m_item.co);
    }

    void setText(const QString& str)
    {

    }

    QGeoCoordinate coordinate()
    {
        return m_marker->coordinate();
    }

    QString markerInfo()
    {
        return m_markerInfo;
    }

private:
    int m_id;
    QString m_markerInfo;
    GasInfoItem m_item;
    bool m_bAlarm;
    QGeoMapTextObject* m_text;
    Marker* m_marker;
};

class MapsWidget;

class LocationManager : public QObject
{
    Q_OBJECT
public:
    explicit LocationManager(QObject *parent, QGraphicsGeoMap* map);

public:
    QList<DeviceTextMarker*> markers() const;
    void autoFit(bool keepCenter);
    QString coordinateFloatToQString(float f);

public slots:
    // id: 127 for Host, <127 for terminals.
    void addLocation(QGeoCoordinate location);
    void addLocation(const GasInfoItem &item, const MapsWidget *widget, bool bAlarm = false);
    void clearLocations();
    void showMarkerDialog(Marker* marker);

private:
    QGraphicsGeoMap* m_map;
    QHash<int, DeviceTextMarker*> m_markers;
};

#endif // LOCATIONMANAGER_H
