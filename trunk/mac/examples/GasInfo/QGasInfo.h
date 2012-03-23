#pragma once

class QGasInfo
{
public:
	QGasInfo(float k, int min = 0x0840);
public:
	~QGasInfo(void);
     float Deduce(int raw, float delta = 0);
private:
	float k;
        int min;
        const static int max = 0x0ffe;
};
