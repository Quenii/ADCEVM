#include "ControlPanel.h"
#include "AdcBoard.hpp"
#include "StaticSettingsDialog.h"
#include "dacanalyzersettings.h"
#include "SpanSettingsDialog.h"
#include "DdsSettingsDialog.h"


#include <QStandardItemModel>
#include <QStringList>
#include <QMessageBox>

ControlPanel::ControlPanel(QWidget *parent, Qt::WFlags flags)
	: QWidget(parent, flags)
{
	ui.setupUi(this);

	/*QStandardItemModel **/
	devListModel = new QStandardItemModel(0, 3, ui.devicesView);
	devListModel->setHeaderData(0, Qt::Horizontal, QObject::tr("USB Addr"));
	devListModel->setHeaderData(1, Qt::Horizontal, QObject::tr("Dev Name"));
	devListModel->setHeaderData(2, Qt::Horizontal, QObject::tr("INF Name"));	

	ui.devicesView->setModel(devListModel);

	bool okay = connect(ui.devicesView, SIGNAL(clicked(const QModelIndex&)),
		this, SLOT(devItemClicked(const QModelIndex&)));
	Q_ASSERT(okay);

	//okay = connect(this, SIGNAL(changeSettings(const SignalSettings&)),
	//	ui.signalSettingsWidget, SLOT(setSettings(const SignalSettings&)));
	//Q_ASSERT(okay);

	//okay = connect(this, SIGNAL(changeSettings(const AdcSettings&)),
	//	ui.adcSettingsWidget, SLOT(setSettings(const AdcSettings&)));
	//Q_ASSERT(okay);

	tdReportModel = new QStandardItemModel(0, 3, ui.treeViewTdReport);
	//tdReportModel->setHeaderData(0, Qt::Horizontal, QObject::tr("Addr"));
	tdReportModel->setHeaderData(0, Qt::Horizontal, QObject::tr("Name"));
	tdReportModel->setHeaderData(1, Qt::Horizontal, QObject::tr("Value"));	
	tdReportModel->setHeaderData(2, Qt::Horizontal, QObject::tr("Unit"));	

	ui.treeViewTdReport->setModel(tdReportModel);

	ui.groupBox_DeviceList->hide();
	ui.groupBoxChSel->hide();

	ui.tabWidget->setVisible(false);
	ui.pushButtonStatisticTest->setVisible(false);
	ui.staticTestButtons->setVisible(false);
	
	//AdcBoard& board = *(AdcBoard::instance());
	//board.adcSettings(adcSettings);
	//ui.adcSettingsWidget->setSettings(adcSettings);

	//board.signalSettings(signalSettings);
	//ui.signalSettingsWidget->setSettings(signalSettings);
}

ControlPanel::~ControlPanel()
{
	
}

void ControlPanel::setDevList(const QList<AdcBoardInfo>& lst)
{
	devListModel->removeRows(0, devListModel->rowCount());

	for (int i = 0; i < lst.size(); ++i)
	{
		devListModel->insertRow(0);

		devListModel->setData(devListModel->index(0, 0), lst[i].usbAddr);
		devListModel->item(0, 0)->setEditable(false);

		devListModel->setData(devListModel->index(0, 1), lst[i].devName);
		devListModel->item(0, 1)->setEditable(false);

		devListModel->setData(devListModel->index(0, 2), lst[i].infName);
		devListModel->item(0, 2)->setEditable(false);
		
	}

	if (lst.size() > 0)
	{
		// choose the first device by default...
		ui.devicesView->selectionModel()->select(devListModel->index(0, 0), QItemSelectionModel::Select | QItemSelectionModel::Rows);
		devItemClicked(devListModel->index(0, 0));
	}	
}

void ControlPanel::devItemClicked(const QModelIndex& index)
{
	int usbAddress = devListModel->data(devListModel->index(index.row(), 0)).toInt();
	emit devSelected(usbAddress);
}

void ControlPanel::updateReport(const AdcBoardReport &rpt)
{
	// td report
	const TimeDomainReport& tdRpt = rpt.tdReport;
	const FreqDomainReport& fdRpt = rpt.fdReport;


	tdReportModel->removeRows(0, tdReportModel->rowCount());
	int len = fdRpt.dualTone ? fdRpt.DualTonePara.size() : fdRpt.DynamicPara.size();
	if (fdRpt.dualTone)
	{
		for (int i = len-1; i >= 0; -- i )
		{
			tdReportModel->insertRow(0);
			tdReportModel->setData(tdReportModel->index(0, 0), fdRpt.DualTonePara[i].name);
			tdReportModel->setData(tdReportModel->index(0, 1), QString("%L1").arg(fdRpt.DualTonePara[i].value, 0, 'f', 2));
			tdReportModel->setData(tdReportModel->index(0, 2), fdRpt.DualTonePara[i].unit);
		}
	}
	else
	{
		for (int i = len-1; i >= 0; -- i )
		{
			tdReportModel->insertRow(0);
			tdReportModel->setData(tdReportModel->index(0, 0), fdRpt.DynamicPara[i].name);
			tdReportModel->setData(tdReportModel->index(0, 1), QString("%L1").arg(fdRpt.DynamicPara[i].value, 0, 'f', 2));
			tdReportModel->setData(tdReportModel->index(0, 2), fdRpt.DynamicPara[i].unit);
		}
	}
}

void ControlPanel::on_pushButtonStartDynamicTest_clicked()
{	
	ui.pushButtonStartAlgTest->setEnabled(false);
	ui.pushButtonStartDynamicTest->setEnabled(false);
	ui.pushButtonStopDynamicTest->setEnabled(true);	
	ui.pushButtonStatisticTest->setEnabled(false);
	ui.staticTestButtons->setEnabled(false);

	AdcAnalyzerSettings m_analyzer;
	SignalSettings m_signal = m_analyzer.signalSettings();
	m_signal.iq = false;
	m_analyzer.setSignalSettings(m_signal);
	AdcBoard::instance()->updateXaxis(m_signal.clockFreq, m_signal.iq);

	AdcBoard::instance()->setDynamicOn(true);
}

void ControlPanel::on_pushButtonStartAlgTest_clicked()
{	
	ui.pushButtonStartAlgTest->setEnabled(false);
	ui.pushButtonStartDynamicTest->setEnabled(false);
	ui.pushButtonStopDynamicTest->setEnabled(true);	
	ui.pushButtonStatisticTest->setEnabled(false);
	ui.staticTestButtons->setEnabled(false);

	AdcAnalyzerSettings m_analyzer;
	SignalSettings m_signal = m_analyzer.signalSettings();
	m_signal.iq = true;
	m_analyzer.setSignalSettings(m_signal);
	AdcBoard::instance()->updateXaxis(m_signal.clockFreq, m_signal.iq);

	AdcBoard::instance()->setDynamicOn(true);
}

void ControlPanel::on_pushButtonStopDynamicTest_clicked()
{		
	ui.pushButtonStartAlgTest->setEnabled(true);
	ui.pushButtonStopDynamicTest->setEnabled(false);
	ui.pushButtonStartDynamicTest->setEnabled(true);	
	ui.pushButtonStatisticTest->setEnabled(true);
	ui.staticTestButtons->setEnabled(true);
	AdcBoard::instance()->setDynamicOn(false);
}

void ControlPanel::on_pushButtonStartStaticTest_clicked()
{
	ui.dynamicTestButtons->setEnabled(false);

	StaticSettingsDialog dlg;
	if (QDialog::Accepted  == dlg.exec())
	{
		AdcAnalyzerSettings s;
		StaticTestSettings sts = s.staticTestSettings();
		sts.noise = false;
		s.setStaticTestSettings(sts);

		AdcBoard::instance()->staticTest();
	}
	ui.dynamicTestButtons->setEnabled(true);
}

void ControlPanel::on_pushButtonStatisticTest_clicked()
{		
	StaticSettingsDialog dlg(true);

	if (QDialog::Accepted  == dlg.exec())
	{
		//QMessageBox notice;
		//notice.setWindowTitle(tr("ADC-Analyzer"));
		//notice.setText();
		//notice.exec();

		AdcAnalyzerSettings s;
		StaticTestSettings sts = s.staticTestSettings();
		sts.noise = true;
		s.setStaticTestSettings(sts);

		AdcBoard::instance()->staticTest();
	}
}

void ControlPanel::spanChanged()
{
	AdcAnalyzerSettings s;
	SpanSettings span;
	
	SpanSettingsDialog dlg;
	dlg.exec();
}

void ControlPanel::on_pushButtonSetDDS_clicked()
{
	DdsSettingsDialog dlg;
	dlg.exec();

	AdcAnalyzerSettings s;
	DdsSettings dds = s.ddsSettings();
	SignalSettings signal = s.signalSettings();

	unsigned short reg = 0;
	reg = 8 | (signal.iq ? 2 : 0);
	AdcBoard::instance()->writeReg(202, reg);
	reg = (signal.iq ? 2 : 0);
	AdcBoard::instance()->writeReg(202, reg);

	AdcBoard::instance()->WriteDDSReg(0, 0, 0x00410000);
	AdcBoard::instance()->WriteDDSReg(1, 0, 0x01400820);
//	AdcBoard::instance()->WriteDDSReg(2, 0, 0x3d1fc018);
	AdcBoard::instance()->WriteDDSReg(2, 0, 0x3d1fc118);

	float coef = 17.895697f;
	unsigned int ftw = dds.startFreq * coef;
	unsigned int asf = (unsigned int)( dds.clockPower * 0x3FFF0000 ) & 0x3FFF0000;
	AdcBoard::instance()->WriteDDSReg(0xE, asf, ftw, false);



}
