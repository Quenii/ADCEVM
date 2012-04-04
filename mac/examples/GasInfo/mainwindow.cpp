#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "terminalwidget.h"
#include "centralmodel.h"
#include "gasinfosettings.h"
#include "optiondialog.h"
#include "QGeoServiceProvider.h"
#include "marker.h"
#include "gasinfosettings.h"
#include "qtermdatahandler.h"

#include <QMdiSubWindow>
#include <QtDebug>
#include <QFileDialog>
#include <QDateTime>
#include <QMessageBox>


static QString terminalTitle(int terminalId)
{
	return QString::fromLocal8Bit("Terminal %1").arg(terminalId);
}

class MdiSubWindow : public QMdiSubWindow
{
public:
    MdiSubWindow(QWidget* parent = 0) : QMdiSubWindow(parent) {}

protected:
    void closeEvent(QCloseEvent *event)
    {
        //        GasInfoSettings settings;
        //        settings.setWindowSize(windowTitle(), size());
        //        settings.setWindowPos(windowTitle(), pos());
    }

    void showEvent(QShowEvent* showEvent)
    {
        //        GasInfoSettings settings;

        //        QSize size = settings.windowSize(windowTitle());
        //        if (size.width() <= 100)
        //            size.setWidth(100);
        //        if (size.height() <= 100)
        //            size.setHeight(100);

        //        resize(size);
        //        move(settings.windowPos(windowTitle()));
    }
};

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
    , m_centralModel(0)
    , m_locationManager(0)
{
    ui->setupUi(this);

    initMap();

    bool ok = false;

    QTermDataHandler * inst = QTermDataHandler::instance();
    ok = connect(inst, SIGNAL(newData(const GasInfoItem&)), this, SLOT(addData(const GasInfoItem&)));
    Q_ASSERT(ok);

    m_locationManager = new LocationManager(this, ui->mapsWidget->map());

    m_centralModel = new CentralModel(this);
    ui->deviceListWidget->setModel(m_centralModel);

    ok = connect(m_centralModel, SIGNAL(archivePeriodReached()),
                 this, SLOT(archiveCentralModel()));
    Q_ASSERT(ok);


    ok = connect(ui->deviceListWidget, SIGNAL(openCloseTerminals(const QList<int>&, bool)),
                      this, SLOT(openCloseTerminals(const QList<int>&, bool)));
    Q_ASSERT(ok);

    ok = connect(ui->deviceListWidget, SIGNAL(deleteTerminals(QList<int>)),
                 this, SLOT(deleteTerminals(QList<int>)));
    Q_ASSERT(ok);

    ok = connect(ui->deviceListWidget, SIGNAL(applicationModeChanged()),
                 this, SLOT(applicationModelChanged()));
    Q_ASSERT(ok);


    readSettings();

//    m_locationManager->addLocation(0, QGeoCoordinate(0, 0, 0));
//    m_locationManager->addLocation(1, QGeoCoordinate(0, .001, 0));
//    m_locationManager->addLocation(2, QGeoCoordinate(0, .002, 0), true);
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

            MdiSubWindow* subWindow1 = new MdiSubWindow();
            TerminalWidget* terminalWidget = new TerminalWidget;
            subWindow1->setWidget(terminalWidget);
            subWindow1->setWindowTitle(terminalTitle(terminalId));
            subWindow1->setAttribute(Qt::WA_DeleteOnClose);
            ui->mdiArea->addSubWindow(subWindow1);
            terminalWidget->setModel(m_centralModel);

			QAction* action = new QAction(QString::fromLocal8Bit("Terminal &%1").arg(terminalId), subWindow1);

            ui->menuWindows->addAction(action);

            bool ok = connect(action, SIGNAL(triggered(bool)), subWindow1, SLOT(raise()));
            Q_ASSERT(ok);

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
    settings.setMainWindowGeometry(saveGeometry());
    settings.setMainWindowState(saveState());
}

void MainWindow::readSettings()
{
    GasInfoSettings settings;

    // main window
    restoreGeometry(settings.mainWindowGeometry());
    restoreState(settings.mainWindowState());
}

void MainWindow::on_actionSave_triggered(bool checked)
{
    archiveCentralModel();
}

void MainWindow::on_actionLoad_triggered(bool checked)
{
    GasInfoSettings settings;
    QString fileName = QFileDialog::getOpenFileName(
                this,
				QString::fromLocal8Bit("载入数据"),
                settings.dataFolder(),
                tr("GasInfo File (*.gas)"));

    m_centralModel->load(fileName);
    ui->deviceListWidget->setModel(m_centralModel);
}

void MainWindow::on_actionOption_triggered(bool checked)
{
    OptionDialog dlg;
    bool ok = connect(&dlg, SIGNAL(optionsApplied()), this, SLOT(optionsApplied()));
    Q_ASSERT(ok);

    dlg.exec();
}

void MainWindow::on_actionExit_triggered(bool checked)
{
    qApp->quit();
}

void MainWindow::applicationModelChanged()
{
    ApplicationModes appMode = GasInfoSettings::applicationModeF();
    ui->actionLoad->setEnabled(appMode == Review);

    if (appMode == Review)
    {
        archiveCentralModel();
    }
    else if (appMode == Receive)
    {
        m_centralModel->endReceiveSession(false);
        m_centralModel->beginReceiveSession();
    }
    else
    {
        Q_ASSERT(false);
    }


    clearAllData();
    if (appMode == Receive)
    {
        m_locationManager->addLocation(0, GasInfoSettings().defaultHostLocation());
    }

}

void MainWindow::addData(const GasInfoItem& item)
{
    if (GasInfoSettings::applicationModeF() == Receive)
    {
        // update date
        if (item.ch > 0 && m_centralModel)
            m_centralModel->addData(item);

        bool bAlarm = false;
        if (item.h2s >= GasInfoSettings::h2sAlarmThresF()
                || item.so2 >= GasInfoSettings::so2AlarmThresF()
                || item.fel >= GasInfoSettings::felAlarmThresF())
        {
            bAlarm = true;
        }

        // update GPS
        if (m_locationManager)
            m_locationManager->addLocation(item.ch, item.location, bAlarm);

        // set host location to settings.
        if (item.ch == 0 && item.location.isValid())
            GasInfoSettings().setDefaultHostLocation(item.location);
    }
}

void MainWindow::clearAllData()
{
    if (m_centralModel)
        m_centralModel->clear();
    if (m_locationManager)
        m_locationManager->clearLocations();
}

void MainWindow::initMap()
{
    QGeoServiceProvider* serviceProvider = 0;
    MapsWidget* mapsWidget =  ui->mapsWidget;
    MarkerManager* markerManager = 0;

    QList<QString> providers = QGeoServiceProvider::availableServiceProviders();
    if (providers.size() < 1) {
        QMessageBox::information(this, QString::fromLocal8Bit("地图"),
                                 tr("No service providers are available"));
        // QCoreApplication::quit();
        return;
    }

    foreach (QString provider, providers) {
        serviceProvider = new QGeoServiceProvider(provider);
        if (serviceProvider->mappingManager() &&
                serviceProvider->searchManager() &&
                serviceProvider->routingManager())
            break;
    }

    if (serviceProvider->error() != QGeoServiceProvider::NoError) {
        QMessageBox::information(this, QString::fromLocal8Bit("地图"),
                                 tr("Error loading geoservice plugin"));
        // QCoreApplication::quit();
        return;
    }

    if (!serviceProvider->mappingManager() ||
            !serviceProvider->searchManager() ||
            !serviceProvider->routingManager()) {
        QMessageBox::information(this, QString::fromLocal8Bit("地图"),
                                 tr("No geoservice found with mapping/search/routing"));
        // QCoreApplication::quit();
        return;
    }

    // start initialising things (maps, searching, routing)

    mapsWidget->initialize(serviceProvider->mappingManager());

    if (markerManager)
        delete markerManager;
    markerManager = new MarkerManager(serviceProvider->searchManager());
    mapsWidget->setMarkerManager(markerManager);

}

void MainWindow::archiveCentralModel()
{
    GasInfoSettings settings;

    QString timeStr = QDateTime::currentDateTime().toString("yyyyMMdd-hhmmss");
    QString fileName = timeStr + ".gas";
    QString filePath = QDir(settings.dataFolder()).filePath(fileName);

    // default folder
    if (!fileName.isEmpty())
       m_centralModel->endReceiveSession(true, filePath);

    clearAllData();
    m_centralModel->beginReceiveSession();
}

void MainWindow::optionsApplied()
{
    GasInfoSettings settings;
    m_locationManager->addLocation(0, settings.defaultHostLocation());
}
