  #include "matlib.h"
  #pragma hdrstop
  
  #include "AlgDynTestv3.h"
  
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o, Mm& Spectrum__o) {
    begin_scope
    fpga_i.setname("fpga_i"); fpga_q.setname("fpga_q"); numpt.setname("numpt"); fclk.setname("fclk"); VppFs.setname( \
      "VppFs"); numbit.setname("numbit"); r.setname("r"); 
    dMm(SNR); dMm(SINAD); dMm(SFDR); dMm(ENOB); dMm(HD); dMm(Fh); dMm(Harbin); dMm(THD); dMm(Spectrum); dMm(ad_len_N) \
      ; dMm(ADout); dMm(AmpMax); dMm(t1); dMm(AmpMin); dMm(t2); dMm(Vpp); dMm(adc_aaa_i); dMm(adc_aaa_q); dMm(ADout_w) \
      ; dMm(ad_len); dMm(adc_aaa_i_afterwin); dMm(adc_aaa_q_afterwin); dMm(ADout_spect_i); dMm(ADout_spect_q); dMm( \
      ADout_spect_real); dMm(ADout_spect_imag); dMm(i_); dMm(i_AlgDynTestv3_v0); dMm(ADout_spect); dMm(ADout_dB); dMm( \
      maxdB_1); dMm(maxdB_2); dMm(maxdB); dMm(fin); dMm(fin_1); dMm(fin_lsb); dMm(freq_fin); dMm(data_ref_iq); dMm( \
      n); dMm(n_AlgDynTestv3_v1); dMm(fin_angle); dMm(data_ref_i); dMm(data_ref_q); dMm(data_ref_i_afterwin); dMm(data_ref_q_afterwin) \
      ; dMm(data_ref_spect_i); dMm(data_ref_spect_q); dMm(data_ref_spect_real); dMm(data_ref_spect_imag); dMm(i_AlgDynTestv3_v2) \
      ; dMm(data_ref_spect); dMm(data_ref_dB); dMm(ref_dB); dMm(BW); dMm(BW_len); dMm(X_FREQ); dMm(span); dMm(spanh_har) \
      ; dMm(span_s); dMm(spectP); dMm(Pdc); dMm(Pdc_dB); dMm(Ps); dMm(Ps_dB); dMm(Ph); dMm(Ph_1); dMm(Harbin_1); dMm( \
      Ph_dB); dMm(Ph_dB_1); dMm(har_num); dMm(har_num_AlgDynTestv3_v3); dMm(tone); dMm(har_peak); dMm(har_bin); dMm( \
      har_peak_1); dMm(har_bin_1); dMm(spectP_temp); dMm(i_AlgDynTestv3_v4); dMm(disturb_len); dMm(spectP_disturb);  \
      dMm(Harbin_disturb); dMm(findSpac); dMm(findSpan); dMm(findStart); dMm(i_AlgDynTestv3_v5); dMm(spectP_disturb_peak) \
      ; dMm(num); dMm(array_flag); dMm(jj); dMm(jj_AlgDynTestv3_v6); dMm(k); dMm(k_AlgDynTestv3_v7); dMm(spectP_disturb_temp) \
      ; dMm(Harbin_disturb_temp); dMm(Ph_disturb); dMm(Ph_disturb_dB); dMm(Ph_disturb_BW); dMm(Fn_disturb); dMm(i_AlgDynTestv3_v8) \
      ; dMm(min_Harbin); dMm(max_Harbin); dMm(Pd_disturb); dMm(Pd_disturb_dB); dMm(Pd); dMm(Pd_dB); dMm(Pd_dB_1); dMm( \
      Pd_dB_2); dMm(Pn); dMm(Pn_dB); dMm(Vin); dMm(SNRFS); dMm(ENOBFS); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=7.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=9.0;
    nargout_set=0;
    
    // translated code
    
    //----------------------------------------------
    fclk = fclk/r;
    ad_len_N = length(fpga_i);
    ADout = VppFs/2.0*(fpga_i+j*fpga_q);
    //-负频带 +正频带
    //% maxADout = max(abs(ADout));
    /*[AmpMax,t1] = */max(real(ADout),i_o,AmpMax,t1);
    /*[AmpMin,t2] = */min(real(ADout),i_o,AmpMin,t2);
    Vpp = AmpMax-AmpMin;
    
    //% adc_aaa=complex(fpga_i,-fpga_q);
    adc_aaa_i = transpose(fpga_i(colon(1.0,1.0,ad_len_N)));
    adc_aaa_q = -transpose(fpga_q(colon(1.0,1.0,ad_len_N)));
    // %ADout_w=blackmanharris(ad_len_N).';
    ADout_w = adc_aaa_i;
    ad_len = length(ADout_w);
    adc_aaa_i_afterwin = times(adc_aaa_i,ADout_w);
    adc_aaa_q_afterwin = times(adc_aaa_q,ADout_w);
    ADout_spect_i = fftshift(fft(adc_aaa_i_afterwin));
    ADout_spect_q = fftshift(fft(adc_aaa_q_afterwin));
    ADout_spect_real = real(ADout_spect_i)-imag(ADout_spect_q);
    ADout_spect_imag = imag(ADout_spect_i)+real(ADout_spect_q);
    i_AlgDynTestv3_v0 = colon(1.0,1.0,ad_len_N); int i_AlgDynTestv3_i0;
    for (i_AlgDynTestv3_i0=0;i_AlgDynTestv3_i0<i_AlgDynTestv3_v0.cols();i_AlgDynTestv3_i0++) {
      forelem(i_,i_AlgDynTestv3_v0,i_AlgDynTestv3_i0);
      ADout_spect(i_) = msqrt(ADout_spect_real(i_)*ADout_spect_real(i_)+ADout_spect_imag(i_)*ADout_spect_real(i_) \
        );
    }
    
    ADout_dB = 20.0*log10(abs(ADout_spect));
    
    //Display the results in the frequency domain with an FFT plot 
    //figure; 
    maxdB_1 = max(ADout_dB(colon(1.0,1.0,ad_len/2.0-6.0)));
    maxdB_2 = max(ADout_dB(colon(ad_len/2.0+6.0,1.0,ad_len)));
    //直流点数与采样深度是否有关？ 后面定义了直流点位5个！
    maxdB = max(maxdB_1,maxdB_2);
    fin = find(ADout_dB(colon(1.0,1.0,ad_len))==maxdB);
    //排除直流点数以外的最大值
    if (istrue(fin<ad_len/2.0)) {
      fin_1 = ad_len/2.0-fin;
    } else {
      
      fin_1 = fin-ad_len/2.0;
    }
    fin_lsb = (fin_1/ad_len);
    freq_fin = fin_lsb*fclk;
    //第二个奈克斯特频率区
    //0dbm时候的计算值(1024点)
    data_ref_iq = zeros(ad_len_N,1.0);
    n_AlgDynTestv3_v1 = colon(1.0,1.0,ad_len_N); int n_AlgDynTestv3_i1;
    for (n_AlgDynTestv3_i1=0;n_AlgDynTestv3_i1<n_AlgDynTestv3_v1.cols();n_AlgDynTestv3_i1++) {
      forelem(n,n_AlgDynTestv3_v1,n_AlgDynTestv3_i1);
      
      fin_angle = 2.0*(n-1.0)*fin_lsb*pi;
      data_ref_iq(n) = VppFs/2.0*(cos(fin_angle)+j*sin(fin_angle));
    }
    //data_ref_w=blackmanharris(ad_len_N).';
    data_ref_i = transpose(real(data_ref_iq));
    data_ref_q = transpose(real(data_ref_iq));
    data_ref_i_afterwin = times(data_ref_i,ADout_w);
    data_ref_q_afterwin = times(data_ref_q,ADout_w);
    data_ref_spect_i = fftshift(fft(data_ref_i_afterwin));
    data_ref_spect_q = fftshift(fft(data_ref_q_afterwin));
    data_ref_spect_real = real(data_ref_spect_i)-imag(data_ref_spect_q);
    data_ref_spect_imag = imag(data_ref_spect_i)+real(data_ref_spect_q);
    i_AlgDynTestv3_v2 = colon(1.0,1.0,ad_len_N); int i_AlgDynTestv3_i2;
    for (i_AlgDynTestv3_i2=0;i_AlgDynTestv3_i2<i_AlgDynTestv3_v2.cols();i_AlgDynTestv3_i2++) {
      forelem(i_,i_AlgDynTestv3_v2,i_AlgDynTestv3_i2);
      data_ref_spect(i_) = msqrt(data_ref_spect_real(i_)*data_ref_spect_real(i_)+data_ref_spect_imag(i_)*data_ref_spect_real( \
        i_));
    }
    
    data_ref_dB = 20.0*log10(abs(data_ref_spect));
    ref_dB = max(data_ref_dB(colon(1.0,1.0,ad_len/2.0)))+3.0;
    //ddc为I/Q两路，因此多3dB增益
    
    BW = fclk/4.0;
    BW_len = (BW/fclk)*ad_len;
    
    X_FREQ = (BR(colon(-ad_len/2.0,1.0,ad_len/2.0-1.0)));
    //频率X轴由负-0-正排序
    //AD_freq_all = fftshift(ADout_dB);                                                        %dB值按频率排序，与上面相对应
    
    //Calculate SNR, SINAD, THD and SFDR values
    //Find the signal bin number, DC = bin 1
    
    //Span of the DC on each side
    span = max(4.0);
    
    //Searching span for peak harmonics amp on each side  
    spanh_har = 6.0;
    //Span of the signal on each side
    span_s = 6.0;
    //Determine power spectrum
    spectP = times((abs(ADout_spect)),(abs(ADout_spect)));
    
    //Find DC offset power 
    Pdc = sum(spectP(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    
    Pdc_dB = sum(ADout_dB(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)));
    //Extract overall signal power 
    Ps = sum(spectP(colon(fin-span_s,1.0,fin+span_s)));
    Ps_dB = sum(ADout_dB(colon(fin-span_s,1.0,fin+span_s)));
    //Vector/matrix to store both frequency and power of signal and harmonics
    Fh = nop_M;
    
    
    //The 1st element in the vector/matrix represents the signal, the next element represents
    //the 2nd harmonic, etc.
    Ph = nop_M;
    
    Ph_1 = nop_M;
    Harbin = nop_M;
    Harbin_1 = nop_M;
    Ph_dB = nop_M;
    Ph_dB_1 = nop_M;
    
    har_num_AlgDynTestv3_v3 = colon(1.0,1.0,11.0); int har_num_AlgDynTestv3_i3;
    for (har_num_AlgDynTestv3_i3=0;har_num_AlgDynTestv3_i3<har_num_AlgDynTestv3_v3.cols();har_num_AlgDynTestv3_i3++) \
       {
      forelem(har_num,har_num_AlgDynTestv3_v3,har_num_AlgDynTestv3_i3);
      
      tone = rem((har_num*(fin_1-1.0)+1.0)/ad_len,1.0);
      
      if (istrue(tone>0.5)) {
        
        tone = 1.0-tone;
        
      }
      
      Fh = (BR(Fh),tone);
      
      
      har_peak = max(spectP(colon(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0,round((tone+1.0/2.0)*ad_len)+spanh_har) \
        ));
      
      har_bin = find(spectP(colon(round((tone+1.0/2.0)*ad_len)-spanh_har,1.0,round((tone+1.0/2.0)*ad_len)+spanh_har) \
        )==har_peak);
      har_bin = har_bin+round((tone+1.0/2.0)*ad_len)-spanh_har-1.0;
      Ph = (BR(Ph),sum(spectP(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      
      Ph_dB = (BR(Ph_dB),sum(ADout_dB(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      Harbin = (BR(Harbin),har_bin);
      
      har_peak_1 = max(spectP(colon(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0,round((1.0/2.0-tone)*ad_len)+spanh_har) \
        ));
      
      har_bin_1 = find(spectP(colon(round((1.0/2.0-tone)*ad_len)-spanh_har,1.0,round((1.0/2.0-tone)*ad_len)+spanh_har) \
        )==har_peak_1);
      har_bin_1 = har_bin_1+round((1.0/2.0-tone)*ad_len)-spanh_har-1.0;
      Ph_1 = (BR(Ph_1),sum(spectP(colon(har_bin_1-spanh_har,1.0,har_bin_1+spanh_har))));
      
      Ph_dB_1 = (BR(Ph_dB_1),sum(ADout_dB(colon(har_bin_1-spanh_har,1.0,har_bin_1+spanh_har))));
      Harbin_1 = (BR(Harbin_1),har_bin_1);
    }
    
    spectP_temp = spectP;
    
    i_AlgDynTestv3_v4 = colon(2.0,1.0,10.0); int i_AlgDynTestv3_i4;
    for (i_AlgDynTestv3_i4=0;i_AlgDynTestv3_i4<i_AlgDynTestv3_v4.cols();i_AlgDynTestv3_i4++) {
      forelem(i_,i_AlgDynTestv3_v4,i_AlgDynTestv3_i4);
      spectP_temp(colon(Harbin(i_)-spanh_har,1.0,Harbin(i_)+spanh_har)) = 0.0;
    }
    spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    spectP_temp(colon(ad_len/2.0-span,1.0,ad_len/2.0+span)) = 0.0;
    
    
    
    disturb_len = 20.0;
    spectP_disturb = zeros(1.0,disturb_len);
    Harbin_disturb = zeros(1.0,disturb_len);
    findSpac = 16.0;
    findSpan = (findSpac-1.0)/2.0;
    findStart = findSpan+1.0;
    
    i_AlgDynTestv3_v5 = colon(findStart,findSpac,ad_len); int i_AlgDynTestv3_i5;
    for (i_AlgDynTestv3_i5=0;i_AlgDynTestv3_i5<i_AlgDynTestv3_v5.cols();i_AlgDynTestv3_i5++) {
      forelem(i_,i_AlgDynTestv3_v5,i_AlgDynTestv3_i5);
      /*[spectP_disturb_peak,num] = */max(spectP_temp(colon(i_-findSpan,1.0,i_+findSpan)),i_o,spectP_disturb_peak, \
        num);
      
      if (istrue(spectP_disturb_peak>spectP_disturb(1.0))) {
        spectP_disturb(1.0) = spectP_disturb_peak;
        Harbin_disturb(1.0) = i_-findStart+num;
        array_flag = 1.0;
      } else {
        
        array_flag = 0.0;
      }
      if (istrue(array_flag==1.0)) {
        jj_AlgDynTestv3_v6 = colon(1.0,1.0,disturb_len-2.0); int jj_AlgDynTestv3_i6;
        for (jj_AlgDynTestv3_i6=0;jj_AlgDynTestv3_i6<jj_AlgDynTestv3_v6.cols();jj_AlgDynTestv3_i6++) {
          forelem(jj,jj_AlgDynTestv3_v6,jj_AlgDynTestv3_i6);
          k_AlgDynTestv3_v7 = colon(1.0,1.0,(disturb_len-jj)); int k_AlgDynTestv3_i7;
          for (k_AlgDynTestv3_i7=0;k_AlgDynTestv3_i7<k_AlgDynTestv3_v7.cols();k_AlgDynTestv3_i7++) {
            forelem(k,k_AlgDynTestv3_v7,k_AlgDynTestv3_i7);
            if (istrue(spectP_disturb(k)>spectP_disturb(k+1.0))) {
              spectP_disturb_temp = spectP_disturb(k);
              spectP_disturb(k) = spectP_disturb(k+1.0);
              spectP_disturb(k+1.0) = spectP_disturb_temp;
              Harbin_disturb_temp = Harbin_disturb(k);
              Harbin_disturb(k) = Harbin_disturb(k+1.0);
              Harbin_disturb(k+1.0) = Harbin_disturb_temp;
              
            }
          }
        }
      }
    }
    Ph_disturb = nop_M;
    Ph_disturb_dB = nop_M;
    Ph_disturb_BW = nop_M;
    Fn_disturb = (Harbin_disturb-ad_len/2.0)/(ad_len);
    i_AlgDynTestv3_v8 = colon(1.0,1.0,disturb_len); int i_AlgDynTestv3_i8;
    for (i_AlgDynTestv3_i8=0;i_AlgDynTestv3_i8<i_AlgDynTestv3_v8.cols();i_AlgDynTestv3_i8++) {
      forelem(i_,i_AlgDynTestv3_v8,i_AlgDynTestv3_i8);
      if (istrue((Harbin_disturb(i_)-spanh_har)<1.0)) {
        min_Harbin = 1.0;
      } else {
        
        min_Harbin = Harbin_disturb(i_)-spanh_har;
      }
      
      if (istrue((Harbin_disturb(i_)+spanh_har)>length(spectP))) {
        max_Harbin = length(spectP);
      } else {
        
        max_Harbin = Harbin_disturb(i_)+spanh_har;
      }
      if (istrue(Harbin_disturb(i_)<(ad_len/2.0+BW_len-spanh_har))&&istrue()&&istrue(Harbin_disturb(i_)>(ad_len/2.0-BW_len+spanh_har) \
        )) {
        Ph_disturb_BW = (BR(Ph_disturb_BW),sum(spectP(colon(min_Harbin,1.0,max_Harbin))));
      }
      
      Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(min_Harbin,1.0,max_Harbin))));
      Ph_disturb_dB = (BR(Ph_disturb_dB),sum(ADout_dB(colon(min_Harbin,1.0,max_Harbin))));
    }
    Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    Pd_disturb_dB = sum(Ph_disturb_dB(colon(1.0,1.0,disturb_len)));
    
    Pd = sum(Ph(colon(2.0,1.0,10.0)));
    Pd_dB = sum(Ph_dB(colon(2.0,1.0,10.0)));
    Pd_dB_1 = sum(Ph_dB_1(colon(2.0,1.0,10.0)));
    Pd_dB_2 = Pd_dB+Pd_dB_1;
    
    Pn = (sum(spectP(colon(1.0,1.0,ad_len)))-Pdc-Ps-Pd);
    //%%Pn_dB = (sum(ADout_dB((ad_len/2-BW_len):ad_len/2+BW_len))-Pdc_dB-Ps_dB-Pd_dB_2 - Pd_disturb_dB)/(2*BW_len) - ref_dB;
    Pn_dB = 10.0*log10((sum(spectP(colon((ad_len/2.0-BW_len),1.0,ad_len/2.0+BW_len)))-sum(Ps)-sum(Pdc)-sum(Ph_disturb_BW) \
      )/(2.0*BW_len))-ref_dB;
    // Vin = 20*log10(Vpp/2);
    Vin = maxdB-ref_dB;
    SINAD = 10.0*log10(Ps/(Pn+Pd));
    SNR = 10.0*log10(Ps/Pn);
    
    THD = 10.0*log10(Pd/Ps);
    SFDR = 10.0*log10(Ps/max(max(Ph(colon(2.0,1.0,10.0)),max(Ph_disturb(colon(1.0,1.0,disturb_len))))));
    
    HD = 10.0*log10(Ph(colon(1.0,1.0,10.0))/Ph(1.0));
    
    SNRFS = SNR+abs(maxdB-ref_dB);
    ENOB = (SINAD-1.76)/6.02;
    ENOBFS = ENOB+abs(maxdB-ref_dB)/6.02;
    // A = [AmpMax,AmpMin];
    // AdB = Vin;
    HD = (BR(ADout_dB(Harbin(2.0))-ref_dB),ADout_dB(Harbin(2.0))-ref_dB,ADout_dB(Harbin(3.0))-ref_dB,ADout_dB(Harbin( \
      4.0))-ref_dB,ADout_dB(Harbin(5.0))-ref_dB,ADout_dB(Harbin(6.0))-ref_dB,ADout_dB(Harbin(7.0))-ref_dB,ADout_dB( \
      Harbin(8.0))-ref_dB,ADout_dB(Harbin(9.0))-ref_dB,ADout_dB(Harbin(10.0))-ref_dB);
    
    Spectrum = ADout_dB-ref_dB;
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    fpga_i.setname(NULL); fpga_q.setname(NULL); numpt.setname(NULL); fclk.setname(NULL); VppFs.setname(NULL); numbit.setname( \
      NULL); r.setname(NULL); 
    SNR__o=SNR; SINAD__o=SINAD; SFDR__o=SFDR; ENOB__o=ENOB; HD__o=HD; Fh__o=Fh; Harbin__o=Harbin; THD__o=THD; Spectrum__o=Spectrum;  \
      
    return x_M;
    end_scope
  }
  
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(SNR__o); dMm(SINAD__o); dMm(SFDR__o); dMm(ENOB__o); dMm(HD__o); dMm(Fh__o); dMm(Harbin__o); dMm(THD__o);  \
      dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(SNR__o);
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(SFDR__o); dMm(ENOB__o); dMm(HD__o); dMm(Fh__o); dMm(Harbin__o); dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(ENOB__o); dMm(HD__o); dMm(Fh__o); dMm(Harbin__o); dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=4.0; nargout_set=1;
    dMm(HD__o); dMm(Fh__o); dMm(Harbin__o); dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=5.0; nargout_set=1;
    dMm(Fh__o); dMm(Harbin__o); dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=6.0; nargout_set=1;
    dMm(Harbin__o); dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=7.0; nargout_set=1;
    dMm(THD__o); dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTestv3(Mm fpga_i, Mm fpga_q, Mm numpt, Mm fclk, Mm VppFs, Mm numbit, Mm r, i_o_t, Mm& SNR__o, Mm& SINAD__o, \
     Mm& SFDR__o, Mm& ENOB__o, Mm& HD__o, Mm& Fh__o, Mm& Harbin__o, Mm& THD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=8.0; nargout_set=1;
    dMm(Spectrum__o); 
    AlgDynTestv3(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o, HD__o, Fh__o, \
       Harbin__o, THD__o, Spectrum__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
