function [r,b,rbbr] = spec(A,dA,B,dB,rho)
AA = rho * conv(A,flip(A));
BB = conv(B,flip(B));
diff = dA - dB;
dBB = 2*dB;
for i = 1:diff
    [BB,dBB] = polmul(BB,dBB,[0 1],1);
end
[rbbr,drbbr] = poladd(AA,2*dA,BB,dBB);
rts = roots(rbbr);  % roots in descending order of magnitude
rtsin = rts(dA+1:2*dA);
b = 1;
for i = 1:dA,
    b = conv(b,[1 -rtsin(i)]);
end
br = flip(b);
bbr = conv(b,br);
r = rbbr(1) / bbr(1);
