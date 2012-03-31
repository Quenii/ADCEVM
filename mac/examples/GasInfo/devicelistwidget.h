#ifndef DEVICELISTWIDGET_H
#define DEVICELISTWIDGET_H

#include "centralmodel.h"

#include <QWidget>

namespace Ui {
    class DeviceListWidget;
}

class DeviceListWidget : public QWidget
{
    Q_OBJECT

public:
    explicit DeviceListWidget(QWidget *parent = 0);
    ~DeviceListWidget();

public:
    void setModel(CentralModel *model);

signals:
    void doubleClicked(const QModelIndex& index);

private:
    Ui::DeviceListWidget *ui;
};

#endif // DEVICELISTWIDGET_H
