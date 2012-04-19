#include "SerialTypes.hpp"
#include "ui_MapTab.h"

class QMapTabWidget : public QWidget
{
public:
        QMapTabWidget(QWidget* parent = 0, Qt::WindowFlags f = 0);

        void updateGraphic(QList<GpsInfo>& list);
    void paintEvent(QPaintEvent *);
public:
        Ui_MapTab ui;

private:
    float maxX;
    float maxY;
    QList<GpsInfo> posList;
};
