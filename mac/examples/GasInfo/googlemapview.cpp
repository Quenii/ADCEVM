#include "googlemapview.h"

#include <QtDebug>
#include <QWebFrame>

QGoogleMapView::QGoogleMapView(QWidget *parent) : QWebView(parent), pendingRequests(0)
{
    manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(replyFinished(QNetworkReply*)));
    connect(this,SIGNAL(reloadMap()),
            this,SLOT(loadCoordinates()));

    load(QUrl("http://maps.google.com"));
    geoCode("");
}

void QGoogleMapView::geoCode(const QString& address)
{
    clearCoordinates();
    QString requestStr( tr("http://maps.google.com/maps/geo?q=%1&output=%2&key=%3")
            .arg("citibank, singapore")
            .arg("csv")
            .arg("0CyaIFHHJUaoVlXQPD-0ADs_s6Ud1Lb4kzep6MA"));
            //.arg("ABQIAAAADX-GI9AcnNpiPCPpHEOvyBTsWThlcmnAmd0F51atdZmM43x6-RR4YCYPrtwhf8O9wSWFJ3XkwjOHIw") );
    manager->get( QNetworkRequest(requestStr) );
    ++pendingRequests;
}

void QGoogleMapView::replyFinished(QNetworkReply *reply)
{
    if( reply->error() != QNetworkReply::NoError ) {
       qDebug () << reply->errorString();
       /* And probably we should do something in UI to reflect error state */
       return;
    }

    QString replyStr( reply->readAll() );
    QStringList coordinateStrList = replyStr.split(",");

    if( coordinateStrList.size() == 4 ) {
        QPointF coordinate( coordinateStrList[2].toFloat(),coordinateStrList[3].toFloat() );
        coordinates << coordinate;
    }

    --pendingRequests;
    if( pendingRequests<1 )
        emit( reloadMap() );
}

void QGoogleMapView::loadCoordinates()
{
    QStringList scriptStr;
    scriptStr
            << "var map = new GMap2(document.getElementById(\"map\"));"
            << "var bounds = new GLatLngBounds;"
            << "var markers = [];"
            << "map.setCenter( new GLatLng(0,0),1 );";

    int num=-1;
    foreach( QPointF point, coordinates ) {
        scriptStr << QString("markers[%1] = new GMarker(new GLatLng(%2, %3));")
                             .arg(++num)
                             .arg(point.x())
                             .arg(point.y());
    }

    scriptStr
            << "for( var i=0; i<markers.length; ++i ) {"
            << "   bounds.extend(markers[i].getPoint());"
            << "   map.addOverlay(markers[i]);"
            <<    "}"
            <<    "map.setCenter(bounds.getCenter());";


    this->page()->mainFrame()->evaluateJavaScript( scriptStr.join("\n") );
}

void QGoogleMapView::clearCoordinates()
{
    coordinates.clear();
}
