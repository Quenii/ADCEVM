clear all
close all

numbit=16;


fs = 80e6;   % sampling rate MHz 
r = 20;      % r>0;
%AD amp deviation

%r=20;
%r=2;
%NFFT=256;
NFFT=800;
fclk=80e6/r;
%fid = fopen('F:\project\DDC_CETC14_STEP2\fpga\FPGA_STEP1\FPGA_test\s60d_2.txt');
fid1 = fopen('');
fid2 = fopen('');
fpga_i = fscanf(fid1,'%d')/ 2^(numbit-1);
fpga_q = fscanf(fid2,'%d')/ 2^(numbit-1);

% fpga_len = length(fpga);
% fpga_i_cnt = 1;
% fpga_q_cnt = 1;
% 
% for i = 1:fpga_len    %i first
%     k = mod(i,r);
%     if (k == 1)
%         fpga_i(fpga_i_cnt) = fpga(i);
%         fpga_i_cnt = fpga_i_cnt + 1;
%     end
%     if (k == 2)
%         fpga_q(fpga_q_cnt) = fpga(i);
%         fpga_q_cnt = fpga_q_cnt + 1;
%     end
% end

fpga_len = length(fpga_i);



figure(1)
plot(fpga_i);
figure(2)
plot(fpga_q);

FPGAout = fpga_i + j*fpga_q;
FPGAout = FPGAout';
FPGAout_w=FPGAout.*hanning(fpga_len);

FPGAout_spect=fft(FPGAout_w); 

FPGAout_dB=20*log10(abs(FPGAout_spect));

%Display the results in the frequency domain with an FFT plot 
%figure; 
maxdB=max(FPGAout_dB(1:fpga_len));
figure(3)
%For TTIMD, use the following short routine, normalized to ��6.5dB full-scale.
plot([0:round(fpga_len/2)-1].*fclk/fpga_len,FPGAout_dB(1:round(fpga_len/2))-maxdB);

%plot([0:numpt/2-1].*fclk/numpt,Dout_dB(1:numpt/2)-maxdB); 
grid on; 
title('FFT PLOT'); 
xlabel('ANALOG INPUT FREQUENCY (MHz)');
ylabel('AMPLITUDE (dB)');
a1=axis; axis([a1(1) a1(2) -120 a1(4)]); 

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
        for j = 1:disturb_len - 2
            for k = 1:(disturb_len-j)
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
AdBm = 10*log10((max(FPGAout)-min(FPGAout)/2)^2/100) + 30

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

%Distinguish all harmonics locations within the FFT plot
hold on; 
% plot(Fh(2)*fclk,0,'mo',Fh(3)*fclk,0,'cx',Fh(4)*fclk,0,'r+',Fh(5)*fclk,0,'g*', Fh(6)*fclk,0,'bs',Fh(7)*fclk,0,'bd',Fh(8)*fclk,0,'kv',Fh(9)*fclk,0,'y^');
% legend('1st','2nd','3rd','4th','5th','6th','7th','8th','9th');
% hold on; 
plot(Fh(2)*fclk,FPGAout_dB(Harbin(2))-maxdB,'ro',Fh(3)*fclk,FPGAout_dB(Harbin(3))-maxdB,'rx',Fh(4)*fclk,FPGAout_dB(Harbin(4))-maxdB,'r+',Fh(5)*fclk,FPGAout_dB(Harbin(5))-maxdB,'r*', Fh(6)*fclk,FPGAout_dB(Harbin(6))-maxdB,'rs',Fh(7)*fclk,FPGAout_dB(Harbin(7))-maxdB,'rd',Fh(8)*fclk,FPGAout_dB(Harbin(8))-maxdB,'rv',Fh(9)*fclk,FPGAout_dB(Harbin(9))-maxdB,'r^');
legend('1st','2nd','3rd','4th','5th','6th','7th','8th','9th');
hold on;
for i = 1:disturb_len
    hold on;
    plot(Fn_disturb(i)*fclk,FPGAout_dB(Harbin_disturb(i))-maxdB,'g*');
end
hold off; 
figure(4)
plot(FPGAout_dB - maxdB)
%Dynamic-Range Specifications, TTIMD 

%Two-tone IMD can be a tricky measurement, because the additional equipment required (a power combiner to combine two input frequencies) can contribute unwanted intermodulation products that falsify the ADC's intermodulation distortion. You must observe the following conditions to optimize IMD performance, although they make the selection of proper input frequencies a tedious task. 

%First, the input tones must fall into the passband of the input filter. If these tones are close together (several tens or hundreds of kilohertz for a megahertz bandwidth), an appropriate window function must be chosen as well. Placing them too close together, however, may allow the power combiner to falsify the overall IMD readings by contributing unwanted 2nd- and 3rd-order IMD products (depending on the input tones' location within the passband). Spacing the input tones too far apart may call for a different window type that has less frequency resolution. 

%The setup also requires a minimum of three phase-locked signal generators. This requirement seldom poses a problem for test labs, but generators have different capabilities for matching frequency and amplitude. Compensating such mismatches to achieve (for example) a -0.5dB FS two-tone envelope and signal amplitudes of -6.5dB FS will increase your effort and test time (see the following program-code extraction). 

%For TTIMD, use the following short routine, normalized to -6.5dB full-scale.
% plot([0:fpga_len/2-1].*fclk/fpga_len,FPGAout_dB(1:fpga_len/2)-maxdB-6.5); 
% 
% plot([0:fpga_len/2-1].*fclk/fpga_len,FPGAout_dB(1:fpga_len/2)-maxdB); 
% grid on;
% title('FFT PLOT');
% xlabel('ANALOG INPUT FREQUENCY (MHz)');
% ylabel('AMPLITUDE (dB)');
% a1=axis; axis([a1(1) a1(2) -120 a1(4)]);