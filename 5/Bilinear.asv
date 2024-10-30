% 2 - Bilinear
clc
clear
close all

fs=1;
Ts=1/fs; 
ws=0.6*pi; 
wp=0.4*pi; 

omega=@(w) (2/Ts)*tan(w/2); 
omegap=omega(wp)/pi; 
omegas=omega(ws)/pi; 

Delta1=0.01;
Delta2=0.001; 

kp=-20*log10(1-Delta1); 
ks=-20*log10(Delta2);

[n,wn] = buttord(omegap,omegas,kp,ks,'s');  
[b,a] = butter(n,wn,'s'); 
[bz,az]=bilinear(b,a,fs);

freqz(bz,az);
fvtool(bz,az);