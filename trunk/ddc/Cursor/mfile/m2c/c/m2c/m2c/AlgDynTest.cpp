  #include "matlib.h"
  #pragma hdrstop
  
  #include "AlgDynTest.h"
  #include "hanning.h"
  #include "check_order.h"
  
  
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o, Mm&  \
    ENOB__o) {
    begin_scope
    data1.setname("data1"); data2.setname("data2"); numpt.setname("numpt"); fclk.setname("fclk"); numbit.setname( \
      "numbit"); 
    dMm(SNR); dMm(SINAD); dMm(SFDR); dMm(ENOB); dMm(fpga_i); dMm(fpga_q); dMm(fpga_len); dMm(FPGAout); dMm(FPGAout_w) \
      ; dMm(FPGAout_spect); dMm(FPGAout_dB); dMm(maxdB); dMm(fin); dMm(span); dMm(spanh_har); dMm(span_s); dMm(spectP) \
      ; dMm(Pdc); dMm(Ps); dMm(Fh); dMm(Ph); dMm(Harbin); dMm(har_num); dMm(har_num_AlgDynTest_v0); dMm(tone); dMm( \
      har_peak); dMm(har_bin); dMm(spectP_temp); dMm(i_); dMm(i_AlgDynTest_v1); dMm(disturb_len); dMm(spectP_disturb) \
      ; dMm(Harbin_disturb); dMm(findSpac); dMm(findSpan); dMm(findStart); dMm(i_AlgDynTest_v2); dMm(spectP_disturb_peak) \
      ; dMm(num); dMm(array_flag); dMm(l); dMm(l_AlgDynTest_v3); dMm(k); dMm(k_AlgDynTest_v4); dMm(spectP_disturb_temp) \
      ; dMm(Harbin_disturb_temp); dMm(Ph_disturb); dMm(Fn_disturb); dMm(i_AlgDynTest_v5); dMm(Pd_disturb); dMm(Pd);  \
      dMm(Pn); dMm(AdBm); dMm(THD); dMm(HD); dMm(allDisturb); dMm(SFDR_mdfy); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=5.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=4.0;
    nargout_set=0;
    
    // translated code
    
    
    // clear all
    // close all
    
    // numbit=16;
    
    // fs = 80e6;   % sampling rate MHz 
    // r = 20;      % r>0;
    //AD amp deviation
    
    //r=20;
    //r=2;
    //NFFT=256;
    // NFFT=800;
    // fclk=80e6/r;
    //fid = fopen('F:\project\DDC_CETC14_STEP2\fpga\FPGA_STEP1\FPGA_test\s60d_2.txt');
    // fid1 = fopen('IQ20090122060735DI.txt');
    // fid2 = fopen('IQ20090122060735DQ.txt');
    fpga_i = data1(colon(1.0,1.0,numpt))/mpower(2.0,(numbit-1.0));
    fpga_q = data2(colon(1.0,1.0,numpt))/mpower(2.0,(numbit-1.0));
    
    // fpga_len = length(fpga);
    // fpga_i_cnt = 1;
    // fpga_q_cnt = 1;
    // 
    // for i = 1:fpga_len    %i first
    //     k = mod(i,r);
    //     if (k == 1)
    //         fpga_i(fpga_i_cnt) = fpga(i);
    //         fpga_i_cnt = fpga_i_cnt + 1;
    //     end
    //     if (k == 2)
    //         fpga_q(fpga_q_cnt) = fpga(i);
    //         fpga_q_cnt = fpga_q_cnt + 1;
    //     end
    // end
    
    fpga_len = length(fpga_i);
    
    
    
    // figure(1)
    // plot(fpga_i);
    // figure(2)
    // plot(fpga_q);
    
    FPGAout = fpga_i+j*fpga_q;
    FPGAout = ctranspose(FPGAout);
    //FPGAout_w=FPGAout.*hanning(fpga_len);
    FPGAout_w = times(FPGAout,ctranspose(hanning((CL(fpga_len)))));
    
    FPGAout_spect = fft(FPGAout_w);
    
    
    FPGAout_dB = 20.0*log10(abs(FPGAout_spect));
    
    //Display the results in the frequency domain with an FFT plot 
    //figure; 
    maxdB = max(FPGAout_dB(colon(1.0,1.0,fpga_len)));
    // figure(3)
    // %For TTIMD, use the following short routine, normalized to ¡ª6.5dB full-scale.
    // plot([0:round(fpga_len/2)-1].*fclk/fpga_len,FPGAout_dB(1:round(fpga_len/2))-maxdB);
    
    //plot([0:numpt/2-1].*fclk/numpt,Dout_dB(1:numpt/2)-maxdB); 
    // grid on; 
    // title('FFT PLOT'); 
    // xlabel('ANALOG INPUT FREQUENCY (MHz)');
    // ylabel('AMPLITUDE (dB)');
    // a1=axis; axis([a1(1) a1(2) -120 a1(4)]); 
    
    //Calculate SNR, SINAD, THD and SFDR values
    //Find the signal bin number, DC = bin 1
    fin = find(FPGAout_dB(colon(1.0,1.0,fpga_len/2.0))==maxdB); display(fin);
    
    //Span of the DC on each side
    span = max(2.0);
    
    
    //Searching span for peak harmonics amp on each side  
    spanh_har = 2.0;
    //Span of the signal on each side
    span_s = 12.0; display(span_s);
    // max(round(fpga_len/200),5);
    //Determine power spectrum
    spectP = times((abs(FPGAout_spect)),(abs(FPGAout_spect)));
    
    //Find DC offset power 
    Pdc = sum(spectP(colon(1.0,1.0,span)));
    
    
    //Extract overall signal power 
    Ps = sum(spectP(colon(fin-span_s,1.0,fin+span_s)));
    //Vector/matrix to store both frequency and power of signal and harmonics
    Fh = nop_M;
    
    
    //The 1st element in the vector/matrix represents the signal, the next element represents
    //the 2nd harmonic, etc.
    Ph = nop_M;
    
    Harbin = nop_M;
    //Find harmonic frequencies and power components in the FFT spectrum 
    har_num_AlgDynTest_v0 = colon(1.0,1.0,10.0); int har_num_AlgDynTest_i0;
    for (har_num_AlgDynTest_i0=0;har_num_AlgDynTest_i0<har_num_AlgDynTest_v0.cols();har_num_AlgDynTest_i0++) {
      forelem(har_num,har_num_AlgDynTest_v0,har_num_AlgDynTest_i0);
      //Input tones greater than fSAMPLE are aliased back into the spectrum
      tone = rem((har_num*(fin-1.0)+1.0)/fpga_len,1.0);
      //returns X - n.*Y where n = fix(X./Y)
      
      if (istrue(tone>0.5)) {
        //Input tones greater than 0.5*fSAMPLE (after aliasing) are reflected
        tone = 1.0-tone;
        
      }
      
      Fh = (BR(Fh),tone);
      
      //For this procedure to work, ensure the folded back high order harmonics do not overlap 
      //with DC or signal or lower order harmonics 
      har_peak = max(spectP(colon(round(tone*fpga_len)-spanh_har,1.0,round(tone*fpga_len)+spanh_har)));
      
      har_bin = find(spectP(colon(round(tone*fpga_len)-spanh_har,1.0,round(tone*fpga_len)+spanh_har))==har_peak);
      har_bin = har_bin+round(tone*fpga_len)-spanh_har-1.0;
      Ph = (BR(Ph),sum(spectP(colon(har_bin-2.0,1.0,har_bin+2.0))));
      
      Harbin = (BR(Harbin),har_bin);
    }
    
    //temp power spectrum array
    spectP_temp = spectP;
    //Set zero amp to Ps Ph and Pd in temp array 
    i_AlgDynTest_v1 = colon(2.0,1.0,10.0); int i_AlgDynTest_i1;
    for (i_AlgDynTest_i1=0;i_AlgDynTest_i1<i_AlgDynTest_v1.cols();i_AlgDynTest_i1++) {
      forelem(i_,i_AlgDynTest_v1,i_AlgDynTest_i1);
      spectP_temp(colon(Harbin(i_)-2.0,1.0,Harbin(i_)+2.0)) = 0.0;
    }
    spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    spectP_temp(colon(1.0,1.0,2.0)) = 0.0;
    
    
    // Find max disturb signal
    // Num of disturb signal 
    disturb_len = 20.0;
    
    spectP_disturb = zeros(1.0,disturb_len);
    Harbin_disturb = zeros(1.0,disturb_len);
    findSpac = 11.0;
    findSpan = (findSpac-1.0)/2.0;
    findStart = findSpan+1.0;
    
    // sif modify , varible j -> l, otherwise , compiler error
    i_AlgDynTest_v2 = colon(findStart,findSpac,fpga_len/2.0); int i_AlgDynTest_i2;
    for (i_AlgDynTest_i2=0;i_AlgDynTest_i2<i_AlgDynTest_v2.cols();i_AlgDynTest_i2++) {
      forelem(i_,i_AlgDynTest_v2,i_AlgDynTest_i2);
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
        l_AlgDynTest_v3 = colon(1.0,1.0,disturb_len-2.0); int l_AlgDynTest_i3;
        for (l_AlgDynTest_i3=0;l_AlgDynTest_i3<l_AlgDynTest_v3.cols();l_AlgDynTest_i3++) {
          forelem(l,l_AlgDynTest_v3,l_AlgDynTest_i3);
          k_AlgDynTest_v4 = colon(1.0,1.0,(disturb_len-l)); int k_AlgDynTest_i4;
          for (k_AlgDynTest_i4=0;k_AlgDynTest_i4<k_AlgDynTest_v4.cols();k_AlgDynTest_i4++) {
            forelem(k,k_AlgDynTest_v4,k_AlgDynTest_i4);
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
    Fn_disturb = Harbin_disturb/(fpga_len);
    i_AlgDynTest_v5 = colon(1.0,1.0,disturb_len); int i_AlgDynTest_i5;
    for (i_AlgDynTest_i5=0;i_AlgDynTest_i5<i_AlgDynTest_v5.cols();i_AlgDynTest_i5++) {
      forelem(i_,i_AlgDynTest_v5,i_AlgDynTest_i5);
      Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(Harbin_disturb(i_)-2.0,1.0,Harbin_disturb(i_)+2.0))));
    }
    Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    //Determine the total distortion power 
    Pd = sum(Ph(colon(2.0,1.0,10.0)));
    
    //Determine the noise power 
    Pn = (sum(spectP(colon(1.0,1.0,fpga_len/2.0)))-Pdc-Ps-Pd);
    
    
    format();
    AdBm = 10.0*log10(mpower((max(FPGAout)-min(FPGAout)/2.0),2.0)/100.0)+30.0;
    
    SINAD = 10.0*log10(Ps/(Pn+Pd)); display(SINAD);
    SNR = 10.0*log10(2.0*Ps/Pn); display(SNR);
    // disp('THD is calculated from 2nd through 5th order harmonics');
    THD = 10.0*log10(Pd/Ph(1.0));
    SFDR = 10.0*log10(Ph(1.0)/max(Ph(colon(2.0,1.0,10.0))));
    
    // disp('Signal & Harmonic Power Components:');
    HD = 10.0*log10(Ph(colon(1.0,1.0,10.0))/Ph(1.0));
    
    // disp('SNR is added diffFPGAoutdb');
    //SNR_mdfy=SNR + diffFPGAoutdb
    // disp('SFDR is calculated from peak disturb power');
    allDisturb = (BR(Ph_disturb),Ph(colon(2.0,1.0,10.0)));
    SFDR_mdfy = 10.0*log10(Ph(1.0)/max(allDisturb));
    
    // sif add
    // SNR = SNR_mdfy
    // SINAD = SINAD + diffADoutdb
    SFDR = SFDR_mdfy; display(SFDR);
    ENOB = (SNR-1.763)/6.02; display(ENOB);
    
    //Distinguish all harmonics locations within the FFT plot
    // hold on; 
    // plot(Fh(2)*fclk,0,'mo',Fh(3)*fclk,0,'cx',Fh(4)*fclk,0,'r+',Fh(5)*fclk,0,'g*', Fh(6)*fclk,0,'bs',Fh(7)*fclk,0,'bd',Fh(8)*fclk,0,'kv',Fh(9)*fclk,0,'y^');
    // legend('1st','2nd','3rd','4th','5th','6th','7th','8th','9th');
    // hold on; 
    
    // plot(Fh(2)*fclk,FPGAout_dB(Harbin(2))-maxdB,'ro',Fh(3)*fclk,FPGAout_dB(Harbin(3))-maxdB,'rx',Fh(4)*fclk,FPGAout_dB(Harbin(4))-maxdB,'r+',Fh(5)*fclk,FPGAout_dB(Harbin(5))-maxdB,'r*', Fh(6)*fclk,FPGAout_dB(Harbin(6))-maxdB,'rs',Fh(7)*fclk,FPGAout_dB(Harbin(7))-maxdB,'rd',Fh(8)*fclk,FPGAout_dB(Harbin(8))-maxdB,'rv',Fh(9)*fclk,FPGAout_dB(Harbin(9))-maxdB,'r^');
    // legend('1st','2nd','3rd','4th','5th','6th','7th','8th','9th');
    // hold on;
    // for i = 1:disturb_len
    //     hold on;
    //     plot(Fn_disturb(i)*fclk,FPGAout_dB(Harbin_disturb(i))-maxdB,'g*');
    // end
    // hold off; 
    // figure(4)
    // plot(FPGAout_dB - maxdB)
    
    //Dynamic-Range Specifications, TTIMD 
    
    //Two-tone IMD can be a tricky measurement, because the additional equipment required (a power combiner to combine two input frequencies) can contribute unwanted intermodulation products that falsify the ADC's intermodulation distortion. You must observe the following conditions to optimize IMD performance, although they make the selection of proper input frequencies a tedious task. 
    
    //First, the input tones must fall into the passband of the input filter. If these tones are close together (several tens or hundreds of kilohertz for a megahertz bandwidth), an appropriate window function must be chosen as well. Placing them too close together, however, may allow the power combiner to falsify the overall IMD readings by contributing unwanted 2nd- and 3rd-order IMD products (depending on the input tones' location within the passband). Spacing the input tones too far apart may call for a different window type that has less frequency resolution. 
    
    //The setup also requires a minimum of three phase-locked signal generators. This requirement seldom poses a problem for test labs, but generators have different capabilities for matching frequency and amplitude. Compensating such mismatches to achieve (for example) a -0.5dB FS two-tone envelope and signal amplitudes of -6.5dB FS will increase your effort and test time (see the following program-code extraction). 
    
    //For TTIMD, use the following short routine, normalized to -6.5dB full-scale.
    // plot([0:fpga_len/2-1].*fclk/fpga_len,FPGAout_dB(1:fpga_len/2)-maxdB-6.5); 
    // 
    // plot([0:fpga_len/2-1].*fclk/fpga_len,FPGAout_dB(1:fpga_len/2)-maxdB); 
    // grid on;
    // title('FFT PLOT');
    // xlabel('ANALOG INPUT FREQUENCY (MHz)');
    // ylabel('AMPLITUDE (dB)');
    // a1=axis; axis([a1(1) a1(2) -120 a1(4)]);
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    data1.setname(NULL); data2.setname(NULL); numpt.setname(NULL); fclk.setname(NULL); numbit.setname(NULL); 
    SNR__o=SNR; SINAD__o=SINAD; SFDR__o=SFDR; ENOB__o=ENOB; 
    return x_M;
    end_scope
  }
  
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=5.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(SNR__o); dMm(SINAD__o); dMm(SFDR__o); dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(SNR__o);
    end_scope
  }
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, i_o_t, Mm& SNR__o, Mm& SINAD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=5.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(SFDR__o); dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AlgDynTest(Mm data1, Mm data2, Mm numpt, Mm fclk, Mm numbit, i_o_t, Mm& SNR__o, Mm& SINAD__o, Mm& SFDR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=5.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(ENOB__o); 
    AlgDynTest(data1, data2, numpt, fclk, numbit, i_o, SNR__o, SINAD__o, SFDR__o, ENOB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
