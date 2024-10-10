clear;
clc;
close all

f0 = 500;         % Signal frequency
fs = 20000;       % Sampling frequency
Ts = 1/fs;        % Sampling period
t = 0:Ts:1000*Ts; % Time interval (from 0 to 1 second)

X = exp(1i*2*pi*f0*t); % Complex signal
y = real(X);           % Real part of the signal

L = 3;                % Signal length
N = length(y);        % FFT size
Y = fft(y);           % FFT calculation

f = (0:N-1)*(fs/N);   % Frequency axis

ys = interp(y, L);    % Interpolation
xs = upsample(y, L);  % Upsampling

figure;
stem(ys(1:300), 'r'); % Plot ys with red color
hold on;              % Hold the current plot
stem(xs(1:300), 'b'); % Plot xs with blue color

hold off;
