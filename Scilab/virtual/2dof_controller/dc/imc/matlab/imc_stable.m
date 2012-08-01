% Designs Discrete Internal Model Controller
% for transfer function z^{-k}B(z^{-1})/A(z^{-1})
% Numerator and Denominator of IMC HQ are outputs
% Controller is also given in R,S form 
% 
function [k,HiN,HiD,R,S,mu] = imc_stable(B,A,k,alpha)

[Kp,d,Bg,Bnmp,Bm] = imcsplit(B,logical(1));
Bg = Kp * Bg;
Bnmpr = flip(Bnmp);
Bms = sum(Bm);
HiN = A;
HiD = Bms * conv(Bg,Bnmpr);
k = k+d;
[zk,dzk] = zpowk(k);
Bf = (1-alpha);
Af = [1 -alpha];
S = conv(Bf,A);
R1 = conv(Af,conv(Bnmpr,Bms));
R2 = conv(zk,conv(Bf,conv(Bnmp,Bm)));
[R,dR] = poladd(R1,length(R1)-1,-R2,length(R2)-1);
R = conv(Bg,R);
