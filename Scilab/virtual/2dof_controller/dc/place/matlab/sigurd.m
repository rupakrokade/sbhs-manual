clear
num = 200;
den = conv([0.05 1],[0.05 1]);
den = conv([10 1],den);
G = tf(num,den); Ts = 0.025; 
[B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); int = 0;

% Transient specifications
a = 0.9; rise = 0.24; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

% Controller design
Delta = [1 -1]; % internal model of step is present
[Rc,Sc,Tc,gamma] = pp_im2(B,A,k,phi,Delta,a);

% margin calculation
Lnum = conv(Sc,conv(B,zk));
Lden = conv(Rc,A);
L = tf(Lnum,Lden,Ts);
[Gm,Pm] = margin(L);

num1 = 100; den1 = [10 1];
Gd = tf(num1,den1);
[C,D,k1] = myc2d(Gd,Ts);
[zk,dzk] = zpowk(k);
C = conv(C,zk);

% simulation parameters g_s_cl2.mdl
N = 1;
st = 1; % desired change in setpoint
st1 = 0; % magnitude of disturbance
t_init = 0; % simulation start time
t_final = 1.5; % simulation end time
