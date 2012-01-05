  #include "matlib.h"
  #pragma hdrstop
  
  #include "DualToneTest64k.h"
  #include "chebwin.h"
  
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o, Mm& SFDR_dBFS__o, Mm& IMD2_Worst__o, Mm& IMD2_w_dBFS__o, Mm& IMD3_Worst__o, Mm& IMD3_w_dBFS__o) {
    begin_scope
    ADout.setname("ADout"); fclk.setname("fclk"); numbit.setname("numbit"); NFFT.setname("NFFT"); V.setname("V");  \
      TPY.setname("TPY"); TPX.setname("TPX"); code.setname("code"); tone_code.setname("tone_code"); fin1_input.setname( \
      "fin1_input"); fin2_input.setname("fin2_input"); 
    dMm(ADout_dB); dMm(Fin1_freq); dMm(Fin1_dBFS); dMm(Fin2_freq); dMm(Fin2_dBFS); dMm(SFDR); dMm(SFDR_dBFS); dMm( \
      IMD2_Worst); dMm(IMD2_w_dBFS); dMm(IMD3_Worst); dMm(IMD3_w_dBFS); dMm(AmpMax); dMm(t1); dMm(AmpMin); dMm(t2);  \
      dMm(Vpp); dMm(ADout_w); dMm(ADout_spect); dMm(span_dc); dMm(spanh_har); dMm(span_s); dMm(maxdB); dMm(fin); dMm( \
      freq_fin); dMm(ADout_dB_temp); dMm(second_maxdB); dMm(second_fin); dMm(second_freq_fin); dMm(data_ref); dMm(n) \
      ; dMm(n_DualToneTest64k_v0); dMm(data_ref_w); dMm(data_ref_spect); dMm(data_ref_dB); dMm(ref_dB); dMm(fin1);  \
      dMm(fin1_dBFS); dMm(fin1_x); dMm(fin2); dMm(fin2_dBFS); dMm(fin2_x); dMm(freq_input); dMm(tone); dMm(har_peak) \
      ; dMm(har_bin); dMm(fin1_freq); dMm(fin2_freq); dMm(fin2_plus_fin1_x); dMm(fin2_plus_fin1); dMm(fin2_sub_fin1_x) \
      ; dMm(fin2_sub_fin1); dMm(two_fin1_x); dMm(two_fin1); dMm(two_fin2_x); dMm(two_fin2); dMm(three_fin1_x); dMm( \
      three_fin1); dMm(three_fin2_x); dMm(three_fin2); dMm(fin1_plus_2fin2_x); dMm(fin1_plus_2fin2); dMm(fin2_plus_2fin1_x) \
      ; dMm(fin2_plus_2fin1); dMm(two_fin2_sub_fin1_x); dMm(two_fin2_sub_fin1); dMm(two_fin1_sub_fin2_x); dMm(two_fin1_sub_fin2) \
      ; dMm(three_maxdB); dMm(three_high_x); dMm(three_high); dMm(IMD2_max); dMm(IMD2_worst); dMm(IMD2_worst_dBFS);  \
      dMm(IMD3_max1); dMm(IMD3_max2); dMm(IMD3_max); dMm(IMD3_worst); dMm(IMD3_worst_dBFS); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=11.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=11.0;
    nargout_set=0;
    
    // translated code
    
    // Pn_dBΪ��������fclkΪ����Ƶ�ʣ�numbitΪ�������ȣ�NFFTΪFFT����
    // �ȣ�VΪ���ֵ�� TPY��TPX�ֱ�Ϊʱ��ͼ��Y��X�ᣬcode
    // Ϊ1�����룬2��ƫ���룬3�������롣
    //���ӣ�������ʱ��80MHZ������16Ϊ�����ֵ2v��ʱ��ͼ��ʾY�ᣫ��1V��X
    //��0��0.01ms�� ��ԴΪ����
    // $$$ clear all
    // $$$ close all
    // $$$ %*****************************��ڲ���***************************
    // $$$ format long
    // $$$ fclk = 125e6;
    // $$$ numbit = 14;
    // $$$ V = 2;
    // $$$ NFFT = 65536;
    // $$$ TPY = 1;
    // $$$ TPX = 0.01;
    // $$$ code = 1;
    // $$$ tone_code = 2;					%tone_code=1�Զ��ж�Ƶ�ʣ�=2ʱͨ������Ƶ�ʼ��㣬
    // $$$ fin1_input = 1549e5;				%�����ź�1
    // $$$ fin2_input = 1559e5;				%�����ź�2,fin2_input�������fin1_input(��������ʱ�ж�)
    //*****************************����ת��***************************
    //****************************************************************
    ADout = V/2.0*ADout;
    //�ָ���ʱ����     
    //****************************************************************
    /*[AmpMax,t1] = */max(ADout,i_o,AmpMax,t1);
    /*[AmpMin,t2] = */min(ADout,i_o,AmpMin,t2);
    Vpp = AmpMax-AmpMin;
    //��������ε�Vppֵ
    //****************************************************************
    ADout_w = times(ADout, chebwin(NFFT,200));
    //chebwin(NFFT,200);    					%���ݼӴ�������200��Ϊ��FFT�����ڸ�Ƶ������
    ADout_spect = fft(ADout_w,NFFT);
    //��64K FFT
    ADout_dB = 20.0*log10(abs(ADout_spect));
    //FFT��תΪdBֵ
    //****************************************************************
    span_dc = 24.0;
    //DC SPAN(��OFFSET��ѹ)�����跶Χ11-35��32K=11��64K=24
    spanh_har = 4.0;
    //г��SPAN�����跶Χ3~6
    span_s = 19.0;
    //�ź�SPAN�����跶Χ16~23
    //****************************************************************
    maxdB = max(ADout_dB(colon(span_dc,1.0,NFFT/2.0)));
    //�ҳ���DC SPAN֮������dBֵ
    fin = find(ADout_dB(colon(1.0,1.0,NFFT/2.0))==maxdB);
    //�ҳ��������dBֵʱ�ĵ�
    freq_fin = (fin*fclk/NFFT);
    //�������ź�Ƶ��
    //****************************************************************
    ADout_dB_temp = ADout_dB;
    ADout_dB_temp(colon(1.0,1.0,span_dc)) = 0.0;
    ADout_dB_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    second_maxdB = max(ADout_dB_temp(colon(1.0,1.0,NFFT/2.0)));
    second_fin = find(ADout_dB_temp(colon(1.0,1.0,NFFT/2.0))==second_maxdB);
    //�ҳ����ڴθ�ֵ�ĵ�
    second_freq_fin = (second_fin*fclk/NFFT);
    //����θ��źŵ�Ƶ��
    //**************************����refdB******************************
    data_ref = zeros(NFFT,1.0);
    //������
    n_DualToneTest64k_v0 = colon(1.0,1.0,NFFT); int n_DualToneTest64k_i0;
    for (n_DualToneTest64k_i0=0;n_DualToneTest64k_i0<n_DualToneTest64k_v0.cols();n_DualToneTest64k_i0++) {
      forelem(n,n_DualToneTest64k_v0,n_DualToneTest64k_i0);
      data_ref(n) = V/2.0*sin((n-1.0)*(freq_fin)/fclk*2.0*pi);
      //�����ź�Ƶ���������۲���
    }
    data_ref_w = times(data_ref, chebwin(NFFT,200));
    //chebwin(NFFT,200);							%���ݼӴ�
    data_ref_spect = fft(data_ref_w,NFFT);
    //64K FFT
    data_ref_dB = 20.0*log10(abs(data_ref_spect));
    //תΪdBֵ
    ref_dB = max(data_ref_dB(colon(1.0,1.0,NFFT/2.0)));
    //����ο�ƽ��ֵ(����ֵ����OFFSET��)
    //****************************************************************
    if (istrue(freq_fin>second_freq_fin)) {
      fin1 = second_freq_fin;
      fin1_dBFS = ADout_dB(second_fin)-ref_dB;
      fin1_x = second_fin;
      fin2 = freq_fin;
      fin2_dBFS = ADout_dB(fin)-ref_dB;
      fin2_x = fin;
    } else {
      
      fin1 = freq_fin;
      fin1_dBFS = ADout_dB(fin)-ref_dB;
      
      fin1_x = fin;
      
      fin2 = second_freq_fin;
      fin2_dBFS = ADout_dB(second_fin)-ref_dB;
      fin2_x = second_fin;
      
    }
    //Ƶ�ʴ��Ϊfin2���θ�Ϊfin1
    //*****************************��ͼ(Ƶ��)**************************
    // $$$ figure(1)
    // $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-20,'-k');
    // $$$ hold on;
    // $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-40,'--k');
    // $$$ hold on;
    // $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-60,'-k');
    // $$$ hold on;
    // $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-80,'--k');
    // $$$ hold on;
    // $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-100,'-k');
    // $$$ hold on;
    // $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-120,'--k');
    // $$$ hold on;
    // $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,ADout_dB(1:round(NFFT/2))-ref_dB);
    // $$$ %****************************************************************
    // $$$ title('FFT PLOT');
    // $$$ xlabel('ANALOG INPUT FREQUENCY (MHz)');	%X����ʾ
    // $$$ ylabel('AMPLITUDE (dBFs)');				%Y����ʾ
    // $$$ a1=axis; axis([a1(1) a1(2) -140 0]); 
    //****************************************************************
    
    if (istrue(tone_code==1.0)) {
      fin1_input = fin1;
      fin2_input = fin2;
    }
    //****************************************************************fin1
    freq_input = fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-span_s,1.0,round(tone*NFFT)+span_s)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-span_s,1.0,round(tone*NFFT)+span_s))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin1_x = har_bin+round(tone*NFFT)-span_s-1.0;
    //�����dBֵ�ľ���λ��
    fin1 = (fin1_x-1.0)*fclk/NFFT;
    fin1_freq = floor((fin1_x-1.0)/NFFT)*fclk+freq_input; display(fin1_freq);
    
    //****************************************************************fin2
    freq_input = fin2_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin2_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    fin2 = (fin2_x-1.0)*fclk/NFFT;
    fin2_freq = floor((fin2_x-1.0)/NFFT)*fclk+freq_input;
    
    //****************************************************************fin2+fin1
    freq_input = fin2_input+fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin2_plus_fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    fin2_plus_fin1 = (fin2_plus_fin1_x-1.0)*fclk/NFFT;
    
    //****************************************************************fin2-fin1
    freq_input = fin2_input-fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin2_sub_fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    fin2_sub_fin1 = (fin2_sub_fin1_x-1.0)*fclk/NFFT;
    
    //****************************************************************2*fin1
    freq_input = 2.0*fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    two_fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    two_fin1 = (two_fin1_x-1.0)*fclk/NFFT;
    
    //****************************************************************2*fin2
    freq_input = 2.0*fin2_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    two_fin2_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    two_fin2 = (two_fin2_x-1.0)*fclk/NFFT;
    
    //****************************************************************3*fin1
    freq_input = 3.0*fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    three_fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    three_fin1 = (three_fin1_x-1.0)*fclk/NFFT;
    
    //****************************************************************3*fin2
    freq_input = 3.0*fin2_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    three_fin2_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    three_fin2 = (three_fin2_x-1.0)*fclk/NFFT;
    
    //****************************************************************fin1+2*fin1
    freq_input = 2.0*fin2_input+fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin1_plus_2fin2_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    fin1_plus_2fin2 = (fin1_plus_2fin2_x-1.0)*fclk/NFFT;
    
    //****************************************************************fin2+2*fin1
    freq_input = fin2_input+2.0*fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    tone = rem(freq_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    //****************************************************************
    fin2_plus_2fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
    //�����dBֵ�ľ���λ��
    fin2_plus_2fin1 = (fin2_plus_2fin1_x-1.0)*fclk/NFFT;
    
    //****************************************************************2fin2-fin1
    freq_input = 2.0*fin2_input-fin1_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    if (istrue(freq_input>0.0)) {
      tone = rem(freq_input/fclk,1.0);
      if (istrue(tone>0.5)) {
        //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone = 1.0-tone;
      }
      har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
      //�����źŸ������ֵ
      har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
      //�ҳ����ֵʱ�ĵ�
      two_fin2_sub_fin1_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
      //�����dBֵ�ľ���λ��
    } else {
      
      two_fin2_sub_fin1_x = 0.0;
    }
    two_fin2_sub_fin1 = (two_fin2_sub_fin1_x-1.0)*fclk/NFFT;
    //****************************************************************
    
    //****************************************************************2fin1-fin2
    freq_input = 2.0*fin1_input-fin2_input;
    //***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
    if (istrue(freq_input>0.0)) {
      tone = rem(freq_input/fclk,1.0);
      if (istrue(tone>0.5)) {
        //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone = 1.0-tone;
      }
      har_peak = max(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har)));
      //�����źŸ������ֵ
      har_bin = find(ADout_dB(colon(round(tone*NFFT)-spanh_har,1.0,round(tone*NFFT)+spanh_har))==har_peak);
      //�ҳ����ֵʱ�ĵ�
      two_fin1_sub_fin2_x = har_bin+round(tone*NFFT)-spanh_har-1.0;
      //�����dBֵ�ľ���λ��
    } else {
      
      two_fin1_sub_fin2_x = 0.0;
    }
    two_fin1_sub_fin2 = (two_fin1_sub_fin2_x-1.0)*fclk/NFFT;
    //****************************************************************
    
    
    //****************************************************************
    ADout_dB_temp(colon(second_fin-span_s,1.0,second_fin+span_s)) = 0.0;
    three_maxdB = max(ADout_dB_temp(colon(1.0,1.0,NFFT/2.0)));
    three_high_x = find(ADout_dB_temp(colon(1.0,1.0,NFFT/2.0))==three_maxdB);
    //�ҳ����ڵ�3��ֵ�ĵ�
    three_high = (three_high_x-1.0)*fclk/NFFT;
    //****************************************************************
    fin1_dBFS = ADout_dB(fin1_x)-ref_dB;
    //�����ź�1,��λdBFS
    fin2_dBFS = ADout_dB(fin2_x)-ref_dB;
    //�����ź�2,��λdBFS
    //****************************************************************
    SFDR = maxdB-ADout_dB(three_high_x);
    //SFDR,��λdBc
    SFDR_dBFS = ref_dB-ADout_dB(three_high_x);
    //SFDR,��λdBFS
    //****************************************************************
    IMD2_max = max(ADout_dB(fin2_plus_fin1_x),ADout_dB(fin2_sub_fin1_x));
    IMD2_worst = maxdB-IMD2_max;
    //���IMD2,��λdBc
    IMD2_worst_dBFS = ref_dB-IMD2_max;
    //���IMD2,��λdBFS
    //****************************************************************
    IMD3_max1 = max(ADout_dB(fin1_plus_2fin2_x),ADout_dB(fin2_plus_2fin1_x));
    IMD3_max2 = max(IMD3_max1,ADout_dB(two_fin2_sub_fin1_x));
    IMD3_max = max(IMD3_max2,ADout_dB(two_fin1_sub_fin2_x));
    IMD3_worst = maxdB-IMD3_max;
    //���IMD3,��λdBc
    IMD3_worst_dBFS = ref_dB-IMD3_max;
    //���IMD3,��λdBFS
    // $$$ %**************************����Ϊ��ͼ****************************
    // $$$ plot(fin1,ADout_dB(fin1_x)-ref_dB,'gd');                                                        %fin1��ɫ
    // $$$ plot(fin2,ADout_dB(fin2_x)-ref_dB,'rd');                                                        %fin2��ɫ
    // $$$ plot(three_high,ADout_dB(three_high_x)-ref_dB,'k*');                                            %�����ߵ㣬��ɫ
    // $$$ plot(two_fin1,ADout_dB(two_fin1_x)-ref_dB,'gv');                                                %fin1����г��(��ע2)
    // $$$ text(two_fin1,ADout_dB(two_fin1_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','g');
    // $$$ plot(two_fin2,ADout_dB(two_fin2_x)-ref_dB,'rv');                                                %fin2����г��(��ע2)
    // $$$ text(two_fin2,ADout_dB(two_fin2_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','r');
    // $$$ plot(three_fin1,ADout_dB(three_fin1_x)-ref_dB,'gv');                                            %fin1����г��(��ע3)
    // $$$ text(three_fin1,ADout_dB(three_fin1_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','g');
    // $$$ plot(three_fin2,ADout_dB(three_fin2_x)-ref_dB,'rv');                                            %fin2����г��(��ע3)
    // $$$ text(three_fin2,ADout_dB(three_fin2_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','r');
    // $$$ %****************************************************************
    // $$$ plot(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB,'kv');                                    %2�λ���(��עA)
    // $$$ text(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB+1,'A','VerticalAlignmen','bottom','Color','k');
    // $$$ plot(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB,'kv');                                      %2�λ���(��עB)
    // $$$ text(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB+1,'B','VerticalAlignmen','bottom','Color','k');
    // $$$ %****************************************************************
    // $$$ plot(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB,'cv');                                  %3�λ���(��עC)
    // $$$ text(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB+1,'C','VerticalAlignmen','bottom','Color','k');
    // $$$ plot(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB,'cv');                                  %3�λ���(��עD)
    // $$$ text(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB+1,'D','VerticalAlignmen','bottom','Color','k');
    // $$$ plot(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB,'cv');                              %3�λ���(��עE)
    // $$$ text(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB+1,'E','VerticalAlignmen','bottom','Color','k');
    // $$$ plot(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB,'cv');                              %3�λ���(��עF)
    // $$$ text(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB+1,'F','VerticalAlignmen','bottom','Color','k');
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    ADout.setname(NULL); fclk.setname(NULL); numbit.setname(NULL); NFFT.setname(NULL); V.setname(NULL); TPY.setname( \
      NULL); TPX.setname(NULL); code.setname(NULL); tone_code.setname(NULL); fin1_input.setname(NULL); fin2_input.setname( \
      NULL); 
    ADout_dB__o=ADout_dB; Fin1_freq__o=Fin1_freq; Fin1_dBFS__o=Fin1_dBFS; Fin2_freq__o=Fin2_freq; Fin2_dBFS__o=Fin2_dBFS;  \
      SFDR__o=SFDR; SFDR_dBFS__o=SFDR_dBFS; IMD2_Worst__o=IMD2_Worst; IMD2_w_dBFS__o=IMD2_w_dBFS; IMD3_Worst__o=IMD3_Worst;  \
      IMD3_w_dBFS__o=IMD3_w_dBFS; 
    return x_M;
    end_scope
  }
  
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(ADout_dB__o); dMm(Fin1_freq__o); dMm(Fin1_dBFS__o); dMm(Fin2_freq__o); dMm(Fin2_dBFS__o); dMm(SFDR__o); dMm( \
      SFDR_dBFS__o); dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(ADout_dB__o);
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(Fin1_dBFS__o); dMm(Fin2_freq__o); dMm(Fin2_dBFS__o); dMm(SFDR__o); dMm(SFDR_dBFS__o); dMm(IMD2_Worst__o);  \
      dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(Fin2_freq__o); dMm(Fin2_dBFS__o); dMm(SFDR__o); dMm(SFDR_dBFS__o); dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o) \
      ; dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=4.0; nargout_set=1;
    dMm(Fin2_dBFS__o); dMm(SFDR__o); dMm(SFDR_dBFS__o); dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o) \
      ; dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=5.0; nargout_set=1;
    dMm(SFDR__o); dMm(SFDR_dBFS__o); dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o) \
      ; 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=6.0; nargout_set=1;
    dMm(SFDR_dBFS__o); dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o, Mm& SFDR_dBFS__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=7.0; nargout_set=1;
    dMm(IMD2_Worst__o); dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o, Mm& SFDR_dBFS__o, Mm& IMD2_Worst__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=8.0; nargout_set=1;
    dMm(IMD2_w_dBFS__o); dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o, Mm& SFDR_dBFS__o, Mm& IMD2_Worst__o, Mm& IMD2_w_dBFS__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=9.0; nargout_set=1;
    dMm(IMD3_Worst__o); dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm DualToneTest64k(Mm ADout, Mm fclk, Mm numbit, Mm NFFT, Mm V, Mm TPY, Mm TPX, Mm code, Mm tone_code, Mm fin1_input, \
     Mm fin2_input, i_o_t, Mm& ADout_dB__o, Mm& Fin1_freq__o, Mm& Fin1_dBFS__o, Mm& Fin2_freq__o, Mm& Fin2_dBFS__o, \
     Mm& SFDR__o, Mm& SFDR_dBFS__o, Mm& IMD2_Worst__o, Mm& IMD2_w_dBFS__o, Mm& IMD3_Worst__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=11.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=10.0; nargout_set=1;
    dMm(IMD3_w_dBFS__o); 
    DualToneTest64k(ADout, fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, fin1_input, fin2_input, i_o, ADout_dB__o, \
       Fin1_freq__o, Fin1_dBFS__o, Fin2_freq__o, Fin2_dBFS__o, SFDR__o, SFDR_dBFS__o, IMD2_Worst__o, IMD2_w_dBFS__o, \
       IMD3_Worst__o, IMD3_w_dBFS__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
