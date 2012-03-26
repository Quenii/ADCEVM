#ifndef DEVICELISTWIDGET_H
#define DEVICELISTWIDGET_H

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

private:
    Ui::DeviceListWidget *ui;
};

#endif // DEVICELISTWIDGET_H
