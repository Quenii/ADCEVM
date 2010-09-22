function [SNR,SINAD,SFDR,ENOB] = AdcDynTest(data,numpt,fclk,numbit)

%截取指定长度数据
data = data(1:numpt);        

%提示数据可能溢出警告
% if (max(data)==2^numbit-1) || (min(data)==0)
% disp('Warning: ADC may be clipping!!!'); 
% end 

%Recenter the digital sine wave 
Dout=data-(2^numbit-1)/2; 

%显示时域波形
% figure;
% plot([1:numpt],Dout+128);
% axis([0 1024 0 2^numbit-1]);
% grid on; 
% title('TIME DOMAIN');
% xlabel('SAMPLES');
% ylabel('DIGITAL OUTPUT CODE');
% text(800,240,['\color{red} SampleRate=',num2str(fclk),'MHz']);

%选择加窗函数
%Doutw=Dout;
%Doutw=Dout.*(hanning(numpt))';         
Doutw=Dout.*(hamming(numpt))'; 

%FFT计算
Dout_spect=fft(Doutw); 

%求对数
Dout_dB=20*log10(abs(Dout_spect));
%test
%a = Dout_dB(1:10)


%显示频域归一化频谱 
%figure; 
%maxdB=max(Dout_dB(1:numpt/2)); 
% sif modify, remove the dc 
maxdB=max(Dout_dB(3:numpt/2)); 

%For TTIMD, use the following short routine, normalized to —6.5dB full-scale.
%plot([0:numpt/2-1].*fclk/numpt,Dout_dB(1:numpt/2)-maxdB-6.5); 


% plot([0:numpt/2-1].*fclk/numpt,Dout_dB(1:numpt/2)-maxdB); 
% grid on; 

% title(ttitle); 
% xlabel('ANALOG INPUT FREQUENCY (MHz)');
% ylabel('AMPLITUDE (dB)');
% a1=axis; 
% axis([a1(1) a1(2) -120 a1(4)]); 

%Calculate SNR, SINAD, THD and SFDR values
%Find the signal bin number, DC = bin 1
fin=find(Dout_dB(1:numpt/2)==maxdB);
%Span of the input frequency on each side 
span=max(round(numpt/200),5); 
%Approximate search span for harmonics on each side 
spanh=2;
%Determine power spectrum
spectP=(abs(Dout_spect)).*(abs(Dout_spect)); 
%Find DC offset power 
Pdc=sum(spectP(1:span)); 
%Extract overall signal power 
Ps=sum(spectP(fin-span:fin+span));
%Vector/matrix to store both frequency and power of signal and harmonics
Fh=[]; 
%The 1st element in the vector/matrix represents the signal, the next element represents
%the 2nd harmonic, etc.
Ph=[]; 

%Find harmonic frequencies and power components in the FFT spectrum 
for har_num=1:10
%Input tones greater than fSAMPLE are aliased back into the spectrum
tone=rem((har_num*(fin-1)+1)/numpt,1); 
if tone>0.5 
%Input tones greater than 0.5*fSAMPLE (after aliasing) are reflected
tone=1-tone;
end 
Fh=[Fh tone]; 
%For this procedure to work, ensure the folded back high order harmonics do not overlap 
%with DC or signal or lower order harmonics 
har_peak=max(spectP(round(tone*numpt)-spanh:round(tone*numpt)+spanh)); 
har_bin=find(spectP(round(tone*numpt)-spanh:round(tone*numpt)+spanh)==har_peak);
har_bin=har_bin+round(tone*numpt)-spanh-1;
Ph=[Ph sum(spectP(har_bin-1:har_bin+1))]; 
end 

%计算总谐波功率，5次谐波以下
Pd=sum(Ph(2:5)); 
%计算总噪声功率
Pn=sum(spectP(1:numpt/2))-Pdc-Ps-Pd; 

%format;
A=(max(data)-min(data))/2^numbit;
AdB=20*log10(A);
SINAD=10*log10(Ps/(Pn+Pd));
SNR=10*log10(Ps/Pn); 
%disp('THD is calculated from 2nd through 5th order harmonics');
THD=10*log10(Pd/Ph(1));
SFDR=10*log10(Ph(1)/max(Ph(2:10)));
ENOB=(SINAD-1.763)/6.02;
%disp('Signal & Harmonic Power Components:');
HD=10*log10(Ph(1:10)/Ph(1));

%text(50,-5,['\color{red} AdB=',num2str(AdB)]);
% text(50,-10,['\color{red} SINAD=',num2str(SINAD)]);
% text(50,-15,['\color{red} SNR=',num2str(SNR)]);
% text(50,-20,['\color{red} THD=',num2str(THD)]);
% text(50,-25,['\color{red} SFDR=',num2str(SFDR)]);
% text(50,-30,['\color{red} ENOB=',num2str(ENOB)]);
% %text(20,-35,['\color{red} HD=',num2str(HD)]);
% 
% %Distinguish all harmonics locations within the FFT plot
% hold on; 
% plot(Fh(2)*fclk,0,'mo',Fh(3)*fclk,0,'cx',Fh(4)*fclk,0,'r+',Fh(5)*fclk,0,'g*',Fh(6)*fclk,0,'bs',Fh(7)*fclk,0,'bd',Fh(8)*fclk,0,'kv',Fh(9)*fclk,0,'y^');
% %legend('1st','2nd','3rd','4th','5th','6th','7th','8th','9th');
% hold off; 

