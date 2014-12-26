#include "stdafx.h"
#include "gkhy/qplotlib/FFTWnd.hpp"
#include "gkhy/qplotlib/plotlab/CSLScope.h"

#include <QString>

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
}

FFTWnd::~FFTWnd()
{

}

void FFTWnd::setTitle(int n)
{
	CTSLScope& scope = rawScope();
	scope.Title.Visible = false;

	if (n == 0)
	{
		scope.XAxis.AxisLabel.Text = _T("Frequency (KHz)");
	}
	else
		scope.XAxis.AxisLabel.Text = _T("Frequency (MHz)");
}
void FFTWnd::update(const std::vector<float> & xdata, const std::vector<float> & ydata, const std::vector<int> & marker)
{
	CTSLScope& scope = rawScope();
	if (scope.Channels.Count < 1)
		scope.Channels.Add(1);
	scope.Channels[0].Name = _T("FFT");

	//scope.Channels[0].Data.SetYData(&data[0], (int)data.size());
	if (xdata.size() > 0 && ydata.size() > 0)
		scope.Channels[0].Data.SetXYData(&xdata[0], &ydata[0], (int)xdata.size());

	const int *a = &marker[0];
	CTSLScopeChannel AChannel = scope.Channels[ 0 ];
	AChannel.Markers.Clear();

	if (scope.MarkerGroups.Count != 11)
	{
		scope.MarkerGroups.Clear();
		scope.MarkerGroups.Add(11);
		scope.MarkerGroups[0].Name = _T("Signal");
		scope.MarkerGroups[0].Shape = msDiamond;
		scope.MarkerGroups[0].Pen.Color = RGB(0, 192, 192);
		scope.MarkerGroups[0].Brush.Color = RGB(0, 192, 192);

		for (int i=1; i<10; ++i)
		{
			CString name(QString("HD[%1]").arg(i+1).toLocal8Bit());
			scope.MarkerGroups[i].Name = name;
			scope.MarkerGroups[i].Shape = msTriangleDown;
			scope.MarkerGroups[i].Pen.Color = RGB(0, 100, 100);
			scope.MarkerGroups[i].Brush.Color = RGB(0, 100, 100);
			CString label(QString("%1").arg(i+1).toLocal8Bit());
			scope.MarkerGroups[i].Labels.Text = label;
		}

		scope.MarkerGroups[10].Name = _T("HD11~20");
		scope.MarkerGroups[10].Shape = msStar;
		scope.MarkerGroups[10].Pen.Color = RGB(128, 0, 128);
		scope.MarkerGroups[10].Brush.Color = RGB(128, 0, 128);


	}

	AChannel.Markers.Add();
	CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
	AMarker.MarkerGroupIndex = 0;
	AMarker.Position = marker[1];

	for (int i=1; i<10; ++i)
	{
		AChannel.Markers.Add();
		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
		AMarker.MarkerGroupIndex = i;
		AMarker.Position = marker[i+1];
	}

	for (int i=10; i<20; ++i)
	{
		AChannel.Markers.Add();
		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
		AMarker.MarkerGroupIndex = 10;
		AMarker.Position = marker[i+1];
	}
	// 0~type, 1~signal, 2~10 HD[2-10]
	if (!marker[0])
	{
		scope.Cursors.Clear();
		scope.Cursors.Add( 1 );
		scope.Cursors[ 0 ].Name = _T("Noise Floor");
		scope.Cursors[ 0 ].Color = RGB(192, 128, 192);
		scope.Cursors[ 0 ].Kind = ckHorizontal;
		scope.Cursors[ 0 ].Position.Y =  marker[21];
	}else
	{
		for (int i=20; i<30; ++i)
		{
			AChannel.Markers.Add();
			CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
			AMarker.MarkerGroupIndex = 10;
			AMarker.Position = marker[i+1];
		}
	}

	//else
	//{
	//	if (scope.MarkerGroups.Count != 8)
	//	{
	//		scope.MarkerGroups.Clear();
	//		scope.MarkerGroups.Add(8);

	//		scope.MarkerGroups[0].Name = _T("Fin1");
	//		scope.MarkerGroups[0].Shape = msDiamond;
	//		scope.MarkerGroups[0].Pen.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[0].Brush.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[1].Name = _T("Fin2");
	//		scope.MarkerGroups[1].Shape = msDiamond;
	//		scope.MarkerGroups[1].Pen.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[1].Brush.Color = RGB(192, 192, 0);

	//		scope.MarkerGroups[2].Name = _T("A: Fin2+Fin1");
	//		scope.MarkerGroups[2].Shape = msTriangleDown;
	//		scope.MarkerGroups[2].Pen.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[2].Brush.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[2].Labels.Text = _T("A");
	//		scope.MarkerGroups[3].Name = _T("B: Fin2-Fin1");
	//		scope.MarkerGroups[3].Shape = msTriangleDown;
	//		scope.MarkerGroups[3].Pen.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[3].Brush.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[3].Labels.Text = _T("B");

	//		scope.MarkerGroups[4].Name = _T("C: Fin1+2Fin2");
	//		scope.MarkerGroups[4].Shape = msStar;
	//		scope.MarkerGroups[4].Pen.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[4].Brush.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[4].Labels.Text = _T("C");
	//		scope.MarkerGroups[5].Name = _T("D: 2Fin1+Fin2");
	//		scope.MarkerGroups[5].Shape = msStar;
	//		scope.MarkerGroups[5].Pen.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[5].Brush.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[5].Labels.Text = _T("D");

	//		scope.MarkerGroups[6].Name = _T("E: 2Fin2-Fin1");
	//		scope.MarkerGroups[6].Shape = msCircle;
	//		scope.MarkerGroups[6].Pen.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[6].Brush.Color = RGB(0, 192, 192);
	//		scope.MarkerGroups[6].Labels.Text = _T("E");
	//		scope.MarkerGroups[7].Name = _T("F: 2Fin1-Fin2");
	//		scope.MarkerGroups[7].Shape = msCircle;
	//		scope.MarkerGroups[7].Pen.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[7].Brush.Color = RGB(192, 192, 0);
	//		scope.MarkerGroups[7].Labels.Text = _T("F");
	//	}
	//	for (int i=1; i<4; ++i)
	//	{
	//		AChannel.Markers.Add();
	//		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
	//		AMarker.MarkerGroupIndex = 0;
	//		AMarker.Position = marker[i];
	//	}
	//	for (int i=4; i<7; ++i)
	//	{
	//		AChannel.Markers.Add();
	//		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
	//		AMarker.MarkerGroupIndex = 1;
	//		AMarker.Position = marker[i];
	//	}
	//	for (int i=8; i<14; ++i)
	//	{
	//		AChannel.Markers.Add();
	//		CTSLScopeChannelMarker AMarker = AChannel.Markers[ AChannel.Markers.Count - 1 ];
	//		AMarker.MarkerGroupIndex = i-6;
	//		AMarker.Position = marker[i];
	//	}
	//}

}