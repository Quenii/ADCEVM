#include "AdcBoardTypes.hpp"

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
					   float vpp, double TPX, double TPY, int tone_code, double fin_input)
{
	const int disturb_len = 10;
	static std::vector<double> input(samples.size());
	static std::vector<double> cADout_dB(input.size()/2);
	static std::vector<double> cHD(disturb_len);
	static std::vector<double> cHarbin(disturb_len);
	static std::vector<double> cFn_disturb(disturb_len);
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

	AdcDynTest64k(&input[0], fclk, bitCount, vpp, TPY, TPX, tone_code, fin_input, 
		cfreq_fin, cVin, cVpp, cSNR, cSFDR, cSINAD, cTHD, cPn_dB, cdisturb_len, cref_dB,
		&cADout_dB[0], &cHD[0], &cHarbin[0], &cFn_disturb[0], &cHarbin_disturb[0]);


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

	for (int i=0; i<cHD.size()-1; ++i)
	{
		param.DynamicPara[10+i].value 
			= cHD[i+1];
	}
}

#endif