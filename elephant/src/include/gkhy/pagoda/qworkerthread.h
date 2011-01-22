#pragma once 


#include "pagoda_global.h"

#include <QThread>
#include <QAtomicInt>


namespace gkhy
{
	namespace pagoda
	{
		class PAGODA_EXPORT QWorkerThread : protected QThread
		{
			Q_OBJECT

		public:
			QWorkerThread(QObject *parent);
			~QWorkerThread();

		public slots:
			void start(Priority priority = InheritPriority);
			void stop();
			bool started() { return m_started ? true : false; }

		protected:
			bool shouldStop();
			void run();  

		private:
			QAtomicInt m_enabled;
			bool m_started;
		};

	}
}

