clear
num = conv([1 1999],conv([1 -1375],[1 28.26]));
num = -conv(num,[1 97.79 2.307e6])*248034818.6741;
den = conv([1 17.73],[1 489.2 6.764e4]);
den = conv(den,conv([1 -53.65 4.783e5],[1 -44.6 1.369e6]));
M = max([num den]); % num = num/M; den = den/M;
tau = 0.00087; G = tf(num,den,'ioDelay',tau);
Ts = 0.001; H = myc2d(G,Ts); [B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); int = 0;
% 
% Transient specifications
rise = 0.004; epsilon = 0.05;
t1 = 1; % T1 = 1;
delta = 0; % no internal model of step

% Controller design
[R,S,T,gamma,D1] = ...
  pp_im(B,A,k,Ts,rise,epsilon,t1,delta);
TM = gamma*T;
%
% simulation parameters
st = 1.0; % desired change in setpoint
t0 = 0; % simulation start time
tf = 0.5; % simulation end time

