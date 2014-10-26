#pragma once

#include <vector>

#include <AdcBoardTypes.hpp>

#ifdef MATLAB
void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param);
#endif


#ifdef MATCOM
void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
					   float vpp, int tone_code);
void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
					   float vpp, int tone_code, double fin1, double fin2, int dc, int spur, int signal);
void calc_dynam_params_iq(TimeDomainReport& tdReport, FreqDomainReport& fdReport, int points, double fclk, int bitCnt, int r);
void calc_dynam_params_iq(TimeDomainReport& tdReport, FreqDomainReport& fdReport, int points, double fclk, int bitCnt, double vpp, int r);
#endif