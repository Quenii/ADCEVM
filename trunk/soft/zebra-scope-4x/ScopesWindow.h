#pragma once

#include "ui_ScopesWindow.h"

namespace gkhy
{
	namespace QPlotLab
	{
		class WaveWnd;
		class LogicWaveWnd;
		class FFTWnd;
	}
}

class ScopesWindow : public QMainWindow
{
	Q_OBJECT
public:
	ScopesWindow(QWidget *parent = 0, Qt::WFlags flags = 0);
	~ScopesWindow();

private:
	Ui::ScopesWindowClass ui;
	gkhy::QPlotLab::WaveWnd* waveWnd;
	gkhy::QPlotLab::FFTWnd* fftWnd;
	gkhy::QPlotLab::LogicWaveWnd* logicWaveWnd;
};
