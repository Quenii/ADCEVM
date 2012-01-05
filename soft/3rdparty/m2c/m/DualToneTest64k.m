
function [Fin1_freq, Fin1_dBFS, Fin2_freq, Fin2_dBFS, SFDR, SFDR_dBFS, ...
          IMD2_Worst, IMD2_w_dBFS, IMD3_Worst, IMD3_w_dBFS] = ...
    DualToneTest64k(fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, ...
                    fin1_input, fin2_input)
% Pn_dBΪ��������fclkΪ����Ƶ�ʣ�numbitΪ�������ȣ�NFFTΪFFT����
% �ȣ�VΪ���ֵ�� TPY��TPX�ֱ�Ϊʱ��ͼ��Y��X�ᣬcode
% Ϊ1�����룬2��ƫ���룬3�������롣
%���ӣ�������ʱ��80MHZ������16Ϊ�����ֵ2v��ʱ��ͼ��ʾY�ᣫ��1V��X
%��0��0.01ms�� ��ԴΪ����
% $$$ clear all
% $$$ close all
% $$$ %*****************************��ڲ���***************************
% $$$ format long
% $$$ fclk = 125e6;
% $$$ numbit = 14;
% $$$ V = 2;
% $$$ NFFT = 65536;
% $$$ TPY = 1;
% $$$ TPX = 0.01;
% $$$ code = 1;
% $$$ tone_code = 2;					%tone_code=1�Զ��ж�Ƶ�ʣ�=2ʱͨ������Ƶ�ʼ��㣬
% $$$ fin1_input = 1549e5;				%�����ź�1
% $$$ fin2_input = 1559e5;				%�����ź�2,fin2_input�������fin1_input(��������ʱ�ж�)
%*****************************����ת��***************************
%****************************************************************
ADout = V/2*ADout; 										%�ָ���ʱ����     
%****************************************************************
[AmpMax t1]=max(ADout);
[AmpMin t2]=min(ADout);
Vpp = AmpMax - AmpMin;								    %��������ε�Vppֵ
%****************************************************************
ADout_w=ADout.*chebwin(NFFT,200);    					%���ݼӴ�������200��Ϊ��FFT�����ڸ�Ƶ������
ADout_spect=fft(ADout_w,NFFT);						    %��64K FFT
ADout_dB=20*log10(abs(ADout_spect));					%FFT��תΪdBֵ
%****************************************************************
span_dc = 24; 											%DC SPAN(��OFFSET��ѹ)�����跶Χ11-35��32K=11��64K=24
spanh_har = 4;											%г��SPAN�����跶Χ3~6
span_s = 19;											%�ź�SPAN�����跶Χ16~23
%****************************************************************
maxdB=max(ADout_dB(span_dc:NFFT/2));					%�ҳ���DC SPAN֮������dBֵ
fin=find(ADout_dB(1:NFFT/2)==maxdB);					%�ҳ��������dBֵʱ�ĵ�
freq_fin = (fin*fclk/NFFT);										%�������ź�Ƶ��
%****************************************************************
ADout_dB_temp = ADout_dB;
ADout_dB_temp(1:span_dc) = 0;
ADout_dB_temp(fin-span_s:fin+span_s) = 0;
second_maxdB=max(ADout_dB_temp(1:NFFT/2));
second_fin=find(ADout_dB_temp(1:NFFT/2)==second_maxdB);					%�ҳ����ڴθ�ֵ�ĵ�
second_freq_fin = (second_fin*fclk/NFFT);												%����θ��źŵ�Ƶ��
%**************************����refdB******************************
data_ref = zeros(NFFT,1);																				%������
for n = 1:NFFT;
    data_ref(n) = V/2*sin((n-1) * (freq_fin) / fclk * 2 * pi) ;	%�����ź�Ƶ���������۲���
end
data_ref_w=data_ref.*chebwin(NFFT,200);													%���ݼӴ�
data_ref_spect=fft(data_ref_w,NFFT);														%64K FFT
data_ref_dB=20*log10(abs(data_ref_spect));											%תΪdBֵ
ref_dB=max(data_ref_dB(1:NFFT/2));															%����ο�ƽ��ֵ(����ֵ����OFFSET��)
%****************************************************************
if 	(freq_fin > second_freq_fin)
  	fin1 = second_freq_fin;
  	fin1_dBFS = ADout_dB(second_fin)-ref_dB;
  	fin1_x = second_fin;
  	fin2 = freq_fin;
  	fin2_dBFS = ADout_dB(fin)-ref_dB;
  	fin2_x = fin;
else
		fin1 = freq_fin;
  	fin1_dBFS = ADout_dB(fin)-ref_dB;	
  	fin1_x = fin; 		
  	fin2 = second_freq_fin;
  	fin2_dBFS = ADout_dB(second_fin)-ref_dB;
  	fin2_x = second_fin;  	
end																															%Ƶ�ʴ��Ϊfin2���θ�Ϊfin1
%*****************************��ͼ(Ƶ��)**************************
% $$$ figure(1)
% $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-20,'-k');
% $$$ hold on;
% $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-40,'--k');
% $$$ hold on;
% $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-60,'-k');
% $$$ hold on;
% $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-80,'--k');
% $$$ hold on;
% $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,-100,'-k');
% $$$ hold on;
% $$$ plot([0:50:round(NFFT/2)-1].*fclk/NFFT,-120,'--k');
% $$$ hold on;
% $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,ADout_dB(1:round(NFFT/2))-ref_dB);
% $$$ %****************************************************************
% $$$ title('FFT PLOT');
% $$$ xlabel('ANALOG INPUT FREQUENCY (MHz)');												%X����ʾ
% $$$ ylabel('AMPLITUDE (dBFs)');																		%Y����ʾ
% $$$ a1=axis; axis([a1(1) a1(2) -140 0]); 
%****************************************************************

if tone_code == 1
	 fin1_input = fin1;
	 fin2_input = fin2;
end
%****************************************************************fin1
freq_input = fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin1_x = har_bin+round(tone*NFFT)-span_s-1;																							%�����dBֵ�ľ���λ��
fin1 = (fin1_x-1)*fclk/NFFT;
fin1_freq = floor((fin1_x-1)/NFFT)*fclk+freq_input

%****************************************************************fin2
freq_input = fin2_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																							%�����dBֵ�ľ���λ��
fin2 = (fin2_x-1)*fclk/NFFT;
fin2_freq = floor((fin2_x-1)/NFFT)*fclk+freq_input;

%****************************************************************fin2+fin1
freq_input = fin2_input+fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin2_plus_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																		%�����dBֵ�ľ���λ��
fin2_plus_fin1 = (fin2_plus_fin1_x-1)*fclk/NFFT;

%****************************************************************fin2-fin1
freq_input = fin2_input-fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin2_sub_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																			%�����dBֵ�ľ���λ��
fin2_sub_fin1 = (fin2_sub_fin1_x-1)*fclk/NFFT;

%****************************************************************2*fin1
freq_input = 2*fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
two_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																					%�����dBֵ�ľ���λ��
two_fin1 = (two_fin1_x-1)*fclk/NFFT;

%****************************************************************2*fin2
freq_input = 2*fin2_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
two_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																					%�����dBֵ�ľ���λ��
two_fin2 = (two_fin2_x-1)*fclk/NFFT;

%****************************************************************3*fin1
freq_input = 3*fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
three_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																				%�����dBֵ�ľ���λ��
three_fin1 = (three_fin1_x-1)*fclk/NFFT;

%****************************************************************3*fin2
freq_input = 3*fin2_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
           tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
three_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																				%�����dBֵ�ľ���λ��
three_fin2 = (three_fin2_x-1)*fclk/NFFT;

%****************************************************************fin1+2*fin1
freq_input = 2*fin2_input+fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																			%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin1_plus_2fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;										%�����dBֵ�ľ���λ��
fin1_plus_2fin2 = (fin1_plus_2fin2_x-1)*fclk/NFFT;

%****************************************************************fin2+2*fin1
freq_input = fin2_input+2*fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																			%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%�����źŸ������ֵ
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
%****************************************************************
fin2_plus_2fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;										%�����dBֵ�ľ���λ��
fin2_plus_2fin1 = (fin2_plus_2fin1_x-1)*fclk/NFFT;

%****************************************************************2fin2-fin1
freq_input = 2*fin2_input-fin1_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
if freq_input > 0
    tone = rem(freq_input/fclk,1);
    if tone>0.5 																				%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
    har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%�����źŸ������ֵ
    har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
    two_fin2_sub_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;									%�����dBֵ�ľ���λ��
else
    two_fin2_sub_fin1_x = 0;
end
two_fin2_sub_fin1 = (two_fin2_sub_fin1_x-1)*fclk/NFFT;
%****************************************************************

%****************************************************************2fin1-fin2
freq_input = 2*fin1_input-fin2_input;
%***************�ӳ����ҳ�Ƶ�ʶ�ӦƵ��λ��*********************
if freq_input > 0
    tone = rem(freq_input/fclk,1);
    if tone>0.5 																				%����0.5ʱ����Ƶ��ΪFs/2���ж������ź�1�Ƿ����Fs/2
        tone=1-tone;
    end
	har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%�����źŸ������ֵ
	har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%�ҳ����ֵʱ�ĵ�
	two_fin1_sub_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;									%�����dBֵ�ľ���λ��
else
    two_fin1_sub_fin2_x = 0;
end
two_fin1_sub_fin2 = (two_fin1_sub_fin2_x-1)*fclk/NFFT;
%****************************************************************


%****************************************************************
ADout_dB_temp(second_fin-span_s:second_fin+span_s) = 0;
three_maxdB=max(ADout_dB_temp(1:NFFT/2));
three_high_x=find(ADout_dB_temp(1:NFFT/2)==three_maxdB);                                        %�ҳ����ڵ�3��ֵ�ĵ�
three_high = (three_high_x-1)*fclk/NFFT;
%****************************************************************
fin1_dBFS = ADout_dB(fin1_x) - ref_dB;                                                           %�����ź�1,��λdBFS
fin2_dBFS = ADout_dB(fin2_x) - ref_dB;                                                           %�����ź�2,��λdBFS
%****************************************************************
SFDR = maxdB - ADout_dB(three_high_x);                                                           %SFDR,��λdBc
SFDR_dBFS = ref_dB - ADout_dB(three_high_x);                                                     %SFDR,��λdBFS
%****************************************************************
IMD2_max = max(ADout_dB(fin2_plus_fin1_x),ADout_dB(fin2_sub_fin1_x));
IMD2_worst = maxdB - IMD2_max;                                                                   %���IMD2,��λdBc
IMD2_worst_dBFS = ref_dB - IMD2_max;                                                             %���IMD2,��λdBFS
%****************************************************************
IMD3_max1 = max(ADout_dB(fin1_plus_2fin2_x),ADout_dB(fin2_plus_2fin1_x));
IMD3_max2 = max(IMD3_max1,ADout_dB(two_fin2_sub_fin1_x));
IMD3_max = max(IMD3_max2,ADout_dB(two_fin1_sub_fin2_x));
IMD3_worst = maxdB - IMD3_max;                                                                   %���IMD3,��λdBc
IMD3_worst_dBFS = ref_dB - IMD3_max;                                                             %���IMD3,��λdBFS
% $$$ %**************************����Ϊ��ͼ****************************
% $$$ plot(fin1,ADout_dB(fin1_x)-ref_dB,'gd');                                                        %fin1��ɫ
% $$$ plot(fin2,ADout_dB(fin2_x)-ref_dB,'rd');                                                        %fin2��ɫ
% $$$ plot(three_high,ADout_dB(three_high_x)-ref_dB,'k*');                                            %�����ߵ㣬��ɫ
% $$$ plot(two_fin1,ADout_dB(two_fin1_x)-ref_dB,'gv');                                                %fin1����г��(��ע2)
% $$$ text(two_fin1,ADout_dB(two_fin1_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','g');
% $$$ plot(two_fin2,ADout_dB(two_fin2_x)-ref_dB,'rv');                                                %fin2����г��(��ע2)
% $$$ text(two_fin2,ADout_dB(two_fin2_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','r');
% $$$ plot(three_fin1,ADout_dB(three_fin1_x)-ref_dB,'gv');                                            %fin1����г��(��ע3)
% $$$ text(three_fin1,ADout_dB(three_fin1_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','g');
% $$$ plot(three_fin2,ADout_dB(three_fin2_x)-ref_dB,'rv');                                            %fin2����г��(��ע3)
% $$$ text(three_fin2,ADout_dB(three_fin2_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','r');
% $$$ %****************************************************************
% $$$ plot(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB,'kv');                                    %2�λ���(��עA)
% $$$ text(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB+1,'A','VerticalAlignmen','bottom','Color','k');
% $$$ plot(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB,'kv');                                      %2�λ���(��עB)
% $$$ text(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB+1,'B','VerticalAlignmen','bottom','Color','k');
% $$$ %****************************************************************
% $$$ plot(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB,'cv');                                  %3�λ���(��עC)
% $$$ text(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB+1,'C','VerticalAlignmen','bottom','Color','k');
% $$$ plot(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB,'cv');                                  %3�λ���(��עD)
% $$$ text(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB+1,'D','VerticalAlignmen','bottom','Color','k');
% $$$ plot(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB,'cv');                              %3�λ���(��עE)
% $$$ text(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB+1,'E','VerticalAlignmen','bottom','Color','k');
% $$$ plot(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB,'cv');                              %3�λ���(��עF)
% $$$ text(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB+1,'F','VerticalAlignmen','bottom','Color','k');