F = [0 0;1 -0.1]; G = [0.1; 0]; 
C = [0 1]; D = 0; Ts = 0.2;
sys = ss(F,G,C,D);
sysd = c2d(sys,Ts,'zoh');
H = tf(sysd)

