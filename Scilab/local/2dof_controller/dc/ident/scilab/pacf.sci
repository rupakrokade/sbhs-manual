// Updated(4-8-07)
// 6.10

function [ajj] = pacf(v,M)
[rvv,rvvn] = xcovz(v); // Normalized
len = length(rvvn);
zero = (len+1)/2;
rvvn0 = rvvn(zero);
rvvn_one_side = rvvn(zero+1:len);
ajj = [];
getf pacf_mat.sci;
for j = 1:M,
  ajj = [ajj pacf_mat(rvvn0,rvvn_one_side,j,1)];
end
p = 1:length(ajj);
N = length(p);
lim = 2/sqrt(length(v));

// Plot the figure
plot(p,ajj,p,ajj,'o',p,lim*ones(N,1),'--',...
               p,-lim*ones(N,1),'--');
label('',4,'Lag','PACF',4);
endfunction;
