clc
clear
close all

Wc = 0.4*pi ;
m = 30 ;
n = 0 : m-1 ;

h = (sin(Wc*(n-(m/2))))./(pi*(n-(m/2)));
h((m/2)+1)= Wc/pi ;

L = length(h) ;
beta = 5;
W = kaiser(L,beta);
Hd=h(:).*W(:);

fvtool(Hd);
