#ifndef __AlgDynTestv3_h
#define __AlgDynTestv3_h

Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o);
Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o, Mm& Spectrum__o);

#endif // __AlgDynTestv3_h
