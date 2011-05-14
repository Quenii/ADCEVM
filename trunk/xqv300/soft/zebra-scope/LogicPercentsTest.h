#ifndef LOGICPERCENTSTEST_H
#define LOGICPERCENTSTEST_H

#include <QDialog>
#include "ui_LogicPercentsDialog.h"

using namespace Ui;

class LogicPercentsTest : public QDialog, public LogicPercentsDialog
{
	Q_OBJECT

public:
	LogicPercentsTest(QWidget *parent = 0);
	~LogicPercentsTest();

public:
	//void setSettings(const AdcSettings& settings);
	//void settings(AdcSettings& settings);

private slots:
	void on_pushButton_1_clicked();
	void on_pushButton_3_clicked();
	void on_pushButton_5_clicked();
	void on_pushButton_7_clicked();
	void on_pushButton_9_clicked();
};

#endif // LOGICPERCENTSTEST_H
