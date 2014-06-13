// Updated(8-8-07)
// 6.15

getf armac1.sci;
process_arx = armac1([1 -0.5],[0 0 0.6 -0.2],1,1,1,0.05);
u = prbs_a(5000,250);
xi = rand(1,5000,'normal');
y = arsimul(process_arx,[u xi]);
z = [y(1:length(u))' u'];
zd = detrend(z,'constant');

// Compute IR for time-delay estimation
[ir,r,cl_s] = cra(detrend(z,'constant'));

// Time-delay = 2 samples
// Estimate ARX model (assume known orders)
getf arx.sci;
na = 1; nb = 2; nk = 2;
[theta_arx,cov_arx,nvar] = arx(zd,na,nb,nk);
