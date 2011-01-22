#pragma once

#include "pagoda_global.h"

#include <QObject>
#include <QElapsedTimer>

namespace gkhy
{
	namespace pagoda
	{
		struct ThruputMeterValue
		{
			// qint64 nElapsedTime;					
			qint64 nTotal;
			qint64 nAvgThruput;
			qint64 nInstThruput;
		};

		class PAGODA_EXPORT QThruputMeter : QObject
		{
			Q_OBJECT

		public:
			QThruputMeter(qint64 avgInteral_ms, QObject* parent = 0);
			virtual ~QThruputMeter(void);

	
		public:
			void reset(void);
			void flow(qint64 nCount);
			ThruputMeterValue value() const;

		private:
			void on_timer_timeout();

		private:
			QElapsedTimer m_avgTimer;		
			QElapsedTimer m_instTimer;		
			ThruputMeterValue m_value;		
			qint64 m_lastTotal;
		};

	}

}

