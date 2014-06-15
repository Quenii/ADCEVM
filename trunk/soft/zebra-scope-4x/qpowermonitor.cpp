#include "qpowermonitor.h"
#include "AdcBoard.hpp"

QPowerMonitor::QPowerMonitor(QWidget *parent)
	: QToggleViewDialog(parent)
{
	ui.setupUi(this);

	AdcBoard* board = AdcBoard::instance();
	bool ok = connect(board, SIGNAL(powerMonitorDataUpdated(const PowerStatus&)),
		this, SLOT(update(const PowerStatus&)));
	Q_ASSERT(ok);
}

QPowerMonitor::~QPowerMonitor()
{

}

void QPowerMonitor::update(const PowerStatus& status)
{
	ui.ia->setText(QString("%L1").arg(status.ia, 0, 'f', 2));
	ui.id->setText(QString("%L1").arg(status.id, 0, 'f', 2));
	ui.va->setText(QString("%L1").arg(status.va, 0, 'f', 2));
	ui.vd->setText(QString("%L1").arg(status.vd, 0, 'f', 2));
	ui.p->setText(QString("%L1").arg(status.power, 0, 'f', 2));
	ui.freq->setText(QString("%L1").arg(status.freq, 0, 'f', 2));
}