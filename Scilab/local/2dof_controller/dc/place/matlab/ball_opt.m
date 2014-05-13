% Operating conditions
M = 0.05; L = 0.01; R = 1; K = 0.0001; g = 9.81;
%
% Equilibrium conditions
hs = 0.01; is = sqrt(M*g*hs/K);
% 
% State space matrices
a21 = K*is^2/M/hs^2; a23 = - 2*K*is/M/hs; a33 = - R/L;
b3 = 1/L;
a = [0 1 0; a21 0 a23; 0 0 a33];
b = [0; 0; b3]; c = [1 0 0]; d = 0;
% 
% Transfer functions
G = ss(a,b,c,d); Ts = 0.01; [B,A,k] = myc2d(G,Ts);
% 
% Transient specifications
rise = 0.1; epsilon = 0.05;
%
% Controller design
[R,S,T,gamma] = pp_opt(B,A,k,Ts,rise,epsilon);
%
% Setting up simulation parameters
T = gamma*T;
st = 0.0001; % desired change in h, in m.
t_init = 0; % simulation start time
t_final = 0.5; % simulation end time
xInitial = [0 0 0];
N1 = 1; D1 = 1; C = 0; D = 1; N_var = 0;
