// Updated (5-4-07)
// 6.12
m = armac(1,0,[1,-0.9,0.2],1,1,1);
xi = 0.1*rand(1,10000);
v = arsimul(m,xi);
getf plotacf.sci;
getf pacf.sci;
plotacf(v,1,11,1);
xset('window',1);
pacf(v,11);
