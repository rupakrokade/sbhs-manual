// Updated(9-8-07)
// 6.17

getf armac1.sci;
getf oe.sci;
b = [0 0 0.6 -0.2];
f = [1 -0.5]; 
c = 1; d = 1; 
process_oe = armac1(1,b,c,d,f,0.05); 
u = prbs_a(2555,250);
xi = rand(1,2555,'normal');
y = arsimul(process_oe,[u xi]);
z = [y(1:length(u))' u'];
zd = detrend(z,'constant');

// Compute IR for time-delay estimation
[ir,r,cl_s] = cra(zd);

// Time-delay = 2 samples
// Estimate ARX model (assume known orders)
nb = 2; nf = 1; nk = 2;

// tic();
[thetaN,covfN,nvar] = oe(zd,nb,nf,nk);
// toc()
