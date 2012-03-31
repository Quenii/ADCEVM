#include "devicelistwidget.h"
#include "ui_devicelistwidget.h"

#include <QHeaderView>

DeviceListWidget::DeviceListWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::DeviceListWidget)
{
    ui->setupUi(this);

    ui->terminalTableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->terminalTableView->setSelectionMode(QAbstractItemView::SingleSelection);

    bool ok = connect(ui->terminalTableView, SIGNAL(doubleClicked(const QModelIndex&)),
                      this, SIGNAL(doubleClicked(const QModelIndex&)));
    Q_ASSERT(ok);
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
