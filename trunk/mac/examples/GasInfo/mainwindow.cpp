#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "overviewwidget.h"
#include "terminalwidget.h"
#include "centralmodel.h"
#include "gasinfosettings.h"

#include <QMdiSubWindow>
#include <QtDebug>


static const char* mainWindowGeometryKey = "mainWindow/geometry";
static const char* mainWindowStateKey = "mainWindow/state";

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // ui->topDockWidget->setTitleBarWidget(new QWidget);

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


    readSettings();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::closeEvent(QCloseEvent *event)
{
    saveSettings();

    QMainWindow::closeEvent(event);
}

void MainWindow::saveSettings()
{
    // main window
    GasInfoSettings settings;
    settings.setValue(mainWindowGeometryKey, saveGeometry());
    settings.setValue(mainWindowStateKey, saveState());

    // mdi area
    QList<QMdiSubWindow*> mdiList = ui->mdiArea->subWindowList();
    for (int i = 0; i < mdiList.count(); ++i)
    {
        QMdiSubWindow* window = mdiList.at(i);

        QString sizeKey = QString("%1/%2/%3").arg("mdi", window->windowTitle(), "size");
        QString posKey = QString("%1/%2/%3").arg("mdi", window->windowTitle(), "pos");

        settings.setValue(sizeKey, window->size());
        settings.setValue(posKey, window->pos());

        qDebug() << window->geometry();
    }
}

void MainWindow::readSettings()
{
    GasInfoSettings settings;

    // main window
    restoreGeometry(settings.value(mainWindowGeometryKey).toByteArray());
    restoreState(settings.value(mainWindowStateKey).toByteArray());

    // mdi area
    QList<QMdiSubWindow*> mdiList = ui->mdiArea->subWindowList();
    for (int i = 0; i < mdiList.count(); ++i)
    {
        QMdiSubWindow* window = mdiList.at(i);

        QString sizeKey = QString("%1/%2/%3").arg("mdi", window->windowTitle(), "size");
        QString posKey = QString("%1/%2/%3").arg("mdi", window->windowTitle(), "pos");

        QSize size = settings.value(sizeKey, QSize(100, 100)).toSize();
        if (size.width() <= 100)
            size.setWidth(100);
        if (size.height() <= 100)
            size.setHeight(100);

        window->resize(size);
        window->move(settings.value(posKey, QPoint(0, 0)).toPoint());
    }
}
