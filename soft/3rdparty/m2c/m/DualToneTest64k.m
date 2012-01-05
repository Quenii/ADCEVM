
function [Fin1_freq, Fin1_dBFS, Fin2_freq, Fin2_dBFS, SFDR, SFDR_dBFS, ...
          IMD2_Worst, IMD2_w_dBFS, IMD3_Worst, IMD3_w_dBFS] = ...
    DualToneTest64k(fclk, numbit, NFFT, V, TPY, TPX, code, tone_code, ...
                    fin1_input, fin2_input)
% Pn_dB为底噪声，fclk为采样频率，numbit为采样精度，NFFT为FFT的深
% 度，V为峰峰值， TPY和TPX分别为时域图的Y和X轴，code
% 为1：补码，2：偏移码，3：格雷码。
%例子：若采样时钟80MHZ，精度16为，峰峰值2v，时域图显示Y轴＋－1V和X
%轴0－0.01ms， 码源为补码
% $$$ clear all
% $$$ close all
% $$$ %*****************************入口参数***************************
% $$$ format long
% $$$ fclk = 125e6;
% $$$ numbit = 14;
% $$$ V = 2;
% $$$ NFFT = 65536;
% $$$ TPY = 1;
% $$$ TPX = 0.01;
% $$$ code = 1;
% $$$ tone_code = 2;					%tone_code=1自动判断频率；=2时通过输入频率计算，
% $$$ fin1_input = 1549e5;				%输入信号1
% $$$ fin2_input = 1559e5;				%输入信号2,fin2_input必须大于fin1_input(界面设置时判断)
%*****************************编码转换***************************
%****************************************************************
ADout = V/2*ADout; 										%恢复成时域波形     
%****************************************************************
[AmpMax t1]=max(ADout);
[AmpMin t2]=min(ADout);
Vpp = AmpMax - AmpMin;								    %计算出波形的Vpp值
%****************************************************************
ADout_w=ADout.*chebwin(NFFT,200);    					%数据加窗，参数200是为了FFT波形在高频处不翘
ADout_spect=fft(ADout_w,NFFT);						    %做64K FFT
ADout_dB=20*log10(abs(ADout_spect));					%FFT后转为dB值
%****************************************************************
span_dc = 24; 											%DC SPAN(即OFFSET电压)，可设范围11-35，32K=11，64K=24
spanh_har = 4;											%谐波SPAN，可设范围3~6
span_s = 19;											%信号SPAN，可设范围16~23
%****************************************************************
maxdB=max(ADout_dB(span_dc:NFFT/2));					%找出除DC SPAN之外的最大dB值
fin=find(ADout_dB(1:NFFT/2)==maxdB);					%找出等于最大dB值时的点
freq_fin = (fin*fclk/NFFT);										%计算主信号频率
%****************************************************************
ADout_dB_temp = ADout_dB;
ADout_dB_temp(1:span_dc) = 0;
ADout_dB_temp(fin-span_s:fin+span_s) = 0;
second_maxdB=max(ADout_dB_temp(1:NFFT/2));
second_fin=find(ADout_dB_temp(1:NFFT/2)==second_maxdB);					%找出等于次高值的点
second_freq_fin = (second_fin*fclk/NFFT);												%计算次高信号的频率
%**************************生成refdB******************************
data_ref = zeros(NFFT,1);																				%空数组
for n = 1:NFFT;
    data_ref(n) = V/2*sin((n-1) * (freq_fin) / fclk * 2 * pi) ;	%按主信号频率生成理论波形
end
data_ref_w=data_ref.*chebwin(NFFT,200);													%数据加窗
data_ref_spect=fft(data_ref_w,NFFT);														%64K FFT
data_ref_dB=20*log10(abs(data_ref_spect));											%转为dB值
ref_dB=max(data_ref_dB(1:NFFT/2));															%计算参考平移值(理论值是无OFFSET的)
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
end																															%频率大的为fin2，次高为fin1
%*****************************绘图(频域)**************************
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
% $$$ xlabel('ANALOG INPUT FREQUENCY (MHz)');												%X轴显示
% $$$ ylabel('AMPLITUDE (dBFs)');																		%Y轴显示
% $$$ a1=axis; axis([a1(1) a1(2) -140 0]); 
%****************************************************************

if tone_code == 1
	 fin1_input = fin1;
	 fin2_input = fin2;
end
%****************************************************************fin1
freq_input = fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)==har_peak);	%找出最大值时的点
%****************************************************************
fin1_x = har_bin+round(tone*NFFT)-span_s-1;																							%换算成dB值的绝对位置
fin1 = (fin1_x-1)*fclk/NFFT;
fin1_freq = floor((fin1_x-1)/NFFT)*fclk+freq_input

%****************************************************************fin2
freq_input = fin2_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																							%换算成dB值的绝对位置
fin2 = (fin2_x-1)*fclk/NFFT;
fin2_freq = floor((fin2_x-1)/NFFT)*fclk+freq_input;

%****************************************************************fin2+fin1
freq_input = fin2_input+fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
fin2_plus_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																		%换算成dB值的绝对位置
fin2_plus_fin1 = (fin2_plus_fin1_x-1)*fclk/NFFT;

%****************************************************************fin2-fin1
freq_input = fin2_input-fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
fin2_sub_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																			%换算成dB值的绝对位置
fin2_sub_fin1 = (fin2_sub_fin1_x-1)*fclk/NFFT;

%****************************************************************2*fin1
freq_input = 2*fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
two_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																					%换算成dB值的绝对位置
two_fin1 = (two_fin1_x-1)*fclk/NFFT;

%****************************************************************2*fin2
freq_input = 2*fin2_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
two_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																					%换算成dB值的绝对位置
two_fin2 = (two_fin2_x-1)*fclk/NFFT;

%****************************************************************3*fin1
freq_input = 3*fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
three_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;																				%换算成dB值的绝对位置
three_fin1 = (three_fin1_x-1)*fclk/NFFT;

%****************************************************************3*fin2
freq_input = 3*fin2_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																							%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
           tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 						%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
three_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;																				%换算成dB值的绝对位置
three_fin2 = (three_fin2_x-1)*fclk/NFFT;

%****************************************************************fin1+2*fin1
freq_input = 2*fin2_input+fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																			%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
fin1_plus_2fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;										%换算成dB值的绝对位置
fin1_plus_2fin2 = (fin1_plus_2fin2_x-1)*fclk/NFFT;

%****************************************************************fin2+2*fin1
freq_input = fin2_input+2*fin1_input;
%***************子程序：找出频率对应频谱位置*********************
tone = rem(freq_input/fclk,1);
    if tone>0.5 																			%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
%****************************************************************
fin2_plus_2fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;										%换算成dB值的绝对位置
fin2_plus_2fin1 = (fin2_plus_2fin1_x-1)*fclk/NFFT;

%****************************************************************2fin2-fin1
freq_input = 2*fin2_input-fin1_input;
%***************子程序：找出频率对应频谱位置*********************
if freq_input > 0
    tone = rem(freq_input/fclk,1);
    if tone>0.5 																				%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
    har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%搜索信号附近最大值
    har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
    two_fin2_sub_fin1_x=har_bin+round(tone*NFFT)-spanh_har-1;									%换算成dB值的绝对位置
else
    two_fin2_sub_fin1_x = 0;
end
two_fin2_sub_fin1 = (two_fin2_sub_fin1_x-1)*fclk/NFFT;
%****************************************************************

%****************************************************************2fin1-fin2
freq_input = 2*fin1_input-fin2_input;
%***************子程序：找出频率对应频谱位置*********************
if freq_input > 0
    tone = rem(freq_input/fclk,1);
    if tone>0.5 																				%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
        tone=1-tone;
    end
	har_peak=max(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)); 				%搜索信号附近最大值
	har_bin=find(ADout_dB(round(tone*NFFT)-spanh_har:round(tone*NFFT)+spanh_har)==har_peak);	%找出最大值时的点
	two_fin1_sub_fin2_x=har_bin+round(tone*NFFT)-spanh_har-1;									%换算成dB值的绝对位置
else
    two_fin1_sub_fin2_x = 0;
end
two_fin1_sub_fin2 = (two_fin1_sub_fin2_x-1)*fclk/NFFT;
%****************************************************************


%****************************************************************
ADout_dB_temp(second_fin-span_s:second_fin+span_s) = 0;
three_maxdB=max(ADout_dB_temp(1:NFFT/2));
three_high_x=find(ADout_dB_temp(1:NFFT/2)==three_maxdB);                                        %找出等于第3高值的点
three_high = (three_high_x-1)*fclk/NFFT;
%****************************************************************
fin1_dBFS = ADout_dB(fin1_x) - ref_dB;                                                           %输入信号1,单位dBFS
fin2_dBFS = ADout_dB(fin2_x) - ref_dB;                                                           %输入信号2,单位dBFS
%****************************************************************
SFDR = maxdB - ADout_dB(three_high_x);                                                           %SFDR,单位dBc
SFDR_dBFS = ref_dB - ADout_dB(three_high_x);                                                     %SFDR,单位dBFS
%****************************************************************
IMD2_max = max(ADout_dB(fin2_plus_fin1_x),ADout_dB(fin2_sub_fin1_x));
IMD2_worst = maxdB - IMD2_max;                                                                   %最差IMD2,单位dBc
IMD2_worst_dBFS = ref_dB - IMD2_max;                                                             %最差IMD2,单位dBFS
%****************************************************************
IMD3_max1 = max(ADout_dB(fin1_plus_2fin2_x),ADout_dB(fin2_plus_2fin1_x));
IMD3_max2 = max(IMD3_max1,ADout_dB(two_fin2_sub_fin1_x));
IMD3_max = max(IMD3_max2,ADout_dB(two_fin1_sub_fin2_x));
IMD3_worst = maxdB - IMD3_max;                                                                   %最差IMD3,单位dBc
IMD3_worst_dBFS = ref_dB - IMD3_max;                                                             %最差IMD3,单位dBFS
% $$$ %**************************以下为绘图****************************
% $$$ plot(fin1,ADout_dB(fin1_x)-ref_dB,'gd');                                                        %fin1绿色
% $$$ plot(fin2,ADout_dB(fin2_x)-ref_dB,'rd');                                                        %fin2红色
% $$$ plot(three_high,ADout_dB(three_high_x)-ref_dB,'k*');                                            %第三高点，红色
% $$$ plot(two_fin1,ADout_dB(two_fin1_x)-ref_dB,'gv');                                                %fin1两次谐波(标注2)
% $$$ text(two_fin1,ADout_dB(two_fin1_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','g');
% $$$ plot(two_fin2,ADout_dB(two_fin2_x)-ref_dB,'rv');                                                %fin2两次谐波(标注2)
% $$$ text(two_fin2,ADout_dB(two_fin2_x)-ref_dB+1,'2','VerticalAlignmen','bottom','Color','r');
% $$$ plot(three_fin1,ADout_dB(three_fin1_x)-ref_dB,'gv');                                            %fin1三次谐波(标注3)
% $$$ text(three_fin1,ADout_dB(three_fin1_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','g');
% $$$ plot(three_fin2,ADout_dB(three_fin2_x)-ref_dB,'rv');                                            %fin2三次谐波(标注3)
% $$$ text(three_fin2,ADout_dB(three_fin2_x)-ref_dB+1,'3','VerticalAlignmen','bottom','Color','r');
% $$$ %****************************************************************
% $$$ plot(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB,'kv');                                    %2次互调(标注A)
% $$$ text(fin2_plus_fin1,ADout_dB(fin2_plus_fin1_x)-ref_dB+1,'A','VerticalAlignmen','bottom','Color','k');
% $$$ plot(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB,'kv');                                      %2次互调(标注B)
% $$$ text(fin2_sub_fin1,ADout_dB(fin2_sub_fin1_x)-ref_dB+1,'B','VerticalAlignmen','bottom','Color','k');
% $$$ %****************************************************************
% $$$ plot(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB,'cv');                                  %3次互调(标注C)
% $$$ text(fin1_plus_2fin2,ADout_dB(fin1_plus_2fin2_x)-ref_dB+1,'C','VerticalAlignmen','bottom','Color','k');
% $$$ plot(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB,'cv');                                  %3次互调(标注D)
% $$$ text(fin2_plus_2fin1,ADout_dB(fin2_plus_2fin1_x)-ref_dB+1,'D','VerticalAlignmen','bottom','Color','k');
% $$$ plot(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB,'cv');                              %3次互调(标注E)
% $$$ text(two_fin2_sub_fin1,ADout_dB(two_fin2_sub_fin1_x)-ref_dB+1,'E','VerticalAlignmen','bottom','Color','k');
% $$$ plot(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB,'cv');                              %3次互调(标注F)
% $$$ text(two_fin1_sub_fin2,ADout_dB(two_fin1_sub_fin2_x)-ref_dB+1,'F','VerticalAlignmen','bottom','Color','k');