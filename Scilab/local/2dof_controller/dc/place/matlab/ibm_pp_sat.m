% Transfer function
B = 0.47; A = [1 -0.43]; k = 1; 
[zk,dzk] = zpowk(k);
 
% Transient specifications
rise = 10; epsilon = 0.01; Ts = 1;
phi = desired(Ts,rise,epsilon);

% Controller design
delta = [1 -1]; % internal model of step used
[Rc,Sc,Tc,gamma,F] = pp_im2(B,A,k,phi,delta);

% Study of Antiwindup Controller

key = menu('Please choose one of the following', ...
	 'Simulate without any saturation limits', ...
         'Simulate saturation, but do not use AWC', ...
         'Simulate saturation with AWC in place', ...
         'Simulate without any saturation limits, but with AWC');

if key == 1
  U = 2; L = -2; P = 1; F = Rc; E = 0; PSc = Sc; PTc = Tc;
elseif key == 2
  U = 1; L = -1; P = 1; F = Rc; E = 0; PSc = Sc; PTc = Tc;
else
  if key == 3 % Antiwindup controller and with saturation
     U = 1; L = -1; 
  elseif key == 4 % Antiwindup controller, but no saturation
     U = 2; L = -2;
  end
  P = A;
  dF = length(F) - 1;
  PRc = conv(P,Rc); dPRc = length(PRc) - 1;
  [E,dE] = poladd(F,dF,-PRc,dPRc);
  PSc = conv(P,Sc); PTc = conv(P,Tc);
end

% Setting up simulation parameters for stb_disc_sat
t_init = 0; % first step begins
st = 1; % height of first step
t_init2 = 500; % second step begins
st2 = -2; % height of second step
t_final = 1000; % simulation end time
st1 = 0; % no disturbance input
C = 0; D = 1; N_var = 0;
