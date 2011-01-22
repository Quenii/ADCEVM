#include "qworkerthread.h"

using namespace gkhy::pagoda;

QWorkerThread::QWorkerThread(QObject *parent)
	: QThread(parent)
	, m_enabled(1)
	, m_started(false)
{
}

QWorkerThread::~QWorkerThread()
{
	stop();
}


void QWorkerThread::start(Priority priority /*= InheritPriority*/)
{
	m_enabled = 1;
	QThread::start(priority);
	m_started = true;
}

void QWorkerThread::stop()
{
	m_enabled = 0;
	if (m_started)
		QWorkerThread::wait();
}

void QWorkerThread::run()
{
	while (! shouldStop())
	{
		sleep(1);
	}
}

bool QWorkerThread::shouldStop()
{
	return m_enabled ? false : true;
}

