#pragma once
#include "gkhy/qplotlib/qplotlab_global.hpp"
#include "gkhy/qplotlib/qscope.hpp"

namespace gkhy
{
	namespace QPlotLab
	{
		class QPLOTLAB_EXPORT WaveWnd : public gkhy::QPlotLab::QScope
		{
		public:
			WaveWnd(QWidget* parent = 0, Qt::WindowFlags f = 0); 
			virtual ~WaveWnd();

		public:
			//void update(const std::vector<float>& data);
			void update(const std::vector<float> & xdata, const std::vector<float> & ydata);
			//void __stdcall CustomXAxesLabel(void * Sender, double Value, CString &);
		};
	}
}