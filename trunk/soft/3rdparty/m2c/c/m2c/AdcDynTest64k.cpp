#include "matlib.h"
#pragma hdrstop

#include "AdcDynTest64k.h"
#include "chebwin.h"
  
  
//%%(Harbin(i)-1)*fclk/65536, ADout_dB(Harbin(i))-ref_dB
//%%Fn_disturb(disturb_len - i)*fclk, ADout_dB(Harbin_disturb(disturb_len - i))-ref_dB
//%%Pn_dB noise floor
Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
				 Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, \
				 Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o, Mm& ref_dB__o) 
{
	begin_scope
		ADout.setname("ADout"); fclk.setname("fclk"); numbit.setname("numbit"); V.setname("V"); TPY.setname("TPY"); TPX.setname( \
		"TPX"); tone_code.setname("tone_code"); fin_input.setname("fin_input"); 
	dMm(freq_fin); dMm(Vin); dMm(Vpp); dMm(SNR); dMm(SFDR); dMm(SINAD); dMm(THD); dMm(HD); dMm(Pn_dB); dMm(ADout_dB) \
		; dMm(Harbin); dMm(Fn_disturb); dMm(Harbin_disturb); dMm(disturb_len); dMm(ref_dB); dMm(NFFT); dMm(AmpMax); dMm( \
		t1); dMm(AmpMin); dMm(t2); dMm(ADout_w); dMm(ADout_spect); dMm(span_dc); dMm(spanh_har); dMm(span_s); dMm(maxdB) \
		; dMm(fin); dMm(data_ref); dMm(n); dMm(n_AdcDynTest64k_v0); dMm(data_ref_w); dMm(data_ref_spect); dMm(data_ref_dB) \
		; dMm(tone); dMm(har_peak); dMm(har_bin); dMm(fin_x); dMm(spectP); dMm(Ph); dMm(Ph_dB); dMm(har_num); dMm(har_num_AdcDynTest64k_v1) \
		; dMm(Pdc); dMm(Ps); dMm(Pd); dMm(Pn); dMm(SNR_dBFS); dMm(ENOB); dMm(ENOBFS); dMm(spectP_temp); dMm(i_); dMm( \
		i_AdcDynTest64k_v2); dMm(spectP_disturb); dMm(findSpac); dMm(findSpan); dMm(findStart); dMm(i_AdcDynTest64k_v3) \
		; dMm(spectP_disturb_peak); dMm(num); dMm(array_flag); dMm(jj); dMm(jj_AdcDynTest64k_v4); dMm(k); dMm(k_AdcDynTest64k_v5) \
		; dMm(spectP_disturb_temp); dMm(Harbin_disturb_temp); dMm(Ph_disturb); dMm(Ph_disturb_dB); dMm(i_AdcDynTest64k_v6) \
		; dMm(Pd_disturb); dMm(Pd_disturb_dB); dMm(Pdc_dB); dMm(Ps_dB); dMm(Pd_dB); dMm(SFDR_dBFS); 
    
	call_stack_begin;
	// nargin, nargout entry code
	double old_nargin=nargin_val; if (!nargin_set) nargin_val=8.0;
	nargin_set=0;
	double old_nargout=nargout_val; if (!nargout_set) nargout_val=15.0;
	nargout_set=0;
    
    // translated code
    
    // Pn_dBΪ��������fclkΪ����Ƶ�ʣ�numbitΪ�������ȣ�NFFTΪFFT����ȣ�VΪ���ֵ��TPY��TPX�ֱ�Ϊʱ��ͼ��Y��X�ᣬcode
    // Ϊ1�����룬2��ƫ���룬3�������롣
    //���ӣ�������ʱ��80MHZ������16Ϊ�����ֵ2v��ʱ��ͼ��ʾY�ᣫ��1V��X��0��0.01ms����ԴΪ����
    //[SNR, SFDR, SNRFS,SINAD, THD, HD, ENOB, ENOBFS, Pn_dB] = calc_64k_dynam_params(80e6, 16, 32768, 2, 1, 0.01, 1)
    //*****************************��ڲ���***************************
    // $$$ format long
    // $$$ fclk = 125e6;
    // $$$ numbit = 14;
    // $$$ V = 2;
    // $$$ NFFT = 65536;
    // $$$ TPY = 1;
    // $$$ TPX = 0.01;
    // $$$ code = 1;
    // $$$ tone_code = 1;		%tone_code=1�Զ��ж�Ƶ�ʣ�=2ʱͨ������Ƶ�ʼ��㣬
    // $$$ fin_input = 1351e5;	%�����ź�
    //****************************************************************
    NFFT = 65536.0;
    ADout = V/2.0*ADout;
    //�ָ���ʱ����     
    //****************************************************************
    /*[AmpMax,t1] = */max(ADout,i_o,AmpMax,t1);
    /*[AmpMin,t2] = */min(ADout,i_o,AmpMin,t2);
    Vpp = AmpMax-AmpMin;
    //��������ε�Vppֵ
    //****************************************************************
    ADout_w = times(ADout, chebwin(NFFT,200));
    //chebwin(NFFT,200);    			%���ݼӴ�������200��Ϊ��FFT�����ڸ�Ƶ������
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
    freq_fin = (fin-1.0)*fclk/NFFT;
    //�������ź�Ƶ��
    //**************************����refdB******************************
    data_ref = zeros(NFFT,1.0);
    //������
    n_AdcDynTest64k_v0 = colon(1.0,1.0,NFFT); int n_AdcDynTest64k_i0;
    for (n_AdcDynTest64k_i0=0;n_AdcDynTest64k_i0<n_AdcDynTest64k_v0.cols();n_AdcDynTest64k_i0++) {
      forelem(n,n_AdcDynTest64k_v0,n_AdcDynTest64k_i0);
      data_ref(n) = V/2.0*sin((n-1.0)*(freq_fin)/fclk*2.0*pi);
      //�����ź�Ƶ���������۲���
    }
    data_ref_w = times(data_ref, chebwin(NFFT,200));
    //chebwin(NFFT,200);					%���ݼӴ�
    data_ref_spect = fft(data_ref_w,NFFT);
    //64K FFT
    data_ref_dB = 20.0*log10(abs(data_ref_spect));
    //תΪdBֵ
    ref_dB = max(data_ref_dB(colon(1.0,1.0,NFFT/2.0)));
    //����ο�ƽ��ֵ(����ֵ����OFFSET��)
    //*****************************��ͼ(Ƶ��)**************************
    //display( figure((CL(1.0))) );
    //% Draw horizontal lines;
    //% Set Y-axis 0~-140dB
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
    //****************************************************************
    // $$$ title('FFT PLOT');
    // $$$ xlabel('ANALOG INPUT FREQUENCY (MHz)');                                                     %X����ʾ
    // $$$ ylabel('AMPLITUDE (dBFs)');                                                                 %Y����ʾ
    // $$$ a1=axis; axis([a1(1) a1(2) -140 0]); 
    //****************************************************************
    tone = rem(fin_input/fclk,1.0);
    if (istrue(tone>0.5)) {
      //����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
      tone = 1.0-tone;
    }
    har_peak = max(ADout_dB(colon(round(tone*NFFT)-span_s,1.0,round(tone*NFFT)+span_s)));
    //�����źŸ������ֵ
    har_bin = find(ADout_dB(colon(round(tone*NFFT)-span_s,1.0,round(tone*NFFT)+span_s))==har_peak);
    //�ҳ����ֵʱ�ĵ�
    fin_x = har_bin+round(tone*NFFT)-span_s-1.0;
    //�����dBֵ�ľ���λ��
    if (istrue(tone_code==2.0)) {
      freq_fin = fin_input+floor((fin_x-1.0)/fclk)*fclk; display(freq_fin);
      //ʵ�����ֵ(�����û�������)     
      fin = fin_x;
    }
    //******************���źź�2~10��г������dBֵ********************
    spectP = times((abs(ADout_spect)),(abs(ADout_spect)));
    //��ѹ*��ѹ�������������źŵ��ܹ���(��dBֵ)
    Ph = nop_M;
    
    Harbin = nop_M;
    Ph_dB = nop_M;
    har_num_AdcDynTest64k_v1 = colon(1.0,1.0,10.0); int har_num_AdcDynTest64k_i1;
    for (har_num_AdcDynTest64k_i1=0;har_num_AdcDynTest64k_i1<har_num_AdcDynTest64k_v1.cols();har_num_AdcDynTest64k_i1++) \
       {
      forelem(har_num,har_num_AdcDynTest64k_v1,har_num_AdcDynTest64k_i1);
      tone = rem(har_num*fin/NFFT,1.0);
      if (istrue(tone>0.5)) {
        //����0.5ʱ����Ƶ��ΪFs/2���ж����źź�2~10��г���Ƿ����Fs/2
        tone = 1.0-tone;
      }
      har_peak = max(spectP(colon(round(tone*NFFT)-2.0*spanh_har,1.0,round(tone*NFFT)+2.0*spanh_har)));
      //�����źź�2~10��г�����ʵ����ֵ
      har_bin = find(spectP(colon(round(tone*NFFT)-2.0*spanh_har,1.0,round(tone*NFFT)+2.0*spanh_har))==har_peak);
      //�ҳ����ֵʱ�ĵ�(���źŻ���г����Ե�����λ��)
      har_bin = har_bin+round(tone*NFFT)-2.0*spanh_har-1.0;
      //ת���ɹ��ʵľ���λ��
      Ph = (BR(Ph),sum(spectP(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      //����Ph�����źź�2~10��г������
      Ph_dB = (BR(Ph_dB),sum(ADout_dB(colon(har_bin-spanh_har,1.0,har_bin+spanh_har))));
      //����Ph_dB�����źź�2~10��г������dBֵ
      Harbin = (BR(Harbin),har_bin);
      //���źź�2~10��г�����ڵ�λ��
    }
    //****************************************************************
    Pdc = sum(spectP(colon(1.0,1.0,span_dc)));
    //DC OFFSET����
    Ps = sum(spectP(colon(fin-span_s,1.0,fin+span_s)));
    //�ź��ܹ���Ps
    Pd = sum(Ph(colon(2.0,1.0,5.0)));
    //2~5г������֮��
    Pn = (sum(spectP(colon(1.0,1.0,NFFT/2.0)))-Pdc-Ps-Pd);
    //�ܹ���ȥ����2~5г�����ʡ�DC OFFSET���ʡ��źŹ��ʣ�
    //******************
    Vin = maxdB-ref_dB;
    //Vin�����ź�dBֵ
    SINAD = 10.0*log10(Ps/(Pn+Pd));
    //SINAD����
    SNR = 10.0*log10(Ps/Pn);
    //SNR����
    THD = 10.0*log10(Pd/Ph(1.0));
    //THD����
    SNR_dBFS = SNR-Vin;
    //SNR dBFSֵ����
    ENOB = (SINAD-1.76)/6.02;
    //ENOB����
    ENOBFS = (SINAD-Vin-1.76)/6.02;
    //ENOB dBFS����
    HD = (BR(ADout_dB(Harbin(1.0))-ref_dB),ADout_dB(Harbin(2.0))-ref_dB,ADout_dB(Harbin(3.0))-ref_dB,ADout_dB(Harbin( \
      4.0))-ref_dB,ADout_dB(Harbin(5.0))-ref_dB,ADout_dB(Harbin(6.0))-ref_dB,ADout_dB(Harbin(7.0))-ref_dB,ADout_dB( \
      Harbin(8.0))-ref_dB,ADout_dB(Harbin(9.0))-ref_dB,ADout_dB(Harbin(10.0))-ref_dB); display(HD);
    //*********************��2~10г��֮�����ɢ����*******************
    //*************************��ɢ���ʼ���***************************
    //****************���ڼ�����׺�SFDR��������������****************
    spectP_temp = spectP;
    i_AdcDynTest64k_v2 = colon(2.0,1.0,10.0); int i_AdcDynTest64k_i2;
    for (i_AdcDynTest64k_i2=0;i_AdcDynTest64k_i2<i_AdcDynTest64k_v2.cols();i_AdcDynTest64k_i2++) {
      forelem(i_,i_AdcDynTest64k_v2,i_AdcDynTest64k_i2);
      spectP_temp(colon(Harbin(i_)-spanh_har,1.0,Harbin(i_)+spanh_har)) = 0.0;
      //2~10��г������=0
    }
    spectP_temp(colon(fin-span_s,1.0,fin+span_s)) = 0.0;
    //�źŹ���=0
    spectP_temp(colon(1.0,1.0,span_dc)) = 0.0;
    //DC OFFSET����=0����spectP_tempΪ��������
    //****************************************************************
    disturb_len = 19.0;
    
    spectP_disturb = zeros(1.0,disturb_len);
    Harbin_disturb = zeros(1.0,disturb_len);
    findSpac = 30.0;
    //����ȥ�������ϵ�����ë��
    findSpan = (findSpac-1.0)/2.0;
    findStart = findSpan+1.0;
    //****************************
    i_AdcDynTest64k_v3 = colon(findStart,findSpac,NFFT/2.0); int i_AdcDynTest64k_i3;
    for (i_AdcDynTest64k_i3=0;i_AdcDynTest64k_i3<i_AdcDynTest64k_v3.cols();i_AdcDynTest64k_i3++) {
      forelem(i_,i_AdcDynTest64k_v3,i_AdcDynTest64k_i3);
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
        jj_AdcDynTest64k_v4 = colon(1.0,1.0,disturb_len-2.0); int jj_AdcDynTest64k_i4;
        for (jj_AdcDynTest64k_i4=0;jj_AdcDynTest64k_i4<jj_AdcDynTest64k_v4.cols();jj_AdcDynTest64k_i4++) {
          forelem(jj,jj_AdcDynTest64k_v4,jj_AdcDynTest64k_i4);
          k_AdcDynTest64k_v5 = colon(1.0,1.0,(disturb_len-jj)); int k_AdcDynTest64k_i5;
          for (k_AdcDynTest64k_i5=0;k_AdcDynTest64k_i5<k_AdcDynTest64k_v5.cols();k_AdcDynTest64k_i5++) {
            forelem(k,k_AdcDynTest64k_v5,k_AdcDynTest64k_i5);
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
    Fn_disturb = (Harbin_disturb-1.0)/(NFFT);
    i_AdcDynTest64k_v6 = colon(1.0,1.0,disturb_len); int i_AdcDynTest64k_i6;
    for (i_AdcDynTest64k_i6=0;i_AdcDynTest64k_i6<i_AdcDynTest64k_v6.cols();i_AdcDynTest64k_i6++) {
      forelem(i_,i_AdcDynTest64k_v6,i_AdcDynTest64k_i6);
      Ph_disturb = (BR(Ph_disturb),sum(spectP(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_)+spanh_har) \
        )));
      Ph_disturb_dB = (BR(Ph_disturb_dB),sum(ADout_dB(colon(Harbin_disturb(i_)-spanh_har,1.0,Harbin_disturb(i_)+spanh_har) \
        )));
    }
    Pd_disturb = sum(Ph_disturb(colon(1.0,1.0,disturb_len)));
    //���źš�2~10��г��������֮�����ɢ����(�൱�ڸ��Ź���)
    Pd_disturb_dB = sum(Ph_disturb_dB(colon(1.0,1.0,disturb_len)));
    //****************************************************************
    Pdc_dB = sum(ADout_dB(colon(1.0,1.0,span_dc)));
    //DC OFFSET����dBֵ
    Ps_dB = sum(ADout_dB(colon(fin-span_s,1.0,fin+span_s)));
    //�źŹ���dBֵ
    Pd_dB = sum(Ph_dB(colon(2.0,1.0,10.0)));
    //2~10г������֮��dBֵ
    Pn_dB = (sum(ADout_dB(colon(1.0,1.0,NFFT/2.0)))-Pdc_dB-Ps_dB-Pd_dB-Pd_disturb_dB)*2.0/(NFFT-span_dc-spanh_har*5.0-span_s) \
      -ref_dB; display(Pn_dB);
    //���dBֵ
    SFDR = 10.0*log10(Ph(1.0)/max(max(Ph(colon(2.0,1.0,10.0)),max(Ph_disturb(colon(1.0,1.0,disturb_len)))))); display( \
      SFDR);
    //SFDR����
    SFDR_dBFS = SFDR-Vin;
    //SFDR dBFSֵ
    //****************************************************************
    //%% Draw markers and numbers on 1~10th harmonic,
    // $$$ hold on; 
    // $$$ plot((Harbin(1)-1)*fclk/NFFT,ADout_dB(Harbin(1))-ref_dB,'rd');
    // $$$ plot((Harbin(2)-1)*fclk/NFFT,ADout_dB(Harbin(2))-ref_dB,'rv');
    // $$$ plot((Harbin(3)-1)*fclk/NFFT,ADout_dB(Harbin(3))-ref_dB,'rv');
    // $$$ plot((Harbin(4)-1)*fclk/NFFT,ADout_dB(Harbin(4))-ref_dB,'rv');
    // $$$ plot((Harbin(5)-1)*fclk/NFFT,ADout_dB(Harbin(5))-ref_dB,'rv');
    // $$$ plot((Harbin(6)-1)*fclk/NFFT,ADout_dB(Harbin(6))-ref_dB,'rv');
    // $$$ plot((Harbin(7)-1)*fclk/NFFT,ADout_dB(Harbin(7))-ref_dB,'rv');
    // $$$ plot((Harbin(8)-1)*fclk/NFFT,ADout_dB(Harbin(8))-ref_dB,'rv');
    // $$$ plot((Harbin(9)-1)*fclk/NFFT,ADout_dB(Harbin(9))-ref_dB,'rv');
    // $$$ plot((Harbin(10)-1)*fclk/NFFT,ADout_dB(Harbin(10))-ref_dB,'rv');
    // $$$ text((Harbin(2)-1)*fclk/NFFT,ADout_dB(Harbin(2))-ref_dB+2,'2','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(3)-1)*fclk/NFFT,ADout_dB(Harbin(3))-ref_dB+2,'3','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(4)-1)*fclk/NFFT,ADout_dB(Harbin(4))-ref_dB+2,'4','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(5)-1)*fclk/NFFT,ADout_dB(Harbin(5))-ref_dB+2,'5','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(6)-1)*fclk/NFFT,ADout_dB(Harbin(6))-ref_dB+2,'6','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(7)-1)*fclk/NFFT,ADout_dB(Harbin(7))-ref_dB+2,'7','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(8)-1)*fclk/NFFT,ADout_dB(Harbin(8))-ref_dB+2,'8','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(9)-1)*fclk/NFFT,ADout_dB(Harbin(9))-ref_dB+2,'9','VerticalAlignmen','bottom','Color','r');
    // $$$ text((Harbin(10)-1)*fclk/NFFT,ADout_dB(Harbin(10))-ref_dB+2,'10','VerticalAlignmen','bottom','Color','r');
    //%% Draw a Horizonta line in noise floor???
    // $$$ hold on;
    // $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,Pn_dB,'m-');
    //%% Show text(SNR etc)  
    // $$$ NFFT_txt = '64K'; 
    // $$$ FRQ_txt = num2str(freq_fin/1e6,'%2.1f');
    // $$$ FRQ_txt = strcat(FRQ_txt,'MHz');
    // $$$ FFT_txt = strcat(NFFT_txt,' FFT');
    // $$$ FREQ_txt = strcat(num2str(fclk/1e6,'%2d'),'MSPS');
    // $$$ DBFS_txt = strcat(FRQ_txt,'@', num2str(maxdB-ref_dB,'%2.1f'),'dBFs');
    // $$$ SNR_txt = strcat('SNR =',num2str(SNR,'% 2.3f'),' dBc');
    // $$$ SFDR_txt = strcat('SFDR =  ',num2str(SFDR,'% 2.3f'),' dBc');
    // $$$ %****************************************************************
    // $$$ text(fclk*5.6/16,-5,FFT_txt,'HorizontalAlignment','left','Color','r');
    // $$$ text(fclk*5.6/16,-13,FREQ_txt,'HorizontalAlignment','left','Color','r');
    // $$$ text(fclk*5.6/16,-21,DBFS_txt,'HorizontalAlignment','left','Color','r');
    // $$$ text(fclk*5.6/16,-29,SNR_txt,'HorizontalAlignment','left','Color','r');
    // $$$ text(fclk*5.6/16,-37,SFDR_txt,'HorizontalAlignment','left','Color','r');
    // $$$ %text(fclk*6/16,-55,THD_txt,'HorizontalAlignment','left','Color','r');
    //%% Draw markers of high order harmonic
    // $$$ hold on;
    // $$$ for i = 0:disturb_len/2
    // $$$     hold on;
    // $$$     plot(Fn_disturb(disturb_len - i)*fclk,ADout_dB(Harbin_disturb(disturb_len - i))-ref_dB,'g*');
    // $$$ end
    // $$$ hold off;
    
    //%% Time Domain figure;
    //****************************
    // $$$ VPP_txt = strcat(num2str(Vpp,'%2.3f'),' Vpp');
    // $$$ figure(2)
    // $$$ %****************************
    // $$$ plot([1:NFFT].*1e3/fclk,ADout(1:NFFT));
    // $$$ title('Time PLOT'); 
    // $$$ xlabel('TIME (ms)');
    // $$$ ylabel('AMPLITUDE (V)');
    // $$$ hold on
    // $$$ axis([0 TPX -TPY TPY]);
    // $$$ % text(t1,AmpMax,num2str(AmpMax),'VerticalAlignmen','bottom');
    // $$$ % text(t1,AmpMin,num2str(AmpMin),'VerticalAlignmen','top')
    // $$$ text(TPX*0.85,0.9*TPY,VPP_txt,'HorizontalAlignment','left','Color','r')
    // $$$ text(TPX*0.85,0.8*TPY,FRQ_txt,'HorizontalAlignment','left','Color','r')
    // $$$ %****************************************************************
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    ADout.setname(NULL); fclk.setname(NULL); numbit.setname(NULL); V.setname(NULL); TPY.setname(NULL); TPX.setname( \
      NULL); tone_code.setname(NULL); fin_input.setname(NULL); 
    freq_fin__o=freq_fin; Vin__o=Vin; Vpp__o=Vpp; SNR__o=SNR; SFDR__o=SFDR; SINAD__o=SINAD; THD__o=THD; HD__o=HD;  \
      Pn_dB__o=Pn_dB; ADout_dB__o=ADout_dB; Harbin__o=Harbin; Fn_disturb__o=Fn_disturb; Harbin_disturb__o=Harbin_disturb;  \
      disturb_len__o=disturb_len; ref_dB__o=ref_dB; 
    return x_M;
    end_scope
  }
  
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(freq_fin__o); dMm(Vin__o); dMm(Vpp__o); dMm(SNR__o); dMm(SFDR__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o) \
      ; dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o) \
      ; dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(freq_fin__o);
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(Vpp__o); dMm(SNR__o); dMm(SFDR__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o) \
      ; dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(SNR__o); dMm(SFDR__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o) \
      ; dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=4.0; nargout_set=1;
    dMm(SFDR__o); dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o) \
      ; dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=5.0; nargout_set=1;
    dMm(SINAD__o); dMm(THD__o); dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o);  \
      dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=6.0; nargout_set=1;
    dMm(THD__o); dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o) \
      ; dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=7.0; nargout_set=1;
    dMm(HD__o); dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm( \
      disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=8.0; nargout_set=1;
    dMm(Pn_dB__o); dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o) \
      ; dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=9.0; nargout_set=1;
    dMm(ADout_dB__o); dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o) \
      ; 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=10.0; nargout_set=1;
    dMm(Harbin__o); dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, \
     Mm& Harbin__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=11.0; nargout_set=1;
    dMm(Fn_disturb__o); dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, \
     Mm& Harbin__o, Mm& Fn_disturb__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=12.0; nargout_set=1;
    dMm(Harbin_disturb__o); dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, \
     Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=13.0; nargout_set=1;
    dMm(disturb_len__o); dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm AdcDynTest64k(Mm ADout, Mm fclk, Mm numbit, Mm V, Mm TPY, Mm TPX, Mm tone_code, Mm fin_input, i_o_t, Mm& freq_fin__o, \
     Mm& Vin__o, Mm& Vpp__o, Mm& SNR__o, Mm& SFDR__o, Mm& SINAD__o, Mm& THD__o, Mm& HD__o, Mm& Pn_dB__o, Mm& ADout_dB__o, \
     Mm& Harbin__o, Mm& Fn_disturb__o, Mm& Harbin_disturb__o, Mm& disturb_len__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=8.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=14.0; nargout_set=1;
    dMm(ref_dB__o); 
    AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input, i_o, freq_fin__o, Vin__o, Vpp__o, SNR__o, \
       SFDR__o, SINAD__o, THD__o, HD__o, Pn_dB__o, ADout_dB__o, Harbin__o, Fn_disturb__o, Harbin_disturb__o, disturb_len__o, \
       ref_dB__o);
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
