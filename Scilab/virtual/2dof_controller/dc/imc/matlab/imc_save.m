% Designs Discrete Internal Model Controller
% for transfer function z^{-k}B(z^{-1})/A(z^{-1})
% Numerator and Denominator of IMC HQ are outputs
% Controller is also given in R,S form 
% A maximum of one unstable pole is permitted
% 
function [k,HiN,HiD,R,S,beta] = imc(B,A,k,alpha)

[Kp,d,Bg,Bnmp,Bm] = imcsplit(B,logical(1));
Bg = Kp * Bg;
Bnmpr = flip(Bnmp);
Bms = sum(Bm);
HiN = A;
HiD = Bms * conv(Bg,Bnmpr);
HfN = 1-alpha;
HfD = [1 -alpha];
[zk,dzk] = zpowk(k);
rts = roots(A);
u = find(abs(rts)>1);
if (length(u)) == 0,
   beta = 0;
   elseif (length(u)) > 1, 
     error('More than one unstable pole');
   else
     p = rts(u);
     HHiv = filtval(zk,p)*filtval(B,p)/filtval(HiD,p);
     beta = p*(filtval(HfD,p)/filtval(HfN,p)/HHiv-1);
end

k = k+d;
Bf = (1-alpha)*[1 beta];
Af = [1 -alpha];
S = conv(Bf,A);
R1 = conv(Af,conv(Bnmpr,Bms));
R2 = conv(zk,conv(Bf,conv(Bnmp,Bm)));
[R,dR] = poladd(R1,length(R1)-1,-R2,length(R2)-1);
R = conv(Bg,R);

if (beta ~= 0)
   [S,dS,R,dR] = l2r(S,length(S)-1,R,length(R)-1);
end
