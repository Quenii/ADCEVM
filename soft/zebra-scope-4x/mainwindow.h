#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "ui_mainwindow.h"
#include <QtGui/QMainWindow>
#include "AdcBoardTypes.hpp"


#include <QPointer>
#include <QList>



class QSplitter;
class ControlPanel;
class QTimerEvent;
class AdcBoard;
class RegAccess;
class QPowerMonitor;
class QMdiSubWindowEx;

class MainWindow : public QMainWindow
{
	Q_OBJECT

public:
	MainWindow* getInstance(){}

public:
	MainWindow(QWidget *parent = 0, Qt::WFlags flags = 0);
	~MainWindow();

protected:
	void closeEvent(QCloseEvent *event);


private:
	void createMenus();
	void readSettings();

signals:
	void settingsLoaded(const AdcTypeSettings& data);
	void settingsLoaded(const SignalSettings& data);
	void adcBoardReportLoaded(const AdcBoardReport& data);

private slots:
	void on_menuSettings_hovered(QAction * action);
	void on_actionLoadData_triggered(bool checked = false);
	void on_actionSaveData_triggered(bool checked = false);
	void on_actionSpiCtrl_triggered(bool checked = false);
	void on_actionLoadStaticData_triggered(bool checked = false);


 	//void slotShowWaveWnd();
 	//void slotShowFFtWnd();
 	void slotShowControlPanel();
	void slotShowAbout();
	void slotShowBoardReport(const AdcBoardReport& report);

private:
	Ui::MainWindowClass ui;
	QPointer<RegAccess> regAccess;
	AdcBoard* adcBoard;
	QPowerMonitor* m_powerMonitorWidget;
	
	QList<QMdiSubWindowEx*> m_mdiSubWindows;

};

#endif // MAINWINDOW_H
