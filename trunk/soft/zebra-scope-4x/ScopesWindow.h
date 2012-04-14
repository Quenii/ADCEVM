#pragma once

#include "ui_ScopesWindow.h"
#include "gkhy/qplotlib/WaveWnd.hpp"
#include "gkhy/qplotlib/FFTWnd.hpp"
#include "gkhy/qplotlib/LogicWaveWnd.hpp"


class ScopesWindow : public QMainWindow
{
	Q_OBJECT
public:
	ScopesWindow(QWidget *parent = 0, Qt::WFlags flags = 0);
	~ScopesWindow();

public:
	gkhy::QPlotLab::WaveWnd* waveWnd;
	gkhy::QPlotLab::FFTWnd* fftWnd;
	gkhy::QPlotLab::LogicWaveWnd* logicWaveWnd;

private:
	Ui::ScopesWindowClass ui;
};
