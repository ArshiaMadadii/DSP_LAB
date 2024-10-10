function sigq =quantazer(sig)

q = 4;
%sig = -0.7

if sig>0 & sig <2/q
    sigq = 1/q ;
elseif sig>(2/q) & sig <(4/q)
    sigq=3/q;
elseif sig<0 & sig>(-2/q)
    sigq=-1/q;
else sigq=3/q;
end

sigq