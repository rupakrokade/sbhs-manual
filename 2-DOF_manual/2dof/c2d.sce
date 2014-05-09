mode(0)
global NUM chi
s=poly(0,'s'); //Defines s to be a polynomial variable
TFcont = syslin('c',[0.532/((30.09*s+1)*(6.971*s+1))]) //Creating cont-time transfer function
SScont = tf2ss(TFcont); //Converting cont-time transfer function to state-space model
Ts=0.5; //Sampling time
SSdisc=dscr(SScont,Ts); //Discretizing cont-time state-space model
TFdisc=ss2tf(SSdisc) //Converting discr-time ss model to tf
[Ds,NUM,chi]=ss2tf(SSdisc)