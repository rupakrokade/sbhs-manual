% function [Rc,Sc,Tc,gamma,phit] = pp_im(B,A,k,phi,Delta)
% Calculates 2-DOF pole placement controller.  

function [Rc,Sc,Tc,gamma] = pp_im(B,A,k,phi,Delta)

% Setting up and solving Aryabhatta identity
[Ag,Ab] = polsplit3(A); dAb = length(Ab) - 1;
[Bg,Bb] = polsplit3(B); dBb = length(Bb) - 1;
[zk,dzk] = zpowk(k);
[N,dN] = polmul(Bb,dBb,zk,dzk);
dDelta = length(Delta)-1;
[D,dD] = polmul(Ab,dAb,Delta,dDelta);
dphi = length(phi)-1;
[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi);

% Determination of control law
Rc = conv(Bg,conv(R1,Delta)); Sc = conv(Ag,S1);
Tc = Ag; gamma = sum(phi)/sum(Bb); 
