// Updated(18-7-07)
// 10.3
// Splits a polynomial B into good, nonminimum with 
// positive real & with negative real parts.
// All are returned in polynomial form.
// Gain is returned in Kp and delay in k.  
// Created for imc design.
// B can given in the form of polynomial or roots
// Kannan Moudgalya, April 2004

// function [Kp,k,Bg,Bnmp,Bm] = imcsplit(B,polynomial)

function [Kp,k,Bg,Bnmp,Bm] = imcsplit(B,polynomial)
k = 0;
Kp = 1;
if(polynomial)
  rts = roots(B);
  Kp = sum(B)/sum(coeff(poly(rts,'z')));
else
  rts = B;
end
Bg = 1; Bnmp = 1; Bm = 1;
for i = 1:length(rts),
    rt = rts(i);
    if rt == 0,
       k = k+1;
    elseif (abs(rt)<1 & real(rt)>=0)
      Bg = convol(Bg,[1 -rt]);
    elseif (abs(rt)>=1 & real(rt)>=0)
      Bnmp = convol(Bnmp,[1 -rt]);
    else
      Bm = convol(Bm,[1 -rt]);
    end
end








