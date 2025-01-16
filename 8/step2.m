p=11;
[input, fs] = audioread('mytest.wav');
L=length(input);

N_frame=floor(L/160);
x_sant=[];
es1 = [];
for i=0:N_frame-1
inp_frame=input(i*160+1:160*i+160);
[a,g] = lpc(inp_frame,p);
es=filter(a,1,inp_frame);
es1 = [es1;es];
x_sant=[x_sant;filter(1,(a),sign(es))];
end
%sound(input,fs);
%sound(x_sant);
%pwelch(x_sant);
%plot(x_sant);
histogram(es1);
ploterrhist(x_sant)