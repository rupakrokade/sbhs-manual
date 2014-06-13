Ts = 1; B = [1 -3]; A = [1 2 -8]; k = 1;
[zk,dzk] = zpowk(k); int = 0;

% Transient specifications
rise = 10; epsilon = 0.1;
phi = desired(Ts,rise,epsilon);

% Controller design
[Rc,Sc,Tc,gamma] = pp_basic(B,A,k,phi);

% simulation parameters for basic_disc.mdl
st = 1.0; % desired change in setpoint
t_init = 0; % simulation start time
t_final = 1000; % simulation end time

% simulation parameters for stb_disc.mdl
N_var = 0; C = 0; D = 1; N = 1; 
