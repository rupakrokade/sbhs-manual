% Splits a polynomial B into good, nonminimum with positive 
% real & with negative real parts. All are returned in 
% polynomial form.  Gain is returned in Kp and delay in k.  

function [Kp,k,Bg,Bnmp,Bm] = imcsplit(B,polynomial)
k = 0;
Kp = 1;
if(polynomial)
  rts = roots(B);
  Kp = sum(B)/sum(poly(rts));
else
  rts = B;
end
Bg = 1; Bnmp = 1; Bm = 1;
for i = 1:length(rts),
    rt = rts(i);
    if rt == 0,
       k = k+1;
    elseif (abs(rt)<1 & real(rt)>=0)
      Bg = conv(Bg,[1 -rt]);
    elseif (abs(rt)>=1 & real(rt)>=0)
      Bnmp = conv(Bnmp,[1 -rt]);
    else
      Bm = conv(Bm,[1 -rt]);
    end
end

