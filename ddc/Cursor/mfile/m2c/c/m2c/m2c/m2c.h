// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the M2C_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// M2C_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef M2C_EXPORTS
#define M2C_API __declspec(dllexport)
#else
#define M2C_API __declspec(dllimport)
#endif



M2C_API void C_AlgDynTest(double* data1, double* data2, int numpt, double fclk, int numbit,
						double& SNR__o, double& SINAD__o, double& SFDR__o, double& ENOB__o);