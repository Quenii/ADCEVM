function [data1, data2] = readfile()
fid1 = fopen('AI.txt');
data1 = fscanf(fid,'%d');
fid2 = fopen('AQ.txt');
data2 = fscanf(fid1,'%d');
