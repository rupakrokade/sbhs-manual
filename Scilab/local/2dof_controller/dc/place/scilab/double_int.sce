// Double integrator, p. 362 and p. 446 of Ogata

a1 = [0 1; 0 0]; b1 = [0;1]; c1 = [1 0]; d1 = 0;

// Transfer functions
Ga = syslin('c',a1,b1,c1,d1); Ts = 0.2; 
[B,A,k] = myc2d(Ga,Ts);

// Discrete time state space matrices
[a,b,c,d] = abcd(dscr(Ga,Ts));

// Transient specifications
roots = [0.6+0.4*%i,0.6-0.4*%i]; phi_pol = poly(roots,'x');
phi = flip(coeff(phi_pol));

// State space pole placement controller
K = ppol(a,b,roots);

// Transfer function approach to controller design
[Rc,Sc,Tc,gamm] = pp_basic(B,A,k,phi);

// Setting up simulation parameters for basic.cos
st = 1; // desired change in h
t_init = 0; // simulation start time
t_final = 5; // simulation end time

// Setting up simulation parameters for c_ss_cl.cos
N_var = 0; xInitial = [0 0]; N = 1; C = 0; D = 1;

[Tc1,Rc1] = cosfil_ip(Tc,Rc); // Tc/Rc 
[Sc2,Rc2] = cosfil_ip(Sc,Rc); // Sc/Rc

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // 1/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D
