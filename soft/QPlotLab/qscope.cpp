#include "stdafx.h"
#include "gkhy/qplotlib/qscope.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"
#include <QSize>
#include <QResizeEvent>
#include <QHBoxLayout>

#pragma comment(lib, "VCLLoaderMS.lib")

using namespace gkhy::QPlotLab;

QScope::QScope(QWidget* parent /* = 0 */, Qt::WindowFlags f /* = 0 */) :
QWidget(parent, f)
{
	m_scope = new CTSLScope;

	//m_scope->Open(winId());
	// oops....the attempt directly render m_scope on QScope fails, 
	// instead, we create a "delegation" window to render m_scope.
	// the reason is not yet found.
	QHBoxLayout* hbox = new QHBoxLayout(this);
	hbox->setSpacing(0);
//	hbox->setMargin(0);
	QWidget* b = new QWidget();
	hbox->addWidget(b);
	m_scope->Open((HWND)b->winId());	

	m_scope->Visible = false;

}

QScope::~QScope()
{
	delete m_scope;

}

void QScope::resizeEvent(QResizeEvent * event)
{
	QSize size = event->size();
	m_scope->Left = 0;
	m_scope->Top = 0;
	m_scope->Width = size.width();
	m_scope->Height = size.height();

	QWidget::resizeEvent(event);
}

void QScope::showEvent (QShowEvent * event) 
{
	QWidget::showEvent(event);
	m_scope->Visible = true;
}

void QScope::hideEvent(QHideEvent *event)
{
	m_scope->Visible = false;
	QWidget::hideEvent(event);
}

void QScope::plot(const double* data, int len)
{
	if(len > 0)
		rawScope().Channels[0].Data.SetYData(data, len); 	
}

void QScope::adjust(double min, double max)
{
	rawScope().YAxis.AutoScaling.Enabled = false;
	rawScope().YAxis.Max.AutoScale = false;	
	rawScope().YAxis.Min.AutoScale = false;

	rawScope().YAxis.Max.Value = max;
	rawScope().YAxis.Min.Value = min;
}