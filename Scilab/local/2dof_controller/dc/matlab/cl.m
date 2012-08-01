% function [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
%    cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int)
% int>=1 means integrated noise and control law:
% delta u = - (Sc/Rc)y
% Evaluates the closed loop transfer function and 
% variances of input and output
%
function [Nu,dNu,Du,dDu,Ny,dNy,Dy,dDy,yvar,uvar] = ...
   cl(A,dA,B,dB,C,dC,k,Sc,dSc,Rc,dRc,int)
[zk,dzk] = zpowk(k);
[BSc,dBSc] = polmul(B,dB,Sc,dSc);
[zBSc,dzBSc] = polmul(zk,dzk,BSc,dBSc);
[RcA,dRcA] = polmul(Rc,dRc,A,dA);
if int>=1, [RcA,dRcA] = polmul(RcA,dRcA,[1 -1],1); end
[D,dD] = poladd(RcA,dRcA,zBSc,dzBSc);
[Ny,dNy] = polmul(C,dC,Rc,dRc);
[Nu,dNu] = polmul(C,dC,Sc,dSc);
[Nu,dNu,Du,dDu,uvar] = tfvar(Nu,dNu,D,dD);
[Ny,dNy,Dy,dDy,yvar] = tfvar(Ny,dNy,D,dD);
