#ifndef __AdcDynTest64k_h
#define __AdcDynTest64k_h

Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNR_dBFS__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o);

#endif // __AdcDynTest64k_h
