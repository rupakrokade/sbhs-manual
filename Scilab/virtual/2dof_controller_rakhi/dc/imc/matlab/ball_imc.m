M = 0.05; L = 0.01; R = 1; K = 0.0001; g = 9.81;
hs = 0.01; is = sqrt(M*g*hs/K);
a21 = K*is^2/M/hs^2; a23 = - 2*K*is/M/hs; a33 = - R/L;
b3 = 1/L;
a = [0 1 0; a21 0 a23; 0 0 a33];
b = [0; 0; b3]; c = [1 0 0]; d = 0;
G = ss(a,b,c,d); Ts = 0.01; [Btilde,Atilde,k] = myc2d(G,Ts);
[Btilde,Atilde,k] = myc2d(G,Ts);
alpha = 0.9;
[k,GiN,GiD,R,S,beta] = imc(Btilde,Atilde,k,alpha);
[zk,dzk] = zpowk(k);
B = Btilde; A = Atilde;
%
% Setting up simulation parameters
st = 0.0001; % desired change in h, in m.
t0 = 0; % simulation start time
tf = 1; % simulation end time
xInitial = [0 0 0];
N1 = S; D1 = R; C = 0; D = 1; N_var = 0;
R = 1; S = 1; T = 1;
