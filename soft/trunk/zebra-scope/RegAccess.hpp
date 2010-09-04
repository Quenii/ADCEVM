#pragma once

#include "ui_RegAccess.h"
#include "AdcBoard.hpp"
#include <QWidget>
#include <QPointer>
#include <QList>

class QModelIndex;
class QStandardItemModel;
class RegAccessItem;

class RegAccess : public QWidget , public Ui::FormRegAccess
{
	Q_OBJECT

public:
	RegAccess(QWidget *parent = 0, Qt::WFlags flags = 0);
	virtual ~RegAccess();

public slots:
	void slotRegAccessItemStateChanged(QWidget* item);
	void on_pushButtonResetCircuit_clicked();
	void on_pushButtonOpenScan_clicked();
	void on_pushButtonAutoExec_clicked();
	void on_sbSampleRate_valueChanged();

private:
	QVector<RegAccessItem*> m_regAccessItems;
};

