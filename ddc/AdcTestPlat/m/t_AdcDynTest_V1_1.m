%t = 0:0.001:1.2;
fclk = 1000;
numbit = 14;
numpt = 32*1024;
% t = 0:1:numpt;
% data = 8192*sin(2*pi*t/50);
%data = 32767*sin(2*pi*t/40)+32767;
fid = fopen('b.txt');
ADout = fscanf(fid,'%d');
data = ADout(1:numpt)';

[SNR,SINAD,SFDR] = AdcDynTest(data,numpt,fclk,numbit);

%figure;
%MyPlot( t, data );