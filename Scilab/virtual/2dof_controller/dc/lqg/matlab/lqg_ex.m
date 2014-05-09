% Macgregor's example problem with common factor
% Astrom's approach, i.e. in powers of z
%
A = conv([-0.5 1],[-0.9 1])
degA = 2
B = 0.5*[-0.9 1]
degB = 1
C = conv([-0.5 1],[0 1])
degC = 2
rho = 1
lqg_ast(A,degA,B,degB,C,degC,rho)
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
% we multiply D(2,2) by q^{-2}.  A later version is given next.
%
A = conv([1 -1],[1 -0.9])
degA = 2
B = [0.1 0.08]
degB = 1
rho = 0.1
[r,P,degP] = specfac_as(A,degA,B,degB,rho)
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
%
% Solves Example 3.1 of Ahlen and Sternad in Hunt's book
% The output is in lqg_as1.out.  This works.  This is the latest.
%
A = [1 -0.9]; degA = 1; B = [0.1 0.08]; degB = 1; k = 2; rho = 0.1;
D = [0.2 0.4]; degD = 1; d = 2; C = 1; degC = 0;
V = 1; degV = 0; F = 1; degF = 0; W = [1 -1]; degW = 1;
[R,degR,S,degS,X,degX] = ...
lqg_as(A,degA,B,degB,C,degC,rho,k,V,degV,W,degW,F,degF)
%
% MacGregor's first example by the method of Ahlen and Sternad
% This works.  The output is in lqg_mac1_as.out
%
A = conv([1 -0.5],[1 -0.9])
degA = 2
B = 0.5*[1 -0.9]
degB = 1
C = [1 -0.5]
degC = 1
rho = 1, k = 1
V = 1, W = 1, F = 1, degV = 0, degW = 0, degF = 0
[R,degR,S,degS,X,degX] = ...
lqg_as(A,degA,B,degB,C,degC,rho,k,V,degV,W,degW,F,degF)
% 
% MacGregor's second example by the method of Ahlen and Sternad
% This works.  The output is in lqg_mac2_as.out
%
A = [1 -0.44]
degA = 1
B = [0.51 1.21]
degB = 1
C = A
degC = 1
F = [1 -1]
degF = 1
rho = 1, k = 1
V = 1, W = 1, degV = 0, degW = 0
[R,degR,S,degS,X,degX] = ...
lqg_as(A,degA,B,degB,C,degC,rho,k,V,degV,W,degW,F,degF)
