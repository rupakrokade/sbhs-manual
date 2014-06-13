% Using plant and noise model objects,
% Define Model
  var = 0.05;
  G = idpoly(1,[0 0.6 -0.2], 1, 1, ...,
  [1 -0.5],'Noisevariance',var,'Ts',1);

% Create input sequence
  u = idinput(2555,'prbs',[0 0.2],[-1 1]);
  e = randn(2555,1);

% Simulate the process
  y = idsim([u e],G);

% Plot y as a function of u and e
  subplot(3,1,1), plot(y(1:500)),
  title('Plant output as a function of inputs',...
        'FontSize',14)
  ylabel('Plant output y','FontSize',14)
  subplot(3,1,2), plot(u(1:500))
  ylabel('Plant input u','FontSize',14)
  subplot(3,1,3), plot(var*e(1:500))
  ylabel('Noise input e','FontSize',14)
  xlabel('Sampling instant, k','FontSize',14)
  figure

% Build iddata objects
  z = iddata(y,u,1);

% Compute impulse response using 
% CRA after removal of means and plot
  [ir,r,cl] = cra(detrend(z,'constant')); 
  hold on

% Compare the first 10 impulse response computed
% computed from G(z)
  impulse(G,'ro-',0:9)
  set(gca,'XLim',[0 9]);
