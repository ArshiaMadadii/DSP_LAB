clear;
clc;
close all

%%N = 50;
%%L = 20;
%%p = 20;

%aliasing

N = 50;
L = 50;
p = 50;

x = ones(L,1);
h = ones(p,1);
X = fft(x,N);
H = fft(h,N);
yf = X.*H ;
y=ifft(yf , N);

stem(y);
hold on;
stem(conv(x,h),"-*r");

