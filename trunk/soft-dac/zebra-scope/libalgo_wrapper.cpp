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

void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param, float vpp)
{
	//mwArray mwSamples(1, samples.size(), mxDOUBLE_CLASS);
	//mwSamples.SetData(&samples[0], samples.size());
	//mwArray mwBitCount(1, 1, mxDOUBLE_CLASS);
	//mwBitCount.SetData(&bitCount, 1);

	static std::vector<double> input(samples.size());
	static std::vector<double> HD(10);
	static std::vector<double> Spectrum(input.size());


	double A;
	double AdB;
	double SINAD;
	double SNR;
	double THD;
	double SFDR;
	double ENOB;

	for (int i = 0; i < samples.size(); ++i)
	{
		input[i] = samples[i];
	}

	//AdcDynTest(double* cdata, int cdata_cnt, double cfclk, double cnumbit, double cNFFT, double cV, double ccode,
	//	double& cSNR__o, double& cSINAD__o, double& cSFDR__o, double& cENOB__o,
	//	double* cHD, double* cy);
	AdcDynTest(&input[0], input.size(), 80e6, bitCount, input.size(), 2*vpp, 1,
		SNR, SINAD, SFDR, ENOB, 
		&HD[0], &Spectrum[0], A, AdB, THD);

	if (param.Spectrum.size() != Spectrum.size())
	{
		param.Spectrum.resize(Spectrum.size());
	}
	for (int i = 0; i < Spectrum.size(); ++i)
	{
		param.Spectrum[i] = Spectrum[i];
	}

	if (param.HD.size() != HD.size())
	{
		param.HD.resize(HD.size());
	}
	for (int i = 0; i < HD.size(); ++i)
	{
		param.HD[i] = HD[i];
	}

	param.ENOB = ENOB;
	param.SNR = SNR;
	param.SINAD = SINAD;
	param.SFDR = SFDR;
	param.A = A;
	param.AdB = AdB;
	param.THD = THD;

}

#endif