% Define the model
m = idpoly(1,[],[1,1,-0.5]);

% Generate noise and the response
xi = 0.1*randn(100000,1);
v = sim(m,xi); z = [v xi]; 

% Plot noise, plant output and ACF

subplot(2,1,1), plot(v(1:500))
label('',18,'','v',18)
subplot(2,1,2), plot(xi(1:500))
label('',18,'n','xi',18)
figure, plotacf(v,1,11,1);
