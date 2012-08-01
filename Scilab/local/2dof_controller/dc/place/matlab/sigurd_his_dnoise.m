clear
num = 200;
den = conv([0.05 1],[0.05 1]);
den = conv([10 1],den);
G = tf(num,den); Ts = 0.01; 
[B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); int = 0;

% Sigurd's feedback controller'
numb = 0.5*conv([1 2],[0.05 1]);
denb = conv([1 0],[0.005 1]);
Gb = tf(numb,denb);
[Sb,Rb,kb] = myc2d(Gb,Ts);
[zkb,dzkb] = zpowk(kb);
Sb = conv(Sb,zkb);

% Sigurd's feed forward controller'
numf = [0.5 1];
denf = conv([0.65 1],[0.03 1]);
Gf = tf(numf,denf);
[Sf,Rf,kf] = myc2d(Gf,Ts);
[zkf,dzkf] = zpowk(kf);
Sf = conv(Sf,zkf);

% Margins
L = series(G,Gb);
[Gm,Pm] = margin(L);
Lnum = conv(Sb,conv(zk,B));
Lden = conv(Rb,A);
L = tf(Lnum,Lden,Ts);
[DGm,DPm] = margin(L);

num1 = 100; den1 = [10 1];
Gd = tf(num1,den1);
[C,D,k1] = myc2d(Gd,Ts);
[zk,dzk] = zpowk(k);
C = conv(C,zk);

% simulation parameters for g_s_cl3.mdl
st = 1; % desired change in setpoint
st1 = 0;
t_init = 0; % simulation start time
t_final = 5; % simulation end time
