#pragma once 

#include "m2c.h"

M2C_API Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r);
M2C_API Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o);
M2C_API Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o);
M2C_API Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o);

