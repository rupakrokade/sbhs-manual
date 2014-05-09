% function [goodpoly,badpoly] = polsplit3(fac,a)
% Splits a scalar polynomial of z^{-1} into good and bad 
% factors. Input is a polynomial in increasing degree of 
% z^{-1}.  Optional input is a, where a <= 1.
% Factors that have roots outside a circle of radius a or
% with negative roots will be called bad and the rest
% good. If a is not specified, it will be assumed as 1.

function [goodpoly,badpoly] = polsplit3(fac,a)
if nargin == 1, a = 1; end  
if a>1 error('good polynomial also is unstable'); end
rts = roots(fac);

% extract good and bad roots
badindex = find((abs(rts)>=a-1.0e-5)|(real(rts)<-0.05));
badpoly = poly(rts(badindex));
goodindex = find((abs(rts)<a-1.0e-5)&(real(rts)>=-0.05));
goodpoly = poly(rts(goodindex));

% scale by equating the largest terms
[m,index] = max(abs(fac));
goodbad = conv(goodpoly,badpoly);
factor = fac(index)/goodbad(index);
goodpoly = goodpoly * factor;
