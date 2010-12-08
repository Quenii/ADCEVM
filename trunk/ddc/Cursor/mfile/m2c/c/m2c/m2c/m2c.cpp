// m2c.cpp : Defines the entry point for the DLL application.
//

#include "m2c.h"
#include "matlib.h"
#include "AlgDynTest.h"

#pragma comment(lib, "v4501v.lib")

void C_AlgDynTest(double* data1, double* data2, int numpt, double fclk, int numbit,
						double& SNR__o, double& SINAD__o, double& SFDR__o, double& ENOB__o)
{
	Mm data1_m = zeros(1, numpt); memcpy(data1_m.addr(), data1, numpt * sizeof(double));
	Mm data2_m = zeros(1, numpt); memcpy(data2_m.addr(), data2, numpt * sizeof(double));
	Mm numpt_m = numpt;
	Mm fclk_m = fclk;
	Mm numbit_m = numpt; 

	Mm SNR__o_m; Mm SINAD__o_m; Mm SFDR__o_m; Mm ENOB__o_m;

	AlgDynTest( data1_m,  data2_m,  numpt_m,  fclk_m,  numbit_m,
				i_o, 
				SNR__o_m,  SINAD__o_m,  SFDR__o_m, ENOB__o_m);

	SNR__o = SNR__o_m.r(1, 1);
	SINAD__o = SINAD__o_m.r(1, 1);
	SFDR__o = SFDR__o_m.r(1, 1);
	ENOB__o = ENOB__o_m.r(1, 1);	
}