// Updated(3-8-07)
// 6.4

S1 = [1 2 3 4]; 
S2 = [1,-2,3,-4];
S3 = [-1,-2,3,4];
len = length(S1)-1; 
xv = -len:len;
m = 1;
xi = rand(4,1,'normal');
Spxi1 = S1 + m*xi';
Spxi2 = S2 + m*xi';
Spxi3 = S3 + m*xi';
n = 1:length(S1);
plot(n,Spxi1,'o-',n,Spxi2,'x--',n,Spxi3,'*:');
label('',4,'n','y',4);
ACF1 = normacf(Spxi1);
ACF2 = normacf(Spxi2);
ACF3 = normacf(Spxi3);
xset('window',1);
a = gca();
a.data_bounds = [-len -1; len 1];
plot(xv,ACF1,'o-',xv,ACF2,'x--',xv,ACF3,'*:');
label('',4,'Lag','ACF',4);
