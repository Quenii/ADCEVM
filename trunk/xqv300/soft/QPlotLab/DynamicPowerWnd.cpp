#include "stdafx.h"
#include "gkhy/qplotlib/DynamicPowerWnd.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"

using namespace gkhy::QPlotLab;

DynamicPowerWnd::DynamicPowerWnd(QWidget *parent /*= 0*/, Qt::WindowFlags f /*= 0*/) : QScope(parent, f), m_chnum(5) 
{
	USES_CONVERSION;

	CTSLScope& scope = rawScope();
	
	scope.Title.Visible = false;

	while(scope.Channels.Count > 0)	
	{
		scope.Channels.Delete(0);
	}

	m_arrayList.resize(m_chnum);

	scope.Channels.Add(m_arrayList.size());

	scope.Channels[0].Color = RGB(0, 128, 128);
	scope.Channels[0].Name = A2T("V(vccint)");

	scope.Channels[1].Color = RGB(0, 128, 255);
	scope.Channels[1].Name = A2T("V(vcco)");
	
	scope.Channels[2].Color = RGB(255, 0, 255);
	scope.Channels[2].Name = A2T("I(vccint)");
	
	scope.Channels[3].Color = RGB(128, 255, 0);
	scope.Channels[3].Name = A2T("I(vcco)");
	
	scope.Channels[4].Color = RGB(255, 255, 0);
	scope.Channels[4].Name = A2T("POWER");
	//	scope.CanRedoZoom

	//std::vector<unsigned short> data(10);	
	//for (int i = 0; i < data.size(); ++i)
	//{
	//	data[i] = unsigned short(i);
	//}

	//update(data);
}

DynamicPowerWnd::~DynamicPowerWnd()
{

}

void DynamicPowerWnd::update(const std::vector<float> & xdata)
{
	CTSLScope& scope = rawScope();

	for (int i = 0; i < m_chnum; ++i)
	{
		scope.Channels[i].Data.AddYPoint(xdata[i], false);  // .SetXYData(&m_x[0], &m_y[0], m_x.size());
		//CTColor color = scope.Channels[0].Color;
	}
}

void DynamicPowerWnd::addMarker(const std::vector<float> & xdata)
{
	CTSLScope& scope = rawScope();

	//add a marker

	for (int i = 0; i < m_chnum; ++i)
	{
		scope.Channels[i].Data.Clear();
	}

	scope.Cursors.Clear();
	scope.Cursors.Add( xdata.size() );

	for (int i = 0; i < xdata.size(); ++i)
	{
		scope.Cursors[ i ].Position.X = xdata[i];
	}

}