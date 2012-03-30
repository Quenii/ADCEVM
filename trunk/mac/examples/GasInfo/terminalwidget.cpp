#include "terminalwidget.h"
#include "ui_terminalwidget.h"

#include "qgeocoordinate.h"


TerminalWidget::TerminalWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::TerminalWidget)
{
    ui->setupUi(this);
}

TerminalWidget::~TerminalWidget()
{
    delete ui;
}

void TerminalWidget::setModel(CentralModel *model)
{
    ui->listView->setModel(model);

    if (model->hasChildren())
    {
        ui->tableView->setModel(model);
        ui->tableView->setRootIndex(model->index(0, 0));

        ui->tableView->hideColumn(0);
        ui->tableView->hideColumn(1);
     }
 }
