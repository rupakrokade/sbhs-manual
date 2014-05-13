// Updated(2-8-07)
// 9.13 
// ----------- Gain margin does not match
// ----------- Convergence problem while calculating
// phase margin (sometimes)------

num = 200;
den = convol([0.05 1],[0.05 1]);
den = convol([10 1],den);
G = trfu(num,den); Ts = 0.025; 
num = G('num'); den = G('den');
// iodel = 0;
[B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); //int1 = 0;

// Transient specifications
a = 0.9; rise = 0.24; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = [1 -1]; // internal model of step is present
[Rc,Sc,Tc,gamm] = pp_im2(B,A,k,phi,Delta,a);

// margin calculation
Lnum = convol(Sc,convol(B,zk));
Lden = convol(Rc,A);
L = trfu(Lnum,Lden,Ts);
Gm = g_margin(L); //---- Does not match --------------- (in dB)
Pm = p_margin(L); //---- Convergence problem --------------- (in degree)

num1 = 100; den1 = [10 1];
Gd = trfu(num1,den1);  //-------
[C,D,k1] = myc2d(Gd,Ts);
[zk,dzk] = zpowk(k);
C = convol(C,zk);

// simulation parameters g_s_cl2.cos ------------
N = 1;
st = 1; // desired change in setpoint
st1 = 0; // magnitude of disturbance
t_init = 0; // simulation start time
t_final = 1.5; // simulation end time

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // N/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

