mode(0)
global Rc Sc Tc gamm
global scn scd tcn tcd rcn rcd gamm
s=%s;
z=%z;


Ts = sampling_time;

//Transfer function 
A = [1 -0.9279 0.92];
B= [0.0020 -0.0018];
k = 5;


rise = 60;
epsilon = 0.1;
Nr = rise/Ts;

// Transient specifications
//rise = 10; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = [1 -1];
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi);//with integral

// Setting up simulation parameters for basic.cos
st = 0.0001; // desired change in h, in m.
t_init = 0; // simulation start time
t_final = 0.5; // simulation end time

// Setting up simulation parameters for c_ss_cl.cos
N_var = 0; xInitial = [0 0 0]; N = 1; C = 0; D = 1;

[Tc1,Rc1] = cosfil_ip(Tc,Rc); // Tc/Rc 
[Sc2,Rc2] = cosfil_ip(Sc,Rc); // Sc/Rc

[Bp] = cosfil_ip(B,1);
[Ap] = cosfil_ip(A,1);

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D

//Rc1=Rc(1);Rc2=Rc(2);Rc3=Rc(3);Rc4=Rc(4);
//Sc1=Sc(1);Sc2=Sc(2);
//Sc3=Sc(3);
//Tc1=Tc(1);Tc2=Tc(2);
//Tc3=Tc(3);
Rcp
Scp1
Tcp1
gamm



scn = poly(Sc(length(Sc):-1:1),'z','coeff');
tcn = poly(Tc(length(Tc):-1:1),'z','coeff');
rcn = poly(Rc(length(Rc):-1:1),'z','coeff');

scd = z^(length(Sc)-1);
rcd = z^(length(Rc)-1);
tcd = z^(length(Tc)-1);

