#include <QtCore/QStringList>
#include <QtCore/QTimer>
#include <QtCore/QVariant>
#include <QMessageBox>
#include "qextserialport.h"
#include "qextserialenumerator.h"

#include "maindialog.h"
#include "ui_dialog.h"
#include "QMyTabWidget.h"
#include "QLogTabWidget.h"
#include "QMapTabWidget.h"
#include "QGasInfo.h"

#include "qdevicedialog.h"
//#include "serialsettings.h"
#include "gasinfosettings.h"

#define min(a, b) (((a) < (b)) ? (a) : (b))

MainDialog::MainDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog),
    settingsFileName("zigbee.ini"),
    queryId(15),
    rawGps("")
{
    ui->setupUi(this);

    ui->tabWidgetStation->clear();

    for (int i = 0; i < 17; ++i)
    {
        GpsInfo info;
        info.valid = false;
        gpsInfoList.append(info);
    }

    ui->tabWidgetStation->setUpdatesEnabled(true);

    ui->tabWidgetStation->addTab(new QMapTabWidget, QString("Map"));
    for (int i=0; i<16; ++i)
    {
        ui->tabWidgetStation->setUpdatesEnabled(true);
        ui->tabWidgetStation->addTab(new QMyTabWidget , QString("%1").arg(i));
        ui->tabWidgetStation->adjustSize();
     }


    ui->tabWidgetStation->addTab(new QLogTabWidget , QString("Log"));
    ui->tabWidgetStation->setUsesScrollButtons(true);

    QList<QextPortInfo> ports = QextSerialEnumerator::getPorts();
    for (int i = 0; i < ports.size(); i++) {
        ui->comboBoxGps->addItem(ports.at(i).portName);
    }

    if (!QFile::exists(settingsFileName))
    {
        QDeviceDialog dlg;//(/*settingsFileName*/);
        dlg.exec();
    }
    reloadSettings();

    port = new QextSerialPort(portInfo.name, settings, QextSerialPort::Polling);
    connect(ui->pushButtonOpen, SIGNAL(clicked()), SLOT(on_pushButtonOpenclicked()));
    connect(ui->pushButtonChangeSettings, SIGNAL(clicked()), SLOT(on_pushButtonChangeSettingsclicked()));
    ui->led->turnOff();
    ui->ledGps->turnOff();
    timer = new QTimer(this);
    timer->setInterval(500);
    connect(timer, SIGNAL(timeout()), SLOT(onReadyRead()));

    timerCmd = new QTimer(this);
    timerCmd->setInterval(1000);
    connect(timerCmd, SIGNAL(timeout()), SLOT(sendCmd()));

    PortSettings gpsSettings = {BAUD9600, DATA_8, PAR_NONE, STOP_1, FLOW_OFF, 10};
    gpsPort = new QextSerialPort(ui->comboBoxGps->currentText(), gpsSettings, QextSerialPort::Polling);


    setWindowTitle(QLatin1String("Gas Monitor"));
}

MainDialog::~MainDialog()
{
    delete ui;
    delete port;
}

void MainDialog::reloadSettings()
{
    //const SerialSettings s(settingsFileName, SerialSettings::IniFormat, 0);
    GasInfoSettings s;
    portInfo = s.serialPortInfo();

    ui->lineEditDevice->setText(portInfo.name);

    settings.BaudRate = (BaudRateType)portInfo.BaudRate;
    settings.DataBits = (DataBitsType)portInfo.DataBits;
    settings.FlowControl = (FlowType)portInfo.FlowControl;
    settings.Parity = (ParityType)portInfo.Parity;
    settings.StopBits = (StopBitsType)portInfo.StopBits;
    settings.Timeout_Millisec = (long)portInfo.Timeout_Millisec;
}

void MainDialog::on_pushButtonOpenclicked()
{
    if (!port->isOpen()) {
        port->setPortName(portInfo.name);
        port->open(QIODevice::ReadWrite);
        timerCmd->start();

        ui->pushButtonOpen->setText(QString("Stop"));
    }
    else {
        port->close();
        timerCmd->stop();
        ui->pushButtonOpen->setText(QString("Start"));
    }

    if (port->isOpen()) {
        if (port->queryMode() == QextSerialPort::Polling)
            timer->start();
        ui->led->turnOn();
    }
    else {
        timer->stop();
        ui->led->turnOff();
    }
}

void MainDialog::on_pushButtonChangeSettingsclicked()
{
    if (port->isOpen()) {
        ui->led->turnOff();
        port->close();
        timer->stop();
    }

    QDeviceDialog dlg;//(/*settingsFileName*/);
    dlg.exec();
    reloadSettings();
}

void MainDialog::setData()
{
    GasInfoItem item;
    rcvBuffer.getItem(item);
    int ch = item.ch + 1;
    ((QMyTabWidget*)ui->tabWidgetStation->widget(ch))->setData(item);
    gpsInfoList[ch].valid = true;
    gpsInfoList[ch].latitude = item.latitude.toFloat();
    gpsInfoList[ch].longitude = item.longitude.toFloat();
    if(gpsInfoList[0].valid == true)
    {
        gpsInfoList[ch].deltaY = gpsInfoList[ch].latitude - gpsInfoList[0].latitude;
        gpsInfoList[ch].deltaX = gpsInfoList[ch].longitude - gpsInfoList[0].longitude;
        float tx = gpsInfoList[ch].deltaX;
        float ty = gpsInfoList[ch].deltaY;
    }

    ((QMapTabWidget*)ui->tabWidgetStation->widget(0))->updateGraphic(gpsInfoList);
    //if (item.fel > felThres || item.h2s > h2sThres || item.so2 > so2Thres)
    {

    }
}

void MainDialog::onReadyRead()
{
    if (port->bytesAvailable()) {
        QByteArray msg = port->readAll();
        //log
        ((QLogTabWidget*)ui->tabWidgetStation->widget(17))->setData(QString(msg), "");

        if (rcvBuffer.ValidateCmd(msg.data(), msg.size()))
        {
            setData();
        }
        while(rcvBuffer.ValidateCmd(msg.data(), 0) && rcvBuffer.valid >= RCVBUFLEN) //
        {
            setData();
        }
    }
}

void MainDialog::sendCmd()
{
    if (queryId == 15)
    {
        queryId = 0;
        if (port->isOpen())
            port->write(QString("Get%1").arg(queryId).toLatin1());

        QString msg;
        gpsInfoList[0].latitude = 31.24972f;
        gpsInfoList[0].longitude = 104.3572f;
        msg += QString("Latitude: %1\n").arg(gpsInfoList[0].latitude, 0, 'f', 4);
        msg += QString("Longitude: %1\n\r").arg(gpsInfoList[0].longitude, 0, 'f', 4);
        gpsInfoList[0].valid = true;
        ((QLogTabWidget*)ui->tabWidgetStation->widget(17))->setData("", QString(msg));

#if 0
        if (gpsPort->bytesAvailable())
        {
            QByteArray ba = gpsPort->readAll();

            QString msg;
            int j = 0;
            while(true)
            {
               if ((j = ba.indexOf("$GPRMC", j)) != -1) {
                    ba = ba.right(ba.size() - j);
                }
                QList<QByteArray> baList = ba.split(',');

                if (baList.size() >= 12 && baList.at(2).at(0) == 'A')
                {
//                    msg += "Latitude: ";
//                    msg += baList.at(3);
//                    msg += "Longitude: ";
//                    msg += baList.at(5);
                    QByteArray tmp = baList.at(3);
                    for(int i=0; i<tmp.size(); ++i)
                        tmp[i] = tmp[i]-'0';
                    gpsInfoList[0].latitude = tmp[0]*10 + tmp[1]
                            + (float(tmp[2]*10 + tmp[3])
                            + (float(tmp[5]*1e3 + tmp[6]*1e2 + tmp[7]*1e1 + tmp[8]))/10000.0f)/60.0f;

                    tmp = baList.at(5);
                    for(int i=0; i<tmp.size(); ++i)
                        tmp[i] = tmp[i]-'0';
                    gpsInfoList[0].longitude = tmp[0]*1e2 + tmp[1]*1e1 + tmp[2]
                            + (float(tmp[3]*10 + tmp[4])
                            + (float(tmp[6]*1e3 + tmp[7]*1e2 + tmp[8]*1e1 + tmp[9]))/10000.0f)/60.0f;

                    //gpsInfoList[0].latitude = baList.at(3).toFloat();
                    //gpsInfoList[0].longitude = baList.at(5).toFloat();
                    msg += QString("Latitude: %1\n").arg(gpsInfoList[0].latitude, 0, 'f', 4);
                    msg += QString("Longitude: %1\n\r").arg(gpsInfoList[0].longitude, 0, 'f', 4);
                    gpsInfoList[0].valid = true;
                    break;
                }
            }
            ((QLogTabWidget*)ui->tabWidgetStation->widget(17))->setData("", QString(msg));
        }
#endif
    }
    else
    {
        queryId += 1;
        if(gpsPort->bytesAvailable())
            gpsPort->readAll();
    }
}

void MainDialog::on_pushButtonOpenGps_clicked()
{
    if (!gpsPort->isOpen()) {
        ui->pushButtonOpenGps->setText(QString("Stop"));
        gpsPort->setPortName(ui->comboBoxGps->currentText());
        gpsPort->open(QIODevice::ReadOnly);
        ui->ledGps->turnOn();
    }
    else {
        gpsPort->close();
        ui->pushButtonOpenGps->setText(QString("Start"));
        ui->ledGps->turnOff();
    }
}
