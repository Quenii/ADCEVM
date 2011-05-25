#pragma once
#include "gkhy/qplotlib/qplotlab_global.hpp"
#include "gkhy/qplotlib/qscope.hpp"

#include <vector>

using namespace std;

namespace gkhy
{
	namespace QPlotLab
	{
		class QPLOTLAB_EXPORT LogicWaveWnd : public gkhy::QPlotLab::QScope
		{
			typedef vector<int> Array;
			typedef list<Array> ArrayList;

		public:
			LogicWaveWnd(QWidget* parent = 0, Qt::WindowFlags f = 0); 
			virtual ~LogicWaveWnd();

		public:
			void update(const std::vector<unsigned int> & xdata);

		private:
			ArrayList m_arrayList;
			int m_chnum;
			std::vector<float> m_x;
			std::vector<float> m_y;
		};
	}
}