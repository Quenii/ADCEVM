#include "mainwindow.h"
#include "ControlPanel.h"
#include "qpowermonitor.h"
#include "RegAccess.hpp"
#include "dacanalyzersettings.h"
#include "QZebraScopeSerializer.h"
#include "ScopesWindow.h"
#include "qmdisubwindowex.h"

#include <QMdiArea>
#include <QMdiSubWindow>
#include <QMenuBar>
#include <QMenu>
#include <QAction>
#include <QHBoxLayout>
#include <QList>
#include <QMessageBox>
#include <QFileDialog>
#include <QFileInfo>


MainWindow::MainWindow(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	
	ui.setupUi(this);

	QMdiArea* mdiArea = new QMdiArea;
	setCentralWidget(mdiArea);

	for (int i = 0; i < 4; ++i)
	{		
		QMdiSubWindowEx* subWindow = new QMdiSubWindowEx();
		subWindow->setAttribute(Qt::WA_DeleteOnClose, false);
		subWindow->setWidget(new ScopesWindow);
		subWindow->setWindowTitle(QString("Scope Window %1").arg(i));
		mdiArea->addSubWindow(subWindow);
		ui.menuWindow->addAction(subWindow->toggleViewAction());
		m_mdiSubWindows.push_back(subWindow);
	}

	adcBoard = AdcBoard::instance(); 

	bool okay = false;
	okay = connect(adcBoard, SIGNAL(boardReport(const AdcBoardReport&)), this, SLOT(slotShowBoardReport(const AdcBoardReport&)));
	Q_ASSERT(okay);

	okay = connect(this, SIGNAL(adcBoardReportLoaded(const AdcBoardReport&)), this, SLOT(slotShowBoardReport(const AdcBoardReport&)));
	Q_ASSERT(okay);
	
	okay = connect(ui.actionADC, SIGNAL(triggered()), ui.controlPanel->ui.adcSettingsWidget, SLOT(on_pushButtonChangeSettings_clicked()));
	okay = connect(ui.actionSIGNAL, SIGNAL(triggered()), ui.controlPanel->ui.signalSettingsWidget, SLOT(on_pushButtonChangeSettings_clicked()));
	okay = connect(ui.actionSPAN, SIGNAL(triggered()), ui.controlPanel, SLOT(spanChanged()));
		

	createMenus();

	readSettings();
}

MainWindow::~MainWindow()
{
	if (regAccess)
		regAccess->deleteLater();
}

void MainWindow::closeEvent(QCloseEvent *event)
{
	AdcAnalyzerSettings s;

	s.setPowerMonitorWidgetPos(m_powerMonitorWidget->pos());
	s.setPowerMonitorWidgetVisible(m_powerMonitorWidget->isVisible());
	foreach(QMdiSubWindowEx* w, m_mdiSubWindows)
	{
		s.beginGroup(w->windowTitle());
		s.setValue("windowState", int(w->windowState()));
		s.setValue("geometry", w->saveGeometry());
		s.setValue("size", w->size());
		s.setValue("visible", w->isVisible());
		
	    s.endGroup();
	}

	QMainWindow::closeEvent(event);
} 

void MainWindow::readSettings()
{
	AdcAnalyzerSettings s;

	m_powerMonitorWidget->move(s.powerMonitorWidgetPos());
	m_powerMonitorWidget->setVisible(s.powerMonitorWidgetVisible());

	foreach(QMdiSubWindowEx* w, m_mdiSubWindows)
	{
		s.beginGroup(w->windowTitle());
			
		w->setWindowState(Qt::WindowStates(s.value("windowState").toInt()));
		w->restoreGeometry(s.value("geometry").toByteArray());	
		QSize size = s.value("size").toSize();
	    size.setWidth(qMax(size.width(), 10));
		size.setHeight(qMax(size.height(), 10));
		w->resize(size);
		w->setVisible(s.value("visible").toBool());
		
		s.endGroup();
	}
}

void MainWindow::createMenus()
{
	QMenu* menuWindow = ui.menuWindow; 

	menuWindow->addAction(ui.dockWidgetControlPanel->toggleViewAction());		

	m_powerMonitorWidget = new QPowerMonitor(this);
	ui.menuWindow->addAction(m_powerMonitorWidget->toggleViewAction());

	connect(ui.action_AboutAdcAnalyzer, SIGNAL(triggered()), this, SLOT(slotShowAbout()));
}

static QString getSettingsFileName(QString adcDataFileName)
{
	QFileInfo fi(adcDataFileName);
	QString settingsFileName = QDir(fi.dir()).absoluteFilePath(fi.completeBaseName() + ".ini");
	return settingsFileName;
}

static QString make_dot_adc_file_name(QString fn)
{
	if (! fn.endsWith(".adc", Qt::CaseInsensitive)) 
		fn += ".adc"; // default

	return fn;
}

static QString getTextFileName(QString adcDataFileName)
{
	QFileInfo fi(adcDataFileName);
	QString settingsFileName = QDir(fi.dir()).absoluteFilePath(fi.completeBaseName() + ".txt");
	return settingsFileName;
}

void MainWindow::on_actionLoadData_triggered(bool checked /*= false*/)
{
	QString fileName = QFileDialog::getOpenFileName(
		this, tr("Open File..."), "", tr("ADC Samples (*.txt)"));
	if (!fileName.isEmpty())
	{
		AdcBoard::instance()->getDynTestData(fileName);
	}
}

void MainWindow::on_actionLoadStaticData_triggered(bool checked /*= false*/)
{
	QString fileName = QFileDialog::getOpenFileName(
		this, tr("Open File..."), "", tr("ADC Samples (*.txt)"));
	if (!fileName.isEmpty())
	{
		AdcBoard::instance()->loadStaticData(fileName);
	}
}

void MainWindow::on_actionSaveData_triggered(bool checked /* = false */)
{
	QString fileName = QFileDialog::getSaveFileName(this, tr("Save as..."),
		QString(), tr("ADC Samples (*.txt)"));

	static char txtBuffer[10];

	if (!fileName.isEmpty())
	{
		AdcAnalyzerSettings settings;

		QString settingsFileName = getSettingsFileName(fileName);
		AdcAnalyzerSettings toSave(settingsFileName, QSettings::IniFormat, 0);
		toSave.setSignalSettings(settings.signalSettings());
		toSave.setAdcTypeSettings(settings.adcTypeSettings());
		toSave.setSpanSettings(settings.spanSettings());

		QString txtFileName = getTextFileName(fileName);
		QFile fileTxt( txtFileName );
		fileTxt.open(QIODevice::WriteOnly);
		QDataStream outTxt(&fileTxt);   // we will serialize the data into the file

		const AdcBoardReport &report = AdcBoard::instance()->reportRef();
		if (report.tdReport.rawSamples.size())
		{
			const unsigned short* p = &report.tdReport.rawSamples[0];

			for (int k=0; k<report.tdReport.samples.size(); ++k)
			{
				sprintf_s(txtBuffer, "%d\r\n", short(p[k]));
				QString a = QString(txtBuffer);
				int m = a.size();
				outTxt.writeRawData(txtBuffer, QString(txtBuffer).size());
			}
		}
	}
}


void MainWindow::slotShowControlPanel()
{
	ui.controlPanel->show();
}

void MainWindow::slotShowAbout()
{
	QMessageBox::about(this, tr("About CETC58 ADC Analyzer"),
		tr("<br><b>ADC Analyzer</b> is designed to work with the USB-ADC evaluation board.<br><br><div align=center>Copyright (c) CETC58, 2012</div><br> "));
}

void MainWindow::slotShowBoardReport(const AdcBoardReport& report)
{
	foreach(QMdiSubWindowEx* mdi, m_mdiSubWindows)
	{
		ScopesWindow* w = dynamic_cast<ScopesWindow* >(mdi->window());
		if (w)
		{
			w->waveWnd->update(report.tdReport.xaxis, report.tdReport.samples);
			w->fftWnd->update(report.fdReport.xaxis, report.fdReport.Spectrum, report.fdReport.markers);
			w->logicWaveWnd->update(report.tdReport.rawSamples);
		}
	}

	ui.controlPanel->updateReport(report);
}

void MainWindow::on_actionSpiCtrl_triggered(bool checked)
{
	if (!regAccess)
	{
		regAccess = new RegAccess(0, 0);
		regAccess->setAttribute(Qt::WA_DeleteOnClose,true);
	}

	regAccess->show();
}


void MainWindow::on_menuSettings_hovered(QAction * action)
{
	bool running = AdcBoard::instance()->isRunning();
	ui.actionSpiCtrl->setEnabled(!running);
	ui.actionFftDepth->setEnabled(!running);
}

//void MainWindow::on_actionADC_triggered(bool checked)
//{
//}
//void MainWindow::on_actionSpectrum_toggled(bool checked)
//{
//	if (checked)
//	{
//		ui.actionLogic->setChecked(!checked);
//		ui.dockWidgetWave->setVisible(checked);
//		ui.dockWidgetFFT->setVisible(checked);
//		ui.dockWidgetLogicWave->setVisible(!checked);
//	}
//};
//
//void MainWindow::on_actionLogic_toggled(bool checked)
//{
//	if (checked)
//	{
//		ui.actionSpectrum->setChecked(!checked);
//		ui.dockWidgetWave->setVisible(checked);
//		ui.dockWidgetFFT->setVisible(!checked);
//		ui.dockWidgetLogicWave->setVisible(checked);
//	}
//};

