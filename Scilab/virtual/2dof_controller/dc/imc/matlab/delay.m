Ts = 1; B = 0.63; A = [1 -0.37];
k = input('Enter the delay as an integer: ');
if k<=0, k = 1; end
[zk,dzk] = zpowk(k);

% Desired transfer function
phi = [1 -0.5];
delta = 1; % internal model of step introduced

% Controller design
[Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,delta);

% simulation parameters for stb_disc.mdl
st = 1.0; % desired change in setpoint
t_init = 0; % simulation start time
t_final = 20; % simulation end time

% simulation parameters for stb_disc.mdl
N_var = 0; C = 0; D = 1; N = 1; 
