S1 = [1 2 3 4]; 
S2 = [1,-2,3,-4];
S3 = [-1,-2,3,4];
len = length(S1)-1; 
xv = -len:len;
m = 1;
xi = randn(4,1);
Spxi1 = S1 + m*xi';
Spxi2 = S2 + m*xi';
Spxi3 = S3 + m*xi';
axes('FontSize',18);
n = 1:length(S1);
plot(n,Spxi1,'o-',n,Spxi2,'x--',n,Spxi3,'*:')
label('',18,'n','y',18)

ACF1 = xcov(Spxi1,'coeff');
ACF2 = xcov(Spxi2,'coeff');
ACF3 = xcov(Spxi3,'coeff');
figure
axis([-len len -1 1])
axis off
axes('FontSize',18);
plot(xv,ACF1,'o-',xv,ACF2,'x--',xv,ACF3,'*:')
label('',18,'Lag','ACF',18)
