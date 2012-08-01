// Double integrator, p. 362 and p. 446 of Ogata

a1 = [0 1; 0 0]; b1 = [0;1]; c1 = [1 0]; d1 = 0;

// Transfer functions
Ga = syslin('c',a1,b1,c1,d1); Ts = 0.2; 
[B,A,k] = myc2d(Ga,Ts);

// Discrete time state space matrices
[a,b,c,d] = abcd(dscr(Ga,Ts));

// Transient specifications
roots = [0,0]; phi_pol = poly(roots,'x');
phi = flip(coeff(phi_pol));

// State space pole placement controller
K = ppol(a,b,roots)

// Transfer function approach to controller design
[Rc,Sc,Tc,gamm] = pp_basic(B,A,k,phi);
Sc/Rc(1), Rc/Rc(1)
