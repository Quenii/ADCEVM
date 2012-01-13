%%%(Harbin(i)-1)*fclk/65536, ADout_dB(Harbin(i))-ref_dB
%%%Fn_disturb(disturb_len - i)*fclk, ADout_dB(Harbin_disturb(disturb_len - i))-ref_dB
%%%Pn_dB noise floor
function [freq_fin, Vin, Vpp, SNR, SFDR, SINAD, THD, HD, Pn_dB, ...
          ADout_dB, Harbin, Fn_disturb, Harbin_disturb, disturb_len, ref_dB]...
    =AdcDynTest64k(ADout, fclk, numbit, V, TPY, TPX, tone_code, fin_input)
% Pn_dB为底噪声，fclk为采样频率，numbit为采样精度，NFFT为FFT的深度，V为峰峰值，TPY和TPX分别为时域图的Y和X轴，code
% 为1：补码，2：偏移码，3：格雷码。
%例子：若采样时钟80MHZ，精度16为，峰峰值2v，时域图显示Y轴＋－1V和X轴0－0.01ms，码源为补码
%[SNR, SFDR, SNRFS,SINAD, THD, HD, ENOB, ENOBFS, Pn_dB] = calc_64k_dynam_params(80e6, 16, 32768, 2, 1, 0.01, 1)
%*****************************入口参数***************************
% $$$ format long
% $$$ fclk = 125e6;
% $$$ numbit = 14;
% $$$ V = 2;
% $$$ NFFT = 65536;
% $$$ TPY = 1;
% $$$ TPX = 0.01;
% $$$ code = 1;
% $$$ tone_code = 1;		%tone_code=1自动判断频率；=2时通过输入频率计算，
% $$$ fin_input = 1351e5;	%输入信号
%****************************************************************
NFFT = 65536;
ADout = V/2*ADout; 							%恢复成时域波形     
%****************************************************************
[AmpMax t1]=max(ADout);
[AmpMin t2]=min(ADout);
Vpp = AmpMax - AmpMin;							%计算出波形的Vpp值
%****************************************************************
ADout_w=ADout.*ADout;%chebwin(NFFT,200);    			%数据加窗，参数200是为了FFT波形在高频处不翘
ADout_spect=fft(ADout_w,NFFT);				    %做64K FFT
ADout_dB=20*log10(abs(ADout_spect));			%FFT后转为dB值
%****************************************************************
span_dc = 24; 								%DC SPAN(即OFFSET电压)，可设范围11-35，32K=11，64K=24
spanh_har = 4;								%谐波SPAN，可设范围3~6
span_s = 19;								%信号SPAN，可设范围16~23
%****************************************************************
maxdB=max(ADout_dB(span_dc:NFFT/2));			%找出除DC SPAN之外的最大dB值
fin=find(ADout_dB(1:NFFT/2)==maxdB);			%找出等于最大dB值时的点
freq_fin = (fin-1)*fclk/NFFT;					%计算主信号频率
%**************************生成refdB******************************
data_ref = zeros(NFFT,1);						%空数组
for n = 1:NFFT;
    data_ref(n) = V/2*sin((n-1) * (freq_fin) / fclk * 2 * pi) ;		%按主信号频率生成理论波形
end
data_ref_w=data_ref.*ADout;%chebwin(NFFT,200);					%数据加窗
data_ref_spect=fft(data_ref_w,NFFT);					%64K FFT
data_ref_dB=20*log10(abs(data_ref_spect));				%转为dB值
ref_dB=max(data_ref_dB(1:NFFT/2));					%计算参考平移值(理论值是无OFFSET的)
%*****************************绘图(频域)**************************
% $$$ figure(1)
%% Draw horizontal lines;
%% Set Y-axis 0~-140dB
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
%****************************************************************
% $$$ title('FFT PLOT');
% $$$ xlabel('ANALOG INPUT FREQUENCY (MHz)');                                                     %X轴显示
% $$$ ylabel('AMPLITUDE (dBFs)');                                                                 %Y轴显示
% $$$ a1=axis; axis([a1(1) a1(2) -140 0]); 
%****************************************************************
tone = rem(fin_input/fclk,1);
    if tone>0.5 																			%等于0.5时输入频率为Fs/2，判断输入信号1是否大于Fs/2
           tone=1-tone;
    end
har_peak=max(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)); 					%搜索信号附近最大值
har_bin=find(ADout_dB(round(tone*NFFT)-span_s:round(tone*NFFT)+span_s)==har_peak);          %找出最大值时的点
fin_x = har_bin+round(tone*NFFT)-span_s-1;													%换算成dB值的绝对位置
if tone_code == 2
    freq_fin = fin_input + floor((fin_x-1)/fclk)*fclk;                %实际最大值(和设置会有区别)     
    fin = fin_x;
end
%******************主信号和2~10次谐波功率dB值********************
spectP=(abs(ADout_spect)).*(abs(ADout_spect));                                              %电压*电压，即计算输入信号的总功率(非dB值)
Ph=[]; 
Harbin = [];
Ph_dB = [];
for har_num=1:10
    tone=rem(har_num*fin/NFFT,1);
    if tone>0.5                                                                             %等于0.5时输入频率为Fs/2，判断主信号和2~10次谐波是否大于Fs/2
        tone=1-tone;
    end
    har_peak=max(spectP(round(tone*NFFT)-2*spanh_har:round(tone*NFFT)+2*spanh_har));    			  			%搜索信号和2~10次谐波功率的最大值
    har_bin=find(spectP(round(tone*NFFT)-2*spanh_har:round(tone*NFFT)+2*spanh_har)==har_peak);				%找出最大值时的点(在信号或者谐波相对的数组位置)
    har_bin=har_bin+round(tone*NFFT)-2*spanh_har-1;                  		                    					%转换成功率的绝对位置
    Ph=[Ph sum(spectP(har_bin-spanh_har:har_bin+spanh_har))];                               %计算Ph：主信号和2~10次谐波功率
    Ph_dB=[Ph_dB sum(ADout_dB(har_bin-spanh_har:har_bin+spanh_har))];                       %计算Ph_dB：主信号和2~10次谐波功率dB值
    Harbin = [Harbin har_bin];																%主信号和2~10次谐波所在的位置
end
%****************************************************************
Pdc=sum(spectP(1:span_dc));                         %DC OFFSET功率
Ps=sum(spectP(fin-span_s:fin+span_s));				%信号总功率Ps
Pd=sum(Ph(2:5));                                    %2~5谐波功率之和
Pn=(sum(spectP(1:NFFT/2))-Pdc-Ps-Pd);				%总功率去除（2~5谐波功率、DC OFFSET功率、信号功率）
%******************
Vin = maxdB - ref_dB;                               %Vin输入信号dB值
SINAD=10*log10(Ps/(Pn+Pd));                          %SINAD计算
SNR=10*log10(Ps/Pn);                                 %SNR计算
THD=10*log10(Pd/Ph(1));                              %THD计算
SNR_dBFS = SNR -Vin;                                 %SNR dBFS值计算
ENOB = (SINAD - 1.76)/6.02;                          %ENOB计算
ENOBFS = (SINAD - Vin - 1.76)/6.02;					%ENOB dBFS计算
HD = [ADout_dB(Harbin(1))-ref_dB, ADout_dB(Harbin(2))-ref_dB, ...
      ADout_dB(Harbin(3))-ref_dB, ADout_dB(Harbin(4))-ref_dB, ...
      ADout_dB(Harbin(5))-ref_dB, ADout_dB(Harbin(6))-ref_dB, ...
      ADout_dB(Harbin(7))-ref_dB, ADout_dB(Harbin(8))-ref_dB, ...
      ADout_dB(Harbin(9))-ref_dB, ADout_dB(Harbin(10))-ref_dB];
%*********************除2~10谐波之外的杂散搜索*******************
%*************************杂散功率计算***************************
%****************用于计算噪底和SFDR，其他参数无用****************
spectP_temp = spectP;
for i = 2:10
    spectP_temp(Harbin(i)-spanh_har:Harbin(i)+spanh_har) = 0;		%2~10次谐波功率=0
end
spectP_temp(fin-span_s:fin+span_s) = 0;                             %信号功率=0
spectP_temp(1:span_dc) = 0;                                         %DC OFFSET功率=0，即spectP_temp为噪声功率
%****************************************************************
disturb_len = 19;										
spectP_disturb = zeros(1,disturb_len);
Harbin_disturb = zeros(1,disturb_len);
findSpac = 30;                                                      %用于去除包络上的其他毛刺
findSpan = (findSpac-1)/2;
findStart = findSpan + 1;
%****************************
for i = findStart:findSpac:NFFT/2
    [spectP_disturb_peak, num]=max(spectP_temp(i-findSpan:i+findSpan)); 
    if (spectP_disturb_peak > spectP_disturb(1))
        spectP_disturb(1) = spectP_disturb_peak;
        Harbin_disturb(1) = i-findStart+num;
        array_flag = 1;
    else
        array_flag = 0;
    end
    if (array_flag == 1)
        for jj = 1:disturb_len - 2
            for k = 1:(disturb_len-jj)
                if spectP_disturb(k) > spectP_disturb(k+1)
                    spectP_disturb_temp = spectP_disturb(k);
                    spectP_disturb(k) = spectP_disturb(k+1);
                    spectP_disturb(k+1) = spectP_disturb_temp;
                    Harbin_disturb_temp = Harbin_disturb(k);
                    Harbin_disturb(k) = Harbin_disturb(k+1);
                    Harbin_disturb(k+1) = Harbin_disturb_temp;                  
                end
            end
        end
    end
end
Ph_disturb=[];
Ph_disturb_dB = [];
Fn_disturb = (Harbin_disturb-1)/(NFFT);
for i = 1:disturb_len
    Ph_disturb=[Ph_disturb sum(spectP(Harbin_disturb(i)-spanh_har:Harbin_disturb(i)+spanh_har))];
    Ph_disturb_dB = [Ph_disturb_dB sum(ADout_dB(Harbin_disturb(i)-spanh_har:Harbin_disturb(i)+spanh_har))];
end
Pd_disturb = sum(Ph_disturb(1:disturb_len));								%除信号、2~10次谐波、噪声之外的杂散功率(相当于干扰功率)
Pd_disturb_dB = sum(Ph_disturb_dB(1:disturb_len));
%****************************************************************
Pdc_dB=sum(ADout_dB(1:span_dc));											%DC OFFSET功率dB值
Ps_dB =sum(ADout_dB(fin-span_s:fin+span_s));								%信号功率dB值
Pd_dB = sum(Ph_dB(2:10));                                                   %2~10谐波功率之和dB值
Pn_dB = (sum(ADout_dB(1:NFFT/2))-Pdc_dB-Ps_dB-Pd_dB - Pd_disturb_dB)*2/(NFFT-span_dc-spanh_har*5-span_s) - ref_dB;	%噪底dB值
SFDR=10*log10(Ph(1)/max(max(Ph(2:10),max(Ph_disturb(1:disturb_len)))));	 	%SFDR计算
SFDR_dBFS = SFDR - Vin;          %SFDR dBFS值
ADout_dB = ADout_dB - ref_dB;
%****************************************************************
%%% Draw markers and numbers on 1~10th harmonic,
% $$$ hold on; 
% $$$ plot((Harbin(1)-1)*fclk/NFFT,ADout_dB(Harbin(1))-ref_dB,'rd');
% $$$ plot((Harbin(2)-1)*fclk/NFFT,ADout_dB(Harbin(2))-ref_dB,'rv');
% $$$ plot((Harbin(3)-1)*fclk/NFFT,ADout_dB(Harbin(3))-ref_dB,'rv');
% $$$ plot((Harbin(4)-1)*fclk/NFFT,ADout_dB(Harbin(4))-ref_dB,'rv');
% $$$ plot((Harbin(5)-1)*fclk/NFFT,ADout_dB(Harbin(5))-ref_dB,'rv');
% $$$ plot((Harbin(6)-1)*fclk/NFFT,ADout_dB(Harbin(6))-ref_dB,'rv');
% $$$ plot((Harbin(7)-1)*fclk/NFFT,ADout_dB(Harbin(7))-ref_dB,'rv');
% $$$ plot((Harbin(8)-1)*fclk/NFFT,ADout_dB(Harbin(8))-ref_dB,'rv');
% $$$ plot((Harbin(9)-1)*fclk/NFFT,ADout_dB(Harbin(9))-ref_dB,'rv');
% $$$ plot((Harbin(10)-1)*fclk/NFFT,ADout_dB(Harbin(10))-ref_dB,'rv');
% $$$ text((Harbin(2)-1)*fclk/NFFT,ADout_dB(Harbin(2))-ref_dB+2,'2','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(3)-1)*fclk/NFFT,ADout_dB(Harbin(3))-ref_dB+2,'3','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(4)-1)*fclk/NFFT,ADout_dB(Harbin(4))-ref_dB+2,'4','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(5)-1)*fclk/NFFT,ADout_dB(Harbin(5))-ref_dB+2,'5','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(6)-1)*fclk/NFFT,ADout_dB(Harbin(6))-ref_dB+2,'6','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(7)-1)*fclk/NFFT,ADout_dB(Harbin(7))-ref_dB+2,'7','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(8)-1)*fclk/NFFT,ADout_dB(Harbin(8))-ref_dB+2,'8','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(9)-1)*fclk/NFFT,ADout_dB(Harbin(9))-ref_dB+2,'9','VerticalAlignmen','bottom','Color','r');
% $$$ text((Harbin(10)-1)*fclk/NFFT,ADout_dB(Harbin(10))-ref_dB+2,'10','VerticalAlignmen','bottom','Color','r');
%%% Draw a Horizonta line in noise floor???
% $$$ hold on;
% $$$ plot([0:round(NFFT/2)-1].*fclk/NFFT,Pn_dB,'m-');
%%% Show text(SNR etc)  
% $$$ NFFT_txt = '64K'; 
% $$$ FRQ_txt = num2str(freq_fin/1e6,'%2.1f');
% $$$ FRQ_txt = strcat(FRQ_txt,'MHz');
% $$$ FFT_txt = strcat(NFFT_txt,' FFT');
% $$$ FREQ_txt = strcat(num2str(fclk/1e6,'%2d'),'MSPS');
% $$$ DBFS_txt = strcat(FRQ_txt,'@', num2str(maxdB-ref_dB,'%2.1f'),'dBFs');
% $$$ SNR_txt = strcat('SNR =',num2str(SNR,'% 2.3f'),' dBc');
% $$$ SFDR_txt = strcat('SFDR =  ',num2str(SFDR,'% 2.3f'),' dBc');
% $$$ %****************************************************************
% $$$ text(fclk*5.6/16,-5,FFT_txt,'HorizontalAlignment','left','Color','r');
% $$$ text(fclk*5.6/16,-13,FREQ_txt,'HorizontalAlignment','left','Color','r');
% $$$ text(fclk*5.6/16,-21,DBFS_txt,'HorizontalAlignment','left','Color','r');
% $$$ text(fclk*5.6/16,-29,SNR_txt,'HorizontalAlignment','left','Color','r');
% $$$ text(fclk*5.6/16,-37,SFDR_txt,'HorizontalAlignment','left','Color','r');
% $$$ %text(fclk*6/16,-55,THD_txt,'HorizontalAlignment','left','Color','r');
%%% Draw markers of high order harmonic
% $$$ hold on;
% $$$ for i = 0:disturb_len/2
% $$$     hold on;
% $$$     plot(Fn_disturb(disturb_len - i)*fclk,ADout_dB(Harbin_disturb(disturb_len - i))-ref_dB,'g*');
% $$$ end
% $$$ hold off;

%%% Time Domain figure;
%****************************
% $$$ VPP_txt = strcat(num2str(Vpp,'%2.3f'),' Vpp');
% $$$ figure(2)
% $$$ %****************************
% $$$ plot([1:NFFT].*1e3/fclk,ADout(1:NFFT));
% $$$ title('Time PLOT'); 
% $$$ xlabel('TIME (ms)');
% $$$ ylabel('AMPLITUDE (V)');
% $$$ hold on
% $$$ axis([0 TPX -TPY TPY]);
% $$$ % text(t1,AmpMax,num2str(AmpMax),'VerticalAlignmen','bottom');
% $$$ % text(t1,AmpMin,num2str(AmpMin),'VerticalAlignmen','top')
% $$$ text(TPX*0.85,0.9*TPY,VPP_txt,'HorizontalAlignment','left','Color','r')
% $$$ text(TPX*0.85,0.8*TPY,FRQ_txt,'HorizontalAlignment','left','Color','r')
% $$$ %****************************************************************