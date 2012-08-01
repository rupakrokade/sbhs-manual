function y = iszeropol(pol,degpol)
[pol,degpol] = clcoef(pol,degpol);
if (pol(1) ~= 0) | (degpol ~= 0)
   y = 0;
else
   y = 1;
end
