% Magnetically suspended ball problem
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

% Transfer functions
G = ss(a,b,c,d); Ts = 0.01; [B,A,k] = myc2d(G,Ts);
[num,den] = tfdata(G,'v');

% Transient specifications
rise = 0.15; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

% Controller design
[Rc,Sc,Tc,gamma] = pp_basic(B,A,k,phi);

% Setting up simulation parameters for basic.mdl
st = 0.0001; % desired change in h, in m.
t_init = 0; % simulation start time
t_final = 0.5; % simulation end time

% Setting up simulation parameters for c_ss_cl
N_var = 0; xInitial = [0 0 0]; N = 1; C = 0; D = 1;
