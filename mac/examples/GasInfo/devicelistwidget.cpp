#include "devicelistwidget.h"
#include "ui_devicelistwidget.h"
#include "centralmodel.h"
#include "gasinfosettings.h"
#include "qdevicedialog.h"
#include "qtermdatahandler.h"

#include <QHeaderView>
#include <QSet>
#include <QMenu>
#include <QtDebug>
#include <QFileDialog>
#include <QTimer>

DeviceListWidget::DeviceListWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::DeviceListWidget)
{
    ui->setupUi(this);

    ui->terminalTableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->terminalTableView->setSelectionMode(QAbstractItemView::ExtendedSelection);

    ui->terminalTableView->setContextMenuPolicy(Qt::CustomContextMenu);

    bool ok = connect(ui->terminalTableView, SIGNAL(customContextMenuRequested(const QPoint&)),
                      this, SLOT(terminalTableView_customContextMenu(const QPoint&)));
    Q_ASSERT(ok);

    ok = connect(ui->terminalTableView, SIGNAL(doubleClicked(const QModelIndex&)),
                 this, SLOT(terminalTableView_doubleClicked(const QModelIndex&)));
    Q_ASSERT(ok);

    QTimer::singleShot(0, ui->receiveModePushButton, SLOT(toggle()));

    GasInfoSettings s;
    QStringList term;
    for (int i=0; i<=s.maxTermCount(); ++i)
    {
        term << QString("%1").arg(i);
    }
    ui->comboBoxChannel->insertItems(0, term);
    ui->ledComm->turnOff();
    ui->ledGps->turnOff();
}

DeviceListWidget::~DeviceListWidget()
{
    delete ui;
}

void DeviceListWidget::setModel(CentralModel *model)
{
    ui->terminalTableView->setModel(model);
    for (int i = 2; i < model->columnCount(); ++i)
        ui->terminalTableView->hideColumn(i);
}

void DeviceListWidget::terminalTableView_doubleClicked(const QModelIndex &index)
{
    openCloseSelectedTerminals(true);
}

void DeviceListWidget::terminalTableView_customContextMenu(const QPoint &pos)
{
    QMenu menu;
    QAction* openAction = new QAction(QString::fromLocal8Bit("打开"), &menu);
    QAction* closeAction = new QAction(QString::fromLocal8Bit("关闭"), &menu);
    QAction* exportAction = new QAction(QString::fromLocal8Bit("导出"), &menu);
    QAction* deleteAction = new QAction(QString::fromLocal8Bit("删除"), &menu);
    menu.addAction(openAction);
    menu.addAction(closeAction);
    menu.addAction(exportAction);
    menu.addAction(deleteAction);

    QAction* selectedItem = menu.exec(ui->terminalTableView->mapToGlobal(pos));
    if (selectedItem == openAction)
        openCloseSelectedTerminals(true);
    else if (selectedItem == closeAction)
        openCloseSelectedTerminals(false);
    else if (selectedItem == exportAction)
        exportTerminalData();
    else if(selectedItem == deleteAction)
        deleteSelectedTerminals();;
}

QList<int> DeviceListWidget::selectedTerminals()
{
    CentralModel* centralModel = dynamic_cast<CentralModel*>(ui->terminalTableView->model());
    if (!centralModel)
        return QList<int>();

    QItemSelectionModel * selectionModel = ui->terminalTableView->selectionModel();
    if (!selectionModel || !selectionModel->hasSelection())
        return QList<int>();


    QModelIndexList lst = ui->terminalTableView->selectionModel()->selectedRows();
    QSet<int> idSet;
    foreach(QModelIndex index, lst)
    {
        int id = centralModel->terminalId(index.row());
        if (id != -1 && !idSet.contains(id))
            idSet.insert(id);
    }

    return idSet.toList();
}

void DeviceListWidget::openCloseSelectedTerminals(bool open)
{
    QList<int> lst = selectedTerminals();
    if (lst.count())
        emit openCloseTerminals(lst, open);
}

void DeviceListWidget::deleteSelectedTerminals()
{
    QList<int> lst = selectedTerminals();
    if (lst.count())
        emit deleteTerminals(lst);
}

void DeviceListWidget::exportTerminalData()
{
    CentralModel* centralModel = dynamic_cast<CentralModel*>(ui->terminalTableView->model());
    if (!centralModel)
        return;

    QList<int> columns;
    for (int i = 2; i < centralModel->columnCount(); ++i)
    {
       // if (! ui->terminalTableView->isColumnHidden(i))
       columns.append(i);
    }

    QList<int> lst = selectedTerminals();
    if (lst.count() == 1)
    {
        QString fileName = QFileDialog::getSaveFileName(
                    this,
                    QString::fromLocal8Bit("导出终端数据"),
                    "",
                    tr("Excel File (*.csv)"));
        if (!fileName.isEmpty())
            centralModel->exportTerminal(fileName, lst.at(0), columns);
    }
    else if (lst.count() > 1)
    {
        QString dirName = QFileDialog::getExistingDirectory(
                    this,
                    QString::fromLocal8Bit("导出终端数据"),
                    "");

        if (!dirName.isEmpty())
            foreach(int id, lst)
            {
                QString fileName = QDir(dirName).filePath(QString("Terminal %1.csv").arg(id));
                centralModel->exportTerminal(fileName, id, columns);

            }
    }
}

void DeviceListWidget::on_receiveModePushButton_toggled(bool checked)
{
    if (checked)
    {
        GasInfoSettings::setApplicationMode(Receive);
        emit applicationModeChanged();
    }
}

void DeviceListWidget::on_reviewModePushButton_toggled(bool checked)
{
    if (checked)
    {
        GasInfoSettings::setApplicationMode(Review);
        emit applicationModeChanged();
    }
}

void DeviceListWidget::on_pushButtonConfig_clicked()
{
    QDeviceDialog dlg;
    dlg.exec();
}

void DeviceListWidget::on_pushButtonStart_clicked()
{
    QTermDataHandler *term = QTermDataHandler::instance();
    if (term->isRunning())
    {
        term->stop();
        ui->ledComm->turnOff();
        ui->ledGps->turnOff();
        ui->pushButtonConfig->setEnabled(true);
        ui->pushButtonStart->setText(QString::fromLocal8Bit("????"));
    }
    else
    {
        if (!term->start())
        {
            //Error message here;
        }
        else
        {
            ui->ledComm->turnOn();
            ui->ledGps->turnOn();
            ui->pushButtonConfig->setEnabled(false);
            ui->pushButtonStart->setText(QString::fromLocal8Bit("??"));
        }
    }
//
}

void DeviceListWidget::on_alarmOnPushButton_clicked()
{
    QTermDataHandler *term = QTermDataHandler::instance();

    term->sendAlarm(ui->comboBoxChannel->currentIndex());
}

void DeviceListWidget::on_alarmOffPushButton_clicked()
{
    QTermDataHandler *term = QTermDataHandler::instance();
    term->sendAlarm(ui->comboBoxChannel->currentIndex(), false);
}
