#ifndef LOGICTESTDIALOG_H
#define LOGICTESTDIALOG_H

#include <QDialog>
#include "ui_LogicTest.h"

using namespace Ui;

class LogicTest : public QDialog, public LogicTestClass
{
	Q_OBJECT

public:
	LogicTest(QWidget *parent = 0);
	~LogicTest();

public:
	//void setSettings(const AdcSettings& settings);
	//void settings(AdcSettings& settings);
};

#endif // LOGICTESTDIALOG_H
