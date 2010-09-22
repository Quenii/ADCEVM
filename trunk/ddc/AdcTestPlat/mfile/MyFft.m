function y = MyFft(x, numpt)

data = x(1:numpt);

%选择加窗函数
%Doutw=Dout;
%Doutw=Dout.*(hanning(numpt))';         
Doutw=data.*(hamming(numpt))'; 

%FFT计算
Dout_spect=fft(Doutw); 

%求对数
Dout_dB=20*log10(abs(Dout_spect));

%显示频域归一化频谱 
%figure; 
%maxdB=max(Dout_dB(1:numpt/2)); 
% sif modify, remove the dc 
maxdB=max(Dout_dB(3:numpt/2)); 

%y = Dout_dB(1:numpt/2)-maxdB;
y = Dout_dB(1:numpt)-maxdB;