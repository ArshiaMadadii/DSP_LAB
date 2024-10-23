clc
clear
close all
N = 120;
L = 45;
p = 15;

x = ones(N,1);
h = ones(p,1);

x1 = zeros(N+p-1,1);
x1(p:end) = x;

Ns = floor(N/L);
Yc = zeros(L-p+1,1);

yf=[];
for j = 1:Ns
 for i = 1:L
     Xs(i) = x1(i+(L-p+1)*(j-1)); 
 end
 xf = fft(Xs,L);
 hf = fft(h,L).';
 Yf = xf .* hf;
 ys = ifft(Yf,L);
 Yc(1:end) = ys(p:end);
 yf=[yf Yc];
end

stem(yf(1:35))