% function [Sc,dSc,Rc,dRc] = mv(A,dA,B,dB,C,dC,k,int)
% implements the minimum variance controller
% if int>=1, integrated noise is assumed; otherwise,
% it is not integrated noise
%
function [Sc,dSc,Rc,dRc] = mv(A,dA,B,dB,C,dC,k,int)
zk = zeros(1,k+1); zk(k+1) = 1;
if int>=1, [A,dA] = polmul([1 -1],1,A,dA); end
[Fk,dFk,Ek,dEk] = xdync(zk,k,A,dA,C,dC);
[Gk,dGk] = polmul(Ek,dEk,B,dB);
Sc = Fk; dSc = dFk; Rc = Gk; dRc = dGk;
