#include "stdafx.h"
#include "gkhy/qplotlib/FFTWndDual.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"

using namespace gkhy::QPlotLab;

FFTWndDual::FFTWndDual(QWidget *parent /*= 0*/, Qt::WindowFlags f /*= 0*/) : QScope(parent, f)
{
	CTSLScope& scope = rawScope();
	scope.Title.Visible = false;

	scope.XAxis.AxisLabel.Text = _T("Frequency (MHz)");
	scope.YAxis.AxisLabel.Text = _T("Amplitude (dBFS)");

	scope.YAxis.Max.Value = 5;
	scope.YAxis.Min.Value = -140;
	scope.YAxis.AutoScaling.Enabled = FALSE;

	scope.MarkerGroups.Add(3);
	scope.MarkerGroups[0].Name = _T("HD2~10");
	scope.MarkerGroups[0].Shape = msTriangleDown;
	scope.MarkerGroups[0].Pen.Color = RGB(0, 100, 100);
	scope.MarkerGroups[0].Brush.Color = RGB(0, 100, 100);
	scope.MarkerGroups[0].Labels.Text = _T("%Y");

	scope.MarkerGroups[1].Name = _T("HD11~20");
	scope.MarkerGroups[1].Shape = msStar;
	scope.MarkerGroups[1].Pen.Color = RGB(128, 0, 128);
	scope.MarkerGroups[1].Brush.Color = RGB(128, 0, 128);

	scope.MarkerGroups[2].Name = _T("Signal");
	scope.MarkerGroups[2].Shape = msDiamond;
	scope.MarkerGroups[2].Pen.Color = RGB(0, 192, 192);
	scope.MarkerGroups[2].Brush.Color = RGB(0, 192, 192);
}

FFTWndDual::~FFTWndDual()
{

}

void FFTWndDual::update(const std::vector<float> & xdata, const std::vector<float> & ydata, const std::vector<int> & marker)
{
	CTSLScope& scope = rawScope();
	if (scope.Channels.Count < 1)
		scope.Channels.Add(1);

	//scope.Channels[0].Data.SetYData(&data[0], (int)data.size());
	if (xdata.size() > 0 && ydata.size() > 0)
		scope.Channels[0].Data.SetXYData(&xdata[0], &ydata[0], (int)xdata.size());
	scope.Channels[0].Name = _T("FFT");

	CTSLScopeChannel AChannel = scope.Channels[ 0 ];
	AChannel.Markers.Clear();

	AChannel.Markers.Add();
	CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
	AMarker.MarkerGroupIndex = 2;
	AMarker.Position = marker[0];

	for (int i=1; i<20; ++i)
	{
		AChannel.Markers.Add();
		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
		AMarker.MarkerGroupIndex = i<10 ? 0 : 1;
		AMarker.Position = marker[i];
	}

	scope.Cursors.Clear();
	scope.Cursors.Add( 1 );
	scope.Cursors[ 0 ].Name = _T("Noise Floor");
	scope.Cursors[ 0 ].Color = RGB(192, 128, 192);
	scope.Cursors[ 0 ].Kind = ckHorizontal;
	scope.Cursors[ 0 ].Position.Y =  marker[20];

}