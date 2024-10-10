[input, fs] = audioread('mytest.wav');
sound(input, fs);   

M = 2;             
ys = interp(input, M);    % Interpolation
xs = upsample(input, M);  % Upsampling

figure;
stem(ys(1:500), 'r'); % Plot interpolated signal with red color
hold on;              
stem(xs(1:500), 'b'); % Plot upsampled signal with blue color

hold off;

sound(ys, fs/M);
