function y = MyFft(x, numpt)

data = x(1:numpt);

%ѡ��Ӵ�����
%Doutw=Dout;
%Doutw=Dout.*(hanning(numpt))';         
Doutw=data.*(hamming(numpt))'; 

%FFT����
Dout_spect=fft(Doutw); 

%�����
Dout_dB=20*log10(abs(Dout_spect));

%��ʾƵ���һ��Ƶ�� 
%figure; 
%maxdB=max(Dout_dB(1:numpt/2)); 
% sif modify, remove the dc 
maxdB=max(Dout_dB(3:numpt/2)); 

%y = Dout_dB(1:numpt/2)-maxdB;
y = Dout_dB(1:numpt)-maxdB;