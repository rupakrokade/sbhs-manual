% Transfer function
B = [1 -1.2]; A = [1 -0.8]; k = 1; 
[zk,dzk] = zpowk(k); Ts = 1;

% Controller design
phi = [1 -1.4 0.49]; dphi = 2;
dB = length(B)-1; dA = length(A)-1;
[N,dN] = polmul(B,dB,zk,dzk);
Delta = [1 -1]; dDelta = 1;
[D,dD] = polmul(A,dA,Delta,dDelta);
[S,dS,R,dR] = xdync(N,dN,D,dD,phi,dphi);
R = conv(R,Delta);
%
% Setting up simulation parameters for simple.mdl
st = 1; % desired change
t_init = 0; % simulation start time
t_final = 25; % simulation end time
C = 0; D = 1; st1 = 0;

