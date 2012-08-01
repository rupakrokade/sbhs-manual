// Updated(3-8-07)
// 6.3

L = 500;
n = 1:L;
w = 0.1;
S = sin(w*n);
m = 1;
xi = m*rand(L,1,'normal');
Spxi = S+xi';
xset('window',0);
plot(Spxi);
label('',4,'n','y',4)
xset('window',1);
getf plotacf.sci;
plotacf(Spxi,1,L,1);




