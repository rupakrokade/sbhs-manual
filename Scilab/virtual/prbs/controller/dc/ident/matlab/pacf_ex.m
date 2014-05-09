% Define model and generate data
m = idpoly([1,-1,0.5],[],1);
xi = 0.1*randn(100000,1);
v = sim(m,xi); 

% Plot noise, plant output and PACF
subplot(2,1,1), plot(v(1:500))
label('',18,'','v',18);
subplot(2,1,2), plot(xi(1:500))
label('',18,'n','xi',18);
figure, pacf(v,10);
