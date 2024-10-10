clear;
clc;
close all

f0 = 500;        % فرکانس سیگنال
fs = 20000;        % فرکانس نمونه‌برداری
Ts = 1/fs;        % دوره نمونه‌برداری
t = 0:Ts:1000*Ts;       % بازه زمانی (از صفر تا 1 ثانیه)

X = exp(1i*2*pi*f0*t); % سیگنال مختلط
y = real(X);           % بخش حقیقی سیگنال

L = 3         % طول سیگنال
%Ts2=(Ts/L);
%N = 10*L;              % اندازه FFT (بیشتر از طول سیگنال برای دقت بیشتر)
N=length(y);
Y = fft(y);% محاسبه FFT

f = (0:N-1)*(fs/N);    % محور فرکانس
hold on

ys=interp(y,L);
hold off

xs=upsample(y,L);
stem(ys(1:300));
