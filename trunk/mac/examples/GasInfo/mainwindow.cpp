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

static QString terminalTitle(int terminalId)
{
    return QString("Terminal %1").arg(terminalId);
}

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QMdiSubWindow *subWindow1 = new QMdiSubWindow;
    subWindow1->setWidget(new OverviewWidget);
    subWindow1->setAttribute(Qt::WA_DeleteOnClose);
    ui->mdiArea->addSubWindow(subWindow1);

    m_centralModel = new CentralModel(this);

    ui->deviceListWidget->setModel(m_centralModel);

    bool ok = connect(ui->deviceListWidget, SIGNAL(openCloseTerminals(const QList<int>&, bool)),
                      this, SLOT(openCloseTerminals(const QList<int>&, bool)));
    Q_ASSERT(ok);
    ok = connect(ui->deviceListWidget, SIGNAL(deleteTerminals(QList<int>)),
                 this, SLOT(deleteTerminals(QList<int>)));
    Q_ASSERT(ok);

    readSettings();
}

MainWindow::~MainWindow()
{
    delete ui;
}

QMdiSubWindow* MainWindow::terminalSubwindow(int terminalId)
{
    QString title = terminalTitle(terminalId);
    for (int i = 0; i < ui->mdiArea->subWindowList().count(); ++i)
    {
        QMdiSubWindow* window = ui->mdiArea->subWindowList().at(i);
        if (title == window->windowTitle())
        {
            return window;
        }
    }

    return 0;
}

void MainWindow::openCloseTerminals(const QList<int> &idList, bool open)
{
    foreach (int terminalId, idList)
    {
        QMdiSubWindow* subWindow = terminalSubwindow(terminalId);
        if (open)
        {
            if (subWindow)
            {
                subWindow->show();
                subWindow->raise();
                continue;
            }
            QMdiSubWindow* subWindow1 = new QMdiSubWindow();
            TerminalWidget* terminalWidget = new TerminalWidget;
            subWindow1->setWidget(terminalWidget);
            subWindow1->setWindowTitle(terminalTitle(terminalId));
            subWindow1->setAttribute(Qt::WA_DeleteOnClose);
            ui->mdiArea->addSubWindow(subWindow1);
            terminalWidget->setModel(m_centralModel);
            subWindow1->show();
        }
        else
        {
            if (subWindow)
                subWindow->close();
        }
    }
}

void MainWindow::deleteTerminals(const QList<int> &idList)
{
    foreach (int terminalId, idList)
    {
        QMdiSubWindow* subWindow = terminalSubwindow(terminalId);
        if (subWindow)
        {
            subWindow->close();
        }

        m_centralModel->removeTerminal(terminalId);
    }
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


