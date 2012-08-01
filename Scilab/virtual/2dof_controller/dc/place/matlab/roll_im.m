% PP control with internal model for rolling mill problem from Goodwin
% Operating conditions

num = 26.24*poly([-190 -21+11*j -21-11*j -20 -0.5+86*j -0.5-86*j]);
den = poly([-143 -162+30*j -162-30*j -30+15*j -30-15*j -21+6*j -21-6*j]);
Ts = 0.001;
G = tf(num,den);
[B,A,k] = myc2d(G,Ts);
[a,b,c,d] = tf2ss(num,den);
% 
% Transient specifications and controller design
rise = 0.005; epsilon = 0.05;
t1 = 1; % T1 = 1
delta = 1; % Choice of internal model of step
[R,S,T,gamma,D1] = ...
pp_im_roll(B,A,k,Ts,rise,epsilon,t1,delta);
T = gamma*T;
%
% simulation parameters
st = 0.2; % desired change in h, in m.
t0 = 0; % simulation start time
tf = 0.2; % simulation end time
xInitial = [0 0.2 0 0 0 0 0];
N1 = 1; C = 0; D = 1; N_var = 0;



