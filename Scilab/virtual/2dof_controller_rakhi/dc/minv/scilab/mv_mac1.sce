// Updated(3-8-07)
// MacGregor's first control problem
// 11.4

A = [1 -1.4 0.45]; dA = 2; C = [1 -0.5]; dC = 1;
B = 0.5*[1 -0.9]; dB = 1; k = 1; int1 = 0;

getf mv.sci;
[Sc,dSc,Rc,dRc] = mv(A,dA,B,dB,C,dC,k,int1);

[Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int1);

// Simulation parameters for stb_disc.cos
Tc = Sc; gamm = 1; [zk,dzk] = zpowk(k);
D = 1; N_var = 0.1; Ts = 1; st = 0;
t_init = 0; t_final = 1000;

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bp,Ap] = cosfil_ip(B,A); // B/A
[zkp1,zkp2] = cosfil_ip(zk,1); // zk/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

scicos('D:/data6/data/data/dc_scilab/digital/scilab/stb_disc.cos');
