% GMVC PID tuning of example given by Miller et al.
% Model
A = [1 -1.95 0.935]; B = -0.015; k = 1; Ts = 1;
%
% Transient specifications
N = 15; epsilon = 0.1; Ts = 1;
T = desired(Ts,N,epsilon);
%
% Controller Design
[Kc,tau_i,tau_d,L] = gmvc_pid(A,B,k,T,Ts);
L1 = filtval(L,1);
zk = zpowk(k);

