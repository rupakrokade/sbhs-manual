mode(0)
global Rc Sc Tc gamm
global scn scd tcn tcd rcn rcd gamm
s=%s;
z=%z;
////TFcont = syslin('c',-280.14/((s-31.32)*(s+100)*(s+31.32))); 
//TFcont = syslin('c',0.593/((47.21*s+1)*(1.373*s+1)))//second order
////TFcont = syslin('c',0.594/(49.19*s+1))//first order
//SScont = tf2ss(TFcont);
////TFdisc=ss2tf(SScont);
//Ts = 1;
//[B,A,k] = myc2d(SScont,Ts);
//
////polynomials are returned
//[Ds,num,den] = ss2tf(SScont);
//num = clean(num); den = clean(den);

Ts = sampling_time;

//Transfer function for Part - B
A = [1 -1.9529968 0.9531269];
B= [0.0057384 -0.0057355];
k = 3;

//Transfer function for Part - A
//B = [0.0043779 -0.0043266];
//A = [1 -1.9444137 0.9447818];
//k = 5;

rise = 10;
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

