#include "devicelistwidget.h"
#include "ui_devicelistwidget.h"

#include <QHeaderView>

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

void DeviceListWidget::setModel(CentralModel *model)
{
    ui->view->setModel(model);
    for (int i = 2; i < model->columnCount(); ++i)
        ui->view->hideColumn(i);
}
