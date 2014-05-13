// Updated(2-8-07)
// 9.10  
// Control of IBM lotus domino server
// Transfer function

B = 0.47; A = [1 -0.43]; k = 1; 
[zk,dzk] = zpowk(k);
 
// Transient specifications
rise = 10; epsilon = 0.01; Ts = 1;
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = [1 -1];  // internal model of step used
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi,Delta);

// Simulation parameters for stb_disc.cos
st = 1; // desired change
t_init = 0; // simulation start time
t_final = 40; // simulation end time
C = 0; D = 1; N_var = 0;

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bp,Ap] = cosfil_ip(B,A); // B/A
[zkp1,zkp2] = cosfil_ip(zk,1); // zk/1
[Cp,Dp] = cosfil_ip(C,D); // C/D



