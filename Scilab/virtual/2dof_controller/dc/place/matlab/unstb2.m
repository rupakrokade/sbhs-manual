num = [1 -1]; den = conv([1 -3],[1 2]);
G = tf(num,den);
Ts = 0.1; [B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); int = 0;
% 
% Transient specifications
rise = 2; epsilon = 0.1;
t1 = 1; % T1 = 1;
delta = 0; % no internal model of step

% Controller design
[R,S,T,gamma,D1] = ...
  pp_im(B,A,k,Ts,rise,epsilon,t1,delta);

% other control blocks
C = 1; D = 1; N_var = 0; N1 = 1; D1 = 1;

% simulation parameters
st = 1.0; % desired change in setpoint
t_init = 0; % simulation start time
t_final = 50; % simulation end time

