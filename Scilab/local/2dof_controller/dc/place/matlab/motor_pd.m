% Motor control problem
% Transfer function
a = [-1 0; 1 0]; b = [1; 0]; c = [0 1]; d = 0;
G = ss(a,b,c,d); Ts = 0.25; [B,A,k] = myc2d(G,Ts);
[num,den] = tfdata(G,'v');

% Transient specifications
rise = 3; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

% Controller design
Delta = 1; % No internal model of step used
[Rc,Sc] = pp_pid(B,A,k,phi,Delta);

% continuous time controller
[K,taud,N] = pd(Rc,Sc,Ts);
numb = K*[1 taud*(1+1/N)]; denb = [1 taud/N];
numf = 1; denf = 1;

% simulation parameters
st = 1; % desired change in position
t_init = 0; % simulation start time
t_final = 20; % simulation end time
st1 = 0;

% continuous controller simulation: g_s_cl3.mdl
num1 = 0; den1 = 1; 

% discrete controller simulation: g_s_cl2.mdl
C = 0; D = 1; N = 1; gamma = 1; Tc = Sc; 
