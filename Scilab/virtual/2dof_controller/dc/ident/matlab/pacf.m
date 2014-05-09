function [ajj] = pacf(v,M)
rvv = xcorr(v,'coeff');
len = length(rvv);
zero = (len+1)/2;
rvv0 = rvv(zero);
rvv_one_side = rvv(zero+1:len);
ajj = [];
for j = 1:M,
  ajj = [ajj pacf_mat(rvv0,rvv_one_side,j,1)];
end
p = 1:length(ajj);
N = length(p);
lim = 2/sqrt(length(v));

% Plot the figure

axes('FontSize',18);
plot(p,ajj,p,ajj,'o',p,lim*ones(N,1),'--',...
               p,-lim*ones(N,1),'--')
label('',18,'Lag','PACF',18)
