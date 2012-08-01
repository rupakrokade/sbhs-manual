// Updated(10-12-06)
// Covariance for zero mean processes
// Calculated through convolution
// Ref.: pg.164, Digital Control, Prof.Kannan Moudgalya
function [xcov,nxcov] = xcovz(x,y)
if argn(2) == 1
y = x;
end;
a = length(x);
b = length(y);
if a~=b
  y = [y zeros(1,a-b)];
end;
y1 = y(length(y):-1:1);
y1 = clean(y1); x1 = clean(x);
xcov = convol(x1,y1);
xcov = clean(xcov);
nxcov = xcov/xcov(a); // Normalized
endfunction;
