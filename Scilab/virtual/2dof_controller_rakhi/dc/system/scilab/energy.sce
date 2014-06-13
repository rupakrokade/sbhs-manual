// Updated(18-7-07)
// 3.1

getf xcovz.sci;
u = [4 5 6];
Eu = norm(u)^2;
ruu = xcovz(u);
Lu = length(ruu);
Eu = ruu(ceil(Lu/2));

