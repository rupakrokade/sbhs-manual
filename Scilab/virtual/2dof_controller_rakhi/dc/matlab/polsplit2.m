% function [goodpoly,badpoly] = polsplit2(fac,a)
% Splits a scalar polynomial of z^{-1} into good and bad 
% factors. 
% Input is a polynomial in increasing degree of z^{-1}
% Optional input is a, where a <= 1.
% Factor that has roots of z^{-1} outside a is called
% good and the rest bad.
% If a is not specified, it will be assumed as 1-1.0e-5

function [goodpoly,badpoly] = polsplit2(fac,a)
if nargin == 1, a = 1-1.0e-5; end  
if a>1 error('good polynomial is unstable'); end
rts = roots(fac);
%
% extract good and bad roots
badindex = find(abs(rts)>=a);
badpoly = poly(rts(badindex));
goodindex = find(abs(rts)<a);
goodpoly = poly(rts(goodindex));
%
% scale by equating the largest terms
[m,index] = max(abs(fac));
goodbad = conv(goodpoly,badpoly);
factor = fac(index)/goodbad(index);
goodpoly = goodpoly * factor;
