#include "ScopesWindow.h"
#include "gkhy/qplotlib/WaveWnd.hpp"
#include "gkhy/qplotlib/FFTWnd.hpp"
#include "gkhy/qplotlib/LogicWaveWnd.hpp"

ScopesWindow::ScopesWindow(QWidget *parent, Qt::WFlags flags)
	: QMainWindow(parent, flags)
{
	ui.setupUi(this);
	
	waveWnd = new gkhy::QPlotLab::WaveWnd();
	ui.dockWidgetWave->setWidget(waveWnd);
	fftWnd = new gkhy::QPlotLab::FFTWnd();
	ui.dockWidgetFFT->setWidget(fftWnd);
	logicWaveWnd = new gkhy::QPlotLab::LogicWaveWnd();
	ui.dockWidgetLogicWave->setWidget(logicWaveWnd);

	setCentralWidget(0);
}

ScopesWindow::~ScopesWindow()
{
}
