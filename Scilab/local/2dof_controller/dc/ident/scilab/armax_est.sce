// Updated(9-8-07)
// 6.16

process_armax = armac([1 -0.5],[0 0 0.6 -0.2],[1 -0.3],1,1,0.05);
u = prbs_a(5000,250);
xi = rand(1,5000);
y = arsimul(process_armax,[u xi]);
z = [y(1:length(u))' u'];
zd = detrend(z,'constant');

// Compute IR for time-delay estimation
[ir,r,cl_s] = cra(detrend(z,'constant'));

// Estimate ARMAX model (assume known orders)
na = 1; nb = 3; nc = 1; nk = 2;
theta_armax = armax1(na,nb,nc,zd(:,1)',zd(:,2)',1)



