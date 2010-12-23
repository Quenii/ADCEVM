
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the M2C_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// M2C_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef M2C_EXPORTS
#define M2C_API __declspec(dllexport)
#else
#define M2C_API __declspec(dllimport)
#endif

// This class is exported from the m2c.dll
class M2C_API CM2c {
public:
	CM2c(void);
	// TODO: add your methods here.
};

extern M2C_API int nM2c;

M2C_API int fnM2c(void);

