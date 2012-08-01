% Discretize the continuous plant
num = 1; den = [2 1]; tau = 0.5;
G = tf(num,den);
G.ioDelay = tau;
Ts = 0.5;
[B,A,k] = myc2d(G,Ts);

% Specify transient requirements
epsilon = 0.05; rise = 5;
phi = desired(Ts,rise,epsilon);

% Design the controller
Delta = [1 -1];
[Rc,Sc] = pp_pid(B,A,k,phi,Delta);
%
% parameters for simulation using g_s_cl
Tc = Sc; gamma = 1; N = 1; 
C = 0; D = 1; N_var = 0; 
st = 1; t_init = 0; t_final = 20;
