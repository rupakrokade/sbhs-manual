// Updated(2-8-07)
// 9.17

// test problem to demonstrate benefits of 2_dof
// Ts = 1; B = [1 0.9]; A = conv([1 -1],[1 -0.8]); k = 1;

Ts = 1; k = 1;
B = convol([1 0.9],[1 -0.8]); A = convol([1 -1],[1 -0.5]);
 
// closed loop characteristic polynomial
phi = [1 -1 0.5];

Delta = 1; // Choice of internal model of step
control = 1;
if control == 1, // 1-DOF with no cancellation
   [Rc,Sc] = pp_pid(B,A,k,phi,Delta);
   Tc = Sc; gamm = 1;
else // 2-DOF
   [Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi,Delta);
end

// simulation parameters for stb_disc.mdl
[zk,dzk] = zpowk(k);
st = 1; // desired step change
t_init = 0; // simulation start time
t_final = 20; // simulation end time
xInitial = [0 0];
C = 0; D = 1; N_var = 0;

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Bp,Ap] = cosfil_ip(B,A); // B/A
[zkp1,zkp2] = cosfil_ip(zk,1); // zk/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

// Give appropriate path
scicos('D:/data6/data/data/dc_scilab/digital/scilab/stb_disc.cos');


