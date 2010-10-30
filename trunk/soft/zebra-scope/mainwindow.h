#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "ui_mainwindow.h"
#include <QtGui/QMainWindow>
#include <QPointer>
#include "AdcBoardTypes.hpp"



namespace gkhy
{
	namespace QPlotLab
	{
		class WaveWnd;
		class LogicWaveWnd;
		class FFTWnd;
	}
}
class QSplitter;
class ControlPanel;
class QTimerEvent;
class AdcBoard;
class RegAccess;

class MainWindow : public QMainWindow
{
	Q_OBJECT

public:
	MainWindow(QWidget *parent = 0, Qt::WFlags flags = 0);
	~MainWindow();

private:
	void createMenus();

private slots:
	void on_actionSpiCtrl_triggered(bool checked = false);

 	void slotShowWaveWnd();
 	void slotShowFFtWnd();
 	void slotShowControlPanel();
	void slotShowAbout();
	void slotShowBoardReport(const AdcBoardReport& report);

private:
	Ui::MainWindowClass ui;
	gkhy::QPlotLab::WaveWnd* waveWnd;
	gkhy::QPlotLab::FFTWnd* fftWnd;
	gkhy::QPlotLab::LogicWaveWnd* logicWaveWnd;
	QPointer<RegAccess> regAccess;
	AdcBoard* adcBoard;
};

#endif // MAINWINDOW_H
