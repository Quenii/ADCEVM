#include <stdlib.h>
#include <qpen.h>
#include <qwt_plot_layout.h>
#include <qwt_legend.h>
#include <qwt_legend_item.h>
#include <qwt_plot_grid.h>
#include <qwt_plot_histogram.h>
#include <qwt_column_symbol.h>
#include <qwt_series_data.h>
#include "histplot.h"


class Histogram: public QwtPlotHistogram
{
public:
	Histogram(const QString &, const QColor &);

	void setColor(const QColor &);
	void setValues(uint numValues, const double *, int origin = 0);
};

Histogram::Histogram(const QString &title, const QColor &symbolColor):
QwtPlotHistogram(title)
{
	setStyle(QwtPlotHistogram::Columns);

	setColor(symbolColor);
}

void Histogram::setColor(const QColor &symbolColor)
{
	QColor color = symbolColor;
	color.setAlpha(180);

	setPen(QPen(Qt::black));
	setBrush(QBrush(color));

	QwtColumnSymbol *symbol = new QwtColumnSymbol(QwtColumnSymbol::Box);
	symbol->setFrameStyle(QwtColumnSymbol::Raised);
	symbol->setLineWidth(2);
	symbol->setPalette(QPalette(color));
	setSymbol(symbol);
}

void Histogram::setValues(uint numValues, const double *values, int origin)
{
	QVector<QwtIntervalSample> samples(numValues);
	for ( uint i = 0; i < numValues; i++ )
	{
		QwtInterval interval(i+origin-0.5, i+origin+0.5);
		interval.setBorderFlags(QwtInterval::ExcludeMaximum);

		samples[i] = QwtIntervalSample(values[i], interval);
	}

	setData(new QwtIntervalSeriesData(samples));
}

HistPlot::HistPlot(QWidget *parent):
QwtPlot(parent)
{
	setCanvasBackground(QColor(Qt::black));
	plotLayout()->setAlignCanvasToScales(true);

	//QwtLegend *legend = new QwtLegend;
	//legend->setItemMode(QwtLegend::CheckableItem);
	//insertLegend(legend, QwtPlot::RightLegend);

	//populate();

	//connect(this, SIGNAL(legendChecked(QwtPlotItem *, bool)),
	//	SLOT(showItem(QwtPlotItem *, bool)));

	//replot(); // creating the legend items

	QwtPlotItemList items = itemList(QwtPlotItem::Rtti_PlotHistogram);
	for ( int i = 0; i < items.size(); i++ )
	{
		if ( i == 0 )
		{
			//QwtLegendItem *legendItem = (QwtLegendItem *)legend->find(items[i]);
			//if ( legendItem )
			//	legendItem->setChecked(true);
			items[i]->setVisible(true);
		}
		else
			items[i]->setVisible(false);
	}

	setAutoReplot(true);
}

void HistPlot::populate()
{
	setTitle("Watching TV during a weekend");
	setAxisTitle(QwtPlot::yLeft, "Number of People");
	setAxisTitle(QwtPlot::xBottom, "Number of Hours");

	QwtPlotGrid *grid = new QwtPlotGrid;
	grid->enableX(false);
	grid->enableY(true);
	grid->enableXMin(false);
	grid->enableYMin(false);
	grid->setMajPen(QPen(Qt::black, 0, Qt::SolidLine));
	grid->attach(this);

	const double juneValues[] = { 7, 19, 24, 32, 10, 5, 3 };
	const double novemberValues[] = { 4, 15, 22, 34, 13, 8, 4 };

	Histogram *histogramJune = new Histogram("Summer", Qt::red);
	histogramJune->setValues(
		sizeof(juneValues) / sizeof(double), juneValues);
	histogramJune->attach(this);

	Histogram *histogramNovember = new Histogram("Winter", Qt::blue);
	histogramNovember->setValues(
		sizeof(novemberValues) / sizeof(double), novemberValues);
	histogramNovember->attach(this);
}

void HistPlot::showItem(QwtPlotItem *item, bool on)
{
	item->setVisible(on);
}

void HistPlot::setValueHist(const vector<double>& histogram, int origin)
{
	setTitle("Histogram");
	setAxisTitle(QwtPlot::yLeft, "Count");
	setAxisTitle(QwtPlot::xBottom, "Value");

	QwtPlotGrid *grid = new QwtPlotGrid;
	grid->enableX(false);
	grid->enableY(true);
	grid->enableXMin(false);
	grid->enableYMin(false);
	grid->setMajPen(QPen(Qt::darkGreen, 0, Qt::SolidLine));
	grid->attach(this);

	Histogram *histogramJune = new Histogram("Summer", Qt::red);
	histogramJune->setValues(
		histogram.size(), &histogram[0], origin);
	histogramJune->attach(this);
}
