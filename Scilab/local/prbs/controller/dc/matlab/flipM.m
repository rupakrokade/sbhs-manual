function [Af,dAf] = flipM(A,dA)
[rows,cols] = polsize(A,dA);
Af = zeros(rows,cols); dAf = 0;
for i = 1:rows,
    for j = 1:cols,
	[p,dp] = ext(A,dA,i,j);
        [Af,dAf] = putin(Af,dAf,flip(p),dp,i,j);
    end
end
[Af,dAf] = transp(Af,dAf);
