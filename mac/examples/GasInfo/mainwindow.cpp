#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "overviewwidget.h"
#include "terminalwidget.h"
#include "centralmodel.h"

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
    TerminalWidget* terminalWidget = new TerminalWidget;
    subWindow1->setWidget(terminalWidget);
    subWindow1->setAttribute(Qt::WA_DeleteOnClose);
    ui->mdiArea->addSubWindow(subWindow1);

    CentralModel* centralModel = new CentralModel(this);
    terminalWidget->setModel(centralModel);
    ui->deviceListWidget->setModel(centralModel);

 }

MainWindow::~MainWindow()
{
    delete ui;
}
