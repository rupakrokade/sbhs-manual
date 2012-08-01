global temp heat_in fan_in CO u_new u_old u_old_old  r_old y_old Rc1 Rc2 Rc3 Sc1 Sc2 Tc1 Tc2 gamm

// Transfer function
B = [0.0078942 0.0056409]; A = [1 -1.352431 0.3621963]; k=1;

// Transient specifications
rise =5
epsilon = 0.1
Ts = 1
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = [1 -1];  // internal model of step used
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi,Delta);

// parameters for twodof.cos
gamm
[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
Tc=coeff(Tcp1)
Tc1=Tc(1,2)
Tc2=Tc(1,1)
[Rcp1,Rcp2] = cosfil_ip(1,Rc); // 1/Rc
Rc=coeff(Rcp2)
Rc1=Rc(1,3)
Rc2=Rc(1,2)
Rc3=Rc(1,1)
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
Sc=coeff(Scp1)
Sc1=Sc(1,2)
Sc2=Sc(1,1)



