f = [0 0.4 0.53 1];
mhi = [0 0 1 1];
h= fir2(34,f,mhi);
%fvtool(h) 
freqz(h)