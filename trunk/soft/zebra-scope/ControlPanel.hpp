#pragma once

#include "ui_ControlPanel.h"
#include "AdcBoard.hpp"
#include "AdcBoardTypes.hpp"

#include <QWidget>
#include <QPointer>
#include <QList>

class QModelIndex;
class QStandardItemModel;
class RegAccess;

class ControlPanel : public QWidget
{
	Q_OBJECT

public:
	ControlPanel(QWidget *parent = 0, Qt::WFlags flags = 0);
	virtual ~ControlPanel();

public:
	void uiAdcSettings(AdcSettings& settings);
	void uiSignalSettings(SignalSettings& settings);

	void setUiAdcSettings(const AdcSettings& settings);
	void setUiSignalSettings(const SignalSettings& settings);

	void setUiPowerStatus(const PowerStatus& status);

public slots:
	void setDevList(const QList<AdcBoardInfo>& lst);
	void updateReport(const AdcBoardReport& rpt);

signals:
	void devSelected(int usbAddr);

private slots:
	void devItemClicked(const QModelIndex& index);
	void on_pushButtonAccessToRegs_clicked();

	void on_pushButtonEditAdcSettings_clicked();
	void on_pushButtonApplyAdcSettings_clicked();

	void on_pushButtonEditSignalSettings_clicked();
	void on_pushButtonApplySignalSettings_clicked();
	
	
	void on_pushButtonStartDynamicTest_clicked();
	void on_pushButtonStopDynamicTest_clicked();
	void on_pushButtonStartStaticTest_clicked();
	void on_pushButtonStopStaticTest_clicked();

private:
	Ui::ControlPanel ui;
	QStandardItemModel *devListModel;
	QPointer<RegAccess> regAccess;
	AdcSettings adcSettings;
	SignalSettings signalSettings;

 	QStandardItemModel *tdReportModel;
 	QStandardItemModel *rdReportModel;

};

