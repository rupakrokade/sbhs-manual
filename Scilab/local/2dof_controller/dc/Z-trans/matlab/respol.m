% This function computes residues for G(z)
% If G(z)=0 at z=0, residues are calculated for G(z)/z

function [res,pol,other] = respol(num,den)
len = length(num);
if num(len) == 0
    num = num(1:len-1);
end
[res,pol,other] = residue(num,den);
