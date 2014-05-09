% PP control with internal model for antenna problem
a = [0 0;1 -0.1]; b = [0.1; 0]; 
c = [0 1]; d = 0; 
% 
% Transfer functions
G = ss(a,b,c,d); Ts = 0.01; [B,A,k] = myc2d(G,Ts);
% 
% Transient specifications and controller design
rise = 1.8; epsilon = 0.25;
t1 = 1; % T1 = 1
delta = 0; % Choice of internal model of step
[R,S,T,gamma,D1] = ...
pp_im(B,A,k,Ts,rise,epsilon,t1,delta);
T = gamma*T;
%
% simulation parameters
st = 1; % desired change in h, in m.
t0 = 0; % simulation start time
tf = 20; % simulation end time
xInitial = [0 0];
N1 = 1; C = 0; D = 1; N_var = 0;
