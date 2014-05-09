// Updated(1-8-07)
// 9.19

// Discretize the continuous plant
num = 1; den = [2 1]; tau = 0.5;
G1 = trfu(num,den);
getf iodelay.sci
G = iodelay(G1,tau);
Ts = 0.5;
getf delc2d.sci
[B,A,k] = delc2d(G,G1,Ts);

// Specify transient requirements
epsilon = 0.05; rise = 5;
phi = desired(Ts,rise,epsilon);

// Design the controller
Delta = [1 -1];
[Rc,Sc] = pp_pid(B,A,k,phi,Delta);

// parameters for simulation using g_s_cl
Tc = Sc; gamm = 1; N = 1; 
C = 0; D = 1; N_var = 0; 
st = 1; t_init = 0; t_final = 20;

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // N/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D
Num = numer(G1);
Den = denom(G1);

