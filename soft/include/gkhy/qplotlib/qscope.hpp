#pragma once
#include "gkhy/qplotlib/qplotlab_global.hpp"
#include <QWidget>

class CTSLScope;

namespace gkhy
{
	namespace QPlotLab
	{
		class QPLOTLAB_EXPORT QScope : public QWidget
		{
		public:
			QScope(QWidget* parent = 0, Qt::WindowFlags f = 0);
			virtual ~QScope();

		public:
			void plot(const double* data, int len);
			void QScope::adjust(double min, double max);

		protected:
			CTSLScope& rawScope()	{ return *m_scope; }
			
		private:
			CTSLScope* m_scope;
		};

	}
}

