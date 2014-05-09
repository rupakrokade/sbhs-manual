% Create the plant and noise model objects
process_bj = idpoly(1,[0 0 0.6 -0.2],[1 -0.3],[1 -0.5],[1 -0.7],'Noisevariance',0.05,'Ts',1);
% Create input sequence
u = idinput(2555,'prbs',[0 0.2],[-1 1]);
e = randn(2555,1);
% Simulate the process
y = idsim([u e],process_bj);
% Build iddata objects and remove means
z = iddata(y,u,1); zd = detrend(z,'constant');
% Compute IR for time-delay estimation
figure; [ir,r,cl] = cra(zd);
%Time-delay = 2 samples
% Estimate BJ model (assume known orders)
nb = 2; nc = 1; nd = 1; nf = 1; nk = 2;
theta_bj = bj(zd,[nb nc nd nf nk])
% Present the model
present(theta_bj)
% Check the residual plot
figure; resid(theta_bj,zd);