p=pi/(2*14)
r=0.13^(p/pi)
T=[1 -2*r*cos(p) r^2]
A = [1 -1.95 0.935]
B=-0.015
C=1
Adelta=conv(A,[1 -1])
[Q,degQ,P,degP]=xdync(Adelta,3,B,0,T,2)
[E,degE,F,degF]=xdync(P(1)*Adelta,3,[0 1],1,P,2)
nu= P(1)*B*E(1)
Kc=-1/nu*(F(2)+2*F(3))
Ti=-(F(2)+2*F(3))/(F(1)+F(2)+F(3))
Td=-F(3)/(F(2)+2*F(3))
Kc/Ti
Kc*(1+Td)
Kc*(1+2*Td)
Kc*Td
