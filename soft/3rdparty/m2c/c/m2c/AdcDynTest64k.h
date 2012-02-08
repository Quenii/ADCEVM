#ifndef __AdcDynTest64k_h
#define __AdcDynTest64k_h

Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o);
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm tone_code, Mm fin_input, Mm span_dc, Mm spanh_har, Mm span_s, i_o_t, Mm& freq_fin__o, Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o);

#endif // __AdcDynTest64k_h
