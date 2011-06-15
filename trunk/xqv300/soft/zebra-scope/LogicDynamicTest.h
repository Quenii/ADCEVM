#ifndef LOGICDYNAMICTEST_H
#define LOGICDYNAMICTEST_H

#include <QDialog>
#include "ui_LogicDynamicDialog.h"
#include "qtoggleviewdialog.h"

using namespace Ui;

class LogicDynamicTest : public QToggleViewDialog, public LogicDynamicDialog
{
	Q_OBJECT

public:
	LogicDynamicTest(QWidget *parent = 0);
	~LogicDynamicTest();

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

#endif // LOGICDYNAMICTEST_H
