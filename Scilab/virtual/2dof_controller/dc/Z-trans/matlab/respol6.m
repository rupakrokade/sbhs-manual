% Coefficients are in ascending power of z^-1
%             3 - (5/6)z^-1             A            B
% G = -------------------------- = ----------- + -----------          
%     (1-(1/4)z^-1)(1-(1/3)z^-1)   1-(1/4)z^-1   1-(1/3)z^-1

num = [3 -5/6];
den = conv([1 -1/4],[1 -1/3]); %Polynomial multiplication
[res,pol,other] = residuez(num,den) 
