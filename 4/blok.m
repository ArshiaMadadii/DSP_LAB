clc
clear
close all

N = 1000;
L = 10;
p = 5;

x = ones(N,1);
h = ones(p,1);
y=conv(x,h);
Ns = floor(N/L);
yf=[];
for j = 1:Ns
 for i = 1:L
     Xs(i) = x(i+L*(j-1)); 

 end
 ys=conv(Xs,h);
 for i =1:L+p-1;
    X2(j,i+(j-1)*L) = ys(i);
 end
end
yf = sum(X2);
stem(yf(1:35))
hold on
stem(y(1:35),"-*r")