% Create the plant and noise model objects
process_arx = idpoly([1 -0.5],[0 0 0.6 -0.2],1,1,1,'Noisevariance',0.05,'Ts',1);
% Create input sequence
u = idinput(2555,'prbs',[0 0.2],[-1 1]);
e = randn(2555,1);
% Simulate the process
y = idsim([u e],process_arx);
% Build iddata objects and remove means
z = iddata(y,u,1); zd = detrend(z,'constant');
% Compute IR for time-delay estimation
figure; [ir,r,cl] = cra(zd);
% Time-delay = 2 samples
% Estimate OE model (assume known orders)
nb = 2; nf = 1; nk = 2;
theta_oe2 = oe(zd,[nb nf nk])
% Present the plant model
disp('Plant Model ');
present(theta_oe2)
% Compute the residuals of the OE model
err_m = pe(theta_oe2,zd); 
% PLot the ACF and PACF of the residuals
figure; subplot(211) 
plotacf(err_m.OutputData,1e-03,21,1);
subplot(212); pacf(err_m.OutputData,21);
% Estimate an AR(1) model for the residuals
theta_h = ar(err_m.OutputData,1); 
% Present the noise model
disp('Noise Model ');
present(theta_h)