function v = win(n , r)
    v = ones(n, 1)

function [SNR,SINAD,SFDR,ENOB] = AlgDynTest(data1,data2,numpt,fclk,numbit,r)
clear all
close all
format long

fpga_i = data1 / 2^(numbit-1);
fpga_q = data2 / 2^(numbit-1);

% fclk = 80e6;
% r=20;
% numbit = 16;

V = 2;
NFFT = min(32768, length(data1));
NFFT = floor(NFFT / 2) * 2;
TPY = 1;
TPX = 0.2;
code = 1;
fclk = fclk / r;


fpga_len = length(fpga_i);

ADout = V/2*(fpga_i+j*fpga_q);   %-负频带 +正频带
ad_len_N = length(ADout);
%ref_dB = 74.666;%0dbm时候的计算值。75.25

maxADout = max(abs(ADout));
real_ADout = real(ADout);

[AmpMax t1]=max(real_ADout);
[AmpMin t2]=min(real_ADout);
Vpp = AmpMax - AmpMin;

ADout_w = ADout .* win(ad_len_N, 200); % ADout_w=ADout.*chebwin(ad_len_N,200);
%ADout_w=ADout.*chebwin(ad_len);
% AA = zeros(NFFT-ad_len_N,1);
%  ADout_w = [ADout_w;AA];
ad_len = length(ADout_w);
ADout_spect = fftshift(fft(ADout_w, NFFT));
abs_ADout_spect = abs(ADout_spect);
ADout_dB = 20 * log10(abs_ADout_spect);

%Display the results in the frequency domain with an FFT plot 
%figure;  
maxdB_1 = max(ADout_dB(1:ad_len / 2 - 6));
maxdB_2 = max(ADout_dB(ad_len / 2 + 6 : ad_len));%直流点数与采样深度是否有关？ 后面定义了直流点位5个！
maxdB = max(maxdB_1,maxdB_2);
fin=find(ADout_dB(1 : ad_len)==maxdB);     %排除直流点数以外的最大值
if fin < ad_len / 2
    fin_1 = ad_len / 2 - fin ;
else
    fin_1 = fin - ad_len/2;
end

fin_lsb =  fin_1 / ad_len;
freq_fin = fin_lsb * fclk;

%refdB
data_ref_iq = zeros(ad_len_N, 1);
for n = 1 : ad_len_N ;    
    fin_angle = 2 * (n - 1) * fin_lsb * pi;
    data_ref_iq(n) = V / 2 * (cos(fin_angle) + j*sin(fin_angle));
end

data_ref_w = data_ref_iq .* win(ad_len_N, 200); % data_ref_w=data_ref_iq .* chebwin(ad_len_N, 200);

%  data_ref_w = [data_ref_w;AA];
data_ref_spect = fft(data_ref_w, NFFT);
data_ref_dB = 20 * log10(abs(data_ref_spect));
ref_dB = max(data_ref_dB(1 : ad_len/2));
BW = fclk / 4;
BW_len = (BW / fclk) * ad_len;

X_FREQ = [-ad_len / 2 : ad_len/2 - 1];                                                         %频率X轴由负-0-正排序
%AD_freq_all = fftshift(ADout_dB);                                                        %dB值按频率排序，与上面相对应
%AD_freq_all_spect = 
X_FREQ1 = [-ad_len / 2 : 200 : ad_len / 2 - 1];  

%Calculate SNR, SINAD, THD and SFDR valuess
%Find the signal bin number, DC = bin 1

%Span of the DC on each side
span=max(6); 
%Searching span for peak harmonics amp on each side  
spanh_har = 4;
%Span of the signal on each side
span_s = 19;
%Determine power spectrum
spectP = (abs_ADout_spect.^2);  % spectP = (abs(ADout_spect)) .* (abs(ADout_spect)); 
%Find DC offset power 
Pdc = sum(spectP(ad_len / 2 - span : ad_len / 2 + span)); 
Pdc_dB = sum(ADout_dB(ad_len / 2 - span : ad_len / 2 + span));
%Extract overall signal power 
Ps = sum(spectP(fin - span_s : fin + span_s));
Ps_dB=sum(ADout_dB(fin-span_s:fin+span_s));
%Vector/matrix to store both frequency and power of signal and harmonics
Fh=[]; 

%The 1st element in the vector/matrix represents the signal, the next element represents
%the 2nd harmonic, etc.
Ph=[]; 
Ph_1=[];
Harbin = [];
Harbin_1=[];
Ph_dB = [];
Ph_dB_1=[];

for har_num=1:11

tone=rem((har_num*(fin_1-1)+1)/ad_len,1);

if tone>0.5 

tone=1-tone;

end 

Fh=[Fh tone]; 

har_peak=max(spectP(round((tone+1/2)*ad_len)-spanh_har:round((tone+1/2)*ad_len)+spanh_har)); 
har_bin=find(spectP(round((tone+1/2)*ad_len)-spanh_har:round((tone+1/2)*ad_len)+spanh_har)==har_peak);
har_bin=har_bin+round((tone+1/2)*ad_len)-spanh_har-1;
Ph=[Ph sum(spectP(har_bin-spanh_har:har_bin+spanh_har))]; 
Ph_dB=[Ph_dB sum(ADout_dB(har_bin-spanh_har:har_bin+spanh_har))];
Harbin = [Harbin har_bin];

har_peak_1=max(spectP(round((1/2-tone)*ad_len)-spanh_har:round((1/2-tone)*ad_len)+spanh_har)); 
har_bin_1=find(spectP(round((1/2-tone)*ad_len)-spanh_har:round((1/2-tone)*ad_len)+spanh_har)==har_peak_1);
har_bin_1=har_bin_1+round((1/2-tone)*ad_len)-spanh_har-1;
Ph_1=[Ph_1 sum(spectP(har_bin_1-spanh_har:har_bin_1+spanh_har))]; 
Ph_dB_1=[Ph_dB_1 sum(ADout_dB(har_bin_1-spanh_har:har_bin_1+spanh_har))];
Harbin_1 = [Harbin_1 har_bin_1];
end


spectP_temp = spectP;

for i = 2:10
    spectP_temp(Harbin(i)-spanh_har:Harbin(i)+spanh_har) = 0;
end
spectP_temp(fin-span_s:fin+span_s) = 0;
spectP_temp(ad_len/2-span:ad_len/2+span) = 0;   


disturb_len =20;
spectP_disturb = zeros(1,disturb_len);
Harbin_disturb = zeros(1,disturb_len);
findSpac = 60;
findSpan = (findSpac-1)/2;
findStart = findSpan + 1;

for i = findStart:findSpac:ad_len
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
Fn_disturb = (Harbin_disturb-ad_len/2)/(ad_len);
for i = 1:disturb_len
 Ph_disturb=[Ph_disturb sum(spectP(Harbin_disturb(i)-spanh_har:Harbin_disturb(i)+spanh_har))];
 Ph_disturb_dB = [Ph_disturb_dB sum(ADout_dB(Harbin_disturb(i)-spanh_har:Harbin_disturb(i)+spanh_har))];
end
 Pd_disturb = sum(Ph_disturb(1:disturb_len));
 Pd_disturb_dB = sum(Ph_disturb_dB(1:disturb_len));

Pd=sum(Ph(2:10));
Pd_dB = sum(Ph_dB(2:10));
Pd_dB_1 = sum(Ph_dB_1(2:10));
Pd_dB_2 = Pd_dB + Pd_dB_1;


Pn=(sum(spectP(1:ad_len))-Pdc-Ps-Pd);
Pn_dB = (sum(ADout_dB((ad_len/2-BW_len):ad_len/2+BW_len))-Pdc_dB-Ps_dB-Pd_dB_2 - Pd_disturb_dB)/(2*BW_len) - ref_dB;
% Vin = 20*log10(Vpp/2);
Vin = maxdB - ref_dB;
SINAD=10*log10(Ps/(Pn+Pd));
SNR=10*log10(Ps/Pn); 
THD=10*log10(Pd/Ps);
SFDR=10*log10(Ps/max(max(Ph(2:10),max(Ph_disturb(1:disturb_len))))); 
HD=10*log10(Ph(1:10)/Ph(1));


SNRFS = SNR + abs(maxdB-ref_dB);
ENOB = (SINAD - 1.76)/6.02;
ENOBFS = ENOB+abs(maxdB-ref_dB)/6.02;
% A = [AmpMax,AmpMin];
% AdB = Vin;
HD = [ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(3))-ref_dB,ADout_dB(Harbin(4))-ref_dB,ADout_dB(Harbin(5))-ref_dB,ADout_dB(Harbin(6))-ref_dB,ADout_dB(Harbin(7))-ref_dB,ADout_dB(Harbin(8))-ref_dB,ADout_dB(Harbin(9))-ref_dB,ADout_dB(Harbin(10))-ref_dB]; 
%Spectrum = ADout_dB - ref_dB;