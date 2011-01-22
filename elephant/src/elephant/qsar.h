#pragma once 

#include "gkhy/pagoda/qrdmpacket.h"
#include "gkhy/pagoda/qworkerthread.h"
#include "qsartypes.h"
#include "qdev.h"

#include <qobject>
#include <memory>

class QSar : virtual public QDev, virtual protected gkhy::pagoda::QWorkerThread
{
	Q_OBJECT

public:
	QSar(QObject* parent = 0);
	virtual ~QSar();

public:
	bool start();
	void stop();

	bool set(const SarConfig& settings);
	bool get(const SarConfig& settings) const;

	bool get(SarStatus& status);
	bool set(const SarCommand& command);

public:
	void run();
	void run_session();

private:
	SarConfig m_sarConfig;
	SarStatus m_sarStatus;
};
