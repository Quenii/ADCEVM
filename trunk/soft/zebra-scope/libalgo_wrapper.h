#pragma once

#include <vector>

#include <AdcBoardTypes.hpp>

#ifdef MATLAB
void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param);
#endif


#ifdef MATCOM
void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param, float vpp);

#endif