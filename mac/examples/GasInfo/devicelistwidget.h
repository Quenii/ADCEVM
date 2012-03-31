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

private:
    QList<int> selectedTerminals();

signals:
    void openCloseTerminals(const QList<int>& idList, bool open);
    void deleteTerminals(const QList<int>& idList);

private slots:
    void terminalTableViewCustomContextMenu(const QPoint& pos);
    void terminalTableViewDoubleClicked(const QModelIndex& index);

    void openCloseSelectedTerminals(bool open);
    void deleteSelectedTerminals();

private:
    Ui::DeviceListWidget *ui;
};

#endif // DEVICELISTWIDGET_H
