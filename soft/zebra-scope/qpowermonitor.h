#ifndef QPOWERMONITOR_H
#define QPOWERMONITOR_H

#include "qtoggleviewdialog.h"
#include "ui_qpowermonitor.h"
#include "AdcBoardTypes.hpp"

#include <QDialog>

class QPowerMonitor : public QToggleViewDialog
{
	Q_OBJECT

public:
	QPowerMonitor(QWidget *parent = 0);
	~QPowerMonitor();

public slots:
	void update(const PowerStatus& data);

private:
	Ui::QPowerMonitorClass ui;
};

#endif // QPOWERMONITOR_H
