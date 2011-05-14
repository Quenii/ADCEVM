#ifndef LOGICDYNAMICTEST_H
#define LOGICDYNAMICTEST_H

#include <QDialog>
#include "ui_LogicDynamicDialog.h"

using namespace Ui;

class LogicDynamicTest : public QDialog, public LogicDynamicDialog
{
	Q_OBJECT

public:
	LogicDynamicTest(QWidget *parent = 0);
	~LogicDynamicTest();

public:
	//void setSettings(const AdcSettings& settings);
	//void settings(AdcSettings& settings);
private slots:
	void on_pushButton_clicked();
};

#endif // LOGICDYNAMICTEST_H
