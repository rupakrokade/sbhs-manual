% Extracts coefficient of ith degree of a polynomial matrix
% function Coeff = extc(A,dA,i)

function Coeff = extc(A,dA,i)
[rA,cA] = polsize(A,dA);
Coeff = A(:,i*cA+1:(i+1)*cA);
