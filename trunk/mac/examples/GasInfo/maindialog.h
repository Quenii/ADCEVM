#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>

#include "SerialTypes.hpp"
#include "QGasInfo.h"

namespace Ui {
    class Dialog;
}
class QTimer;
class QextSerialPort;
const int RCVBUFLEN = 50;    // * 16 * 2;
const int IDPOS = 4;

struct SerialRcvBuffer{
    unsigned char buffer[RCVBUFLEN*2*16];
    int valid;

    SerialRcvBuffer()
    {
        valid = 0;
    }

    bool ValidateCmd(const char* buf, const int bufLen)
    {
        if (bufLen > 0)
        {
            int toCopy = (valid + bufLen) > RCVBUFLEN*2*16 ? RCVBUFLEN*2*16 - valid : bufLen;
            memcpy(buffer+valid, buf, toCopy);
            valid += toCopy;
        }
        if (valid > 1)
        {
            for (int i=0; i<valid-1; ++i)
            {
                if (buffer[i] == 0x66 && buffer[i+1] == 0x77)
                {
                    if (i>0)
                    {
                        memcpy(buffer, buffer+i, valid-i);
                    }
                    valid -= i;
                    break;
                }
            }
        }
        if ((buffer[0] != 0x66 || buffer[1] != 0x77))
        {
            valid = 0;
        }

        return valid >= RCVBUFLEN && buffer[IDPOS] >= 0 && buffer[IDPOS] <= 15;
    }

    void getItem(GasInfoItem &item)
    {
        item.ch = buffer[IDPOS];
        QGasInfo h2s(0.05703125f);
        QGasInfo so2(0.07564296520423600605143721633888f);
        QGasInfo fel(0.038124285169653069004956157072055f, 0x05c0);

        item.h2s = h2s.Deduce(buffer[11]*256 + buffer[12]);
        item.so2 = so2.Deduce(buffer[9]*256 + buffer[10]);
        item.fel = fel.Deduce(buffer[13]*256 + buffer[14]);

        for (int i=15; i<33; ++i)
        {
            if (buffer[i] > 9)
                buffer[i] = 0;
        }
        QString str;
        float t = 0.0f;

//        t = buffer[15]*1e3 + buffer[16]*1e2 + buffer[17]*1e1 + buffer[18]*1 +
//                ((buffer[19]*10+buffer[20])/60.0f) + ((buffer[21]*10+buffer[22])/3600.0f);
        unsigned char* tmp = &buffer[15];

        t = tmp[0]*10 + tmp[1]
                + (float(tmp[2]*10 + tmp[3])
                + (float(tmp[4]*1e3 + tmp[5]*1e2 + tmp[6]*1e1 + tmp[7]))/10000.0f)/60.0f;
        item.latitude = QString("%1").arg(t, 0, 'f', 4);

//        t = buffer[24]*1e4 + buffer[25]*1e3 + buffer[26]*1e2 + buffer[27]*1e1 + buffer[28]*1 +
//                (float(buffer[29]*10+buffer[30]))/60.0f + (float(buffer[31]*10+buffer[32]))/3600.0f;
        tmp = &buffer[24];
        t = tmp[0]*1e2 + tmp[1]*1e1 + tmp[2]
                + (float(tmp[3]*10 + tmp[4])
                + (float(tmp[5]*1e3 + tmp[6]*1e2 + tmp[7]*1e1 + tmp[8]))/10000.0f)/60.0f;
        item.longitude = QString("%1").arg(t, 0, 'f', 4);

        memcpy(buffer, buffer+RCVBUFLEN, RCVBUFLEN);
        valid -= RCVBUFLEN;
    }
};

class MainDialog : public QDialog
{
    Q_OBJECT

public:
    explicit MainDialog(QWidget *parent = 0);
    ~MainDialog();

protected:
//    void changeEvent(QEvent *e);

private Q_SLOTS:
    void on_pushButtonOpenclicked();
    void on_pushButtonChangeSettingsclicked();
    void on_pushButtonOpenGps_clicked();
    void onReadyRead();
    void sendCmd();
    void setData();

private:
    void reloadSettings();

private:
    Ui::Dialog *ui;
    QTimer *timer;
    QTimer *timerCmd;
    QextSerialPort *port;
    PortSettings settings;
    SerialPortInfo portInfo;

    QextSerialPort *gpsPort;

    QString rawGps;
    QString settingsFileName;

    int queryId;
    SerialRcvBuffer rcvBuffer;

    QList<GpsInfo> gpsInfoList;
};

#endif // DIALOG_H
