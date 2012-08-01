F = [-1 0;1 0]; G = [1; 0]; 
C = [0 1]; D = 0; Ts=1;
sys = ss(F,G,C,D);
sysd = c2d(sys,Ts,'zoh')
