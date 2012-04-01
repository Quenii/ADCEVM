#include "qdevicedialog.h"
#include "qextserialport.h"
#include "qextserialenumerator.h"
#include "gasinfosettings.h"


#include <QtCore/QList>


QDeviceDialog::QDeviceDialog(QWidget *parent)
    : QDialog(parent)
{
    //ui.setupUi(this);
    //initDevice();
}
QDeviceDialog::QDeviceDialog(QString name, QWidget *parent)
: QDialog(parent)
{
    ui.setupUi(this);
    initDevice();
    settingFileName = name;
}

QDeviceDialog::~QDeviceDialog()
{

}

void QDeviceDialog::initDevice()
{

    QList<QextPortInfo> ports = QextSerialEnumerator::getPorts();
    for (int i = 0; i < ports.size(); i++) {
        ui.portBox->addItem(ports.at(i).portName);
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

    ui.queryModeBox->addItem(QLatin1String("Polling"), QextSerialPort::Polling);
    ui.queryModeBox->addItem(QLatin1String("EventDriven"), QextSerialPort::EventDriven);

    //ui.led->turnOff();

    //connect(ui.baudRateBox, SIGNAL(currentIndexChanged(int)), SLOT(onBaudRateChanged(int)));
    //connect(ui.parityBox, SIGNAL(currentIndexChanged(int)), SLOT(onParityChanged(int)));
    //connect(ui.dataBitsBox, SIGNAL(currentIndexChanged(int)), SLOT(onDataBitsChanged(int)));
    //connect(ui.stopBitsBox, SIGNAL(currentIndexChanged(int)), SLOT(onStopBitsChanged(int)));
    //connect(ui.queryModeBox, SIGNAL(currentIndexChanged(int)), SLOT(onQueryModeChanged(int)));
    //connect(ui.timeoutBox, SIGNAL(valueChanged(int)), SLOT(onTimeoutChanged(int)));
    //connect(ui.portBox, SIGNAL(editTextChanged(QString)), SLOT(onPortNameChanged(QString)));

    setWindowTitle(QLatin1String("Zigbee Settings"));

}

void QDeviceDialog::accept()
{
    SerialPortInfo info;

    info.name = ui.portBox->currentText();
    info.BaudRate = /*(BaudRateType)*/ui.baudRateBox->itemData(ui.baudRateBox->currentIndex()).toInt();
    info.DataBits = /*(DataBitsType)*/ui.dataBitsBox->itemData(ui.baudRateBox->currentIndex()).toInt();
    info.FlowControl = FLOW_OFF;
    info.Parity = /*(ParityType)*/ui.parityBox->itemData(ui.baudRateBox->currentIndex()).toInt();
    info.StopBits = /*(StopBitsType)*/ui.stopBitsBox->itemData(ui.baudRateBox->currentIndex()).toInt();
    info.Timeout_Millisec = ui.timeoutBox->value();
    info.mode = /*(QextSerialPort::QueryMode)*/ui.queryModeBox->itemData(ui.baudRateBox->currentIndex()).toInt();

    GasInfoSettings settings;
  //  SerialSettings settings(settingFileName, QSettings::IniFormat, 0);
    settings.setSerialPortInfo(info);
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

void QDeviceDialog::onPortNameChanged(const QString & /*name*/)
{
    //if (port->isOpen()) {
    //    port->close();
    //    ui.led->turnOff();
    //}
}

void QDeviceDialog::onBaudRateChanged(int idx)
{
    //port->setBaudRate((BaudRateType)ui->baudRateBox->itemData(idx).toInt());
}

void QDeviceDialog::onParityChanged(int idx)
{
    //port->setParity((ParityType)ui->parityBox->itemData(idx).toInt());
}

void QDeviceDialog::onDataBitsChanged(int idx)
{
    //port->setDataBits((DataBitsType)ui->dataBitsBox->itemData(idx).toInt());
}

void QDeviceDialog::onStopBitsChanged(int idx)
{
    //port->setStopBits((StopBitsType)ui->stopBitsBox->itemData(idx).toInt());
}

void QDeviceDialog::onQueryModeChanged(int idx)
{
    //port->setQueryMode((QextSerialPort::QueryMode)ui->queryModeBox->itemData(idx).toInt());
}

void QDeviceDialog::onTimeoutChanged(int val)
{
    //port->setTimeout(val);
}
