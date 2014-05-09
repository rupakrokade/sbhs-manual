% function [Rc,Sc,Tc,gamma] = pp_basic(B,A,k,phi)
% calculates pole placement controller

function [Rc,Sc,Tc,gamma] = pp_basic(B,A,k,phi)

% Setting up and solving Aryabhatta identity
[Ag,Ab] = polsplit2(A); dAb = length(Ab) - 1;
[Bg,Bb] = polsplit2(B); dBb = length(Bb) - 1;
[zk,dzk] = zpowk(k);
[N,dN] = polmul(Bb,dBb,zk,dzk);
dphi = length(phi) - 1;
[S1,dS1,R1,dR1] = xdync(N,dN,Ab,dAb,phi,dphi);

% Determination of control law
Rc = conv(Bg,R1); Sc = conv(Ag,S1);
Tc = Ag; gamma = sum(phi)/sum(Bb); 

