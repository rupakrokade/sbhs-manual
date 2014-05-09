// Updated(18-7-07)
// 10.4
// Designs Discrete Internal Model Controller
// for transfer function z^{-k}B(z^{-1})/A(z^{-1})
// Numerator and Denominator of IMC HQ are outputs
// Controller is also given in R,S form 
// Kannan Moudgalya, April 2004

function [k,HiN,HiD] = imc_stable1(B,A,k,alpha)

getf imcsplit.sci;
[Kp,d,Bg,Bnmp,Bm] = imcsplit(B,mtlb_logical(1));
Bg = Kp * Bg;

Bnmpr = flip(Bnmp);
Bms = sum(Bm);
HiN = A;
HiD = Bms * convol(Bg,Bnmpr);
k = k+d;
endfunction;


