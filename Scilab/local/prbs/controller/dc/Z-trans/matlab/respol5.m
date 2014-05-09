%                z^2 + 2z            
% G(z)  =  --------------------  
%           (z + 1)^2 (z - 2)

num = [1 2 0];
den = conv(conv([1 1],[1 1]),[1 -2]);
[res,pol] = respol(num,den)
