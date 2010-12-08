#ifndef __calc_dynam_params_h
#define __calc_dynam_params_h

Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o, Mm& THD__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o);
Mm calc_dynam_params(Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o);

#endif // __calc_dynam_params_h
