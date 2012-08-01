% Define the model
m = idpoly(1,[],[1,-0.5,0.5]);

% Generate noise and the response
  e = randn(100000,1);
  y = sim(m,e); z = [y e]; 

% Plot noise and plant output
  subplot(2,1,1), plot(y(1:500))
  title('Plant output, noise input vs. time',...
        'FontSize',14)
  ylabel('Plant output y','FontSize',14)
  subplot(2,1,2), plot(e(1:500))
  ylabel('Noise input e','FontSize',14)
  xlabel('Sampling instant, k','FontSize',14)

% Calculate covariance and plot it
  ryy = xcov(y,'coeff');
  figure, plotacf(y,1,11,1);

