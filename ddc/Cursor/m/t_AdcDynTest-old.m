%t = 0:0.001:1.2;
numpt = 16*1024;
t = 0:1:numpt-1;
% data = 127*sin(2*pi*t/50)+127;
data = 32767*sin(2*pi*t/40)+32767;
fclk = 80e6;
numbit = 16;
[SNR,SINAD,SFDR] = AdcDynTest(data,numpt,fclk,numbit);

%figure;
%MyPlot( t, data );