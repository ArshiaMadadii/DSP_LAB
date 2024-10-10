clear
clc
%function sigq =quantazer(sig)
   f0 = 500;         % Signal frequency
fs = 20000;       % Sampling frequency
Ts = 1/fs;        % Sampling period
t = 0:Ts:1000*Ts; % Time interval (from 0 to 1 second)

X = exp(1i*2*pi*f0*t); % Complex signal
y = real(X);           % Real part of the signal

L = 3;                % Signal length
N = length(y);        % FFT size
for i=1:N
    sig=y(i);
    sigq(i) =quantazer(sig);
end

Y = fft(sigq);           % FFT calculation

figure;
plot(abs(fft(y)),'r');
hold on;              
plot(abs(Y),'b');

hold off;
