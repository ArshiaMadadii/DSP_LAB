clear
clc
q=4;
f0=1000;
fs=10000;
t=0:1/fs:100/f0;
X=real(exp(1i*2*pi*f0*t))
    for i=1:length(X)
        sig=X(i);
    if sig>0 & sig<2/q
        sigq=1/q;
    elseif sig>2/q
        sigq=3/q;
    elseif sig>-2/q & sig<0
        sigq=-1/q;
    elseif sig<-2/q
        sigq=-3/q;
    end
       mysigq(i)=sigq;
    end
    N=length(X);
    f=(0:N-1)*fs/N;
    plot(f,abs(fft(mysigq)))
    hold on
    plot(f,abs(fft(X)),'r')
    legend("quantized","True")