% PP control with internal model for antenna problem
a = [0 0;1 -0.1]; b = [0.1; 0]; 
c = [0 1]; d = 0; 
% 
% Transfer functions
G = ss(a,b,c,d); Ts = 0.2; [B,A,k] = myc2d(G,Ts);
% 
% Transient specifications and controller design
rise = 1.8; epsilon = 0.25;
phi = desired(Ts,rise,epsilon);

Delta = [1 -1]; % Choice of internal model of step
control = 0;
if control == 0, % 1-DOF with cancellation of good factors
   [Rc,Sc] = pp_im(B,A,k,phi,Delta);
   Tc = Sc; gamma = 1;
elseif one_dof == 1, % 1-DOF with no cancellation of factors
   [Rc,Sc] = pp_pid(B,A,k,phi,Delta);
   Tc = Sc; gamma = 1;
else % 2-DOF controller
   [Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta);
end
%
% simulation parameters for stb_disc.mdl
[zk,dzk] = zpowk(k);
st = 1; % desired step change
t_init = 0; % simulation start time
t_final = 20; % simulation end time
xInitial = [0 0];
C = 0; D = 1; N_var = 0;
open_system('stb_disc.mdl')
%
% simulation parameters for c_ss_sr.mdl
N = 1;
open_system('c_ss_sr.mdl')
