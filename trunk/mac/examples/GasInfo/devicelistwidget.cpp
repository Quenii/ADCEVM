#include "devicelistwidget.h"
#include "ui_devicelistwidget.h"

DeviceListWidget::DeviceListWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::DeviceListWidget)
{
    ui->setupUi(this);
}

DeviceListWidget::~DeviceListWidget()
{
    delete ui;
}
