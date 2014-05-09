function [ajj] = pacf(y,M)
ryy = xcorr(y,'coeff');
len = length(ryy);
zero = (len+1)/2;
ryy0 = ryy(zero);
ryy_one_side = ryy(zero+1:len);
ajj = [];
for j = 1:M,
  ajj = [ajj pacf_mat(ryy0,ryy_one_side,j,1)];
end
% p = 0:length(ajj)-1;
p = 1:length(ajj);
N = length(p);
lim = 2/sqrt(length(y));

% Plot the figure

%axis([0 length(ajj) min(min(ajj),-lim-0.1) ...
%     max(max(ajj),lim+0.1)])
%axis off, 
A = axes('FontSize',14);
set(get(A,'Xlabel'),'FontSize',14);
plot(p,ajj,p,ajj,'o',p,lim*ones(N,1),'--',...
               p,-lim*ones(N,1),'--')
ylabel('PACF'),xlabel('Lag')
