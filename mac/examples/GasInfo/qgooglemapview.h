#ifndef QGOOGLEMAPVIEW_H
#define QGOOGLEMAPVIEW_H

#include <QtGlobal>
#include <QObject>
#include <QWebView>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QList>
#include <QPointF>
#include <QStringList>

class QGoogleMapView : public QWebView
{
    Q_OBJECT

public:
    QGoogleMapView(QWidget *parent=0);

public slots:
    void replyFinished(QNetworkReply*);
    void loadCoordinates();
    void geoCode(const QString &address);
    void clearCoordinates();

signals:
    void reloadMap();

private:
    QNetworkAccessManager *manager;
    QList<QPointF> coordinates;
    int pendingRequests;
};

#endif // QGOOGLEMAPVIEW_H
