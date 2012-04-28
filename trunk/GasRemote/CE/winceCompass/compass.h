#ifndef COMPASS_H
#define COMPASS_H

struct COMPASSCMD
{
    CByteArray cmdword;
    unsigned short len;
    unsigned int addr;
    CByteArray params;
    unsigned char cksum;
};

class Compass
{
private:
    Compass();
public:
    static Compass *instance(QextSerialPort *term);
    bool getMessage(CByteArray& msg, const CByteArray &hdr);
    bool getLocation();
    bool getSensorData();
    bool getID(unsigned int& id);
    int getRFPower();
    bool sendMessage(const unsigned int &adr, CByteArray& msg);

    void sendCommand(COMPASSCMD& cmd);

private:
    CByteArray buffer;
    unsigned int rfPower;
    unsigned int hostID;
};

#endif // COMPASS_H
