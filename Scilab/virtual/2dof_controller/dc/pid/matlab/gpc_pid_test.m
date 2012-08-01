clear
A = [1 -1.95 0.935];
B=-0.015;
C=1;
degA=2;
degB=0;
degC=0;
N1=1;
N2=5;
Nu=2;
gamma=0.05;
gamma_y=1;
lambda=0.02;
[Kp,Ki,Kd] = ...
gpc_pid(A,degA,B,degB,C,degC,N1,N2,Nu,lambda,gamma,gamma_y)
