// Updated (15-12-06)
// 9.17 
function [Rc,Sc] = pp_pid(B,A,k,phi,Delta)

getd('/home/inderpreet/scilab');
// Setting up and solving Aryabhatta identity
dB = length(B) - 1; dA = length(A) - 1;
[zk,dzk] = zpowk(k);
[N,dN] = polmul(B,dB,zk,dzk);
dDelta = length(Delta)-1;
[D,dD] = polmul(A,dA,Delta,dDelta);
dphi = length(phi)-1;
[Sc,dSc,R,dR] = xdync(N,dN,D,dD,phi,dphi);
Rc = convol(R,Delta);
endfunction;
