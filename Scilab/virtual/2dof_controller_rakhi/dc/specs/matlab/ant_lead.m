% continuous time antenna model
a = 0.1;
F = [0 1;0 -a]; g = [0; a]; c = [1 0]; d = 0;
Ga = ss(F,g,c,d); [num,den] = tfdata(Ga,'v'); 
Ts = 0.2;
G = c2d(Ga,Ts);

% lead controller
beta = 0.8;
N = [1 -0.9802]*(1-beta)/(1-0.9802); Rc = [1 -beta];

% simulation parameters using g_s_cl2.mdl
gamma = 1; Sc = 1; Tc = 1; C = 0; D = 1;
st = 1; st1 = 0;
t_init = 0; t_final = 20;
