// Updated(3-8-07)
// 10.1 

Ts = 1; B = 0.63; A = [1 -0.37];
k = input('Enter the delay as an integer: ');
if k<=0, k = 1; end
[zk,dzk] = zpowk(k);

// Desired transfer function
phi = [1 -0.5];
delta = 1; // internal model of step introduced

// Controller design
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi,delta);

// simulation parameters for stb_disc.cos 
// y1: 0 to 1; u1: 0 to 1.2
st = 1.0; // desired change in setpoint
t_init = 0; // simulation start time
t_final = 20; // simulation end time

// simulation parameters for stb_disc_10.1.cos
N_var = 0; C = 0; D = 1; N = 1; 

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bp,Ap] = cosfil_ip(B,A); // B/A
[zkp1,zkp2] = cosfil_ip(zk,1); // zk/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

