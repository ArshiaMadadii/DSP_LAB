clear;
clc;
close all

N = 250 ;
bk = randi([0, 1], N ,1);
I = 2*bk-1 ;
q = 2*bk-1 ;
sig = I + 1i*q;
Sn = ifft(sig);

Sk = fft(Sn);
Ihat = 2*(real(sig)>0)-1;
qhat = 2*(imag(sig)>0)-1;
 
%stem(I);
%hold on;
%stem(Ihat,"-*r");
stem(q);
hold on;
stem(qhat,"-*r");

biterrI = mean(abs(Ihat - I))/2
biterrQ = mean(abs(qhat - q))/2

PC = (1 - biterrI)*(1 - biterrQ)
biterrI = 1 - PC