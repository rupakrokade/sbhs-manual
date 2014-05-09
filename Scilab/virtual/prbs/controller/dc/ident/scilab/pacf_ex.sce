// Updated(4-8-07)
// 6.9

// Define model and generate data
m = armac([1,-1,0.5],0,1,1,1,1);
xi = 0.1*rand(1,10000,'normal');
v = arsimul(m,xi); 

// Plot noise, plant output and PACF
getf pacf.sci;
subplot(2,1,1), plot(v(1:500));
label('',18,'','v',18);
subplot(2,1,2), plot(xi(1:500));
label('',18,'n','xi',18);
xset('window',1)
pacf(v,10);


