#include "ControlPanel.h"
#include "AdcBoard.hpp"
#include "LogicTest.h"
#include "LogicPercentsTest.h"
#include "LogicDynamicTest.h"

#include <QStandardItemModel>
#include <QStringList>
#include <QProcess>
#include <Qdir>
#include <QFile>
#include <QTextStream>
#include <QDebug>

#include "gkhy/mfcminus/Win32App.hpp"

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

	okay = connect(this, SIGNAL(changeSettings(const SignalSettings&)),
		ui.signalSettingsWidget, SLOT(setSettings(const SignalSettings&)));
	Q_ASSERT(okay);

	okay = connect(this, SIGNAL(changeSettings(const AdcSettings&)),
		ui.adcSettingsWidget, SLOT(setSettings(const AdcSettings&)));
	Q_ASSERT(okay);

	for (int i=0; i<8; ++i)
	{
		this->ui.comboBoxBank->addItem(tr("Bank%1").arg(i));
	}
	//buttonsOrientationComboBox->addItem(tr("Horizontal"), Qt::Horizontal);
	//buttonsOrientationComboBox->addItem(tr("Vertical"), Qt::Vertical);

	//connect(buttonsOrientationComboBox, SIGNAL(currentIndexChanged(int)),
	//	this, SLOT(buttonsOrientationChanged(int)));
	okay = connect(this->ui.comboBoxBank, SIGNAL( activated(int) ), this, SLOT(on_comboBoxBank_activated(int)));
	Q_ASSERT(okay);

	//tdReportModel = new QStandardItemModel(0, 2, ui.treeViewTdReport);
	//tdReportModel->setHeaderData(0, Qt::Horizontal, QObject::tr("Addr"));
	//tdReportModel->setHeaderData(0, Qt::Horizontal, QObject::tr("Name"));
	//tdReportModel->setHeaderData(1, Qt::Horizontal, QObject::tr("Value"));	

	//ui.treeViewTdReport->setModel(tdReportModel);

//	ui.groupBox_DeviceList->hide();

	
	AdcBoard& board = *(AdcBoard::instance());
	board.adcSettings(adcSettings);
	ui.adcSettingsWidget->setSettings(adcSettings);

	board.signalSettings(signalSettings);
	ui.signalSettingsWidget->setSettings(signalSettings);
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
	setUiPowerStatus(rpt.powerStatus);

	// td report
	const TimeDomainReport& tdRpt = rpt.tdReport;
	const FreqDomainReport& fdRpt = rpt.fdReport;

}


void ControlPanel::on_adcSettingsWidget_settingsChanged()
{
	ui.adcSettingsWidget->settings(adcSettings);
	AdcBoard& board = *(AdcBoard::instance());
	if (!board.setAdcSettings(adcSettings))
	{
		Q_ASSERT(false);
	}
}

void ControlPanel::on_signalSettingsWidget_settingsChanged()
{
	ui.signalSettingsWidget->settings(signalSettings);
	AdcBoard& board = *(AdcBoard::instance());
	if (!board.setSignalSettings(signalSettings))
	{
		Q_ASSERT(false);
	}
}

void ControlPanel::on_pushButtonStartDynamicTest_clicked()
{	
	ui.pushButtonStartDynamicTest->setEnabled(false);
	ui.pushButtonStopDynamicTest->setEnabled(true);	
//	ui.staticTestButtons->setEnabled(false);
	AdcBoard::instance()->setDynamicOn(true);
}

void ControlPanel::on_pushButtonStopDynamicTest_clicked()
{		
	ui.pushButtonStopDynamicTest->setEnabled(false);
	ui.pushButtonStartDynamicTest->setEnabled(true);	
//	ui.staticTestButtons->setEnabled(true);
	AdcBoard::instance()->setDynamicOn(false);
}

void ControlPanel::on_pushButtonStartStaticTest_clicked()
{
	
//	ui.pushButtonStartStaticTest->setEnabled(false);
//	ui.pushButtonStopStaticTest->setEnabled(true);		
	ui.dynamicTestButtons->setEnabled(false);
//	AdcBoard::instance()->staticTest();
	ui.dynamicTestButtons->setEnabled(true);

}

void ControlPanel::on_pushButtonStopStaticTest_clicked()
{		
	//ui.pushButtonStopStaticTest->setEnabled(false);	
	//ui.pushButtonStartStaticTest->setEnabled(true);
	//ui.dynamicTestButtons->setEnabled(true);

}

void ControlPanel::setUiPowerStatus(const PowerStatus& status)
{
	ui.vdLineEdit->setText(QString("%L1").arg(status.vio, 0, 'f', 2));
	ui.vaLineEdit->setText(QString("%L1").arg(status.vcore, 0, 'f', 2));
	ui.idLineEdit->setText(QString("%L1").arg(status.iio, 0, 'f', 1));
	ui.iaLineEdit->setText(QString("%L1").arg(status.icore, 0, 'f', 1));
	ui.powerLineEdit->setText(QString("%1").arg(status.power, 0, 'f', 2));
	ui.temperatureLineEdit->setText(QString("%L1").arg(status.temperature, 0, 'f', 2));
}

bool ControlPanel::on_pushButtonJtagTest_clicked()
{		
	//QObject *parent;
	//QString program = "impact";
	//QStringList arguments;
	//arguments << "setMode" << "-bs";
 //
	//QProcess *myProcess = new QProcess(parent);
	//myProcess->start(program, arguments);

	QProcess impact;
	impact.start("impact", QStringList() << "-mode bscan -port auto");
	gkhy::MfcMinus::Win32App::sleep(1000);
	//sleep(1000);
	//if (!impact.waitForStarted())
	//	return false;

	return true;

}

void ControlPanel::on_pushButtonLogicTest_clicked()
{
	LogicTest dlg;
	if (QDialog::Accepted  == dlg.exec())
	{
	}

}

void ControlPanel::on_pushButtonThermal_clicked()
{
	LogicPercentsTest dlg;
	QString cmdFilePrefix = "setMode -bscan \nsetCable -p auto \naddDevice -p 1 -part xcf04s \naddDevice -p 2 -file ";
	QString cmdFileSufix = "\nprogram -p 2 \nquit";
	if (QDialog::Accepted  == dlg.exec())
	{
		m_thermalTestInfo.bitFileName[0] = dlg.bitFileName1->text();
		m_thermalTestInfo.bitFileName[1] = dlg.bitFileName3->text();
		m_thermalTestInfo.bitFileName[2] = dlg.bitFileName5->text();
		m_thermalTestInfo.bitFileName[3] = dlg.bitFileName7->text();
		m_thermalTestInfo.bitFileName[4] = dlg.bitFileName9->text();

		m_thermalTestInfo.interval = dlg.intervalDoubleSpinBox->value();
		m_thermalTestInfo.last = dlg.lastDoubleSpinBox->value();

	}

	std::vector<float> markers;
	for (int i = 0; i < 5; ++i)
	{
		markers.push_back(i*2*(m_thermalTestInfo.interval + m_thermalTestInfo.last));

		QString fileName = QString("%1.cmd").arg(i);

		QString filePath = QDir(qApp->applicationDirPath()).filePath(fileName);

		QFile m_file;
		m_file.setFileName(filePath);
		if (!m_file.open(QIODevice::WriteOnly | QIODevice::Text))
			Q_ASSERT(false);
		QTextStream out(&m_file);
		out << cmdFilePrefix << m_thermalTestInfo.bitFileName[i] << cmdFileSufix;

	}
	QProcess impact;
	impact.setProcessChannelMode(QProcess::MergedChannels);

	QString fileName = QString("0.cmd");

	QString filePath = QDir(qApp->applicationDirPath()).filePath(fileName);

	impact.start("impact", QStringList() << "-batch " << filePath);

	if (!impact.waitForFinished())
		qDebug() << "Make failed:" << impact.errorString();
	else
		qDebug() << "Make output:" << impact.readAll();		

	emit( changeTest(markers));
	m_timeId = startTimer((m_thermalTestInfo.interval + m_thermalTestInfo.last)*1000);

}

void ControlPanel::on_pushButtonDynPower_clicked()
{
	LogicDynamicTest dlg;
	QString cmdFilePrefix = "setMode -bscan \nsetCable -p auto \naddDevice -p 1 -part xcf04s \naddDevice -p 2 -file ";
	QString cmdFileSufix = "\nprogram -p 2 \nquit";
	if (QDialog::Accepted  == dlg.exec())
	{
		m_thermalTestInfo.bitFileName[0] = dlg.bitFileName1->text();
		m_thermalTestInfo.bitFileName[1] = dlg.bitFileName3->text();
		m_thermalTestInfo.bitFileName[2] = dlg.bitFileName5->text();
		m_thermalTestInfo.bitFileName[3] = dlg.bitFileName7->text();
		m_thermalTestInfo.bitFileName[4] = dlg.bitFileName9->text();

		m_thermalTestInfo.interval = dlg.intervalDoubleSpinBox->value();
		m_thermalTestInfo.last = dlg.lastDoubleSpinBox->value();
	}
	std::vector<float> markers;
	for (int i = 0; i < 5; ++i)
	{
		markers.push_back(i*2*(m_thermalTestInfo.interval + m_thermalTestInfo.last));

		QString fileName = QString("%1.cmd").arg(i);

		QString filePath = QDir(qApp->applicationDirPath()).filePath(fileName);

		QFile m_file;
		m_file.setFileName(filePath);
		if (!m_file.open(QIODevice::WriteOnly | QIODevice::Text))
			Q_ASSERT(false);
		QTextStream out(&m_file);
		out << cmdFilePrefix << m_thermalTestInfo.bitFileName[i] << cmdFileSufix;

	}
	QProcess impact;
	impact.setProcessChannelMode(QProcess::MergedChannels);

	QString fileName = QString("0.cmd");

	QString filePath = QDir(qApp->applicationDirPath()).filePath(fileName);

	impact.start("impact", QStringList() << "-batch " << filePath);

	if (!impact.waitForFinished())
		qDebug() << "Make failed:" << impact.errorString();
	else
		qDebug() << "Make output:" << impact.readAll();		

	emit( changeTest(markers));
	m_timeId = startTimer((m_thermalTestInfo.interval + m_thermalTestInfo.last)*1000);

}

void ControlPanel::timerEvent(QTimerEvent* event)
{
	if (event->timerId() == m_timeId)
	{
		qDebug() << "timeEvent \n";
		static int i = 0;
		++i;
		QProcess impact;
		impact.setProcessChannelMode(QProcess::MergedChannels);

		QString fileName = QString("%1.cmd").arg(i);

		QString filePath = QDir(qApp->applicationDirPath()).filePath(fileName);

		impact.start("impact", QStringList() << "-batch " << filePath);

		if (!impact.waitForFinished())
			qDebug() << "Make failed:" << impact.errorString();
		else
			qDebug() << "Make output:" << impact.readAll();		
		killTimer(m_timeId);
		if (i < 4)
		{
			m_timeId = startTimer((m_thermalTestInfo.interval + m_thermalTestInfo.last)*1000);
		}
		else
		{
			i = 0;
		}
	}


}

void ControlPanel::on_comboBoxBank_activated(int bank)
{
	bank = ui.comboBoxBank->currentIndex();
	AdcBoard& board = *(AdcBoard::instance());

	board.changeBank(bank);

}