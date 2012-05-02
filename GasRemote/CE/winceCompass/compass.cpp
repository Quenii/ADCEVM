#include "compass.h"


// 5 + 2 + 3 + 1
#define MSGLEN 11
Compass::Compass()
: rfPower(0),
: hostID(0)
{
	buffer.RemoveAll();
}

Compass * Compass::instance(QextSerialPort* term)
{
    static Compass _instance;
    if (term != NULL)
        _instance.term = term;
    return &_instance;
}
bool Compass::getMessage(CByteArray& msg, const QByteArray& hdr)
{
    int len = MSGLEN;

    if (term->bytesAvailable()) {
        buffer += term->readAll();
        qDebug() << QString("buffer Length after reading %1").arg(buffer.size());
    }

    if(buffer.size() > MSGLEN)
    {
        int j = 0;
        if ((j = buffer.indexOf('$', j)) >= 0) {
            buffer = buffer.mid(j);
        }else{
            buffer.clear();
            return false;
        }

        j = buffer.indexOf(hdr);
        if (j >= 0 && (buffer.size()-j) > 7)   //long enough to have length info
        {
            len = buffer[j+5]*256 + buffer[j+6];
            if ((buffer.size()-j) >= len) //complete msg
            {
                msg = buffer.mid(j, len);
                buffer = buffer.left(j) + buffer.right(buffer.size()-j-len);
                qDebug() << QString("Got Message at length %1, msg = %2").arg(len).arg(QString(msg));
                return true;
            }
        }
    }
    if (buffer.size() > 16384)
        buffer.clear();
    return false;
}

bool Compass::getLocation()
{
    COMPASSCMD cmd;
    cmd.cmdword = "$DWSQ";
    cmd.params[0] = 0x04;
    for(int i=0; i<10; ++i)
    {
        cmd.params[i+1] = 0;
    }
    sendCommand(cmd);
    return true;
}

bool Compass::getID(uint& id)
{
    COMPASSCMD cmd;
    cmd.cmdword = "$ICJC";
    cmd.params[0] = 0;
    sendCommand(cmd);
    sleep(1);
    QByteArray msg;
    if (getMessage(msg, QByteArray("$ICXX")))
    {
        unsigned char *t = (unsigned char *)&id;
        for(int i=0; i<3; ++i)
        {
            t[2-i] = msg[i+7];
        }
        hostID = id;
        qDebug() << QString("HostID: %1").arg(hostID);
        return true;
    }
    return false;
}

void Compass::sendCommand(COMPASSCMD &cmd)
{
    cmd.addr = hostID;
    cmd.len = cmd.params.size() + MSGLEN;
    QByteArray buf;
    buf = cmd.cmdword;

    buf[5] = cmd.len >> 8;
    buf[6] = cmd.len % 255;

    for(int i=0; i<3; ++i)
    {
        buf[i+7] = cmd.addr >> (2-i)*8;
        unsigned char u = buf[buf.size()-1];
    }

    buf.append(cmd.params);

    unsigned char parity = 0;
    for(int i=0; i<buf.size(); ++i)
    {
        parity = parity ^ buf[i];
    }
    buf[buf.size()] = parity;

    term->write(buf);
    qDebug() << QString("Sending Cmd: %1, length: %2").arg(QString(buf)).arg(buf.size());

}

int Compass::getRFPower()
{
    COMPASSCMD cmd;
    cmd.cmdword = "$GLJC";
    cmd.params[0] = 0;
    sendCommand(cmd);

    QByteArray msg;
    if (getMessage(msg, QByteArray("$GLZK")))
    {
        unsigned char sum = 0;
        for(int i=0; i<rfPower.size(); ++i)
        {
            rfPower[i] = msg[i+10];
            unsigned char u = rfPower[i];
            sum += rfPower[i];
            qDebug() << QString("Power of Beam %1 = %2").arg(i).arg(u);
        }
        if (sum > 4)
            return 1;
        else
            return 0;
    }
    return -1;

}

bool Compass::sendMessage(const uint &adr, QByteArray& msg)
{
    COMPASSCMD cmd;
    cmd.cmdword = "$TXSQ";
    cmd.params[0] = 0x46; //
    cmd.params[cmd.params.size()] = (adr >> 16) & 0xFF;
    cmd.params[cmd.params.size()] = (adr >> 8) & 0xFF;
    cmd.params[cmd.params.size()] = (adr >> 0) & 0xFF;
    cmd.params[cmd.params.size()] = msg.size() * 8 / 256;
    cmd.params[cmd.params.size()] = msg.size() * 8 % 256;
    cmd.params[cmd.params.size()] = 0; //answer or not
    cmd.params.append(msg);

    sendCommand(cmd);
    return true;

}
