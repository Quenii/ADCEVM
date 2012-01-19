#pragma once

#define QWT_DLL // This is needed due to a bug/imperfectness of QWT.

#include <qwt_plot.h>

class HistPlot: public QwtPlot
{
	Q_OBJECT

public:
	HistPlot(QWidget * = NULL);

private:
	void populate();

private Q_SLOTS:
	void showItem(QwtPlotItem *, bool on);
};
