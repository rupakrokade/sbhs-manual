B = 1; A = [1 -1]; k = 1; zk = zpowk(k); Ts = 1; 
phi = [1 -0.5];

Delta = 1; % Choice of internal model of step
[Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta);
%
% simulation parameters for stb_disc.mdl
st = 1; % desired step change
t_init = 0; % simulation start time
t_final = 20; % simulation end time
xInitial = [0 0];
C = 0; D = 1; N_var = 0;
open_system('stb_disc.mdl')
