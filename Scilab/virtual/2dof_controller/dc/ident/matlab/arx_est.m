% Create the plant and noise model objects
process_arx = idpoly([1 -0.5],[0 0 0.6 -0.2],...
               1,1,1,'Noisevariance',0.05,'Ts',1);

% Create input sequence and simulate
u = idinput(2555,'prbs',[0 0.2],[-1 1]);
xi = randn(2555,1);
y = sim([u xi],process_arx);

% Build iddata objects and remove means
z = iddata(y,u,1); zd = detrend(z,'constant');

% Compute IR for time-delay estimation
figure; [ir,r,cl] = cra(zd);

% Time-delay = 2 samples
% Estimate ARX model (assume known orders)
na = 1; nb = 2; nk = 2;
theta_arx = arx(zd,[na nb nk])

% Present the model
present(theta_arx)

% Check the residual plot
figure; resid(theta_arx,zd);
