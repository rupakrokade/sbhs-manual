% function b = cindep( S,gap)
% used in XD + YN = C. all rows except the last of are assumed to
% be independent.  The aim is to check if the last row is dependent on the
% rest and if so how.  The coefficients of dependence is sent in b
function b = cindep( S,gap)

if nargin == 1
        gap = 1.0e8;
end
[rows,cols] = size(S);
if rows > cols
   ind = 0;
else
   sigma = svd(S);
   len = length(sigma);
   if (sigma(len)/sigma(1) <= (eps*max(i,cols)))
      ind = 0;                  % not independent
   else
      if any(sigma(1:len-1) ./sigma(2:len)>=gap)
         ind = 0;               % not dependent
      else
         ind = 1;               % independent
      end
   end
end
if ind
   b = [];
else
   b = S(rows,:)/S(1:rows-1,:);
   b = makezero(b,gap);
end
