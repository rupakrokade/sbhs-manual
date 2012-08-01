L = 500;
n = 1:L;
w = 0.1;
S = sin(w*n);
m = 1;
xi = m*randn(L,1);
Spxi = S+xi';
axes('FontSize',18);
plot(Spxi);
label('',18,'n','y',18)
figure
plotacf(Spxi,1,L,1);
