#include "qmapwidget.h"
#include "googlemapview.h"
#include "ui_qmapwidget.h"


QMapWidget::QMapWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::QMapWidget)
{
    ui->setupUi(this);

    ui->webView->geoCode("Linz");

}

QMapWidget::~QMapWidget()
{
    delete ui;
}
