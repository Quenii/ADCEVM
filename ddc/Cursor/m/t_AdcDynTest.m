%t = 0:0.001:1.2;
close all
clear all

fclk = 80e6;
numbit = 16;
numpt = 32*1024;
% t = 0:1:numpt;
% data = 8192*sin(2*pi*t/50);
%data = 32767*sin(2*pi*t/40)+32767;

fid = fopen('V1_0_TB.txt');
ADout = fscanf(fid,'%d');
data = ADout(1:numpt)';

% t = 0:1:numpt;
% data = 2048*sin(2*pi*t/80);

[SNR,SINAD,SFDR] = AdcDynTest(data,numpt,fclk,numbit);

% figure;
% y=MyFft( data, numpt );
% MyPlot( [0:round(numpt/2)-1].*fclk/numpt, y(1:numpt/2) );