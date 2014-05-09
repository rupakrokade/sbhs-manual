% Motor control problem
% Transfer function
a = [-1 0; 1 0]; b = [1; 0]; c = [0 1]; d = 0;
G = ss(a,b,c,d); Ts = 0.25; [B,A,k] = myc2d(G,Ts);

% Transient specifications
rise = 3; epsilon = 0.05; 
phi = desired(Ts,rise,epsilon);

% Controller design
Delta = 1; % No internal model of step used
[Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta);

% simulation parameters for c_ss_cl.mdl
st = 1; % desired change in position
t_init = 0; % simulation start time
t_final = 10; % simulation end time
xInitial = [0 0]; % initial conditions
N = 1; C = 0; D = 1; N_var = 0;
