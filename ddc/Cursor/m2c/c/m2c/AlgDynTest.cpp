  #include "matlib.h"
  #pragma hdrstop
  
  #include "AlgDynTest.h"
  #include "chebwin.h"
  
  
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, \
     Mm& ENOB__o) {
    begin_scope
    data1.setname("data1"); data2.setname("data2"); numpt.setname("numpt"); fclk.setname("fclk"); numbit.setname( \
      "numbit"); r.setname("r"); 
    dMm(SNR); dMm(SINAD); dMm(SFDR); dMm(ENOB); dMm(all_); dMm(fpga_i); dMm(fpga_q); dMm(V); dMm(NFFT); dMm(TPY);  \
      dMm(TPX); dMm(code); dMm(fpga_len); dMm(ADout); dMm(ad_len_N); dMm(maxADout); dMm(real_ADout); dMm(AmpMax); dMm( \
      t1); dMm(AmpMin); dMm(t2); dMm(Vpp); dMm(ADout_w); dMm(ad_len); dMm(ADout_spect); dMm(abs_ADout_spect); dMm(ADout_dB) \
      ; dMm(maxdB_1); dMm(maxdB_2); dMm(maxdB); dMm(fin); dMm(fin_1); dMm(fin_lsb); dMm(freq_fin); dMm(data_ref_iq) \
      ; dMm(n); dMm(n_AlgDynTest_v0); dMm(fin_angle); dMm(data_ref_w); dMm(data_ref_spect); dMm(data_ref_dB); dMm(ref_dB) \
      ; dMm(BW); dMm(BW_len); dMm(X_FREQ); dMm(X_FREQ1); dMm(span); dMm(spanh_har); dMm(span_s); dMm(spectP); dMm(Pdc) \
      ; dMm(Pdc_dB); dMm(Ps); dMm(Ps_dB); dMm(Fh); dMm(Ph); dMm(Ph_1); dMm(Harbin); dMm(Harbin_1); dMm(Ph_dB); dMm( \
      Ph_dB_1); dMm(har_num); dMm(har_num_AlgDynTest_v1); dMm(tone); dMm(l); dMm(u); dMm(har_peak); dMm(har_bin); dMm( \
      har_peak_1); dMm(har_bin_1); dMm(spectP_temp); dMm(i_); dMm(i_AlgDynTest_v2); dMm(disturb_len); dMm(spectP_disturb) \
      ; dMm(Harbin_disturb); dMm(findSpac); dMm(findSpan); dMm(findStart); dMm(i_AlgDynTest_v3); dMm(spectP_disturb_peak) \
      ; dMm(num); dMm(array_flag); dMm(jj); dMm(jj_AlgDynTest_v4); dMm(k); dMm(k_AlgDynTest_v5); dMm(spectP_disturb_temp) \
      ; dMm(Harbin_disturb_temp); dMm(Ph_disturb); dMm(Ph_disturb_dB); dMm(Fn_disturb); dMm(i_AlgDynTest_v6); dMm(Pd_disturb) \
      ; dMm(Pd_disturb_dB); dMm(Pd); dMm(Pd_dB); dMm(Pd_dB_1); dMm(Pd_dB_2); dMm(Pn); dMm(Pn_dB); dMm(Vin); dMm(THD) \
      ; dMm(HD); dMm(SNRFS); dMm(ENOBFS); 
    
    #line 1 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    call_stack_begin;
    #line 1 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=6.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=4.0;
    nargout_set=0;
    
    // translated code
    
    #line 2 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   clear((CL(all_)));
    #line 3 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   figure_close(TM("all"));
    #line 4 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   format(TM("long"));
    
    #line 6 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fpga_i = data1/mpower(2.0,(numbit-1.0));
    #line 7 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fpga_q = data2/mpower(2.0,(numbit-1.0));
    
    #line 9 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // fclk = 80e6;
    #line 10 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // r=20;
    #line 11 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // numbit = 16;
    
    #line 13 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   V = 2.0;
    #line 14 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   NFFT = min(32768.0,length(data1));
    #line 15 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   NFFT = floor(NFFT/2.0)*2.0;
    #line 16 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   TPY = 1.0;
    #line 17 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   TPX = 0.2;
    #line 18 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   code = 1.0;
    #line 19 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fclk = fclk/r;
    
    
    #line 22 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fpga_len = length(fpga_i);
    
    #line 24 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ADout = V/2.0*(fpga_i+j*fpga_q);
    #line 24 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //-负频带 +正频带
    #line 25 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ad_len_N = length(ADout);
    #line 26 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //ref_dB = 74.666;%0dbm时候的计算值。75.25
    
    #line 28 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   maxADout = max(abs(ADout));
    #line 29 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   real_ADout = real(ADout);
    
    #line 31 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   /*[AmpMax,t1] = */max(real_ADout,i_o,AmpMax,t1);
    #line 32 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   /*[AmpMin,t2] = */min(real_ADout,i_o,AmpMin,t2);
    #line 33 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Vpp = AmpMax-AmpMin;
    
    #line 35 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ADout_w = times(ADout,chebwin(ad_len_N,200.0));
    #line 35 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // ADout_w=ADout.*chebchebwin(ad_len_N,200);
    #line 36 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //ADout_w=ADout.*chebchebwin(ad_len);
    #line 37 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // AA = zeros(NFFT-ad_len_N,1);
    #line 38 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //  ADout_w = [ADout_w;AA];
    #line 39 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ad_len = length(ADout_w);
    #line 40 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ADout_spect = fftshift(fft(ADout_w,NFFT));
    #line 41 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   abs_ADout_spect = abs(ADout_spect);
    #line 42 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ADout_dB = 20.0*log10(abs_ADout_spect);
    
    #line 44 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Display the results in the frequency domain with an FFT plot 
    #line 45 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //figure;  
    #line 46 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   maxdB_1 = max(ADout_dB(colon(1.0,1.0,ad_len/2.0-6.0)));
    #line 47 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   maxdB_2 = max(ADout_dB(colon(ad_len/2.0+6.0,1.0,ad_len)));
    #line 47 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //直流点数与采样深度是否有关？ 后面定义了直流点位5个！
    #line 48 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   maxdB = max(maxdB_1,maxdB_2);
    #line 49 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fin = find(ADout_dB(colon(1.0,1.0,ad_len))==maxdB);
    #line 49 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //排除直流点数以外的最大值
    #line 50 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   if (istrue(fin<ad_len/2.0)) {
      #line 51 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     fin_1 = ad_len/2.0-fin;
      #line 52 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    } else {
      
      #line 53 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     fin_1 = fin-ad_len/2.0;
      #line 54 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    
    #line 56 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   fin_lsb = fin_1/ad_len;
    #line 57 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   freq_fin = fin_lsb*fclk;
    
    #line 59 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //refdB
    #line 60 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   data_ref_iq = zeros(ad_len_N,1.0);
    #line 61 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   n_AlgDynTest_v0 = colon(1.0,1.0,ad_len_N); int n_AlgDynTest_i0;
    for (n_AlgDynTest_i0=0;n_AlgDynTest_i0<n_AlgDynTest_v0.cols();n_AlgDynTest_i0++) {
      forelem(n,n_AlgDynTest_v0,n_AlgDynTest_i0);
      
      #line 62 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     fin_angle = 2.0*(n-1.0)*fin_lsb*pi;
      #line 63 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     data_ref_iq(n) = V/2.0*(cos(fin_angle)+j*sin(fin_angle));
      #line 64 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    
    #line 66 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   data_ref_w = times(data_ref_iq,chebwin(ad_len_N,200.0));
    #line 66 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // data_ref_w=data_ref_iq .* chebchebchebchebwin(ad_len_N, 200);
    
    #line 68 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //  data_ref_w = [data_ref_w;AA];
    #line 69 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   data_ref_spect = fft(data_ref_w,NFFT);
    #line 70 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   data_ref_dB = 20.0*log10(abs(data_ref_spect));
    #line 71 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ref_dB = max(data_ref_dB(colon(1.0,1.0,ad_len/2.0)));
    #line 72 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   BW = fclk/4.0;
    #line 73 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   BW_len = (BW/fclk)*ad_len;
    
    #line 75 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   X_FREQ = (BR(colon(-ad_len/2.0,1.0,ad_len/2.0-1.0)));
    #line 75 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //频率X轴由负-0-正排序
    #line 76 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //AD_freq_all = fftshift(ADout_dB);                                                        %dB值按频率排序，与上面相对应
    #line 77 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //AD_freq_all_spect = 
    #line 78 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   X_FREQ1 = (BR(colon(-ad_len/2.0,200.0,ad_len/2.0-1.0)));
    
    
    #line 80 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Calculate SNR, SINAD, THD and SFDR valuess
    #line 81 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Find the signal bin number, DC = bin 1
    
    #line 83 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Span of the DC on each side
    #line 84 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   span = max(6.0);
    
    #line 85 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Searching span for peak harmonics amp on each side  
    #line 86 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spanh_har = 4.0;
    #line 87 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Span of the signal on each side
    #line 88 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   span_s = 19.0;
    #line 89 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Determine power spectrum
    #line 90 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spectP = (power(abs_ADout_spect,2.0));
    #line 90 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // spectP = (abs(ADout_spect)) .* (abs(ADout_spect)); 
    #line 91 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Find DC offset power 
    #line 92 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pdc = sum(spectP(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    
    #line 93 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pdc_dB = sum(ADout_dB(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    #line 94 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Extract overall signal power 
    #line 95 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ps = sum(spectP(colon(fin-span_s,1.0,fin+span_s)));
    #line 96 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ps_dB = sum(ADout_dB(colon(fin-span_s,1.0,fin+span_s)));
    #line 97 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Vector/matrix to store both frequency and power of signal and harmonics
    #line 98 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Fh = nop_M;
    
    
    #line 100 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //The 1st element in the vector/matrix represents the signal, the next element represents
    #line 101 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //the 2nd harmonic, etc.
    #line 102 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph = nop_M;
    
    #line 103 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph_1 = nop_M;
    #line 104 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Harbin = nop_M;
    #line 105 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Harbin_1 = nop_M;
    #line 106 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph_dB = nop_M;
    #line 107 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph_dB_1 = nop_M;
    
    #line 109 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   har_num_AlgDynTest_v1 = colon(1.0,1.0,11.0); int har_num_AlgDynTest_i1;
    for (har_num_AlgDynTest_i1=0;har_num_AlgDynTest_i1<har_num_AlgDynTest_v1.cols();har_num_AlgDynTest_i1++) {
      forelem(har_num,har_num_AlgDynTest_v1,har_num_AlgDynTest_i1);
      
      #line 111 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     tone = rem((har_num*(fin_1-1.0)+1.0)/ad_len,1.0);
      
      #line 113 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     if (istrue(tone>0.5)) {
        
        #line 115 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       tone = 1.0-tone;
        
        #line 117 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
      }
      
      #line 119 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Fh = (BR(Fh),tone);
      
      
      #line 121 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0);
      
      #line 122 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(round((tone+1.0/2.0)*ad_len)+spanh_har,length(spectP));
      
      #line 124 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_peak = max(spectP(colon(l,1.0,u)));
      
      
      #line 126 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0);
      
      #line 127 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(round((tone+1.0/2.0)*ad_len)+spanh_har,length(spectP));
      
      #line 129 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_bin = find(spectP(colon(l,1.0,u))==har_peak);
      
      #line 131 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_bin = har_bin+round((tone+1.0/2.0)*ad_len)-spanh_har-1.0;
      
      #line 133 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(har_bin-spanh_har,1.0);
      
      #line 134 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(har_bin+spanh_har,length(spectP));
      
      #line 136 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph = (BR(Ph),sum(spectP(colon(l,1.0,u))));
      
      
      #line 138 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(har_bin-spanh_har,1.0);
      
      #line 139 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(har_bin+spanh_har,length(spectP));
      
      #line 141 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph_dB = (BR(Ph_dB),sum(ADout_dB(colon(l,1.0,u))));
      
      #line 143 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Harbin = (BR(Harbin),har_bin);
      
      #line 145 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0);
      
      #line 146 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(round((1.0/2.0-tone)*ad_len)+spanh_har,length(spectP));
      
      #line 148 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_peak_1 = max(spectP(colon(l,1.0,u)));
      
      
      #line 150 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0);
      
      #line 151 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(round((1.0/2.0-tone)*ad_len)+spanh_har,length(spectP));
      
      #line 153 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_bin_1 = find(spectP(colon(l,1.0,u))==har_peak_1);
      
      #line 155 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     har_bin_1 = har_bin_1+round((1.0/2.0-tone)*ad_len)-spanh_har-1.0;
      
      #line 157 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(har_bin_1-spanh_har,1.0);
      
      #line 158 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(har_bin_1+spanh_har,length(spectP));
      
      #line 160 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph_1 = (BR(Ph_1),sum(spectP(colon(l,1.0,u))));
      
      #line 162 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     l = max(har_bin_1-spanh_har,1.0);
      
      #line 163 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     u = min(har_bin_1+spanh_har,length(spectP));
      
      #line 165 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph_dB_1 = (BR(Ph_dB_1),sum(ADout_dB(colon(l,1.0,u))));
      
      #line 167 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Harbin_1 = (BR(Harbin_1),har_bin_1);
      #line 168 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    
    
    #line 171 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spectP_temp = spectP;
    
    #line 173 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   i_AlgDynTest_v2 = colon(2.0,1.0,10.0); int i_AlgDynTest_i2;
    for (i_AlgDynTest_i2=0;i_AlgDynTest_i2<i_AlgDynTest_v2.cols();i_AlgDynTest_i2++) {
      forelem(i_,i_AlgDynTest_v2,i_AlgDynTest_i2);
      #line 174 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     spectP_temp(colon(Harbin(i_)-spanh_har,1.0,Harbin(i_)+spanh_har)) = 0.0;
      #line 175 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    #line 176 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    #line 177 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spectP_temp(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)) = 0.0;
    
    
    
    #line 180 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   disturb_len = 20.0;
    #line 181 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   spectP_disturb = zeros(1.0,disturb_len);
    #line 182 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Harbin_disturb = zeros(1.0,disturb_len);
    #line 183 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   findSpac = 60.0;
    #line 184 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   findSpan = (findSpac-1.0)/2.0;
    #line 185 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   findStart = findSpan+1.0;
    
    #line 187 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   i_AlgDynTest_v3 = colon(findStart,findSpac,ad_len); int i_AlgDynTest_i3;
    for (i_AlgDynTest_i3=0;i_AlgDynTest_i3<i_AlgDynTest_v3.cols();i_AlgDynTest_i3++) {
      forelem(i_,i_AlgDynTest_v3,i_AlgDynTest_i3);
      #line 188 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     /*[spectP_disturb_peak,num] = */max(spectP_temp(colon(i_-findSpan,1.0,i_+findSpan)),i_o,spectP_disturb_peak, \
        num);
      
      #line 189 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     if (istrue(spectP_disturb_peak>spectP_disturb(1.0))) {
        #line 190 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       spectP_disturb(1.0) = spectP_disturb_peak;
        #line 191 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       Harbin_disturb(1.0) = i_-findStart+num;
        #line 192 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       array_flag = 1.0;
        #line 193 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
      } else {
        
        #line 194 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       array_flag = 0.0;
        #line 195 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
      }
      #line 196 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     if (istrue(array_flag==1.0)) {
        #line 197 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_       jj_AlgDynTest_v4 = colon(1.0,1.0,disturb_len-2.0); int jj_AlgDynTest_i4;
        for (jj_AlgDynTest_i4=0;jj_AlgDynTest_i4<jj_AlgDynTest_v4.cols();jj_AlgDynTest_i4++) {
          forelem(jj,jj_AlgDynTest_v4,jj_AlgDynTest_i4);
          #line 198 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_         k_AlgDynTest_v5 = colon(1.0,1.0,(disturb_len-jj)); int k_AlgDynTest_i5;
          for (k_AlgDynTest_i5=0;k_AlgDynTest_i5<k_AlgDynTest_v5.cols();k_AlgDynTest_i5++) {
            forelem(k,k_AlgDynTest_v5,k_AlgDynTest_i5);
            #line 199 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_           if (istrue(spectP_disturb(k)>spectP_disturb(k+1.0))) {
              #line 200 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             spectP_disturb_temp = spectP_disturb(k);
              #line 201 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             spectP_disturb(k) = spectP_disturb(k+1.0);
              #line 202 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             spectP_disturb(k+1.0) = spectP_disturb_temp;
              #line 203 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             Harbin_disturb_temp = Harbin_disturb(k);
              #line 204 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             Harbin_disturb(k) = Harbin_disturb(k+1.0);
              #line 205 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_             Harbin_disturb(k+1.0) = Harbin_disturb_temp;
              
              #line 206 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
            }
            #line 207 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
          }
          #line 208 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
        }
        #line 209 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
      }
      #line 210 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    #line 211 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph_disturb = nop_M;
    #line 212 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Ph_disturb_dB = nop_M;
    #line 213 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Fn_disturb = (Harbin_disturb-ad_len/2.0)/(ad_len);
    #line 214 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   i_AlgDynTest_v6 = colon(1.0,1.0,disturb_len); int i_AlgDynTest_i6;
    for (i_AlgDynTest_i6=0;i_AlgDynTest_i6<i_AlgDynTest_v6.cols();i_AlgDynTest_i6++) {
      forelem(i_,i_AlgDynTest_v6,i_AlgDynTest_i6);
      #line 215 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_)+spanh_har) \
        )));
      #line 216 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_     Ph_disturb_dB = (BR(Ph_disturb_dB),sum(ADout_dB(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_) \
        +spanh_har))));
      #line 217 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    }
    #line 218 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    #line 219 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd_disturb_dB = sum(Ph_disturb_dB(colon(1.0,1.0,disturb_len)));
    
    #line 221 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd = sum(Ph(colon(2.0,1.0,10.0)));
    #line 222 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd_dB = sum(Ph_dB(colon(2.0,1.0,10.0)));
    #line 223 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd_dB_1 = sum(Ph_dB_1(colon(2.0,1.0,10.0)));
    #line 224 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pd_dB_2 = Pd_dB+Pd_dB_1;
    
    
    #line 227 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pn = (sum(spectP(colon(1.0,1.0,ad_len)))-Pdc-Ps-Pd);
    #line 228 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Pn_dB = (sum(ADout_dB(colon((ad_len/2.0-BW_len),1.0,ad_len/2.0+BW_len)))-Pdc_dB-Ps_dB-Pd_dB_2-Pd_disturb_dB) \
      /(2.0*BW_len)-ref_dB;
    #line 229 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // Vin = 20*log10(Vpp/2);
    #line 230 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   Vin = maxdB-ref_dB;
    #line 231 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   SINAD = 10.0*log10(Ps/(Pn+Pd));
    #line 232 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   SNR = 10.0*log10(Ps/Pn);
    
    #line 233 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   THD = 10.0*log10(Pd/Ps);
    #line 234 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   SFDR = 10.0*log10(Ps/max(max(Ph(colon(2.0,1.0,10.0)),max(Ph_disturb(colon(1.0,1.0,disturb_len))))));
    
    #line 235 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   HD = 10.0*log10(Ph(colon(1.0,1.0,10.0))/Ph(1.0));
    
    
    #line 238 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   SNRFS = SNR+abs(maxdB-ref_dB);
    #line 239 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ENOB = (SINAD-1.76)/6.02;
    #line 240 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   ENOBFS = ENOB+abs(maxdB-ref_dB)/6.02;
    #line 241 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // A = [AmpMax,AmpMin];
    #line 242 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    // AdB = Vin;
    #line 243 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
_   HD = (BR(ADout_dB(Harbin(2.0))-ref_dB),ADout_dB(Harbin(2.0))-ref_dB,ADout_dB(Harbin(3.0))-ref_dB,ADout_dB(Harbin( \
      4.0))-ref_dB,ADout_dB(Harbin(5.0))-ref_dB,ADout_dB(Harbin(6.0))-ref_dB,ADout_dB(Harbin(7.0))-ref_dB,ADout_dB( \
      Harbin(8.0))-ref_dB,ADout_dB(Harbin(9.0))-ref_dB,ADout_dB(Harbin(10.0))-ref_dB);
    
    #line 244 "e:/_adcevm/ddc/cursor/m2c/m/algdyntest.m"
    //Spectrum = ADout_dB - ref_dB;
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    data1.setname(NULL); data2.setname(NULL); numpt.setname(NULL); fclk.setname(NULL); numbit.setname(NULL); r.setname( \
      NULL); 
    SNR__o=SNR; SINAD__o=SINAD; SFDR__o=SFDR; ENOB__o=ENOB; 
    return x_M;
    end_scope
  }
  
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(SNR__o); dMm(SINAD__o); dMm(SFDR__o); dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(SNR__o);
    end_scope
  }
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(SFDR__o); dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
