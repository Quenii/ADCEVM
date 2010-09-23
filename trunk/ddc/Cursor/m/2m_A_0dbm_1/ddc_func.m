function [ENOB, SNR, SFDR_mdfy, SINAD] = ddc_func(data_i, data_q, numbit, r, fs)

% numbit=16;
% r = 20;
% NFFT=32768;

fclk=fs/r;


fpga_i = data_i / 2^(numbit-1);

fpga_q = data_q / 2^(numbit-1);
fpga_len = length(fpga_i);

FPGAout = fpga_i+j*fpga_q;
FPGAout = FPGAout;
FPGAout_w=FPGAout.*hanning(fpga_len);

FPGAout_spect=fft(FPGAout_w); 

FPGAout_dB=20*log10(abs(FPGAout_spect));

%Display the results in the frequency domain with an FFT plot 
%figure; 
maxdB=max(FPGAout_dB(1:fpga_len));

%Calculate SNR, SINAD, THD and SFDR values
%Find the signal bin number, DC = bin 1
fin=find(FPGAout_dB(1:fpga_len/2)==maxdB) 

%Span of the DC on each side
span=max(2); 

%Searching span for peak harmonics amp on each side  
spanh_har = 2;
%Span of the signal on each side
span_s =12% max(round(fpga_len/200),5);
%Determine power spectrum
spectP=(abs(FPGAout_spect)).*(abs(FPGAout_spect)); 
%Find DC offset power 
Pdc=sum(spectP(1:span)); 

%Extract overall signal power 
Ps=sum(spectP(fin-span_s:fin+span_s));
%Vector/matrix to store both frequency and power of signal and harmonics
Fh=[]; 

%The 1st element in the vector/matrix represents the signal, the next element represents
%the 2nd harmonic, etc.
Ph=[]; 
Harbin = [];
%Find harmonic frequencies and power components in the FFT spectrum 
for har_num=1:10
%Input tones greater than fSAMPLE are aliased back into the spectrum
tone=rem((har_num*(fin-1)+1)/fpga_len,1);%returns X - n.*Y where n = fix(X./Y)

if tone>0.5 
%Input tones greater than 0.5*fSAMPLE (after aliasing) are reflected
tone=1-tone;

end 

Fh=[Fh tone]; 
%For this procedure to work, ensure the folded back high order harmonics do not overlap 
%with DC or signal or lower order harmonics 
har_peak=max(spectP(round(tone*fpga_len)-spanh_har:round(tone*fpga_len)+spanh_har)); 
har_bin=find(spectP(round(tone*fpga_len)-spanh_har:round(tone*fpga_len)+spanh_har)==har_peak);
har_bin=har_bin+round(tone*fpga_len)-spanh_har-1;
Ph=[Ph sum(spectP(har_bin-2:har_bin+2))]; 
Harbin = [Harbin har_bin];
end

%temp power spectrum array
spectP_temp = spectP;
%Set zero amp to Ps Ph and Pd in temp array 
for i = 2:10
    spectP_temp(Harbin(i)-2:Harbin(i)+2) = 0;
end
spectP_temp(fin-span_s:fin+span_s) = 0;
spectP_temp(1:2) = 0;   

% Find max disturb signal
% Num of disturb signal 
disturb_len = 20;

spectP_disturb = zeros(1,disturb_len);
Harbin_disturb = zeros(1,disturb_len);
findSpac = 11;
findSpan = (findSpac-1)/2;
findStart = findSpan + 1;

for i = findStart:findSpac:fpga_len/2
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
Fn_disturb = Harbin_disturb/(fpga_len);
for i = 1:disturb_len
 Ph_disturb=[Ph_disturb sum(spectP(Harbin_disturb(i)-2:Harbin_disturb(i)+2))];
end
 Pd_disturb = sum(Ph_disturb(1:disturb_len));
%Determine the total distortion power 
Pd=sum(Ph(2:10));

%Determine the noise power 
Pn=(sum(spectP(1:fpga_len/2))-Pdc-Ps-Pd);


format;
AdBm = 10*log10((max(fpga_i)-min(fpga_i)/2)^2/100) + 30

SINAD=10*log10(Ps/(Pn+Pd))
SNR=10*log10(2*Ps/Pn) 
disp('THD is calculated from 2nd through 5th order harmonics');
THD=10*log10(Pd/Ph(1))
SFDR=10*log10(Ph(1)/max(Ph(2:10))) 
disp('Signal & Harmonic Power Components:');
HD=10*log10(Ph(1:10)/Ph(1))

disp('SNR is added diffFPGAoutdb');
%SNR_mdfy=SNR + diffFPGAoutdb
disp('SFDR is calculated from peak disturb power');
allDisturb = [Ph_disturb Ph(2:10)];
SFDR_mdfy = 10*log10(Ph(1)/max(allDisturb))
ENOB=(SNR-1.763)/6.02
%Distinguish all harmonics locations within the FFT plot

