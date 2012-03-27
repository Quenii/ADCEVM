#include "terminalwidget.h"
#include "ui_terminalwidget.h"

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
    ui->treeView->setModel(model);
    ui->columnView->setModel(model);
    ui->tableView->setModel(model);
}
