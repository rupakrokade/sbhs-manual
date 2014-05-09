// Updated(3-8-07)
// 10.2

Ts = 1; B = 0.63; A = [1 -0.37]; k = 3;
Bd = convol(B,[0 1]);
kd = k - 1;
[zkd,dzkd] = zpowk(kd);
[mzkd,dmzkd] = poladd(1,0,-zkd,dzkd);

// Desired transfer function
phi = [1 -0.5]; delta = 1;

// Controller design
[Rc,Sc,Tc,gamm] = pp_im(B,A,1,phi,delta);

// simulation parameters for smith_disc.cos 
// Control effort -----------
st = 1.0; // desired change in setpoint
t_init = 0; // simulation start time
t_final = 20; // simulation end time

// simulation parameters for smith_disc.cos
N_var = 0; C = 0; D = 1; N = 1; 

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bdp,Ap] = cosfil_ip(Bd,A); // Bd/Ad
[zkdp1,zkdp2] = cosfil_ip(zkd,1); // zkd/1
[mzkdp1,mzkdp2] = cosfil_ip(mzkd,1); // mzkd/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

