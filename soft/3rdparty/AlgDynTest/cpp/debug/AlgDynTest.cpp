  #include "matlib.h"
  #pragma hdrstop
  
  #include "AlgDynTest.h"
  #include "win.h"
  
  
  
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, \
     Mm& ENOB__o) {
    begin_scope
    data1.setname("data1"); data2.setname("data2"); numpt.setname("numpt"); fclk.setname("fclk"); numbit.setname( \
      "numbit"); r.setname("r"); 
    dMm(SNR); dMm(SINAD); dMm(SFDR); dMm(ENOB); dMm(fpga_i); dMm(fpga_q); dMm(V); dMm(NFFT); dMm(TPY); dMm(TPX);  \
      dMm(code); dMm(fpga_len); dMm(ADout); dMm(ad_len_N); dMm(maxADout); dMm(real_ADout); dMm(AmpMax); dMm(t1); dMm( \
      AmpMin); dMm(t2); dMm(Vpp); dMm(ADout_w); dMm(ad_len); dMm(ADout_spect); dMm(ADout_dB); dMm(maxdB_1); dMm(maxdB_2) \
      ; dMm(maxdB); dMm(fin); dMm(fin_1); dMm(fin_lsb); dMm(freq_fin); dMm(data_ref_iq); dMm(n); dMm(n_AlgDynTest_v0) \
      ; dMm(fin_angle); dMm(data_ref_w); dMm(data_ref_spect); dMm(data_ref_dB); dMm(ref_dB); dMm(BW); dMm(BW_len);  \
      dMm(X_FREQ); dMm(X_FREQ1); dMm(span); dMm(spanh_har); dMm(span_s); dMm(spectP); dMm(Pdc); dMm(Pdc_dB); dMm(Ps) \
      ; dMm(Ps_dB); dMm(Fh); dMm(Ph); dMm(Ph_1); dMm(Harbin); dMm(Harbin_1); dMm(Ph_dB); dMm(Ph_dB_1); dMm(har_num) \
      ; dMm(har_num_AlgDynTest_v1); dMm(tone); dMm(har_peak); dMm(har_bin); dMm(har_peak_1); dMm(har_bin_1); dMm(spectP_temp) \
      ; dMm(i_); dMm(i_AlgDynTest_v2); dMm(disturb_len); dMm(spectP_disturb); dMm(Harbin_disturb); dMm(findSpac); dMm( \
      findSpan); dMm(findStart); dMm(i_AlgDynTest_v3); dMm(spectP_disturb_peak); dMm(num); dMm(array_flag); dMm(jj) \
      ; dMm(jj_AlgDynTest_v4); dMm(k); dMm(k_AlgDynTest_v5); dMm(spectP_disturb_temp); dMm(Harbin_disturb_temp); dMm( \
      Ph_disturb); dMm(Ph_disturb_dB); dMm(Fn_disturb); dMm(i_AlgDynTest_v6); dMm(Pd_disturb); dMm(Pd_disturb_dB);  \
      dMm(Pd); dMm(Pd_dB); dMm(Pd_dB_1); dMm(Pd_dB_2); dMm(Pn); dMm(Pn_dB); dMm(Vin); dMm(THD); dMm(HD); dMm(SNRFS) \
      ; 
    
    #line 2 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    call_stack_begin;
    #line 2 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=6.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=4.0;
    nargout_set=0;
    
    // translated code
    
    #line 3 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   format(TM("long"));
    
    #line 5 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fpga_i = data1/mpower(2.0,(numbit-1.0));
    #line 6 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fpga_q = data2/mpower(2.0,(numbit-1.0));
    
    #line 8 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // fclk = 80e6;
    #line 9 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // r=20;
    #line 10 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // numbit = 16;
    
    #line 12 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   V = 2.0;
    #line 13 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   NFFT = min(32768.0,length(data1));
    #line 14 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   NFFT = floor(NFFT/2.0)*2.0;
    #line 15 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   TPY = 1.0;
    #line 16 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   TPX = 0.2;
    #line 17 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   code = 1.0;
    #line 18 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fclk = fclk/r;
    
    
    #line 21 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fpga_len = length(fpga_i);
    
    #line 23 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ADout = V/2.0*(fpga_i+j*fpga_q);
    #line 23 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //-负频带 +正频带
    #line 24 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ad_len_N = length(ADout);
    #line 25 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //ref_dB = 74.666;%0dbm时候的计算值。75.25
    
    #line 27 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   maxADout = max(abs(ADout));
    #line 28 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   real_ADout = real(ADout);
    
    #line 30 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   /*[AmpMax,t1] = */max(real_ADout,i_o,AmpMax,t1);
    #line 31 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   /*[AmpMin,t2] = */min(real_ADout,i_o,AmpMin,t2);
    #line 32 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Vpp = AmpMax-AmpMin;
    
    #line 34 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ADout_w = times(ADout,win(ad_len_N,200.0));
    #line 34 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // ADout_w=ADout.*chebwin(ad_len_N,200);
    #line 35 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //ADout_w=ADout.*chebwin(ad_len);
    #line 36 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // AA = zeros(NFFT-ad_len_N,1);
    #line 37 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //  ADout_w = [ADout_w;AA];
    #line 38 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ad_len = length(ADout_w);
    #line 39 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ADout_spect = fftshift(fft(ADout_w,NFFT));
    #line 40 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ADout_dB = 20.0*log10(abs(ADout_spect));
    
    #line 42 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Display the results in the frequency domain with an FFT plot 
    #line 43 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //figure;  
    #line 44 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   maxdB_1 = max(ADout_dB(colon(1.0,1.0,ad_len/2.0-6.0)));
    #line 45 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   maxdB_2 = max(ADout_dB(colon(ad_len/2.0+6.0,1.0,ad_len)));
    #line 45 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //直流点数与采样深度是否有关？ 后面定义了直流点位5个！
    #line 46 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   maxdB = max(maxdB_1,maxdB_2);
    #line 47 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fin = find(ADout_dB(colon(1.0,1.0,ad_len))==maxdB);
    #line 47 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //排除直流点数以外的最大值
    #line 48 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   if (istrue(fin<ad_len/2.0)) {
      #line 49 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     fin_1 = ad_len/2.0-fin;
      #line 50 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    } else {
      
      #line 51 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     fin_1 = fin-ad_len/2.0;
      #line 52 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    
    #line 54 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   fin_lsb = fin_1/ad_len;
    #line 55 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   freq_fin = fin_lsb*fclk;
    
    #line 57 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //refdB
    #line 58 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   data_ref_iq = zeros(1.0,ad_len_N);
    #line 59 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   n_AlgDynTest_v0 = colon(1.0,1.0,ad_len_N); int n_AlgDynTest_i0;
    for (n_AlgDynTest_i0=0;n_AlgDynTest_i0<n_AlgDynTest_v0.cols();n_AlgDynTest_i0++) {
      forelem(n,n_AlgDynTest_v0,n_AlgDynTest_i0);
      
      #line 60 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     fin_angle = 2.0*(n-1.0)*fin_lsb*pi;
      #line 61 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     data_ref_iq(n) = V/2.0*(cos(fin_angle)+j*sin(fin_angle));
      #line 62 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    
    #line 64 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   data_ref_w = times(data_ref_iq,win(ad_len_N,200.0));
    #line 64 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // data_ref_w=data_ref_iq .* chebwin(ad_len_N, 200);
    
    #line 66 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //  data_ref_w = [data_ref_w;AA];
    #line 67 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   data_ref_spect = fft(data_ref_w,NFFT);
    #line 68 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   data_ref_dB = 20.0*log10(abs(data_ref_spect));
    #line 69 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ref_dB = max(data_ref_dB(colon(1.0,1.0,ad_len/2.0)));
    #line 70 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   BW = fclk/4.0;
    #line 71 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   BW_len = (BW/fclk)*ad_len;
    
    #line 73 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   X_FREQ = (BR(colon(-ad_len/2.0,1.0,ad_len/2.0-1.0)));
    #line 73 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //频率X轴由负-0-正排序
    #line 74 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //AD_freq_all = fftshift(ADout_dB);                                                        %dB值按频率排序，与上面相对应
    #line 75 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //AD_freq_all_spect = 
    #line 76 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   X_FREQ1 = (BR(colon(-ad_len/2.0,200.0,ad_len/2.0-1.0)));
    
    
    #line 78 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Calculate SNR, SINAD, THD and SFDR valuess
    #line 79 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Find the signal bin number, DC = bin 1
    
    #line 81 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Span of the DC on each side
    #line 82 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   span = max(6.0);
    
    #line 83 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Searching span for peak harmonics amp on each side  
    #line 84 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spanh_har = 4.0;
    #line 85 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Span of the signal on each side
    #line 86 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   span_s = 19.0;
    #line 87 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Determine power spectrum
    #line 88 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spectP = (power(abs(ADout_spect),2.0));
    #line 88 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // spectP = (abs(ADout_spect)) .* (abs(ADout_spect)); 
    #line 89 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Find DC offset power 
    #line 90 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pdc = sum(spectP(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    
    #line 91 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pdc_dB = sum(ADout_dB(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    #line 92 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Extract overall signal power 
    
    #line 94 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ps = sum(spectP(colon(max(fin-span_s,1.0),1.0,min(fin+span_s,length(spectP)))));
    #line 95 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ps_dB = sum(ADout_dB(colon(max(fin-span_s,1.0),1.0,min(fin+span_s,length(ADout_dB)))));
    #line 96 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //Vector/matrix to store both frequency and power of signal and harmonics
    #line 97 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Fh = nop_M;
    
    
    #line 99 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //The 1st element in the vector/matrix represents the signal, the next element represents
    #line 100 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //the 2nd harmonic, etc.
    #line 101 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph = nop_M;
    
    #line 102 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph_1 = nop_M;
    #line 103 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Harbin = nop_M;
    #line 104 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Harbin_1 = nop_M;
    #line 105 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph_dB = nop_M;
    #line 106 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph_dB_1 = nop_M;
    
    #line 108 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   har_num_AlgDynTest_v1 = colon(1.0,1.0,11.0); int har_num_AlgDynTest_i1;
    for (har_num_AlgDynTest_i1=0;har_num_AlgDynTest_i1<har_num_AlgDynTest_v1.cols();har_num_AlgDynTest_i1++) {
      forelem(har_num,har_num_AlgDynTest_v1,har_num_AlgDynTest_i1);
      #line 109 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     tone = rem((har_num*(fin_1-1.0)+1.0)/ad_len,1.0);
      
      #line 111 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     if (istrue(tone>0.5)) {
        #line 112 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       tone = 1.0-tone;
        
        #line 114 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
      }
      
      #line 116 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Fh = (BR(Fh),tone);
      
      
      #line 118 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_peak = max(spectP(colon(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0,round((tone+1.0/2.0)*ad_len)+spanh_har) \
        ));
      
      #line 119 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_bin = find(spectP(colon(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0,round((tone+1.0/2.0)*ad_len)+spanh_har) \
        )==har_peak);
      #line 120 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_bin = har_bin+round((tone+1.0/2.0)*ad_len)-spanh_har-1.0;
      #line 121 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph = (BR(Ph),sum(spectP(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      
      #line 122 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph_dB = (BR(Ph_dB),sum(ADout_dB(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      #line 123 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Harbin = (BR(Harbin),har_bin);
      
      #line 125 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_peak_1 = max(spectP(colon(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0,round((1.0/2.0-tone)*ad_len)+spanh_har) \
        ));
      
      #line 126 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_bin_1 = find(spectP(colon(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0,round((1.0/2.0-tone)*ad_len)+spanh_har) \
        )==har_peak_1);
      #line 127 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     har_bin_1 = har_bin_1+round((1.0/2.0-tone)*ad_len)-spanh_har-1.0;
      #line 128 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph_1 = (BR(Ph_1),sum(spectP(colon(har_bin_1-spanh_har,1.0,har_bin_1+spanh_har))));
      
      #line 129 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph_dB_1 = (BR(Ph_dB_1),sum(ADout_dB(colon(har_bin_1-spanh_har,1.0,har_bin_1+spanh_har))));
      #line 130 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Harbin_1 = (BR(Harbin_1),har_bin_1);
      #line 131 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    
    
    #line 134 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spectP_temp = spectP;
    
    #line 136 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   i_AlgDynTest_v2 = colon(2.0,1.0,10.0); int i_AlgDynTest_i2;
    for (i_AlgDynTest_i2=0;i_AlgDynTest_i2<i_AlgDynTest_v2.cols();i_AlgDynTest_i2++) {
      forelem(i_,i_AlgDynTest_v2,i_AlgDynTest_i2);
      #line 137 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     spectP_temp(colon(Harbin(i_)-spanh_har,1.0,Harbin(i_)+spanh_har)) = 0.0;
      #line 138 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    #line 139 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    #line 140 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spectP_temp(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)) = 0.0;
    
    
    
    #line 143 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   disturb_len = 20.0;
    #line 144 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   spectP_disturb = zeros(1.0,disturb_len);
    #line 145 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Harbin_disturb = zeros(1.0,disturb_len);
    #line 146 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   findSpac = 60.0;
    #line 147 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   findSpan = (findSpac-1.0)/2.0;
    #line 148 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   findStart = findSpan+1.0;
    
    #line 150 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   i_AlgDynTest_v3 = colon(findStart,findSpac,ad_len); int i_AlgDynTest_i3;
    for (i_AlgDynTest_i3=0;i_AlgDynTest_i3<i_AlgDynTest_v3.cols();i_AlgDynTest_i3++) {
      forelem(i_,i_AlgDynTest_v3,i_AlgDynTest_i3);
      #line 151 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     /*[spectP_disturb_peak,num] = */max(spectP_temp(colon(i_-findSpan,1.0,i_+findSpan)),i_o,spectP_disturb_peak, \
        num);
      
      #line 152 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     if (istrue(spectP_disturb_peak>spectP_disturb(1.0))) {
        #line 153 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       spectP_disturb(1.0) = spectP_disturb_peak;
        #line 154 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       Harbin_disturb(1.0) = i_-findStart+num;
        #line 155 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       array_flag = 1.0;
        #line 156 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
      } else {
        
        #line 157 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       array_flag = 0.0;
        #line 158 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
      }
      #line 159 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     if (istrue(array_flag==1.0)) {
        #line 160 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_       jj_AlgDynTest_v4 = colon(1.0,1.0,disturb_len-2.0); int jj_AlgDynTest_i4;
        for (jj_AlgDynTest_i4=0;jj_AlgDynTest_i4<jj_AlgDynTest_v4.cols();jj_AlgDynTest_i4++) {
          forelem(jj,jj_AlgDynTest_v4,jj_AlgDynTest_i4);
          #line 161 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_         k_AlgDynTest_v5 = colon(1.0,1.0,(disturb_len-jj)); int k_AlgDynTest_i5;
          for (k_AlgDynTest_i5=0;k_AlgDynTest_i5<k_AlgDynTest_v5.cols();k_AlgDynTest_i5++) {
            forelem(k,k_AlgDynTest_v5,k_AlgDynTest_i5);
            #line 162 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_           if (istrue(spectP_disturb(k)>spectP_disturb(k+1.0))) {
              #line 163 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             spectP_disturb_temp = spectP_disturb(k);
              #line 164 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             spectP_disturb(k) = spectP_disturb(k+1.0);
              #line 165 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             spectP_disturb(k+1.0) = spectP_disturb_temp;
              #line 166 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             Harbin_disturb_temp = Harbin_disturb(k);
              #line 167 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             Harbin_disturb(k) = Harbin_disturb(k+1.0);
              #line 168 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_             Harbin_disturb(k+1.0) = Harbin_disturb_temp;
              
              #line 169 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
            }
            #line 170 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
          }
          #line 171 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
        }
        #line 172 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
      }
      #line 173 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    #line 174 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph_disturb = nop_M;
    #line 175 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Ph_disturb_dB = nop_M;
    #line 176 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Fn_disturb = (Harbin_disturb-ad_len/2.0)/(ad_len);
    
    #line 178 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   i_AlgDynTest_v6 = colon(1.0,1.0,disturb_len); int i_AlgDynTest_i6;
    for (i_AlgDynTest_i6=0;i_AlgDynTest_i6<i_AlgDynTest_v6.cols();i_AlgDynTest_i6++) {
      forelem(i_,i_AlgDynTest_v6,i_AlgDynTest_i6);
      #line 179 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(max(1.0,Harbin_disturb(i_)-spanh_har),1.0,min(length(spectP) \
        ,Harbin_disturb(i_)+spanh_har)))));
      #line 180 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_     Ph_disturb_dB = (BR(Ph_disturb_dB),sum(ADout_dB(colon(max(1.0,Harbin_disturb(i_)-spanh_har),1.0,min(length( \
        ADout_dB),Harbin_disturb(i_)+spanh_har)))));
      #line 181 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    }
    #line 182 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    #line 183 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd_disturb_dB = sum(Ph_disturb_dB(colon(1.0,1.0,disturb_len)));
    
    #line 185 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd = sum(Ph(colon(2.0,1.0,10.0)));
    #line 186 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd_dB = sum(Ph_dB(colon(2.0,1.0,10.0)));
    #line 187 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd_dB_1 = sum(Ph_dB_1(colon(2.0,1.0,10.0)));
    #line 188 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pd_dB_2 = Pd_dB+Pd_dB_1;
    
    
    #line 191 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pn = (sum(spectP(colon(1.0,1.0,ad_len)))-Pdc-Ps-Pd);
    #line 192 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Pn_dB = (sum(ADout_dB(colon((ad_len/2.0-BW_len),1.0,ad_len/2.0+BW_len)))-Pdc_dB-Ps_dB-Pd_dB_2-Pd_disturb_dB) \
      /(2.0*BW_len)-ref_dB;
    #line 193 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // Vin = 20*log10(Vpp/2);
    #line 194 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   Vin = maxdB-ref_dB;
    #line 195 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   SINAD = 10.0*log10(Ps/(Pn+Pd));
    #line 196 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   SNR = 10.0*log10(Ps/Pn);
    
    #line 197 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   THD = 10.0*log10(Pd/Ps);
    #line 198 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   SFDR = 10.0*log10(Ps/max(max(Ph(colon(2.0,1.0,10.0)),max(Ph_disturb(colon(1.0,1.0,disturb_len))))));
    
    #line 199 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   HD = 10.0*log10(Ph(colon(1.0,1.0,10.0))/Ph(1.0));
    
    
    #line 202 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   SNRFS = SNR+abs(maxdB-ref_dB);
    #line 203 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
_   ENOB = (SINAD-1.76)/6.02;
    #line 204 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    //ENOBFS = ENOB+abs(maxdB-ref_dB)/6.02;
    #line 205 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // A = [AmpMax,AmpMin];
    #line 206 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // AdB = Vin;
    #line 207 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // HD = [ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(3))-ref_dB,ADout_dB(Harbin(4))-ref_dB,ADout_dB(Harbin(5))-ref_dB,ADout_dB(Harbin(6))-ref_dB,ADout_dB(Harbin(7))-ref_dB,ADout_dB(Harbin(8))-ref_dB,ADout_dB(Harbin(9))-ref_dB,ADout_dB(Harbin(10))-ref_dB]; 
    #line 208 "e:/workshop/projects/adv-evm2/matcom/algdyntest.m"
    // Spectrum = ADout_dB - ref_dB;
    
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
  
