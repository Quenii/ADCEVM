#pragma once

#include <vector>

#include <AdcBoardTypes.hpp>

void calc_dynam_params(std::vector<float> samples, int bitCount, FreqDomainReport& param);