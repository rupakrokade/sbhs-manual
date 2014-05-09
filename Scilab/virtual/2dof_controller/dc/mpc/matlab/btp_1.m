%-- 3/11/05  4:13 AM --%
A = [1 -1.95 0.935]
B=-0.015
C=1
Adelta=conv(A,[1 -1])
[K,degK,L,degL,E1,degE1,F1,degF1]=xdync(Adelta,3,[0 1],1,C,0)
[K,degK,L,degL,E2,degE2,F2,degF2]=xdync(Adelta,3,[0 0 1],2,C,0)
[K,degK,L,degL,E3,degE3,F3,degF3]=xdync(Adelta,3,[0 0 0 1],3,C,0)
[K,degK,L,degL,E4,degE4,F4,degF4]=xdync(Adelta,3,[0 0 0 0 1],4,C,0)
[K,degK,L,degL,E5,degE5,F5,degF5]=xdync(Adelta,3,[0 0 0 0 0 1],5,C,0)
[K,degK,L,degL,E10,degE10,F10,degF10]=xdync(Adelta,3,[0 0 0 0 0 0 0 0 0 0 1],10,C,0)
[K,degK,L,degL,E20,degE20,F20,degF20]=xdync(Adelta,3,[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1],20,C,0)
[K,degK,L,degL,Gtilda1,degGtilda1,Gbar1,degGbar1]=xdync(C,0,[0 1],1,E1*B,degE1)
[K,degK,L,degL,Gtilda2,degGtilda2,Gbar2,degGbar2]=xdync(C,0,[0 0 1],2,E2*B,degE2)
[K,degK,L,degL,Gtilda3,degGtilda3,Gbar3,degGbar3]=xdync(C,0,[0 0 0 1],3,E3*B,degE3)
[K,degK,L,degL,Gtilda4,degGtilda4,Gbar4,degGbar4]=xdync(C,0,[0 0 0 0 1],4,E4*B,degE4)
[K,degK,L,degL,Gtilda5,degGtilda5,Gbar5,degGbar5]=xdync(C,0,[0 0 0 0 0 1],5,E5*B,degE5)
G=[Gtilda5(1) 0;Gtilda5(2) Gtilda5(1); Gtilda5(3) Gtilda5(2);Gtilda5(4) Gtilda5(3);Gtilda5(5) Gtilda5(4)]
gs= 1
es= -1/0.015
G_s= [1 0; 1 1]
gamma_y=diag([1 1 1 1 1])
gamma = diag([0.05 0.05])
lambda = diag([0.02 0.02])
mat1=inv(G'*gamma_y*G+lambda+G_s'*gamma*G_s)
mat2=mat1*(G'*gamma_y)
mat2_s=mat1*(G_s'*gamma)
h_s=sum(mat2_s(1,:))
F_s=es*A
h=[mat2(1,:)]
T=C
R=C*(sum(h(:))+h_s)
S=F1*h(1)+F2*h(2)+F3*h(3)+F4*h(4)+F5*h(5)+F_s*h_s
Kp=S(1)-R-S(3)
Ki=R
Kd=S(3)
Kp+Ki+Kd
-(Kp+2*Kd)