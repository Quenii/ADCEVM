#include "qdevicedialog.h"
#include "qextserialport.h"
#include "qextserialenumerator.h"
#include "gasinfosettings.h"


#include <QtCore/QList>


QDeviceDialog::QDeviceDialog(QWidget *parent)
    : QDialog(parent)
{
    ui.setupUi(this);
    initDevice();
}
//QDeviceDialog::QDeviceDialog(QString name, QWidget *parent)
//: QDialog(parent)
//{
//    ui.setupUi(this);
//    initDevice();
//    settingFileName = name;
//}

QDeviceDialog::~QDeviceDialog()
{

}

void QDeviceDialog::initDevice()
{
    QList<QextPortInfo> ports = QextSerialEnumerator::getPorts();
    for (int i = 0; i < ports.size(); i++) {
        ui.portBox->addItem(ports.at(i).portName);
        ui.portBoxGps->addItem(ports.at(i).portName);
    }

    ui.baudRateBox->addItem(QLatin1String("1200"), BAUD1200);
    ui.baudRateBox->addItem(QLatin1String("2400"), BAUD2400);
    ui.baudRateBox->addItem(QLatin1String("4800"), BAUD4800);
    ui.baudRateBox->addItem(QLatin1String("9600"), BAUD9600);
    ui.baudRateBox->addItem(QLatin1String("19200"), BAUD19200);
    ui.baudRateBox->addItem(QLatin1String("38400"), BAUD38400);
    ui.baudRateBox->addItem(QLatin1String("57600"), BAUD57600);
    ui.baudRateBox->addItem(QLatin1String("115200"), BAUD115200);
    ui.baudRateBox->setCurrentIndex(7);

    ui.parityBox->addItem(QLatin1String("NONE"), PAR_NONE);
    ui.parityBox->addItem(QLatin1String("ODD"), PAR_ODD);
    ui.parityBox->addItem(QLatin1String("EVEN"), PAR_EVEN);

    ui.dataBitsBox->addItem(QLatin1String("5"), DATA_5);
    ui.dataBitsBox->addItem(QLatin1String("6"), DATA_6);
    ui.dataBitsBox->addItem(QLatin1String("7"), DATA_7);
    ui.dataBitsBox->addItem(QLatin1String("8"), DATA_8);
    ui.dataBitsBox->setCurrentIndex(3);

    ui.stopBitsBox->addItem(QLatin1String("1"), STOP_1);
    ui.stopBitsBox->addItem(QLatin1String("2"), STOP_2);

    ui.queryModeBox->addItem(tr("Polling"), QextSerialPort::Polling);
    ui.queryModeBox->addItem(tr("Event"), QextSerialPort::EventDriven);

    ui.baudRateBoxGps->addItem(QLatin1String("1200"), BAUD1200);
    ui.baudRateBoxGps->addItem(QLatin1String("2400"), BAUD2400);
    ui.baudRateBoxGps->addItem(QLatin1String("4800"), BAUD4800);
    ui.baudRateBoxGps->addItem(QLatin1String("9600"), BAUD9600);
    ui.baudRateBoxGps->addItem(QLatin1String("19200"), BAUD19200);
    ui.baudRateBoxGps->addItem(QLatin1String("38400"), BAUD38400);
    ui.baudRateBoxGps->addItem(QLatin1String("57600"), BAUD57600);
    ui.baudRateBoxGps->addItem(QLatin1String("115200"), BAUD115200);
    ui.baudRateBoxGps->setCurrentIndex(3);

    ui.parityBoxGps->addItem(QLatin1String("NONE"), PAR_NONE);
    ui.parityBoxGps->addItem(QLatin1String("ODD"), PAR_ODD);
    ui.parityBoxGps->addItem(QLatin1String("EVEN"), PAR_EVEN);

    ui.dataBitsBoxGps->addItem(QLatin1String("5"), DATA_5);
    ui.dataBitsBoxGps->addItem(QLatin1String("6"), DATA_6);
    ui.dataBitsBoxGps->addItem(QLatin1String("7"), DATA_7);
    ui.dataBitsBoxGps->addItem(QLatin1String("8"), DATA_8);
    ui.dataBitsBoxGps->setCurrentIndex(3);

    ui.stopBitsBoxGps->addItem(QLatin1String("1"), STOP_1);
    ui.stopBitsBoxGps->addItem(QLatin1String("2"), STOP_2);

    ui.queryModeBoxGps->addItem(tr("Polling"), QextSerialPort::Polling);
    ui.queryModeBoxGps->addItem(tr("Event"), QextSerialPort::EventDriven);

    setWindowTitle(tr("Device Settings"));

}

void QDeviceDialog::accept()
{
    SerialPortInfo info;

    info.name = ui.portBox->currentText();
    info.BaudRate = /*(BaudRateType)*/ui.baudRateBox->itemData(ui.baudRateBox->currentIndex()).toInt();
    info.DataBits = /*(DataBitsType)*/ui.dataBitsBox->itemData(ui.dataBitsBox->currentIndex()).toInt();
    info.FlowControl = FLOW_OFF;
    info.Parity = /*(ParityType)*/ui.parityBox->itemData(ui.parityBox->currentIndex()).toInt();
    info.StopBits = /*(StopBitsType)*/ui.stopBitsBox->itemData(ui.stopBitsBox->currentIndex()).toInt();
    info.Timeout_Millisec = ui.timeoutBox->value();
    info.mode = /*(QextSerialPort::QueryMode)*/ui.queryModeBox->itemData(ui.queryModeBox->currentIndex()).toInt();

    GasInfoSettings settings;
  //  SerialSettings settings(settingFileName, QSettings::IniFormat, 0);
    settings.setSerialPortInfo(info);

    info.name = ui.portBoxGps->currentText();
    info.BaudRate = /*(BaudRateType)*/ui.baudRateBoxGps->itemData(ui.baudRateBoxGps->currentIndex()).toInt();
    info.DataBits = /*(DataBitsType)*/ui.dataBitsBoxGps->itemData(ui.dataBitsBoxGps->currentIndex()).toInt();
    info.FlowControl = FLOW_OFF;
    info.Parity = /*(ParityType)*/ui.parityBoxGps->itemData(ui.parityBoxGps->currentIndex()).toInt();
    info.StopBits = /*(StopBitsType)*/ui.stopBitsBoxGps->itemData(ui.stopBitsBoxGps->currentIndex()).toInt();
    info.Timeout_Millisec = ui.timeoutBoxGps->value();
    info.mode = /*(QextSerialPort::QueryMode)*/ui.queryModeBoxGps->itemData(ui.queryModeBoxGps->currentIndex()).toInt();

    settings.setGpsPortInfo(info);
    QDialog::accept();
}

void QDeviceDialog::changeEvent(QEvent *e)
{
    QDialog::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui.retranslateUi(this);
        break;
    default:
        break;
    }
}

