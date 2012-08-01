// Updated(3-8-07)
// Calculates auto-covariance
// Equivalent of xcov(for single input)

function [x] = autocov(y)
l=length(y); nlags = l; x=corr(y,nlags); x0=x(1);
k = 2*l -1;

// Shifting the sequence (nlags - 1) times
  for i = 0:(l - 1)
      x(k-i) = x(nlags-i);
  end;

// Complete auto covariance sequence formation 
   for i = 0:(l-1)
   x(i+1) = x(k-i);
   end;
x = nlags*x
endfunction;
 
