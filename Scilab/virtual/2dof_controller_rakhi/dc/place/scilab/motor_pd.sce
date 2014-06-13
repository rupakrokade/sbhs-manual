// Updated(1-8-07)
// 9.21

// Motor control problem
// Transfer function

a = [-1 0; 1 0]; b = [1; 0]; c = [0 1]; d = 0;
G = syslin('c',a,b,c,d); Ts = 0.25;
[B,A,k] = myc2d(G,Ts);
[Ds,num,den] = ss2tf(G);

// Transient specifications
rise = 3; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = 1;  //No internal model of step used
[Rc,Sc] = pp_pid(B,A,k,phi,Delta);

// continuous time controller
getf pd.sci;
[K,taud,N] = pd(Rc,Sc,Ts);
numb = K*[1 taud*(1+1/N)]; denb = [1 taud/N];
numf = 1; denf = 1;

// simulation parameters
st = 1;  // desired change in position
t_init = 0; // simulation start time
t_final = 20; // simulation end time
st1 = 0;

// continuous controller simulation: g_s_cl3.cos
num1 = 0; den1 = 1; 

// discrete controller simulation: g_s_cl2.cos
// u1: -0.1 to 0.8
// y1: 0 to 1.4
C = 0; D = 1; N = 1; gamm = 1; Tc = Sc; 

[Tcp1,Tcp2] = cosfil_ip(Tc,1); // Tc/1
[Np,Rcp] = cosfil_ip(N,Rc); // N/Rc
[Scp1,Scp2] = cosfil_ip(Sc,1); // Sc/1
[Cp,Dp] = cosfil_ip(C,D); // C/D
Numb = polyno(numb,'s');
Denb = polyno(denb,'s');
Numf = polyno(numf,'s');
Denf = polyno(denf,'s');
Num1 = polyno(num1,'s');
Den1 = polyno(den1,'s');
