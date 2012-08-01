% Plant 
B = 1; A = [1 -1]; zk = [0 1]; Ts = 1; 

% Specify closed loop characteristic polynomial
phi = [1 -0.5];

% Design the controller
reject_ramps = 1;
if reject_ramps == 1,
   Delta = [1 -1]; % to reject ramps another Delta
else
   Delta = 1; % steps can be rejected by plant itself
end
[Rc,Sc] = pp_pid(B,A,k,phi,Delta);

% parameters for simulation using stb_disc.mdl
Tc = Sc; gamma = 1; N = 1; 
C = 0; D = 1; N_var = 0; 
st = 1; t_init = 0; t_final = 20;
open_system('stb_disc.mdl')
