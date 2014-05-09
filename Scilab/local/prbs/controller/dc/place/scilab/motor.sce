// Updated(2-8-07)
// 9.11
// Motor control problem
// Transfer function

a1 = [-1 0; 1 0]; b1 = [1; 0]; c1 = [0 1]; d1 = 0;
G = syslin('c',a1,b1,c1,d1); Ts = 0.25;
[B,A,k] = myc2d(G,Ts);

// Transient specifications
rise = 3; epsilon = 0.05; 
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = 1; // No internal model of step used
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi,Delta);

// simulation parameters for c_ss_cl.cos
st = 1;  //desired change in position
t_init = 0;  //simulation start time
t_final = 10;  //simulation end time
xInitial = [0 0];  //initial conditions
N = 1; C = 0; D = 1; N_var = 0;

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D



