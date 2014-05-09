% Create the plant and noise model objects
process_armax = idpoly([1 -0.5],[0 0 0.6 -0.2],[1 -0.3],1,1,'Noisevariance',0.05,'Ts',1);
% Create input sequence
u = idinput(2555,'prbs',[0 0.2],[-1 1]);
e = randn(2555,1);
% Simulate the process
y = idsim([u e],process_armax);
% Build iddata objects and remove means
z = iddata(y,u,1); zd = detrend(z,'constant');
% Compute IR for time-delay estimation
figure; [ir,r,cl] = cra(zd);
% Time-delay = 2 samples
% Estimate ARMAX model (assume known orders)
na = 1; nb = 2; nc = 1; nk = 2;
theta_armax = armax(zd,[na nb nc nk])
% Present the model
present(theta_armax)
% Check the residual plot
figure; resid(theta_armax,zd);