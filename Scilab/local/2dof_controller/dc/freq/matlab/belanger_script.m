Omega = 3;
GD = tf([1 -0.726],[1 -0.278],0.2)
[mag,phase] = bode(GD,Omega)
