wp=0.4*pi;
ws=0.6*pi;
wn=(wp+ws)/2;

delta1=0.01;
delta2=0.001;
delta = min( [delta1,delta2] );

atten = -20*log10( delta );
beta = 0.1102*(atten-8.7).*(atten>50) + ...
        (0.5842*(atten-21).^0.4 + ...
        0.07886*(atten-21)).*(atten>=21 & atten<=50);
df = (ws - wp);
D = (atten - 7.95)/(df*2.285);
L = ceil(D/df) + 1;

W=kaiser(L+1, beta);
n=0:L;
h=sin(wn*(n-L/2))./(pi*(n-L/2));
h=h(:);
hd=h.*(W(:));

fvtool(hd);