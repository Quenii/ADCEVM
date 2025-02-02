#include "AdcBoardTypes.hpp"
#include <algorithm>
using namespace std;

#ifdef MATLAB 

#include "libalgo_wrapper.h"
#include "libalgo.h"

void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param)
{
	mwArray mwSamples(1, samples.size(), mxDOUBLE_CLASS);
	mwSamples.SetData(&samples[0], samples.size());
	mwArray mwBitCount(1, 1, mxDOUBLE_CLASS);
	mwBitCount.SetData(&bitCount, 1);

	mwArray A;
	mwArray AdB;
	mwArray SINAD;
	mwArray SNR;
	mwArray THD;
	mwArray SFDR;
	mwArray ENOB;
	mwArray HD;
	mwArray Spectrum;

	calc_dynam_params(9,
		A, AdB, SINAD, 
		SNR, THD, SFDR, 
		ENOB, HD, Spectrum,
		mwSamples,
		mwBitCount);	

	if (param.Spectrum.size() != Spectrum.NumberOfElements())
	{
		param.Spectrum.resize(Spectrum.NumberOfElements());
	}
	Spectrum.GetData(&param.Spectrum[0], param.Spectrum.size());

	if (param.HD.size() != HD.NumberOfElements())
	{
		param.HD.resize(HD.NumberOfElements());
	}
	HD.GetData(&param.HD[0], param.HD.size());

	A.GetData(&param.A, 1);
	AdB.GetData(&param.AdB, 1);
	SINAD.GetData(&param.SINAD, 1);
	SNR.GetData(&param.SNR, 1);
	THD.GetData(&param.THD, 1);
	SFDR.GetData(&param.SFDR, 1);
	ENOB.GetData(&param.ENOB, 1);
}

#endif // MATLAB

#ifdef MATCOM

#include "./3rdparty/m2c/c/include/m2c.h"

void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
					   float vpp, int tone_code, double fin_input, int dc, int spur, int signal)
{
	const int hd_len = 10;
	const int disturb_len = 19;
	const int NFFT = 64 * 1024;
	static std::vector<double> input(samples.size());
	static std::vector<double> cADout_dB(input.size()/2);
	static std::vector<double> cHD(hd_len);
	static std::vector<double> cHarbin(disturb_len);
	static std::vector<double> cHarbin_disturb(disturb_len);

	for (int i = 0; i < samples.size(); ++i)
	{
		input[i] = samples[i];
	}

	double cfreq_fin; 
	double cVin; 
	double cVpp; 		
	double cSNR; 
	double cSFDR; 
	double cSINAD; 
	double cTHD; 
	double cPn_dB; 
	int cdisturb_len; 
	double cref_dB;

	AdcDynTest64k(&input[0], fclk, bitCount, vpp, tone_code, fin_input, dc, spur, signal, 
		cfreq_fin, cVin, cVpp, cSNR, cSFDR, cSINAD, cTHD, cPn_dB, cdisturb_len, cref_dB,
		&cADout_dB[0], &cHD[0], &cHarbin[0], &cHarbin_disturb[0]);

	double * harbin = &cHarbin[0];
	double * harbin_dstb = &cHarbin_disturb[0];
	if (param.Spectrum.size() != cADout_dB.size())
	{
		param.Spectrum.resize(cADout_dB.size());
	}
	for (int i = 0; i < param.Spectrum.size(); ++i)
	{
		param.Spectrum[i] = cADout_dB[i];
	}
	param.dualTone = false;
	param.DynamicPara[0].value = cfreq_fin / 1e6;
	param.DynamicPara[1].value = cVin;
	param.DynamicPara[2].value = cVpp;
	param.DynamicPara[3].value = cSNR;
	param.DynamicPara[4].value = cSNR - cVin;
	param.DynamicPara[5].value = cSFDR;
	param.DynamicPara[6].value = cSFDR - cVin;
	param.DynamicPara[7].value = (cSINAD - 1.76) / 6.02;
	param.DynamicPara[8].value = (cSINAD - cVin - 1.76) / 6.02;
	param.DynamicPara[9].value = cPn_dB;
	param.DynamicPara[10].value = cSINAD;
	param.DynamicPara[11].value = cTHD;

	for (int i=0; i<cHD.size()-1; ++i)
	{
		param.DynamicPara[12+i].value 
			= cHD[i+1];
	}

	if (param.markers.size()<22)
	{
		param.markers.resize(22);
	}
	param.markers[0] = 0;  //identify dynamic or dualtone;
	param.markers[21] = cPn_dB; //noise floor
	for (int i=0; i<10; ++i)
	{
		param.markers[i+1] = cHarbin[i] - 1;
		param.markers[i+11] = cHarbin_disturb[cdisturb_len-i-1] - 1;
	}
}

void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
					   float vpp, int tone_code, double fin1, double fin2, int dc, int spur, int signal)
{
	const int NFFT = 64 * 1024;
	static std::vector<double> input(NFFT);
	static std::vector<double> cADout_dB(input.size()/2);
	static std::vector<double> cmarker(13);
	for (int i = 0; i < min(samples.size(), input.size()); ++i)
	{
		input[i] = samples[i];
	}
	double cFo1;
	double cF1_dBFS;
	double cFo2;
	double cF2_dBFS;
	double cSFDR;
	double cSFDR_dBFS;
	double cIMD2_Worst;
	double cIMD2_w_dBFS;
	double cIMD3_Worst;
	double cIMD3_w_dBFS;

	DualToneTest64k(&input[0], fclk, bitCount, vpp, tone_code, fin1, fin2, dc, spur, signal, \
		&cADout_dB[0], &cmarker[0], cFo1, cF1_dBFS, cFo2, cF2_dBFS, cSFDR, cSFDR_dBFS, cIMD2_Worst, cIMD2_w_dBFS, \
		cIMD3_Worst, cIMD3_w_dBFS); 

	if (param.Spectrum.size() != cADout_dB.size())
	{
		param.Spectrum.resize(cADout_dB.size());
	}
	for (int i = 0; i < param.Spectrum.size(); ++i)
	{
		param.Spectrum[i] = cADout_dB[i];
	}
	
	param.DualTonePara[0].value = cFo1 / 1e6;
	param.DualTonePara[1].value = cF1_dBFS;
	param.DualTonePara[2].value = cFo2 / 1e6;
	param.DualTonePara[3].value = cF2_dBFS;
	param.DualTonePara[4].value = cSFDR;
	param.DualTonePara[5].value = cSFDR_dBFS;
	param.DualTonePara[6].value = cIMD2_Worst;
	param.DualTonePara[7].value = cIMD2_w_dBFS;
	param.DualTonePara[8].value = cIMD3_Worst;
	param.DualTonePara[9].value = cIMD3_w_dBFS;

	if (param.markers.size()<22)
	{
		param.markers.resize(22);
	}
	param.markers[0] = 1;  //identify dynamic(0) or dualtone;
	for (int i=0; i<cmarker.size(); ++i)
	{
		param.markers[i+1] = cmarker[i] - 1;
	}

}

#endif