clc
clear 
b = 10;
sigma = 10;
N = 1000;
M = 50 ;
Xrand = b*randn(N,1) + sigma;
e = randn(N,1);
X = zeros(N,1);
a1 = 0.8 ;
a2 = -0.6 ;
%histogeram(Xrand);
EX = var(Xrand)*Xrand;
Xcorred = xcorr(Xrand,M);
for n = 3 :N ;
    X(n) = a1*(X(n-1)) + a2*(X(n-2)) + e(n);
end
%pwelch(X);
%plot(X);
%histogram(X);  
%plot(Xcorred);
%pwelch(Xrand)

%A = [1 -2.7607 3.8106 -2.6535 0.9238];
arcoeffs = aryule(X,2)

