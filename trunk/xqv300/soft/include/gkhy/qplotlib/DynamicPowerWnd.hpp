#pragma once
#include "gkhy/qplotlib/qplotlab_global.hpp"
#include "gkhy/qplotlib/qscope.hpp"

#include <vector>

using namespace std;

namespace gkhy
{
	namespace QPlotLab
	{
		class QPLOTLAB_EXPORT DynamicPowerWnd : public gkhy::QPlotLab::QScope
		{
			typedef vector<int> Array;
			typedef list<Array> ArrayList;

		public:
			DynamicPowerWnd(QWidget* parent = 0, Qt::WindowFlags f = 0); 
			virtual ~DynamicPowerWnd();

		public:
			void update(const std::vector<float> & xdata);
			void addMarker(const std::vector<float> & xdata);


		private:
			ArrayList m_arrayList;
			int m_chnum;
			std::vector<float> m_x;
			std::vector<float> m_y;
		};
	}
}