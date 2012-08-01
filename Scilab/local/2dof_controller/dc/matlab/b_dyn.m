% Builds dynamic matrix
% At the (i,j)th location of A, puts B
% function A = b_dyn(A,B,i,j)

function A = b_dyn(A,B,i,j)
[rB,cB] = size(B);
A((i-1)*rB+1:i*rB,(j-1)*cB+1:j*cB) = B;
