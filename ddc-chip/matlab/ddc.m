

clear all; close all; clc;   % clear up workspace

%% Design CIC 
R    = 320; 
R1   = 80; % Decimation factor
D    = 1;  % Differential delay
Nsecs= 1;  % Number of sections
IWL  = 16; % Input word length
IFL  = 14; % Input fraction length
OWL  = 16; % Output word length

% If the output wordlength is specified when creating a CIC filter then the
% "FilterInternals" property is set to "MinWordLengths" automatically.
% Therefore, the minimum word sizes are used between each section.
hcic = mfilt.cicdecim(R1,D,Nsecs,IWL,OWL);
hcic.InputFracLength = IFL;

info(hcic)

Fs_in = 80e6;
h = fvtool(hcic,'Fs',Fs_in);
set(gcf, 'Color', 'White');

%% Normalize CIC
hgain = dfilt.scalar(1/gain(hcic)); % Define gain
hcicnorm = cascade(hgain,hcic);

% Replace the CIC in FVTool with a normalized CIC.
setfilter(h,hcicnorm,'Fs',Fs_in);

axis([0 .125 -2 0]);

%% Compensation FIR filter
% Filter specifications
Fs     = Fs_in / R1;  % Sampling frequency
Apass  = 0.5;        % dB
Astop  = 1;          % dB
Aslope = 1;          % dB slope over half the Nyquist range
Fpass  = 100e3;       % Hz passband-edge frequency
Fstop  = 125e3;       % Hz stopband-edge frequency

% Design decimation filter. D and Nsecs have been defined above as the
% differential delay and number of sections, respectively.
R2 = R / R1;
d = fdesign.decimator(R2,'ciccomp',D,Nsecs,Fpass,Fstop,Apass,Astop,Fs);
hcfir = design(d,'equiripple',...
               'StopbandShape', 'linear',...
               'StopbandDecay', Aslope);

% Now we have to define the fixed-point attributes of our multirate filter.
% By default, the fixed-point attributes of the accumulator and multipliers
% are set to ensure that full precision arithmetic is used, i.e. no
% quantization takes place.
set(hcfir,...
    'Arithmetic',      'fixed',...
    'CoeffWordLength',  16,...
    'InputWordLength',  20,...
    'InputFracLength', -12);


info(hcfir)

hcas1 = cascade(hcicnorm,hcfir);
set(h,'Filters', [hcicnorm,hcfir,hcas1],'Fs',[Fs_in,Fs,Fs_in]);
axis([0 .125 -0.8 0.8]);
legend(h,'hcic','hcfir','cascade');