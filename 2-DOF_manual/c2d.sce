s=poly(0,'s'); //Defines s to be a polynomial variable
TFcont = syslin('c',[0.5/(58*s+1)]) //Creating cont-time transfer function
SScont = tf2ss(TFcont); //Converting cont-time transfer function to state-space model
Ts=1; //Sampling time
SSdisc=dscr(SScont,Ts); //Discretizing cont-time state-space model
TFdisc=ss2tf(SSdisc) //Converting discr-time ss model to tf
