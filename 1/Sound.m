[input, fs] = audioread('mytest.wav');
sound(input,fs);
M = 5;
yd=upsample(input,M);
%ys=upsample(yd,M);
sound(yd,fs/M);

