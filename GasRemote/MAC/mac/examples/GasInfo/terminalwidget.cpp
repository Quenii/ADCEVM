#include "terminalwidget.h"
#include "ui_terminalwidget.h"
#include "qgeocoordinate.h"

#include <QStandardItem>
#include <QtDebug>
#include <QSortFilterProxyModel>


TerminalWidget::TerminalWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TerminalWidget)
{
    ui->setupUi(this);


    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->setSelectionMode(QAbstractItemView::SingleSelection);

    ui->tableView->setSortingEnabled(true);

   // ui->tableView->setColumnWidth(2, 200);

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

void TerminalWidget::setModel(CentralModel *model, int id, int row)
{
    // ui->listView->setModel(model);

    if (model->hasChildren())
    {
        m_proxyModel = new QSortFilterProxyModel(this);
        m_proxyModel->setDynamicSortFilter(true);
        m_proxyModel->setSourceModel(model);
        m_proxyModel->setSortRole(Qt::UserRole);

        ui->tableView->setModel(m_proxyModel);
        ui->tableView->setRootIndex(m_proxyModel->index(row, 0));
        ui->tableView->hideColumn(0);
        ui->tableView->hideColumn(1);
        if(id < LIFEBASE)
        {
            ui->tableView->hideColumn(6);
            ui->tableView->hideColumn(7);
            ui->tableView->hideColumn(8);
        }
        else
        {
            ui->tableView->hideColumn(3);
            ui->tableView->hideColumn(4);
            ui->tableView->hideColumn(5);
        }
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


