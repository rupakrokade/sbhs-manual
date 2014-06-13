% function [Sc,dSc,Rc,dRc] = mv_nm(A,dA,B,dB,C,dC,k,int)
% implements the minimum variance controller
% if int>=1, integrated noise is assumed; otherwise,
% it is not integrated noise
%
function [Sc,dSc,Rc,dRc] = mv_nm(A,dA,B,dB,C,dC,k,int)
if int>=1, [A,dA] = polmul([1 -1],1,A,dA); end
[zk,dzk] = zpowk(k);
[Bzk,dBzk] = polmul(B,dB,zk,dzk);
[Bg,Bb] = polsplit3(B); Bbr = flip(Bb);
RHS = conv(C,conv(Bg,Bbr)); dRHS = length(RHS)-1;
[Sc,dSc,Rc,dRc] = xdync(Bzk,dBzk,A,dA,RHS,dRHS);
