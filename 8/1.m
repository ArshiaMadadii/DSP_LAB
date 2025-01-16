clc
clear 
b = 10;
sigma = 10;
N = 1000;
Xrand = b*randn(N,1) + sigma;
histogeram(Xrand);
EX = var(Xrand)*Xrand;
Xcorred = xcorr(EX,N);
plot(EX);