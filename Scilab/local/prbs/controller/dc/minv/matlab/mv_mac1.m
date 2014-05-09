% MacGregor's first control problem
%
A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int = 0;
[Sc,dSc,Rc,dRc] = mv(A,dA,B,dB,C,dC,k,int)
[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int);

% Simulation parameters for stb_disc.mdl
Tc = Sc; gamma = 1; [zk,dzk] = zpowk(k);
D = 1; N_var = 0.1; Ts = 1; st = 0;
t_init = 0; t_final = 1000;

open_system('stb_disc.mdl')
