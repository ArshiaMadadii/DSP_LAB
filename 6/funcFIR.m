Wm=0.5;
N = 100;
%h = fir1(100,Wm,"HIGH");
h = fir1(100,Wm,"HIGH",chebwin(N+1));

fvtool(h);