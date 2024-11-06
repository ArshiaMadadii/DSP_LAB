clc
clear
close all
n = 0:1000;

x = exp(1i*0.3*pi*n) + exp(1i*0.5*pi*n) + exp(1i*0.7*pi*n);
X=fft(x);

f = [0 0.4 0.53 1];
mhi = [0 0 1 1];
h= fir2(34,f,mhi);
y=filter(h,1,x);
Y=fft(y);
plot(abs(Y));
hold
plot(abs(X),'r');
fvtool(h);