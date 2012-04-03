#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "terminalwidget.h"
#include "centralmodel.h"
#include "gasinfosettings.h"
#include "optiondialog.h"
#include "QGeoServiceProvider.h"
#include "marker.h"
#include "gasinfosettings.h"

#include <QMdiSubWindow>
#include <QtDebug>
#include <QFileDialog>
#include <QDateTime>
#include <QMessageBox>


static QString terminalTitle(int terminalId)
{
    return QString("Terminal %1").arg(terminalId);
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
    , m_locationManager(0)
    , m_centralModel(0)
{
    ui->setupUi(this);

    initMap();

    m_locationManager = new LocationManager(this, ui->mapsWidget->map());

    m_centralModel = new CentralModel(this);

    ui->deviceListWidget->setModel(m_centralModel);

    bool ok = connect(ui->deviceListWidget, SIGNAL(openCloseTerminals(const QList<int>&, bool)),
                      this, SLOT(openCloseTerminals(const QList<int>&, bool)));
    Q_ASSERT(ok);
    ok = connect(ui->deviceListWidget, SIGNAL(deleteTerminals(QList<int>)),
                 this, SLOT(deleteTerminals(QList<int>)));
    Q_ASSERT(ok);

    ok = connect(ui->deviceListWidget, SIGNAL(applicationModeChanged()),
                 this, SLOT(applicationModelChanged()));
    Q_ASSERT(ok);

    startTimer(1000); // one tick per second

    readSettings();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::clearAllData()
{
    if (m_centralModel)
        m_centralModel->clear();
    if (m_locationManager)
        m_locationManager->clearLocations();
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

            QAction* action = new QAction(QString("Terminal &%1").arg(terminalId), subWindow1);

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
    GasInfoSettings settings;

    QString timeStr = QDateTime::currentDateTime().toString("yyyyMMdd-hhmmss");
    QString fileName = timeStr + ".gas";
    QString filePath = QDir(settings.dataFolder()).filePath(fileName);

    // default folder
    if (!fileName.isEmpty())
        m_centralModel->save(filePath);
}

void MainWindow::on_actionLoad_triggered(bool checked)
{
    GasInfoSettings settings;
    QString fileName = QFileDialog::getOpenFileName(
                this,
                tr("Load Data"),
                settings.dataFolder(),
                tr("GasInfo File (*.gas)"));

    m_centralModel->load(fileName);
    ui->deviceListWidget->setModel(m_centralModel);
}

void MainWindow::on_actionOption_triggered(bool checked)
{
    OptionDialog dlg;
    dlg.exec();
}

void MainWindow::on_actionExit_triggered(bool checked)
{
    qApp->quit();
}

void MainWindow::applicationModelChanged()
{
    ApplicationModes appMode = GasInfoSettings::applicationMode();
    ui->actionLoad->setEnabled(appMode == Review);

    if (appMode == Review)
    {
        on_actionSave_triggered();
    }
    else if (appMode == Receive)
    {
        m_receiveSessionStartTime = QDateTime::currentDateTime();
    }
    else
    {
        Q_ASSERT(false);
    }

    clearAllData();
}

void MainWindow::addData(const GasInfoItem& item)
{
    if (GasInfoSettings::applicationMode() == Receive)
    {
        // update date
        if (m_centralModel)
            m_centralModel->addData(item);

        // update GPS
        if (m_locationManager)
            m_locationManager->addLocation(item.ch, item.location);

        if (item.ch == 0 && item.location.isValid())
            GasInfoSettings().setDefaultHostLocation(item.location);

        m_lastReceiveTime = QDateTime::currentDateTime();
    }
}

void MainWindow::initMap()
{
    QGeoServiceProvider* serviceProvider = 0;
    MapsWidget* mapsWidget =  ui->mapsWidget;
    MarkerManager* markerManager = 0;

    QList<QString> providers = QGeoServiceProvider::availableServiceProviders();
    if (providers.size() < 1) {
        QMessageBox::information(this, tr("Maps"),
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
        QMessageBox::information(this, tr("Maps"),
                                 tr("Error loading geoservice plugin"));
        // QCoreApplication::quit();
        return;
    }

    if (!serviceProvider->mappingManager() ||
            !serviceProvider->searchManager() ||
            !serviceProvider->routingManager()) {
        QMessageBox::information(this, tr("Maps"),
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

    /*connect(markerManager, SIGNAL(searchError(QGeoSearchReply::Error,QString)),
            this, SLOT(showErrorMessage(QGeoSearchReply::Error,QString)));
    connect(mapsWidget, SIGNAL(markerClicked(Marker*)),
            this, SLOT(showMarkerDialog(Marker*)));
     connect(mapsWidget, SIGNAL(mapPanned()),
            this, SLOT(disableTracking()));

    if (positionSource)
        delete positionSource;

    // set up position feeds (eg GPS)

    positionSource = QGeoPositionInfoSource::createDefaultSource(this);

    if (!positionSource) {
        mapsWidget->statusBar()->showText("Could not open GPS", 5000);
        mapsWidget->setMyLocation(QGeoCoordinate(-27.5796, 153.1));
        //mapsWidget->setMyLocation(QGeoCoordinate(21.1813, -86.8455));
    } else {
        positionSource->setUpdateInterval(1000);
        connect(positionSource, SIGNAL(positionUpdated(QGeoPositionInfo)),
                this, SLOT(updateMyPosition(QGeoPositionInfo)));
        positionSource->startUpdates();
        mapsWidget->statusBar()->showText("Opening GPS...");
    }
    */

   // ui->mapsWidget->setMyLocation(QGeoCoordinate(39.903924, 116.391432));
}

void MainWindow::timerEvent(QTimerEvent *event)
{
    if (GasInfoSettings::applicationMode() == Receive)
    {
        GasInfoSettings settings;

        if (m_receiveSessionStartTime.secsTo(m_lastReceiveTime) >= int(settings.archivePeriod()))
        {
            on_actionSave_triggered(false);
            clearAllData();
        }

        qDebug("tick");

        static QGeoCoordinate loc(39.903924, 116.391432);
        static int id = 0;
        m_locationManager->addLocation(id, loc);
        id ++;
        loc.setLongitude(loc.longitude() + 0.0005);
    }
}
