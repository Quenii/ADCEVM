function [SNR, SINAD, SFDR, ENOB, HD, Fh, Harbin, Harbin_disturb, THD, Spectrum] = AlgDynTest1k(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r)
format long

fclk = fclk / r;
ADout = VppFs/2*(fpga_i+j*fpga_q);                              %-负频带 +正频带
maxADout = max(abs(ADout));
[AmpMax t1]=max(real(ADout));
[AmpMin t2]=min(real(ADout));
Vpp = AmpMax - AmpMin;

ADC_complex=complex(fpga_i,-fpga_q);
ADout_w = fpga_i;
%ADout_w = blackmanharris(numpt);
ad_len = length(ADout_w);
x=(ADC_complex(1:numpt)).*ADout_w;
ADout_spect = fftshift(fft(x));
ADout_dB=20*log10(abs(fftshift(fft(x,numpt))));

maxdB_1=max(ADout_dB(1:ad_len/2-6));
maxdB_2=max(ADout_dB(ad_len/2+6:ad_len));%直流点数与采样深度是否有关？ 后面定义了直流点位5个！
maxdB = max(maxdB_1,maxdB_2);
fin=find(ADout_dB(1:ad_len)==maxdB);     %排除直流点数以外的最大值
if fin <ad_len/2
    fin_1 = ad_len/2-fin ;
else
    fin_1 = fin - ad_len/2;
end
fin_lsb = (fin_1/ad_len);
freq_fin = fin_lsb*fclk;                %第二个奈克斯特频率区
%ref_dB = 51.2308;						%0dbm时候的计算值(1024点)
data_ref_iq = zeros(numpt,1);
for n = 1:numpt;    
    fin_angle=2*(n-1)*fin_lsb*pi;
    data_ref_iq(n) = VppFs/2*(cos(fin_angle)+j*sin(fin_angle));
end
data_ref_w=data_ref_iq.*ADout_w;
data_ref_spect=fft(data_ref_w, numpt);
data_ref_dB=20*log10(abs(data_ref_spect));
ref_dB=max(data_ref_dB(1:ad_len/2))+3; %ddc为I/Q两路，因此多3dB增益

BW = fclk /4;
BW_len = (BW/fclk)*ad_len;

%Calculate SNR, SINAD, THD and SFDR values
%Find the signal bin number, DC = bin 1

%Span of the DC on each side
span=max(4); 
%Searching span for peak harmonics amp on each side  
spanh_har = 6;
%Span of the signal on each side
span_s = 6;
%Determine power spectrum
spectP=(abs(ADout_spect)).*(abs(ADout_spect)); 
%Find DC offset power 
l = max(ad_len / 2 - span , 1); 
u = min( ad_len / 2 + span, length(spectP));
Pdc = sum(spectP(l : u)); 

l = max(ad_len/2-span, 1);
u = min(ad_len/2+span, length(ADout_dB));
Pdc_dB = sum(ADout_dB(l:u));

%Extract overall signal power 
l = max(fin-span_s, 1);
u = min(fin+span_s, length(spectP));
Ps=sum(spectP(l : u));

l = max(fin-span_s, 1);
u = min(fin+span_s, length(ADout_dB));
Ps_dB = sum(ADout_dB(l : u));
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

    l = max(round((tone+1/2)*ad_len)-spanh_har, 1);
    u = min(round((tone+1/2)*ad_len)+spanh_har, length(spectP));
    har_peak=max(spectP(l : u)); 
    
    l = max(round((tone+1/2)*ad_len)-spanh_har, 1);
    u = min(round((tone+1/2)*ad_len)+spanh_har, length(spectP));
    har_bin=find(spectP(l : u)==har_peak);
    har_bin=har_bin+round((tone+1/2)*ad_len)-spanh_har-1;
    
    l = max(har_bin-spanh_har, 1);
    u = min(har_bin+spanh_har, length(spectP));
    Ph=[Ph sum(spectP(l : u))]; 
    
    l = max(har_bin-spanh_har, 1);
    u = min(har_bin+spanh_har, length(ADout_dB));
    Ph_dB=[Ph_dB sum(ADout_dB(l : u))];
    
    Harbin = [Harbin har_bin];

    l = max(round((1/2-tone)*ad_len)-spanh_har, 1);
    u = min(round((1/2-tone)*ad_len)+spanh_har, length(spectP));
    har_peak_1=max(spectP(l : u)); 
    har_bin_1=find(spectP(l : u)==har_peak_1);
    
    l = max(har_bin-spanh_har, 1);
    u = min(har_bin+spanh_har, length(spectP));
    har_bin_1=har_bin_1+round((1/2-tone)*ad_len)-spanh_har-1;
    Ph_1=[Ph_1 sum(spectP(l : u))]; 
    Ph_dB_1=[Ph_dB_1 sum(ADout_dB(l : u))];
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
findSpac = 16;
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
Ph_disturb_BW=[];
Fn_disturb = (Harbin_disturb-ad_len/2)/(ad_len);
for i = 1:disturb_len
    if (Harbin_disturb(i)-spanh_har)<1
        min_Harbin=1;
    else
        min_Harbin=Harbin_disturb(i)-spanh_har;
    end
    
    if (Harbin_disturb(i)+spanh_har)>length(spectP)
        max_Harbin=length(spectP);
    else
        max_Harbin=Harbin_disturb(i)+spanh_har;
    end
    if Harbin_disturb(i)<(ad_len/2+BW_len-spanh_har) && Harbin_disturb(i)>(ad_len/2-BW_len+spanh_har)
        Ph_disturb_BW=[Ph_disturb_BW sum(spectP(min_Harbin:max_Harbin))];
    end
         
    Ph_disturb=[Ph_disturb sum(spectP(min_Harbin:max_Harbin))];
    Ph_disturb_dB = [Ph_disturb_dB sum(ADout_dB(min_Harbin:max_Harbin))];
end
Pd_disturb = sum(Ph_disturb(1:disturb_len));
Pd_disturb_dB = sum(Ph_disturb_dB(1:disturb_len));

Pd=sum(Ph(2:10));
Pd_dB = sum(Ph_dB(2:10));
Pd_dB_1 = sum(Ph_dB_1(2:10));
Pd_dB_2 = Pd_dB + Pd_dB_1;


Pn=(sum(spectP(1:ad_len))-Pdc-Ps-Pd);
%%%Pn_dB = (sum(ADout_dB((ad_len/2-BW_len):ad_len/2+BW_len))-Pdc_dB-Ps_dB-Pd_dB_2 - Pd_disturb_dB)/(2*BW_len) - ref_dB;
Pn_dB = 10*log10((sum(spectP((ad_len/2-BW_len):ad_len/2+BW_len))-sum(Ps)-sum(Pdc)-sum(Ph_disturb_BW))/(2*BW_len)) - ref_dB;
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
%HD = [ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(2))-ref_dB,ADout_dB(Harbin(3))-ref_dB,ADout_dB(Harbin(4))-ref_dB,ADout_dB(Harbin(5))-ref_dB,ADout_dB(Harbin(6))-ref_dB,ADout_dB(Harbin(7))-ref_dB,ADout_dB(Harbin(8))-ref_dB,ADout_dB(Harbin(9))-ref_dB,ADout_dB(Harbin(10))-ref_dB]; 
Spectrum = ADout_dB - ref_dB;
HD = [Spectrum(Harbin(2)),Spectrum(Harbin(2)),Spectrum(Harbin(3)),Spectrum(Harbin(4)),Spectrum(Harbin(5)),Spectrum(Harbin(6)),Spectrum(Harbin(7)),Spectrum(Harbin(8)),Spectrum(Harbin(9)),Spectrum(Harbin(10))]; 

