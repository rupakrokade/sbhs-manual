F = [-0.1 0; 1 0]; G = [0.1; 0]; C = [0 1]; D = 0;
Ts = 0.2;
%[V,D] = eig(F);
%[S,L] = eig(F);
%A = S*exp(L*Ts)*inv(S)
%B = [1-exp(-0.1*Ts); Ts+10*(exp(-0.1*Ts)-1)]
sys = ss(F,G,C,D);
sysd = c2d(sys,Ts)
