clear;
clc;
close all

N = 200 ;
L = 5 ;
h = zeros(L+1,1);
h(1)=1;

bk = randi([0, 1], N ,1);
%stem(bk);
Sk=2*bk-1 ;
Sn = ifft(Sk);
%stem(Sk);
Scp = [Sn(end-(L-1):end);Sn];
y=conv(Scp,h);
%plot(y)
yrem = y(L+1:end-L);
Shatk = fft(yrem);
%plot(Shatk)
cp = 2*(Shatk>0)-1;

ber = mean(abs(cp-Sk))/2

