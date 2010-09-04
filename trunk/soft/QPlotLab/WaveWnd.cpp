#include "stdafx.h"
#include "gkhy/qplotlib/WaveWnd.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"

using namespace gkhy::QPlotLab;

WaveWnd::WaveWnd(QWidget *parent /*= 0*/, Qt::WindowFlags f /*= 0*/) : QScope(parent, f) 
{
	//rawScope().Title.Text = _T("Time-domain Wave");
	rawScope().Title.Visible = false;
	rawScope().XAxis.AxisLabel.Text = _T("Time (ns)");
	
	rawScope().YAxis.AxisLabel.Text = _T("Amplitude (V)");

	//rawScope().XAxis.OnCustomLabel.Set(this, &WaveWnd::CustomXAxesLabel);



}

WaveWnd::~WaveWnd()
{

}

void WaveWnd::update(const std::vector<float> & xdata, const std::vector<float> & ydata)
{
	CTSLScope& scope = rawScope();
	if (scope.Channels.Count < 1)
		scope.Channels.Add(1);

	//scope.Channels[0].Data.SetYData(&data[0], (int)data.size()); 
	scope.Channels[0].Data.SetXYData(&xdata[0], &ydata[0], (int)xdata.size());

}
//void __stdcall WaveWnd::CustomXAxesLabel(void * Sender, double Value, CString &)
//{
//	CString str;
//	CTSLScope& scope = rawScope();
//	str.Format( _T("Sample : %d"), (int)( Value * 4 ));
//
//	scope.XAxis.SetTickText( str );
//}
