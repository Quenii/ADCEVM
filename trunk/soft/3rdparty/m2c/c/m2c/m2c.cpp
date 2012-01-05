// m2c.cpp : Defines the entry point for the DLL application.
//
#include "m2c.h"
#include "matlib.h"
#include "AlgDynTest.h"
#include "AdcDynTest.h"
#include "myfft.h"
#include "myfft_complex.h"
#include "inldnl.h"
#include "DualToneTest64k.h"

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

void DualToneTest64k(double* cADout, double cfclk, int cnumbit, int cNFFT, double cV, \
			double cTPY, double cTPX, int ccode, int ctone_code, double cf1, double cf2, \
			double *cADout_dB, double& cFo1, double& cF1_dBFS, double& cFo2, double& cF2_dBFS, \
			double& cSFDR, double& cSFDR_dBFS, double& cIMD2_Worst, double& cIMD2_w_dBFS, \
			double& cIMD3_Worst, double& cIMD3_w_dBFS) 
{
	SingleLock lock(&cs);

	DECLEAR_Mm_MORE(ADout, cADout, cNFFT); 
	DECLEAR_Mm_ONE(fclk, cfclk); 
	DECLEAR_Mm_ONE(numbit, cnumbit); 
	DECLEAR_Mm_ONE(NFFT, cNFFT); 
	DECLEAR_Mm_ONE(V, cV); 
	DECLEAR_Mm_ONE(TPY, cTPY); 
	DECLEAR_Mm_ONE(TPX, cTPX); 
	DECLEAR_Mm_ONE(code, ccode); 
	DECLEAR_Mm_ONE(tone_code, ctone_code); 
	DECLEAR_Mm_ONE(f1, cf1); 
	DECLEAR_Mm_ONE(f2, cf2);  

	Mm Fo1;
	Mm F1_dBFS;
	Mm Fo2;
	Mm F2_dBFS;
	Mm SFDR;
	Mm SFDR_dBFS;
	Mm IMD2_Worst;
	Mm IMD2_w_dBFS;
	Mm IMD3_Worst;
	Mm IMD3_w_dBFS;
	Mm ADout_dB;

	DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, f1, f2, i_o,
					 ADout_dB, Fo1, F1_dBFS, Fo2, F2_dBFS, SFDR, SFDR_dBFS, IMD2_Worst, IMD2_w_dBFS, IMD3_Worst, IMD3_w_dBFS);

	cFo1 = Fo1.r(1, 1);
	cF1_dBFS = F1_dBFS.r(1, 1);
	cFo2 = Fo2.r(1, 1);
	cF2_dBFS = F2_dBFS.r(1, 1);
	cSFDR = SFDR.r(1, 1);
	cSFDR_dBFS = SFDR_dBFS.r(1, 1);
	cIMD2_Worst = IMD2_Worst.r(1, 1);
	cIMD2_w_dBFS = IMD2_w_dBFS.r(1, 1);
	cIMD3_Worst = IMD3_Worst.r(1, 1);
	cIMD3_w_dBFS = IMD3_w_dBFS.r(1, 1);
	memcpy(cADout_dB, ADout_dB.addr(), cNFFT * sizeof(*cADout_dB));
}
Mm AdcDynTest64k(double* ADout, double fclk, int numbit, double V, double TPY, double TPX, int tone_code, double fin_input, \
				 double& cSNR, double& cSFDR, double& SNR_dBFS__o, double& SINAD__o, double& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm&  \
				 ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o) 
{
Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input,


Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm&  ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o
	
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o, Mm& SNR__o, \
		Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm&  \
		ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o) 

}