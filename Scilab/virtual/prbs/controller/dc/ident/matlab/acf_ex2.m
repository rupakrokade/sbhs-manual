L = 100;
n = 1:L;
w = 0.1;
S = 1.1 .^ n .* sin(w*n);
M = 0.1;
xi = M*randn(L,1);
Spxi = S+xi';
A = axes('FontSize',14);
set(get(A,'Xlabel'),'FontSize',14);
plot(Spxi);
ylabel('n'),xlabel('y');
figure
plotacf(Spxi,1,L,1);

