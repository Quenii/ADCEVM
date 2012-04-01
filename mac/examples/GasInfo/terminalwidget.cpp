#include "terminalwidget.h"
#include "ui_terminalwidget.h"
#include "qgeocoordinate.h"

#include <QStandardItem>
#include <QtDebug>


TerminalWidget::TerminalWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TerminalWidget)
{
    ui->setupUi(this);

    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);

    ui->tableView->setSortingEnabled(true);

    bool ok = connect(
                ui->tableView->horizontalHeader(),
                SIGNAL(sortIndicatorChanged(int,Qt::SortOrder)),
                this,
                SLOT(tableView_sortIndicatorChanged(int,Qt::SortOrder)));

    Q_ASSERT(ok);
}

TerminalWidget::~TerminalWidget()
{
    delete ui;
}

void TerminalWidget::setModel(CentralModel *model)
{
    // ui->listView->setModel(model);

    if (model->hasChildren())
    {
        ui->tableView->setModel(model);
        ui->tableView->setRootIndex(model->index(0, 0));

        ui->tableView->hideColumn(0);
        ui->tableView->hideColumn(1);
    }
}

void TerminalWidget::tableView_sortIndicatorChanged(int logicalIndex, Qt::SortOrder order)
{
    CentralModel* centralModel = dynamic_cast<CentralModel*>(ui->tableView->model());
    if (!centralModel)
        return ;

    QModelIndex rootIndex = ui->tableView->rootIndex();
    if (!rootIndex.isValid())
        return ;

    QStandardItem* rootItem = centralModel->itemFromIndex(rootIndex);
    if (!rootItem)
        return ;

    rootItem->sortChildren(logicalIndex, order);
}

