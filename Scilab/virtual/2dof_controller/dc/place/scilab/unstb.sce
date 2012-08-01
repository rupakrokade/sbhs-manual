// Updated(21-9-07)
// 9.7

Ts = 1; B = [1 -3]; A = [1 2 -8]; k = 1;
// Since k=1, tf is of the form z^-1
[zk,dzk] = zpowk(k); // int1 = 0;//---- int1

// Transient specifications
rise = 10; epsilon = 0.1;
phi = desired(Ts,rise,epsilon);

// Controller design
[Rc,Sc,Tc,gamm] = pp_basic(B,A,k,phi);

// simulation parameters for basic_disc.cos
//While simulating for t_final = 100, set the limit of Y axis of each scope
//u1: -0.2 to 3
//y1: -0.1 to 1.2
st = 1.0; // Desired change in setpoint
t_init = 0; // Simulation start time
t_final = 1000; // Simulation end time

// Simulation parameters for stb_disc.cos
N_var = 0; C = 0; D = 1; N = 1; 

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bp,Ap] = cosfil_ip(B,A); // B/A
[zkp1,zkp2] = cosfil_ip(zk,1); // zk/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

[Tcp,Rcp] = cosfil_ip(Tc,Rc); // Tc/Rc
[Scp_b,Rcp_b] = cosfil_ip(Sc,Rc); // Sc/Rc



