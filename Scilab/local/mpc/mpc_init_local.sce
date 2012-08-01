// For scilab 5.1.1 or lower version users, 
//use scicos command to open scicos diagrams instead of xcos

global err_count y p q xk_old Tsp heats fan temp heat

p = 40; //prediction horizon
q = 4;  // control horizon
xk_old = zeros(8,1);
Tsp=1;
heats=1;
fan=1;
temp=1;

exec ("mpc_local.sci");
exec("mpc_run.sci");
