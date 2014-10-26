#ifndef __AlgDynTest1k_h
#define __AlgDynTest1k_h

Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o);
Mm AlgDynTest1k(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o, Mm& Spectrum__o);

#endif // __AlgDynTest1k_h
