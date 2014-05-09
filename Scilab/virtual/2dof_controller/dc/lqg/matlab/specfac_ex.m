% Macgregor's example problem without common factor
% [r,P,degP] = specfac([-0.5 1],1,0.5,0,1)
%
% Macgregor's example problem with common factor
A = conv([-0.5 1],[-0.9 1])
degA = 2
B = 0.5*[-0.9 1]
degB = 1
C = conv([-0.5 1],[0 1])
[r,P,degP] = specfac(A,degA,B,degB,1)
%
% Sternad and Ahlen in Hunt Example
%
A = conv([1 -1],[1 -0.9])
degA = 2
B = [0.1 0.08]
degB = 1
rho = 0.1
[r,P,degP] = specfac2(A,degA,B,degB,rho)
D = zeros(2)
[D,degD] = putin(D,0,P,degP,1,1)
[D,degD] = putin(D,degD,P,degP,2,2)
N = zeros(1,2)
[N,degN] = putin(N,0,[-0.1 -0.08],1,1,1)
[N,degN] = putin(N,degN,[1 -0.9],1,1,2)
C1 = conv([1 -1],[1 -1])
C1 = 0.1 * conv(C1,[0.9 -1])
C2 = conv([0 1],[0.08 0.1])
C = zeros(1,2)
[C,degC] = putin(C,0,C1,3,1,1)
[C,degC] = putin(C,degC,C2,2,1,2)
[Lnum,dLnum,Lden,dLden,Y,degY,X,degX] = ...
xdync(N,degN,D,degD,C,degC)
%
% the above works, but controller is not causal; to make it causal
% we multiply D(2,2) by q^{-2}
%
A = conv([1 -1],[1 -0.9])
degA = 2
B = [0.1 0.08]
degB = 1
rho = 0.1
[r,P,degP] = specfac2(A,degA,B,degB,rho)
D = zeros(2)
[D,degD] = putin(D,0,P,degP,1,1)
D2 = conv(P,[0 1])
D2 = conv(D2,[0 1])
[D,degD] = putin(D,degD,D2,4,2,2)
N = zeros(1,2)
[N,degN] = putin(N,0,[-0.1 -0.08],1,1,1)
[N,degN] = putin(N,degN,[1 -0.9],1,1,2)
C1 = conv([1 -1],[1 -1])
C1 = 0.1 * conv(C1,[0.9 -1])
C2 = conv([0 1],[0.08 0.1])
C = zeros(1,2)
[C,degC] = putin(C,0,C1,3,1,1)
[C,degC] = putin(C,degC,C2,2,1,2)
[Lnum,dLnum,Lden,dLden,Y,degY,X,degX] = ...
xdync(N,degN,D,degD,C,degC)
