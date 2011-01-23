#pragma once 

#include "gkhy/pagoda/qrdmpacket.h"
#include "gkhy/pagoda/qworkerthread.h"
#include "qsartypes.h"
#include "qdev.h"

#include <qobject>
#include <memory>

class QSar : public QDev ,  private gkhy::pagoda::QWorkerThread
{
	Q_OBJECT

public:
	QSar(QObject* parent = 0);
	virtual ~QSar();

public:
	bool start();
	void stop();

public slots:
	bool set(const SarConfig& settings, int& ret);
	bool get(const SarConfig& settings, int& ret) const;

	bool get(SarStatus& status, int& ret);
	bool set(const SarCommand& command, int& ret);

public:
	void run();
	void run_session();

private:
	SarConfig m_sarConfig;
	SarStatus m_sarStatus;
};
