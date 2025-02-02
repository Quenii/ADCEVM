#ifndef DEVICELISTWIDGET_H
#define DEVICELISTWIDGET_H

#include "centralmodel.h"

#include <QWidget>

namespace Ui {
    class DeviceListWidget;
}

class QTermDataHandler;

class DeviceListWidget : public QWidget
{
    Q_OBJECT

public:
    explicit DeviceListWidget(QWidget *parent = 0);
    ~DeviceListWidget();

public:
    void setModel(CentralModel *model);

private:
    QMap<int, int> selectedTerminals();
    void exportTerminalData();
signals:
    void openCloseTerminals(const QMap<int, int>& idList, bool open);
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

    void on_alarmOnPushButton_clicked();
    void on_alarmOffPushButton_clicked();

private:
    Ui::DeviceListWidget *ui;

    //QTermDataHandler *term;
};

#endif // DEVICELISTWIDGET_H
