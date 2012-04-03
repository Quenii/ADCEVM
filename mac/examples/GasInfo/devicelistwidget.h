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
    void exportTerminalData();
signals:
    void openCloseTerminals(const QList<int>& idList, bool open);
    void deleteTerminals(const QList<int>& idList);
    void applicationModeChanged();

private slots:
    void terminalTableView_customContextMenu(const QPoint& pos);
    void terminalTableView_doubleClicked(const QModelIndex& index);

    void openCloseSelectedTerminals(bool open);
    void deleteSelectedTerminals();

    void on_receiveModePushButton_toggled(bool checked);
    void on_reviewModePushButton_toggled(bool checked);

    void on_pushButtonConfig_clicked();
    void on_pushButtonStart_clicked();

private:
    Ui::DeviceListWidget *ui;
};

#endif // DEVICELISTWIDGET_H
