% $$$ clear all;
% $$$ 
% $$$ filename=input('Enter File Name: ','s');    %enter the file name of the datas you acquired from the ADC, for example:file2.txt
% $$$ 
% $$$ fid=fopen(filename,'r');
% $$$ if fid==-1,
% $$$    warning='no such file'
% $$$    return;
% $$$ end
% $$$ 
% $$$ numpt=input('Enter Number of Data Points:  ');   %for example of file2.txt:8388608
% $$$ numbit=input ('Enter ADC Resolution:  ');        %for example of file2.txt:14
% $$$ 
% $$$ T1=input('T1:');    %the transition level of logic 0
% $$$ T2=input('T2:');    %the transition level of logic 2^numbit
% $$$ 
% $$$ T_ideal_1=input('T_ideal_1:');   %the ideal level of logic 0
% $$$ T_ideal_2=input('T_ideal_2:');   %the ideal level of logic 2^numbit
% $$$ 
% $$$ 
% $$$ [v1,count]=fscanf(fid,'%f',[1,numpt]);
% $$$ fclose(fid);

function [INLar, DNLar, H, indexl, indexh] = inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2)
% INLDNL - 
% plot([(indexl):(indexh-2)],DNLar);
% plot([(indexl):(indexh-1)],INLar);

NCODES = 2^numbit;

v1 = samples;
v1 = v1';
v2 = v1/2^(16-numbit)+2^(numbit-1);
code = round(v2(:,1)-0.4999999);

H = zeros(1,NCODES);
Hc = zeros(1,NCODES-1);
T = zeros(1,NCODES-1);
Tnom = zeros(1,NCODES-1);
S = numpt;


for i = 1:size(code),
    H(code(i)+1) = H(code(i)+1)+1;
end


%======================================
%search for the positions of '111бн11' and '000бн00'
%======================================
for jh = 2^(numbit-1):NCODES;
    if H(jh) == 0;
        indexh = jh-1;
        break;
    else 
        indexh = jh;
    end
end

for jl = 2^(numbit-1):-1:1;
    if H(jl)==0;
        indexl = jl+1;
        break;
    else 
        indexl = jl;
    end
end

if indexh<NCODES & indexl>1
    warning = 'can not reach "111..11" and "000..00"';
    return;
elseif indexl>1
    warning = 'can not reach "000..00"';
    return;
elseif indexh<NCODES
    warning = 'can not reach "111..11"';
    return;
end

for k = 1:(NCODES-1),
    Tnom(k) = (k-0.5)*(T_ideal_2-T_ideal_1)/(NCODES);
    for i = 1:k,
        Hc(k) = Hc(k)+H(i);
    end
end

Q = (Tnom(NCODES-1)-Tnom(1))/(NCODES-2);
A = (T2-T1)/(cos(pi*Hc(1)/S)+cos(pi*(1-(Hc(NCODES-1)/S))));
C = (T2*cos(pi*Hc(1)/S)+T1*cos(pi*(1-(Hc(NCODES-1)/S))))/(cos(pi*Hc(1)/S)+cos(pi*(1-(Hc(NCODES-1)/S))));


for k = 1:(NCODES-1),
    T(k) = C-A*cos(pi*Hc(k)/S);
end

%==============
%best fit
%==============   
%in this file2.txt example, the best fit is better than end point
sTk = 0;
sT = 0;
sT2 = 0;

for k = 1:(NCODES-1),
    sTk = sTk+k*T(k);
    sT = sT+T(k);
    sT2 = sT2+T(k)*T(k);
end

G = Q*(NCODES-1)*(sTk-2^(numbit-1)*sT)/((NCODES-1)*sT2-sT*sT);
Vos = Tnom(1)+Q*(2^(numbit-1)-1)-G*sT/(NCODES-1);

%==============
%calculate INL
%==============
for k = (indexl):(indexh-1),
    e(k) = Tnom(k)-G*T(k)-Vos;
    INLar(k) = e(k)/Q;
end

%==============
%calculate DNL
%==============
for k = (indexl):(indexh-2),
    DNLar(k) = G*(T(k+1)-T(k))/Q-1;
end


%==============
%plot figures
%==============
H = H(1: NCODES);
figure;
plot([1:NCODES],H);
axis([0 NCODES 0 max(H)]);

DNLar = DNLar((indexl) : (indexh-2));
figure;
plot([(indexl):(indexh-2)],DNLar);
axis([0 NCODES -max(abs(DNLar)) max(abs(DNLar))]);
grid on;
title('DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE');
xlabel('DIGITAL OUTPUT CODE');
ylabel('DNL (LSB)');

INLar = INLar((indexl) : (indexh-1));
figure;
plot([(indexl):(indexh-1)],INLar);
axis([0 NCODES -max(abs(INLar)) max(abs(INLar))]);
grid on;
title('INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE');
xlabel('DIGITAL OUTPUT CODE');
ylabel('INL(LSB)');
