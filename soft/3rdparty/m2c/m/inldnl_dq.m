%Code density/histofgram test to calculate INL and DNL require a large number of samples.
%Step 1: Apply a close to full-scale sine wave (but not clipping) and find the mid-code for the applied signal.
%Step 2: Apply the same sine wave input, but slightly larger amplitude to clip the ADC slightly.
%Run the following program, enter the number of samples, resolution and mid-code from Step 1and continue.
%Copyright Au/Hofner, Maxim Integrated Products, 120 San Gabriel Drive, Sunnyvale, CA94086
%This program is believed to be accurate and reliable. This program may get altered without prior notification.

%filename=input('Enter File Name: ');
%if isempty(filename)
%   filename = 'listing';
%end
%fid=fopen('D:\lht\lhtadc\spice����\smic����\9.9M2.5G.dat','r');
clear all;
numpt=input('Enter Number of Data Points:  ');
numbit=input ('Enter ADC Resolution:  ');
%mid_code=input('Enter Mid-Code (Mean Code):  ');

%for i=1:13,	
%   fgetl(fid);
%end
%[v1,count]=fscanf(fid,'%f',[1,numpt]);
%[v1,count]=fscanf(fid,'%2x',[1,numpt]);
%fclose(fid);

fin=29.111%29.111;
fsample=80;
n=1:numpt;
mid_code=(2^numbit-1)/2;
v3(n)=round(mid_code*sin(2*pi*fin*n/fsample)+mid_code);


v1=v3';
v2=round(v1);
code=v2(:,1);
%code=round(code1);
code_count=zeros(1,2^numbit);

for i=1:size(code),
    code_count(code(i)+1)=code_count(code(i)+1)+1;
end

%if code_count(1) == 0 | code_count(2^numbit) == 0 | ...
%(code_count(1) < code_count(2)) | (code_count(2^numbit-1) > code_count(2^numbit))
%disp('ADC not clipping ... Increase sinewave amplitude!');
%break;
%end

A=max(mid_code,2^numbit-1-mid_code)+0.1; 
vin=(0:2^numbit-1)-mid_code;	
sin2ramp=1./(pi*sqrt(A^2*ones(size(vin))-vin.*vin));

%while sum(code_count(2:2^numbit-1)) < numpt*sum(sin2ramp(2:2^numbit-1))

%  A=A+0.1;
%  sin2ramp=1./(pi*sqrt(A^2*ones(size(vin))-vin.*vin));
%end

disp('You Have Applied a Sine Wave of (dBFS): '); 
%Amplitude=A/(2^numbit/2)
% figure;
% plot([0:2^numbit-1],code_count,[0:2^numbit-1],sin2ramp*numpt);
% title('CODE HISTOGRAM - SINE WAVE');
% xlabel('DIGITAL OUTPUT CODE');
% ylabel('COUNTS');
%axis([0 2^numbit-1 0 max(code_count(2),code_count(2^numbit-1))]);
%axis([0 2^numbit-1 0 64]);

code_countn=code_count(2:2^numbit-1)./(numpt*sin2ramp(2:2^numbit-1));

% figure;
% plot([1:2^numbit-2],code_countn);
% 
% title('CODE HISTOGRAM - NORMALIZED')
% xlabel('DIGITAL OUTPUT CODE');
% ylabel('NORMALIZED COUNTS');
dnl=code_countn-1;
inl=zeros(size(dnl));
for j=1:size(inl')
   inl(j)=sum(dnl(1:j));
end

%End-Point fit INL
%[p,S]=polyfit([1,2^numbit-2],[inl(1),inl(2^numbit-2)],1);

%Best-straight-line fit INL
[p,S]=polyfit([1:2^numbit-2],inl,1);

inl=inl-p(1)*[1:2^numbit-2]-p(2);


disp('End Points Eliminated for DNL and INL Calculations');
figure;
plot([1:2^numbit-2],dnl);
%plot([1:62],dnl);

grid on;
title('DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE');
xlabel('DIGITAL OUTPUT CODE');
ylabel('DNL (LSB)');
figure;
plot([1:2^numbit-2],inl);
%plot([1:62],inl);
grid on;
title('INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE');
xlabel('DIGITAL OUTPUT CODE');
ylabel('INL(LSB)');  