#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "overviewwidget.h"
#include "qmapwidget.h"

#include <QMdiSubWindow>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    ui->topDockWidget->setTitleBarWidget(new QWidget);

    QMdiSubWindow *subWindow1 = new QMdiSubWindow;
    subWindow1->setWidget(new OverviewWidget);
    subWindow1->setAttribute(Qt::WA_DeleteOnClose);
    ui->mdiArea->addSubWindow(subWindow1);

    subWindow1 = new QMdiSubWindow;
    subWindow1->setWidget(new QMapWidget);
    subWindow1->setAttribute(Qt::WA_DeleteOnClose);
    ui->mdiArea->addSubWindow(subWindow1);

}

MainWindow::~MainWindow()
{
    delete ui;
}
