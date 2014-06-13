// Updated(2-8-07)
// 9.15

clear
num = 200;
den = convol([0.05 1],[0.05 1]);
den = convol([10 1],den);
G = trfu(num,den); Ts = 0.005; 
[B,A,k] = myc2d(G,Ts);
[zk,dzk] = zpowk(k); //int = 0;

// Sigurd's feedback controller'
numb = 0.5*convol([1 2],[0.05 1]);
denb = convol([1 0],[0.005 1]);
Gb = trfu(numb,denb);
[Sb,Rb,kb] = myc2d(Gb,Ts);
[zkb,dzkb] = zpowk(kb);
Sb = convol(Sb,zkb);

// Sigurd's feed forward controller'
numf = [0.5 1];
denf = convol([0.65 1],[0.03 1]);
Gf = trfu(numf,denf);
[Sf,Rf,kf] = myc2d(Gf,Ts);
[zkf,dzkf] = zpowk(kf);
Sf = convol(Sf,zkf);

// Margins
simp_mode(%f);
L = G*Gb;
Gm = g_margin(L); // ------
Pm = p_margin(L); // ------
Lnum = convol(Sb,convol(zk,B));
Lden = convol(Rb,A);
L = trfu(Lnum,Lden,Ts);
DGm = g_margin(L); // ------
DPm = p_margin(L); // ------

// Noise
num1 = 100; den1 = [10 1];

// simulation parameters for 
// entirely continuous simulation: g_s_cl3.cos
// hybrid simulation: g_s_cl6.cos
st = 1; // desired change in setpoint
st1 = 0;
t_init = 0; // simulation start time
t_final = 5; // simulation end time

num = polyno(num,'s'); den = polyno(den,'s');
Numb = polyno(numb,'s'); Denb = polyno(denb,'s');
Numf = polyno(numf,'s'); Denf = polyno(denf,'s'); 
Num1 = polyno(num1,'s'); Den1 = polyno(den1,'s'); 

[Sbp,Rbp] = cosfil_ip(Sb,Rb);
[Sfp,Rfp] = cosfil_ip(Sf,Rf);


