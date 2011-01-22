#ifndef QSARPARAMWINDOW_H
#define QSARPARAMWINDOW_H

#include <QWidget>
#include "ui_qsarparamwindow.h"
#include "qsar.h"

class QSarParamWindow : public QWidget
{
	Q_OBJECT

public:
	QSarParamWindow(QWidget *parent = 0);
	~QSarParamWindow();

public slots:
	void get(SarConfig& settings);
	void set(const SarConfig& settings);
	void set(const SarStatus& status);

private:
	Ui::QSarParamWindowClass ui;
};

#endif // QSARPARAMWINDOW_H
