// test.cpp : Defines the entry point for the console application.
//

#include <stdio.h>
#include <tchar.h>
#include <vector>
#include "cmath"
#include "m2c.h"

using namespace std;

#pragma comment(lib, "m2c.lib")

int _tmain(int argc, _TCHAR* argv[])
{
	const double pi = 3.1415926L;
	vector<double> buff(32768);
	vector<double> buff2(32768);
	
	for (int i=0; i<buff.size(); ++i)
	{
		buff[i] = sin(2*pi*i*2150000/80000000) * (1<<12);
		buff2[i] = sin((2+1)*pi*i*2150000/80000000) * (1<<12);

	}
	double cnumpt = buff.size(), cfclk = 8e6, cnumbit = 12, cr = 20;
	double cSNR__o, cSINAD__o, cENOB__o, cSFDR__o, SNRFS__o;

	while (1)
	{
		//FFT(&buff[0], buff.size(), &buff2[0], buff2.size());
		//FFT_complex(&buff[0], &buff[0], buff.size(), &buff2[0], buff2.size());
		


		AlgDynTest(&buff[0], buff.size(), &buff[0], buff.size(),
			cnumpt, cfclk, cnumbit, cr,
			cSNR__o, cSINAD__o, cSFDR__o, cENOB__o, &buff2[0]);

		AdcDynTest(&buff[0], buff.size(), cfclk, cnumbit, buff.size(), 2, 1,
			cSNR__o, cSFDR__o, SNRFS__o, cSINAD__o, &buff2[0]);
		

	}

	return 0;
}

