close all;
clear all;
fclk = 80e6;        %采样频率
r=128;              %抽取数                
numbit = 14;
VppFs = 1.4;
NFFT = 1024;

fid = fopen('ddc_soft.txt');
fid = fscanf(fid,'%d')/(2^14*32.5832);     %归一化，ADC 14bit，以及DDC的放大倍数
fpga_i = fid(1:2:2*NFFT-1);
fpga_q = fid(2:2:2*NFFT);
figure;
plot(fpga_i);
numpt = length(fpga_i);

[SNR, SINAD, SFDR, ENOB, HD, Fh, Harbin, Harbin_disturb, THD, Spectrum] = AlgDynTest1k(fpga_i, fpga_q, numpt, fclk, VppFs, numbit, r);
figure;
X_FREQ = [-NFFT/2:NFFT/2-1]; 
%fclk = 1;
fclk = fclk / r;
plot(X_FREQ.*fclk/NFFT, Spectrum);
hold on; 
%Fh = Harbin;
for i=2:10
    plot(Fh(i)*fclk,Spectrum(Harbin(i)),'rv');
    plot(-Fh(i)*fclk,Spectrum(Harbin(i)),'rv');
end
Fn_disturb = (Harbin_disturb-NFFT/2)/(NFFT);
for i=1:20
    plot(Fn_disturb(i)*fclk,Spectrum(Harbin_disturb(i)),'g*');
end
%plot(Fh(2)*fclk,Spectrum(Harbin(2)),'rv',Fh(3)*fclk,Spectrum(Harbin(3)),'rv',Fh(4)*fclk,Spectrum(Harbin(4)),'rv',Fh(5)*fclk,Spectrum(Harbin(5)),'rv', Fh(6)*fclk,Spectrum(Harbin(6)),'rv',Fh(7)*fclk,Spectrum(Harbin(7)),'rv',Fh(8)*fclk,Spectrum(Harbin(8)),'rv',Fh(9)*fclk,Spectrum(Harbin(9)),'rv',Fh(10)*fclk,Spectrum(Harbin(10)),'rv');
%Fh = -Fh;
%hold on; 
%plot(Fh(2)*fclk,Spectrum(Harbin(2)),'rv',Fh(3)*fclk,Spectrum(Harbin(3)),'rv',Fh(4)*fclk,Spectrum(Harbin(4)),'rv',Fh(5)*fclk,Spectrum(Harbin(5)),'rv', Fh(6)*fclk,Spectrum(Harbin(6)),'rv',Fh(7)*fclk,Spectrum(Harbin(7)),'rv',Fh(8)*fclk,Spectrum(Harbin(8)),'rv',Fh(9)*fclk,Spectrum(Harbin(9)),'rv',Fh(10)*fclk,Spectrum(Harbin(10)),'rv');