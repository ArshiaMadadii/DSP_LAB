%Filter

clc
clear
close all

fs=1;
Ts=1/fs; 
ws=0.6*pi/pi; 
wp=0.2*pi/pi; 

%omega=@(w) (2/Ts)*tan(w/2); 
%omegap=omega(wp)/pi; 
%%omegas=omega(ws)/pi; 

Delta1=0.01;
Delta2=0.0001; 

kp=-20*log10(1-Delta1); 
ks=-20*log10(Delta2);

[n,wn] = buttord(wp,ws,kp,ks);  
[b,a] = butter(n,wn);

w1 = 0.2*pi;
w2 = 0.7*pi;

N=1000;
n=0:N-1;
A1=1;
A2=1;

x=A1*exp(i*w1*n)+A2*exp(i*w2*n);
sigma=0.1;
y=x + sqrt(sigma)*randn(size(x));
yf=filter(b,a,y);

SP=fft(y);
INP=fft(yf);

plot(abs(SP),'r');
hold on
plot(abs(INP),'b*');
