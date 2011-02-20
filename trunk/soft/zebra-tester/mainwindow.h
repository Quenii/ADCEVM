#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "ui_mainwindow.h"

class QPushButton;
class QWidget;

class MainWindow : public QMainWindow
{
	Q_OBJECT

public:
	MainWindow(QWidget *parent = 0);
	~MainWindow();

public:
	void addMdiWindow(QWidget* widget, QPushButton* btn);

private:
	Ui::MainWindowClass ui;
};

#endif // MAINWINDOW_H
