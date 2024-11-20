clear;
clc;
close all

N = 200 ;
bk = randi([0, 1], N ,1);
%stem(bk);
Sk=2*bk-1 ;
%stem(Sk);
Sn = ifft(Sk);
%stem(Sn);
Sk = fft(Sn);
shat = 2*(Sk>0)-1;

stem(Sk);
hold on;
stem(shat,"-*r");

ber = (min(bk-shat))/2 ; 
