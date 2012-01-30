#include "stdafx.h"
#include "gkhy/qplotlib/FFTWnd.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"

using namespace gkhy::QPlotLab;

FFTWnd::FFTWnd(QWidget *parent /*= 0*/, Qt::WindowFlags f /*= 0*/) : QScope(parent, f)
{
	CTSLScope& scope = rawScope();
	scope.Title.Visible = false;

	scope.XAxis.AxisLabel.Text = _T("Frequency (MHz)");
	scope.YAxis.AxisLabel.Text = _T("Amplitude (dBFS)");

	scope.YAxis.Max.Value = 5;
	scope.YAxis.Min.Value = -140;
	scope.YAxis.AutoScaling.Enabled = FALSE;

	scope.MarkerGroups.Add(4);
	scope.MarkerGroups[0].Name = _T("Signal/fin1");
	scope.MarkerGroups[0].Shape = msDiamond;
	scope.MarkerGroups[0].Pen.Color = RGB(0, 192, 192);
	scope.MarkerGroups[0].Brush.Color = RGB(0, 192, 192);

	scope.MarkerGroups[1].Name = _T("HD2~10/fin2");
	scope.MarkerGroups[1].Shape = msTriangleDown;
	scope.MarkerGroups[1].Pen.Color = RGB(0, 100, 100);
	scope.MarkerGroups[1].Brush.Color = RGB(0, 100, 100);
	scope.MarkerGroups[1].Labels.Text = _T("%Y");

	scope.MarkerGroups[2].Name = _T("HD11~20/IMD2");
	scope.MarkerGroups[2].Shape = msStar;
	scope.MarkerGroups[2].Pen.Color = RGB(128, 0, 128);
	scope.MarkerGroups[2].Brush.Color = RGB(128, 0, 128);

	scope.MarkerGroups[3].Name = _T("IMD3");
	scope.MarkerGroups[3].Shape = msStar;
	scope.MarkerGroups[3].Pen.Color = RGB(128, 128, 0);
	scope.MarkerGroups[3].Brush.Color = RGB(128, 128, 0);

}

FFTWnd::~FFTWnd()
{

}

void FFTWnd::update(const std::vector<float> & xdata, const std::vector<float> & ydata, const std::vector<int> & marker)
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

	if (!marker[0])
	{
		AChannel.Markers.Add();
		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
		AMarker.MarkerGroupIndex = 0;
		AMarker.Position = marker[1];

		for (int i=1; i<20; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = i<10 ? 1 : 2;
			AMarker.Position = marker[i+1];
		}

		scope.Cursors.Clear();
		scope.Cursors.Add( 1 );
		scope.Cursors[ 0 ].Name = _T("Noise Floor");
		scope.Cursors[ 0 ].Color = RGB(192, 128, 192);
		scope.Cursors[ 0 ].Kind = ckHorizontal;
		scope.Cursors[ 0 ].Position.Y =  marker[21];
	}
	else
	{
		for (int i=1; i<4; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = 0;
			AMarker.Position = marker[i];
		}
		for (int i=4; i<7; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = 1;
			AMarker.Position = marker[i];
		}
		for (int i=8; i<10; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = 2;
			AMarker.Position = marker[i];
		}
		for (int i=10; i<14; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = 3;
			AMarker.Position = marker[i];
		}


	}

}