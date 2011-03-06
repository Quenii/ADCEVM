#ifndef QCLOCKFREQWIDGET_H
#define QCLOCKFREQWIDGET_H

#include <QWidget>
#include "ui_qclockfreqwidget.h"

class QClockFreqWidget : public QWidget
{
	Q_OBJECT

public:
	QClockFreqWidget(QWidget *parent = 0);
	~QClockFreqWidget();

private:
	Ui::QClockFreqWidgetClass ui;
};

#endif // QCLOCKFREQWIDGET_H
