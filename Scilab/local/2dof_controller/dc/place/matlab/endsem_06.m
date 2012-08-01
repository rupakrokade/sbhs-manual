% Motor control problem
% Transfer function
B = [1 2]; A = [1 1 1]; k = 1; Ts = 1;

% Transient specifications
rise = 5; epsilon = 0.1; 
phi = desired(Ts,rise,epsilon);

% Controller design
Delta = [1 -1]; % No internal model of step used
[Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta);

% simulation parameters for c_ss_cl.mdl
st = 1; % desired change in position
t_init = 0; % simulation start time
t_final = 10; % simulation end time
xInitial = [0 0]; % initial conditions
N = 1; C = 0; D = 1; N_var = 0;

open_system('c_ss_cl.mdl')
