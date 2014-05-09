Ts = 1; B = 0.63; A = [1 -0.37]; k = 3;
Bd = conv(B,[0 1]);
kd = k - 1;
[zkd,dzkd] = zpowk(kd);
[mzkd,dmzkd] = poladd(1,0,-zkd,dzkd);

% Desired transfer function
phi = [1 -0.5]; delta = 1;

% Controller design
[Rc,Sc,Tc,gamma] = pp_im(B,A,1,phi,delta);

% simulation parameters for smith_disc.mdl
st = 1.0; % desired change in setpoint
t_init = 0; % simulation start time
t_final = 20; % simulation end time

% simulation parameters for smith_disc.mdl
N_var = 0; C = 0; D = 1; N = 1; 
