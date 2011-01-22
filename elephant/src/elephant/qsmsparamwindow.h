#ifndef QSMSPARAMWINDOW_H
#define QSMSPARAMWINDOW_H

#include <QWidget>
#include "ui_qsmsparamwindow.h"

class QSmsParamWindow : public QWidget
{
	Q_OBJECT

public:
	QSmsParamWindow(QWidget *parent = 0);
	~QSmsParamWindow();

private:
	Ui::QSmsParamWindowClass ui;
};

#endif // QSMSPARAMWINDOW_H
