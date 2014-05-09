% PP control with internal model for 
% example 10.1 of Ogata, P. 692
% Transfer functions
num = 1; den = conv([1 0],conv([1 1],[1 5])); tau = 0;
G = tf(num,den); Ts = 0.1; [B,A,k] = myc2d(G,Ts);
% 
% Transient specifications and controller design
rise = 1; epsilon = 0.2;
t1 = 1; % T1 = 1
delta = 0; % Choice of internal model of step
[R,S,T,gamma,Delta] = ...
pp_im(B,A,k,Ts,rise,epsilon,t1,delta);
TM = gamma*T;
%
% simulation parameters
st = 1; % desired change in h, in m.
t0 = 0; % simulation start time
tf = 5; % simulation end time
