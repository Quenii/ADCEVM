#pragma once
#include "gkhy/qplotlib/qplotlab_global.hpp"
#include "gkhy/qplotlib/qscope.hpp"
#include <vector>

namespace gkhy
{
	namespace QPlotLab
	{
		class QPLOTLAB_EXPORT FFTWndDual : public gkhy::QPlotLab::QScope
		{

		public:
			FFTWndDual(QWidget* parent = 0, Qt::WindowFlags f = 0); 
			virtual ~FFTWndDual();

		public:
			//void update(const std::vector<float> & data);
			void update(const std::vector<float> &, const std::vector<float> &, const std::vector<int> &);
		};
	}
}

