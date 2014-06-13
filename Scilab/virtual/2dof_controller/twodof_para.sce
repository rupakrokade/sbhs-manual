mode(0)
global Rc Sc Tc gamm u_old_old u_old r_old_old r_old y_old_old y_old u_new r_new y_new 
s=%s;
z=%z;
//TFcont = syslin('c',0.593/((47.21*s+1)*(1.373*s+1)));//second order
//TFcont = syslin('c',0.594/(49.19*s+1))//first order
TFcont = syslin('c',0.42/(35.61*s+1));//first order
SScont = tf2ss(TFcont);
Ts = 1;
[B,A,k] = myc2d(SScont,Ts);

//polynomials are returned
[Ds,num,den] = ss2tf(SScont);
num = clean(num); den = clean(den);

// Transient specifications
rise = 100; epsilon = 0.05;
phi = desired(Ts,rise,epsilon);

// Controller design
Delta = [1 -1];
[Rc,Sc,Tc,gamm] = pp_im(B,A,k,phi);//with integral

// initial values 
u_old_old = 0;
u_old = 0;
r_old_old = 0;
r_old = 0;
y_old_old = 0;
y_old = 0;

