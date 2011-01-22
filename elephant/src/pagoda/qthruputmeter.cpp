#include "QThruputMeter.h"

#include <QTimer>

using namespace gkhy::pagoda;


QThruputMeter::QThruputMeter(qint64 avgInteral_ms, QObject* parent /*= 0*/) 
: QObject(parent)
{
	QTimer* timer = new QTimer(this);
	timer->setObjectName("timer");

	QMetaObject::connectSlotsByName(this);

	timer->start(avgInteral_ms);

	m_instTimer.start();
	m_avgTimer.start();

	reset();
}

QThruputMeter::~QThruputMeter(void)
{

}

ThruputMeterValue QThruputMeter::value() const
{
	return m_value;
}

void QThruputMeter::on_timer_timeout()
{
	m_value.nInstThruput = (m_value.nTotal - m_lastTotal) / m_instTimer.restart();
	m_value.nAvgThruput = m_value.nTotal / m_avgTimer.restart();
	m_lastTotal = m_value.nTotal;		 
}

void QThruputMeter::reset()
{
	m_value.nTotal = 0;
	m_value.nAvgThruput = 0;
	m_value.nInstThruput = 0;

	m_avgTimer.restart();
	m_instTimer.restart();
}

void QThruputMeter::flow(qint64 nCount)
{
	m_value.nTotal += nCount;
}