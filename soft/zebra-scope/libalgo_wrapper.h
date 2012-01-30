#pragma once

#include <vector>

#include <AdcBoardTypes.hpp>

#ifdef MATLAB
void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param);
#endif


#ifdef MATCOM
void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
							float vpp, double TPX, double TPY, int tone_code, double fin_input);
void calc_dynam_params(std::vector<float> samples, double fclk, int bitCount, FreqDomainReport& param, 
					   float vpp, int tone_code, double fin1, double fin2);

#endif