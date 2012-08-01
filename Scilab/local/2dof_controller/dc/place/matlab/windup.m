% Transfer function
B = [1 -0.8]; A = [1 -0.7]; k = 1; 
[zk,dzk] = zpowk(k); Ts = 1;

% Transient specifications
rise = 4; epsilon = 0.1;
phi = desired(Ts,rise,epsilon);

% Controller design
delta = 1;
[Rc,Sc,Tc,gamma,F] = pp_im(B,A,k,phi,delta);

% Simulation parameters for stb_disc
st = 1; % desired change
t_init = 0; % simulation start time
t_final = 50; % simulation end time
C = 0; D = 1; N_var = 0;

% Speed of antiwindup controller
% rise2 = 2; epsilon2 = 0.1;
% P = desired(Ts,rise2,epsilon2);
P = A;

% Design of antiwindup controller
dF = length(F) - 1;
PRc = conv(P,Rc); dPRc = length(PRc) - 1;
[E,dE] = poladd(F,dF,-PRc,dPRc);
PSc = conv(P,Sc); PTc = conv(P,Tc);

% Setting up simulation parameters for stb_disc_sat
U = 1; L = -1;
t_init2 = 25; % second step begins
st2 = -2; % height of second step
st1 = 0; % no disturbance input
