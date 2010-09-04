#include "mainwindow.h"
#include "ControlPanel.hpp"
#include "gkhy/qplotlib/WaveWnd.hpp"
#include "gkhy/qplotlib/FFTWnd.hpp"
#include "gkhy/qplotlib/LogicWaveWnd.hpp"
#include <QMdiArea>
#include <QSplitter>
#include <QMdiSubWindow>
#include <QMenuBar>
#include <QMenu>
#include <QAction>
#include <QHBoxLayout>
#include <QList>
#include <QMessageBox>

/*using namespace gkhy::QPlotLab;*/

MainWindow::MainWindow(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	adcBoard = AdcBoard::instance(); //new AdcBoard(this);

	ui.setupUi(this);
	
	/*controlPanel = new ControlPanel();
	ui.dockWidgetControlPanel->setWidget(controlPanel);
	*/

	waveWnd = new gkhy::QPlotLab::WaveWnd();
	ui.dockWidgetWave->setWidget(waveWnd);
	
	fftWnd = new gkhy::QPlotLab::FFTWnd();
	ui.dockWidgetFFT->setWidget(fftWnd);

	logicWaveWnd = new gkhy::QPlotLab::LogicWaveWnd();
	ui.dockWidgetLogicWave->setWidget(logicWaveWnd);
//	ui.dockWidgetLogicWave->hide();

	bool okay = connect(adcBoard, SIGNAL(devListChanged(const QList<AdcBoardInfo>&)), ui.controlPanel, SLOT(setDevList(const QList<AdcBoardInfo>&)));
	Q_ASSERT(okay);

	okay = connect(ui.controlPanel, SIGNAL(devSelected(int)), adcBoard, SLOT(open(int)));
	Q_ASSERT(okay);

	okay = connect(adcBoard, SIGNAL(boardReport(const AdcBoardReport&)), this, SLOT(slotShowBoardReport(const AdcBoardReport&)));
	Q_ASSERT(okay);

	setCentralWidget(0);

	createMenus();
}

MainWindow::~MainWindow()
{

}

void MainWindow::createMenus()
{
	QMenu* windowMenu = menuBar()->addMenu(tr("Window"));

	//QAction* showControlPanelAct= new QAction(tr("&Control Panel"), this);
	windowMenu->addAction(ui.dockWidgetControlPanel->toggleViewAction());	
	
	//QAction* showWaveWindowAct = new QAction(tr("&Wave Window"), this);
	windowMenu->addAction(ui.dockWidgetWave->toggleViewAction());	


	//QAction* showFFTWindowAct = new QAction(tr("&FFT Window"), this);
	windowMenu->addAction(ui.dockWidgetFFT->toggleViewAction());	

	//QAction* showLogicWaveWindowAct = new QAction(tr("&Logic Wave Window"), this);
	windowMenu->addAction(ui.dockWidgetLogicWave->toggleViewAction());	

	QMenu* helpMenu = menuBar()->addMenu(tr("Help"));
	QAction* aboutAct= new QAction(tr("&About"), this);
	connect(aboutAct, SIGNAL(triggered()), this, SLOT(slotShowAbout()));
	helpMenu->addAction(aboutAct);	

}

void MainWindow::slotShowWaveWnd()
{
	waveWnd->show();
}

void MainWindow::slotShowFFtWnd()
{
	fftWnd->show();
}

void MainWindow::slotShowControlPanel()
{
	ui.controlPanel->show();
}

void MainWindow::slotShowAbout()
{
	QMessageBox::about(this, tr("About CETC58 ADC Analyzer"),
		tr("<br><b>ADC Analyzer</b> is designed to work with the USB-ADC evaluation board.<br><br><div align=center>Copyright (c) CETC58, 2010</div><br> "));
}

void MainWindow::slotShowBoardReport(const AdcBoardReport& report)
{
	waveWnd->update(report.tdReport.xaxis, report.tdReport.samples);
	fftWnd->update(report.fdReport.xaxis, report.fdReport.Spectrum);
	logicWaveWnd->update(report.tdReport.rawSamples);
	ui.controlPanel->updateReport(report);
}