% Control of IBM lotus domino server
% Transfer function
B = 0.47; A = [1 -0.43]; k = 1; 
[zk,dzk] = zpowk(k);
 
% Transient specifications
rise = 10; epsilon = 0.01; Ts = 1;
phi = desired(Ts,rise,epsilon);

% Controller design
Delta = [1 -1]; % internal model of step used
[Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta);

% Simulation parameters for stb_disc
st = 1; % desired change
t_init = 0; % simulation start time
t_final = 40; % simulation end time
C = 0; D = 1; N_var = 0;
