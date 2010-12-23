  #include "matlib.h"
  #pragma hdrstop
  
  #include "AdcDynTest.h"
  #include "chebwin.h"
  
  
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o, Mm& Pn_dB__o) {
    begin_scope
    ADout.setname("ADout"); fclk.setname("fclk"); numbit.setname("numbit"); NFFT.setname("NFFT"); V.setname("V");  \
      code.setname("code"); 
    dMm(SNR); dMm(SFDR); dMm(SNRFS); dMm(SINAD); dMm(THD); dMm(HD); dMm(ENOB); dMm(ENOBFS); dMm(Pn_dB); dMm(ad_len_N) \
      ; dMm(maxADout); dMm(AmpMax); dMm(t1); dMm(AmpMin); dMm(t2); dMm(Vpp); dMm(ADout_w); dMm(AA); dMm(ad_len); dMm( \
      ADout_spect); dMm(ADout_dB); dMm(maxdB); dMm(fin); dMm(freq_fin); dMm(data_ref); dMm(n); dMm(n_calc_dynam_params_v0) \
      ; dMm(data_ref_w); dMm(data_ref_spect); dMm(data_ref_dB); dMm(ref_dB); dMm(a1); dMm(span); dMm(spanh_har); dMm( \
      span_s); dMm(spectP); dMm(Pdc); dMm(Pdc_dB); dMm(Ps); dMm(Ps_dB); dMm(Fh); dMm(Ph); dMm(Harbin); dMm(Ph_dB);  \
      dMm(har_num); dMm(har_num_calc_dynam_params_v1); dMm(tone); dMm(har_peak); dMm(har_bin); dMm(spectP_temp); dMm( \
      i_); dMm(i_calc_dynam_params_v2); dMm(disturb_len); dMm(spectP_disturb); dMm(Harbin_disturb); dMm(findSpac);  \
      dMm(findSpan); dMm(findStart); dMm(i_calc_dynam_params_v3); dMm(spectP_disturb_peak); dMm(num); dMm(array_flag) \
      ; dMm(jj); dMm(jj_calc_dynam_params_v4); dMm(k); dMm(k_calc_dynam_params_v5); dMm(spectP_disturb_temp); dMm(Harbin_disturb_temp) \
      ; dMm(Ph_disturb); dMm(Ph_disturb_dB); dMm(Fn_disturb); dMm(i_calc_dynam_params_v6); dMm(Pd_disturb); dMm(Pd_disturb_dB) \
      ; dMm(Pd); dMm(Pd_dB); dMm(Pn); dMm(Vin); dMm(NFFT_txt); dMm(FRQ_txt); dMm(FFT_txt); dMm(FREQ_txt); dMm(DBFS_txt) \
      ; dMm(SNR_txt); dMm(SFDR_txt); dMm(i_calc_dynam_params_v7); dMm(VPP_txt); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=6.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=9.0;
    nargout_set=0;
    
    // translated code
    
    // Pn_dB为底噪声，fclk为采样频率，numbit为采样精度，NFFT为FFT的深度，V为峰峰值，TPY和TPX分别为时域图的Y和X轴，code
    // 为1：补码，2：偏移码，3：格雷码。
    //例子：若采样时钟80MHZ，精度16为，峰峰值2v，时域图显示Y轴＋－1V和X轴0－0.01ms，码源为补码
    //[SNR, SFDR, SNRFS,SINAD, THD, HD, ENOB, ENOBFS, Pn_dB] = calc_dynam_params(80e6, 16, 32768, 2, 1, 0.01, 1)
    // clear all
    // close all
    // format long
    // fclk = 80e6;
    // numbit = 14;
    // V = 2;
    // NFFT = 32768;
    // TPY = 1;
    // TPX = 0.01;
    // code = 1;
    // fid = fopen('adc_0dbm.txt');%;
    // fid = fopen('SNR测试_A通道_20090105053713.txt');
    
    
    //fid = fopen('adc_0dbm.txt');
    //ADout = fscanf(fid,'%d');
    
    
    if (istrue(code==1.0)) {
      if (istrue(numbit<16.0)) {
        ADout = fix(ADout/mpower(2.0,(16.0-numbit)));
      }
      ADout = ADout/mpower(2.0,(numbit-1.0));
      
    } else
    if (istrue(code==2.0)) {
      if (istrue(numbit<16.0)) {
        ADout = fix(ADout/mpower(2.0,(16.0-numbit)));
      }
      ADout = ADout/mpower(2.0,(numbit-1.0))-1.0;
    } else {
      
      if (istrue(numbit<16.0)) {
        ADout = fix(ADout/mpower(2.0,(16.0-numbit)));
      }
      //    ADout = gray2bin(ADout) / 2^(numbit-1) - 1;
    }
    
    ADout = V/2.0*ADout;
    
    // ADout=input('the number of bits is');
    // ADout=ADout/2^(numbit-1);
    ad_len_N = length(ADout);
    //ref_dB = 74.666;%0dbm时候的计算值。75.25
    
    maxADout = max(abs(ADout));
    /*[AmpMax,t1] = */max(ADout,i_o,AmpMax,t1);
    /*[AmpMin,t2] = */min(ADout,i_o,AmpMin,t2);
    Vpp = AmpMax-AmpMin;
    
    
    ADout_w = times(ADout,chebwin(ad_len_N,200.0));
    //ADout_w=ADout.*chebwin(ad_len);
    AA = zeros(NFFT-ad_len_N,1.0);
    ADout_w = (BR(ADout_w),semi,
    AA);
    ad_len = length(ADout_w);
    ADout_spect = fft(ADout_w,NFFT);
    ADout_dB = 20.0*log10(abs(ADout_spect));
    
    //Display the results in the frequency domain with an FFT plot 
    //figure; 
    maxdB = max(ADout_dB(colon(1.0,1.0,ad_len/2.0)));
    fin = find(ADout_dB(colon(1.0,1.0,ad_len/2.0))==maxdB);
    
    freq_fin = (fin*fclk/ad_len);
    
    //refdB
    data_ref = zeros(ad_len_N,1.0);
    n_calc_dynam_params_v0 = colon(1.0,1.0,ad_len_N); int n_calc_dynam_params_i0;
    for (n_calc_dynam_params_i0=0;n_calc_dynam_params_i0<n_calc_dynam_params_v0.cols();n_calc_dynam_params_i0++)  \
      {
      forelem(n,n_calc_dynam_params_v0,n_calc_dynam_params_i0);
      
      data_ref(n) = V/2.0*sin((n-1.0)*(freq_fin)/fclk*2.0*pi);
    }
    data_ref_w = times(data_ref,chebwin(ad_len_N,200.0));
    
    data_ref_w = (BR(data_ref_w),semi,
    AA);
    data_ref_spect = fft(data_ref_w,NFFT);
    data_ref_dB = 20.0*log10(abs(data_ref_spect));
    ref_dB = max(data_ref_dB(colon(1.0,1.0,ad_len/2.0)));
    display( figure((CL(1.0))) );
    plot((CL(times((BR(colon(0.0,1.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-20.0,TM("-k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,50.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-40.0,TM("--k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,1.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-60.0,TM("-k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,50.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-80.0,TM("--k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,1.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-100.0,TM("-k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,50.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),-120.0,TM("--k")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,1.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),ADout_dB(colon(1.0,1.0,round(ad_len/2.0) \
      ))-ref_dB));
    
    
    title((CL(TM("FFT PLOT"))));
    
    xlabel((CL(TM("ANALOG INPUT FREQUENCY (MHz)"))));
    ylabel((CL(TM("AMPLITUDE (dBFs)"))));
    a1 = axis();
    axis((BR(a1(1.0)),a1(2.0),-140.0,0.0));
    
    
    //Calculate SNR, SINAD, THD and SFDR values
    //Find the signal bin number, DC = bin 1
    
    //Span of the DC on each side
    span = max(11.0);
    
    
    //Searching span for peak harmonics amp on each side  
    spanh_har = 4.0;
    //Span of the signal on each side
    span_s = 19.0;
    //8
    //Determine power spectrum
    spectP = times((abs(ADout_spect)),(abs(ADout_spect)));
    
    //Find DC offset power 
    Pdc = sum(spectP(colon(1.0,1.0,span)));
    
    Pdc_dB = sum(ADout_dB(colon(1.0,1.0,span)));
    //Extract overall signal power 
    Ps = sum(spectP(colon(fin-span_s,1.0,fin+span_s)));
    Ps_dB = sum(ADout_dB(colon(fin-span_s,1.0,fin+span_s)));
    //Vector/matrix to store both frequency and power of signal and harmonics
    Fh = nop_M;
    
    
    //The 1st element in the vector/matrix represents the signal, the next element represents
    //the 2nd harmonic, etc.
    Ph = nop_M;
    
    Harbin = nop_M;
    Ph_dB = nop_M;
    
    har_num_calc_dynam_params_v1 = colon(1.0,1.0,11.0); int har_num_calc_dynam_params_i1;
    for (har_num_calc_dynam_params_i1=0;har_num_calc_dynam_params_i1<har_num_calc_dynam_params_v1.cols();har_num_calc_dynam_params_i1++) \
       {
      forelem(har_num,har_num_calc_dynam_params_v1,har_num_calc_dynam_params_i1);
      
      tone = rem((har_num*(fin-1.0)+1.0)/ad_len,1.0);
      
      if (istrue(tone>0.5)) {
        
        tone = 1.0-tone;
        
      }
      
      Fh = (BR(Fh),tone);
      
      
      har_peak = max(spectP(colon(round(tone*ad_len)-spanh_har,1.0,round(tone*ad_len)+spanh_har)));
      
      har_bin = find(spectP(colon(round(tone*ad_len)-spanh_har,1.0,round(tone*ad_len)+spanh_har))==har_peak);
      har_bin = har_bin+round(tone*ad_len)-spanh_har-1.0;
      Ph = (BR(Ph),sum(spectP(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      
      Ph_dB = (BR(Ph_dB),sum(ADout_dB(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      Harbin = (BR(Harbin),har_bin);
    }
    
    
    spectP_temp = spectP;
    
    i_calc_dynam_params_v2 = colon(2.0,1.0,10.0); int i_calc_dynam_params_i2;
    for (i_calc_dynam_params_i2=0;i_calc_dynam_params_i2<i_calc_dynam_params_v2.cols();i_calc_dynam_params_i2++)  \
      {
      forelem(i_,i_calc_dynam_params_v2,i_calc_dynam_params_i2);
      spectP_temp(colon(Harbin(i_)-spanh_har,1.0,Harbin(i_)+spanh_har)) = 0.0;
    }
    spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    spectP_temp(colon(1.0,1.0,span)) = 0.0;
    
    
    
    disturb_len = 19.0;
    spectP_disturb = zeros(1.0,disturb_len);
    Harbin_disturb = zeros(1.0,disturb_len);
    findSpac = 30.0;
    findSpan = (findSpac-1.0)/2.0;
    findStart = findSpan+1.0;
    
    i_calc_dynam_params_v3 = colon(findStart,findSpac,ad_len/2.0); int i_calc_dynam_params_i3;
    for (i_calc_dynam_params_i3=0;i_calc_dynam_params_i3<i_calc_dynam_params_v3.cols();i_calc_dynam_params_i3++)  \
      {
      forelem(i_,i_calc_dynam_params_v3,i_calc_dynam_params_i3);
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
        jj_calc_dynam_params_v4 = colon(1.0,1.0,disturb_len-2.0); int jj_calc_dynam_params_i4;
        for (jj_calc_dynam_params_i4=0;jj_calc_dynam_params_i4<jj_calc_dynam_params_v4.cols();jj_calc_dynam_params_i4++) \
           {
          forelem(jj,jj_calc_dynam_params_v4,jj_calc_dynam_params_i4);
          k_calc_dynam_params_v5 = colon(1.0,1.0,(disturb_len-jj)); int k_calc_dynam_params_i5;
          for (k_calc_dynam_params_i5=0;k_calc_dynam_params_i5<k_calc_dynam_params_v5.cols();k_calc_dynam_params_i5++) \
             {
            forelem(k,k_calc_dynam_params_v5,k_calc_dynam_params_i5);
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
    Fn_disturb = Harbin_disturb/(ad_len);
    i_calc_dynam_params_v6 = colon(1.0,1.0,disturb_len); int i_calc_dynam_params_i6;
    for (i_calc_dynam_params_i6=0;i_calc_dynam_params_i6<i_calc_dynam_params_v6.cols();i_calc_dynam_params_i6++)  \
      {
      forelem(i_,i_calc_dynam_params_v6,i_calc_dynam_params_i6);
      Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_)+spanh_har) \
        )));
      Ph_disturb_dB = (BR(Ph_disturb_dB),sum(ADout_dB(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_)+spanh_har) \
        )));
    }
    Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    Pd_disturb_dB = sum(Ph_disturb_dB(colon(1.0,1.0,disturb_len)));
    
    Pd = sum(Ph(colon(2.0,1.0,10.0)));
    Pd_dB = sum(Ph_dB(colon(2.0,1.0,10.0)));
    
    
    Pn = (sum(spectP(colon(1.0,1.0,ad_len/2.0)))-Pdc-Ps-Pd);
    Pn_dB = (sum(ADout_dB(colon(1.0,1.0,ad_len/2.0)))-Pdc_dB-Ps_dB-Pd_dB-Pd_disturb_dB)*2.0/ad_len-ref_dB;
    // Vin = 20*log10(Vpp/2);
    Vin = maxdB-ref_dB;
    SINAD = 10.0*log10(Ps/(Pn+Pd));
    SNR = 10.0*log10(Ps/Pn);
    
    disp(TM("THD is calculated from 2nd through 5th order harmonics"));
    THD = 10.0*log10(Pd/Ph(1.0));
    SFDR = 10.0*log10(Ph(1.0)/max(max(Ph(colon(2.0,1.0,10.0)),max(Ph_disturb(colon(1.0,1.0,disturb_len))))));
    
    disp(TM("Signal & Harmonic Power Components:"));
    HD = 10.0*log10(Ph(colon(1.0,1.0,10.0))/Ph(1.0));
    
    
    
    
    hold(TM("on"));
    
    
    plot((CL(Fh(2.0)*fclk),ADout_dB(Harbin(2.0))-ref_dB,TM("rv"),Fh(3.0)*fclk,ADout_dB(Harbin(3.0))-ref_dB,TM("rv") \
      ,Fh(4.0)*fclk,ADout_dB(Harbin(4.0))-ref_dB,TM("rv"),Fh(5.0)*fclk,ADout_dB(Harbin(5.0))-ref_dB,TM("rv"),Fh(6.0) \
      *fclk,ADout_dB(Harbin(6.0))-ref_dB,TM("rv"),Fh(7.0)*fclk,ADout_dB(Harbin(7.0))-ref_dB,TM("rv"),Fh(8.0)*fclk,ADout_dB( \
      Harbin(8.0))-ref_dB,TM("rv"),Fh(9.0)*fclk,ADout_dB(Harbin(9.0))-ref_dB,TM("rv"),Fh(10.0)*fclk,ADout_dB(Harbin( \
      10.0))-ref_dB,TM("rv")));
    hold(TM("on"));
    plot((CL(times((BR(colon(0.0,1.0,round(ad_len/2.0)-1.0))),fclk)/ad_len),Pn_dB,TM("m-")));
    mswitch ((NFFT)) {
      beginmswitch {
        break;
      }
      mcase (16384.0) {
        NFFT_txt = TM("16K");
        break;
      }
      mcase (32768.0) {
        NFFT_txt = TM("32K");
        break;
      }
      mcase (65536.0) {
        NFFT_txt = TM("64K");
        
      }
    } endmswitch;
    FRQ_txt = num2str(freq_fin/1000000.0,TM("%2.1f"));
    FRQ_txt = strcat((CL(FRQ_txt),TM("MHz")));
    FFT_txt = strcat((CL(NFFT_txt),TM(" FFT")));
    FREQ_txt = strcat((CL(num2str(fclk/1000000.0,TM("%2d"))),TM("MSPS")));
    DBFS_txt = strcat((CL(FRQ_txt),TM("@"),num2str(maxdB-ref_dB,TM("%2.1f")),TM("dBFs")));
    SNR_txt = strcat((CL(TM("SNR =")),num2str(SNR,TM("% 2.3f")),TM(" dBc")));
    SFDR_txt = strcat((CL(TM("SFDR =  ")),num2str(SFDR,TM("% 2.3f")),TM(" dBc")));
    // SINAD_txt = strcat('SINAD: ',num2str(SINAD,'%2.3f'),' dB');
    // THD_txt = strcat('THD: ',num2str(THD,'%2.3f'),' dB');
    text((CL(fclk*5.6/16.0),-5.0,FFT_txt,TM("HorizontalAlignment"),TM("left"),TM("Color"),TM("r")));
    text((CL(fclk*5.6/16.0),-13.0,FREQ_txt,TM("HorizontalAlignment"),TM("left"),TM("Color"),TM("r")));
    text((CL(fclk*5.6/16.0),-21.0,DBFS_txt,TM("HorizontalAlignment"),TM("left"),TM("Color"),TM("r")));
    text((CL(fclk*5.6/16.0),-29.0,SNR_txt,TM("HorizontalAlignment"),TM("left"),TM("Color"),TM("r")));
    text((CL(fclk*5.6/16.0),-37.0,SFDR_txt,TM("HorizontalAlignment"),TM("left"),TM("Color"),TM("r")));
    //text(fclk*6/16,-55,THD_txt,'HorizontalAlignment','left','Color','r');
    text((CL(Fh(2.0)*fclk),ADout_dB(Harbin(2.0))-ref_dB+2.0,TM("2"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(3.0)*fclk),ADout_dB(Harbin(3.0))-ref_dB+2.0,TM("3"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(4.0)*fclk),ADout_dB(Harbin(4.0))-ref_dB+2.0,TM("4"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(5.0)*fclk),ADout_dB(Harbin(5.0))-ref_dB+2.0,TM("5"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(6.0)*fclk),ADout_dB(Harbin(6.0))-ref_dB+2.0,TM("6"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(7.0)*fclk),ADout_dB(Harbin(7.0))-ref_dB+2.0,TM("7"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(8.0)*fclk),ADout_dB(Harbin(8.0))-ref_dB+2.0,TM("8"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(9.0)*fclk),ADout_dB(Harbin(9.0))-ref_dB+2.0,TM("9"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    text((CL(Fh(10.0)*fclk),ADout_dB(Harbin(10.0))-ref_dB+2.0,TM("10"),TM("VerticalAlignmen"),TM("bottom"),TM("Color") \
      ,TM("r")));
    hold(TM("on"));
    i_calc_dynam_params_v7 = colon(0.0,1.0,disturb_len/2.0); int i_calc_dynam_params_i7;
    for (i_calc_dynam_params_i7=0;i_calc_dynam_params_i7<i_calc_dynam_params_v7.cols();i_calc_dynam_params_i7++)  \
      {
      forelem(i_,i_calc_dynam_params_v7,i_calc_dynam_params_i7);
      hold(TM("on"));
      plot((CL(Fn_disturb(disturb_len-i_)*fclk),ADout_dB(Harbin_disturb(disturb_len-i_))-ref_dB,TM("g*")));
    }
    hold(TM("off"));
    
    
    VPP_txt = strcat((CL(num2str(Vpp,TM("%2.3f"))),TM(" Vpp")));
    display( figure((CL(2.0))) );
    
    plot((CL(times((BR(colon(1.0,1.0,ad_len_N))),1000.0)/fclk),ADout(colon(1.0,1.0,ad_len_N))));
    title((CL(TM("Time PLOT"))));
    
    xlabel((CL(TM("TIME (ms)"))));
    ylabel((CL(TM("AMPLITUDE (V)"))));
    hold(TM("on"));
    //axis([0 TPX -TPY TPY]);
    // text(t1,AmpMax,num2str(AmpMax),'VerticalAlignmen','bottom');
    // text(t1,AmpMin,num2str(AmpMin),'VerticalAlignmen','top')
    // text(TPX*0.85,0.9*TPY,VPP_txt,'HorizontalAlignment','left','Color','r')
    // text(TPX*0.85,0.8*TPY,FRQ_txt,'HorizontalAlignment','left','Color','r')
    SNRFS = SNR+abs(maxdB-ref_dB);
    ENOB = (SINAD-1.76)/6.02;
    ENOBFS = ENOB+abs(maxdB-ref_dB)/6.02;
    // A = [AmpMax,AmpMin];
    // AdB = Vin;
    HD = (BR(ADout_dB(Harbin(2.0))-ref_dB),ADout_dB(Harbin(2.0))-ref_dB,ADout_dB(Harbin(3.0))-ref_dB,ADout_dB(Harbin( \
      4.0))-ref_dB,ADout_dB(Harbin(5.0))-ref_dB,ADout_dB(Harbin(6.0))-ref_dB,ADout_dB(Harbin(7.0))-ref_dB,ADout_dB( \
      Harbin(8.0))-ref_dB,ADout_dB(Harbin(9.0))-ref_dB,ADout_dB(Harbin(10.0))-ref_dB);
    
    //Spectrum = ADout_dB - ref_dB;TPX*0.85,0.8*TPY,FRQ_txt,'HorizontalAlignment','left','Color','r')
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    ADout.setname(NULL); fclk.setname(NULL); numbit.setname(NULL); NFFT.setname(NULL); V.setname(NULL); code.setname( \
      NULL); 
    SNR__o=SNR; SFDR__o=SFDR; SNRFS__o=SNRFS; SINAD__o=SINAD; THD__o=THD; HD__o=HD; ENOB__o=ENOB; ENOBFS__o=ENOBFS;  \
      Pn_dB__o=Pn_dB; 
    return x_M;
    end_scope
  }
  
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(SNR__o); dMm(SFDR__o); dMm(SNRFS__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(ENOB__o); dMm(ENOBFS__o) \
      ; dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(SNR__o);
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(SNRFS__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(ENOB__o); dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(ENOB__o); dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=4.0; nargout_set=1;
    dMm(THD__o); dMm(HD__o); dMm(ENOB__o); dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o, Mm& THD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=5.0; nargout_set=1;
    dMm(HD__o); dMm(ENOB__o); dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o, Mm& THD__o, Mm& HD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=6.0; nargout_set=1;
    dMm(ENOB__o); dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=7.0; nargout_set=1;
    dMm(ENOBFS__o); dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm code, i_o_t, Mm& SNR__o, Mm& SFDR__o, Mm& SNRFS__o, \
     Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& ENOB__o, Mm& ENOBFS__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=6.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=8.0; nargout_set=1;
    dMm(Pn_dB__o); 
    AdcDynTest(ADout, fclk, numbit, NFFT, V, code, i_o, SNR__o, SFDR__o, SNRFS__o, SINAD__o, THD__o, HD__o, ENOB__o, \
       ENOBFS__o, Pn_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
