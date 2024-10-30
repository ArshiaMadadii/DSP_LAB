%Invariance Impulse
clc
clear
close all

fs=1;
ts=1/fs;

wp=0.4*pi;
ws=0.6*pi;

Delta1=0.01;
Delta2=0.001;

kp=-20*log10(1-Delta1);
ks=-20*log10(Delta2);

[n,wn]=buttord(wp,ws,kp,ks,'s');
[b,a] = butter(n,wn,'s');
[bz,az]=impinvar(b,a,fs);

freqz(bz,az);
fvtool(bz,az);