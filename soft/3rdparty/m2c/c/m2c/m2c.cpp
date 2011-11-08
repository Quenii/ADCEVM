// m2c.cpp : Defines the entry point for the DLL application.
//
#include "m2c.h"
#include "matlib.h"
#include "AlgDynTest.h"
#include "AdcDynTest.h"
#include "myfft.h"
#include "myfft_complex.h"
#include "inldnl.h"

#include <Windows.h>

class CriticalSection
{
public:
	CriticalSection()
	{
		InitializeCriticalSection(&cs);

	}
	virtual ~CriticalSection()
	{
		DeleteCriticalSection(&cs);
	}

	void Lock()
	{
		EnterCriticalSection(&cs);
	}

	void Unlock()
	{
		LeaveCriticalSection(&cs);
	}

private:
	CRITICAL_SECTION cs;
};

class SingleLock
{
public:
	SingleLock(CriticalSection* cs)
	{
		m_cs = cs;
		m_cs->Lock();
	}
virtual ~SingleLock()
	{
		m_cs->Unlock();
	}

private:
	CriticalSection* m_cs;
};


static CriticalSection cs;

#define DECLEAR_Mm_MORE(v, d, cnt) \
	Mm v; v = zeros(cnt, 1); memcpy(v.addr(), d, cnt * sizeof(*d)) 

#define DECLEAR_Mm_ONE(v, d) \
	Mm v; v = zeros(1, 1); v.r(1, 1) = d

void AlgDynTest(double* cdata1, int cdata1_cnt,
						double* cdata2, int cdata2_cnt,
						double cnumpt, double cfclk, double cnumbit, double cr,
						double& cSNR__o, double& cSINAD__o, double& cSFDR__o, double& cENOB__o,
						double* cy)
{
	SingleLock lock(&cs);
	
	DECLEAR_Mm_MORE(data1, cdata1, cdata1_cnt);
	DECLEAR_Mm_MORE(data2, cdata2, cdata2_cnt);
	DECLEAR_Mm_ONE(numpt, cnumpt);	
	DECLEAR_Mm_ONE(fclk,cfclk);
	DECLEAR_Mm_ONE(numbit, cnumbit); 
	DECLEAR_Mm_ONE(r, cr);

	Mm SNR__o; 
	Mm SINAD__o;
	Mm SFDR__o; 
	Mm ENOB__o;
	Mm y__o;

//	double peek[] = {data1.r(1, 1), data1.r(2, 1), data1.r(32767, 1)};

	AlgDynTest(data1, data2, numpt, fclk, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o,  ENOB__o, y__o);

	cSNR__o = SNR__o.r(1, 1); 
	cSINAD__o = SINAD__o.r(1, 1);
	cSFDR__o = SFDR__o.r(1, 1); 
	cENOB__o = ENOB__o.r(1, 1);
	memcpy(cy, y__o.addr(), cdata1_cnt * sizeof(*cy));
}

void AdcDynTest(double* cdata, int cdata_cnt, double cfclk, double cnumbit, double cNFFT, double cV, double ccode,
				double& cSNR__o, double& cSINAD__o, double& cSFDR__o, double& cENOB__o,
				double* cHD, double* cy, double& cVpp__o, double& cVin__o, double& cTHD__o)
{
	SingleLock lock(&cs);
	
	DECLEAR_Mm_MORE(ADout, cdata, cdata_cnt);
	DECLEAR_Mm_ONE(fclk, cfclk);	
	DECLEAR_Mm_ONE(numbit, cnumbit);
	DECLEAR_Mm_ONE(NFFT, cNFFT);
	DECLEAR_Mm_ONE(V, cV);
	DECLEAR_Mm_ONE(code, ccode);
	Mm SNR__o; 
	Mm SINAD__o;
	Mm SFDR__o; 
	Mm ENOB__o;
	Mm HD__o;
	Mm y__o;
	Mm Vpp__o;
	Mm Vin__o;
	Mm THD__o;
	
	AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, y__o, Vpp__o, Vin__o, THD__o);

	cSNR__o = SNR__o.r(1, 1); 
	cSINAD__o = SINAD__o.r(1, 1);
	cSFDR__o = SFDR__o.r(1, 1); 
	cENOB__o = ENOB__o.r(1, 1);
	cVpp__o = Vpp__o.r(1, 1);
	cVin__o = Vin__o.r(1, 1);
	cTHD__o = THD__o.r(1, 1);

	memcpy(cy, y__o.addr(), cdata_cnt * sizeof(*cy));
	memcpy(cHD, HD__o.addr(), 10 * sizeof(*cHD));

}

void FFT(double* data, int data_cnt, double* result, int result_cnt)
{
	SingleLock lock(&cs);
	
	DECLEAR_Mm_MORE(x, data, data_cnt);
	DECLEAR_Mm_ONE(n, data_cnt);		
	Mm ret = myfft(x, n);
	memcpy(result, ret.addr(), result_cnt * sizeof(*result));

}

void FFT_complex(double* r_data, double* i_data, int data_cnt, double* result, int result_cnt)
{
	SingleLock lock(&cs);
	
	DECLEAR_Mm_MORE(r, r_data, data_cnt);
	DECLEAR_Mm_MORE(i, i_data, data_cnt);
	DECLEAR_Mm_ONE(n, data_cnt);		
	Mm ret = myfft_complex(r, i, n);
	memcpy(result, ret.addr(), result_cnt * sizeof(*result));
}


void inldnl(double* csamples, int cnumbit, int cnumpt, double cT1, double cT2, 
            double cT_ideal_1, double cT_ideal_2, double* cINLar__o, double* cDNLar__o,
            double* cH__o, int& cindexl__o, int& cindexh__o) 
{
	SingleLock lock(&cs);

    DECLEAR_Mm_MORE(samples, csamples, cnumpt);
    DECLEAR_Mm_ONE(numbit, cnumbit);
	DECLEAR_Mm_ONE(numpt, cnumpt); 
	DECLEAR_Mm_ONE(T1, cT1); 
	DECLEAR_Mm_ONE(T2, cT2); 
	DECLEAR_Mm_ONE(T_ideal_1, cT_ideal_1); 
	DECLEAR_Mm_ONE(T_ideal_2, cT_ideal_2);

    Mm INLar__o;
    Mm DNLar__o;
    Mm H__o;
    Mm indexl__o;
    Mm indexh__o;

    inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2, i_o, 
           INLar__o, DNLar__o, H__o, indexl__o, indexh__o);

    cindexl__o = indexl__o.r(1, 1);
    cindexh__o = indexh__o.r(1, 1);
    memcpy(cH__o, H__o.addr(), (1<<cnumbit)*sizeof(*cH__o));
    memcpy(cINLar__o, INLar__o.addr(), ((1<<cnumbit)-1)*sizeof(*cH__o));
    memcpy(cDNLar__o, DNLar__o.addr(), ((1<<cnumbit)-2)*sizeof(*cH__o));
}
