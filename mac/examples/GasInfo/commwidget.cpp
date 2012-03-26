#include "commwidget.h"
#include "ui_commwidget.h"

CommWidget::CommWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::CommWidget)
{
    ui->setupUi(this);
}

CommWidget::~CommWidget()
{
    delete ui;
}
