#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "terminalwidget.h"
#include "centralmodel.h"
#include "gasinfosettings.h"
#include "optiondialog.h"

#include <QMdiSubWindow>
#include <QtDebug>
#include <QFileDialog>
#include <QDateTime>

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
        GasInfoSettings settings;
        settings.setWindowSize(windowTitle(), size());
        settings.setWindowPos(windowTitle(), pos());
    }

    void showEvent(QShowEvent* showEvent)
    {
        GasInfoSettings settings;

        QSize size = settings.windowSize(windowTitle());
        if (size.width() <= 100)
            size.setWidth(100);
        if (size.height() <= 100)
            size.setHeight(100);

        resize(size);
        move(settings.windowPos(windowTitle()));
    }
};

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

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
            MdiSubWindow* subWindow1 = new MdiSubWindow();
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

    QString fileName = QDateTime::currentDateTime().toString();
    QString filePath = QDir(settings.dataFolder()).filePath(fileName);

    // default folder
    if (!fileName.isEmpty())
        m_centralModel->save(filePath);
}

void MainWindow::on_actionSaveAs_triggered(bool checked)
{
    QString fileName = QFileDialog::getSaveFileName(
                this,
                tr("Save Data As"),
                "",
                tr("GasInfo Files (*.gas)"));

    if (!fileName.isEmpty())
        m_centralModel->save(fileName);
}

void MainWindow::on_actionLoad_triggered(bool checked)
{
    GasInfoSettings settings;
    QString fileName = QFileDialog::getOpenFileName(
                this,
                tr("Load Data"),
                settings.dataFolder(),
                tr("GasInfo File (*.gas)"));
}


void MainWindow::on_actionOption_triggered(bool checked)
{
    OptionDialog dlg;
    dlg.exec();
}

//void MainWindow::on_actionExport_triggered(bool checked)
//{
//    QString fileName = QFileDialog::getSaveFileName(this,
//         tr("Export Terminal Data"), "", tr("Excel File (*.csv)"));

//    if (!fileName.isEmpty())
//        m_centralModel->exportTerminal()

//}

void MainWindow::on_actionExit_triggered(bool checked)
{
    qApp->quit();
}


