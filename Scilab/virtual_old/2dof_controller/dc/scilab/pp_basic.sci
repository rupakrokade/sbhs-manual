// Updated(26-7-07)
// 9.5
// function [Rc,Sc,Tc,gamma] = pp_basic(B,A,k,phi)
// calculates pole placement controller
// ------

function [Rc,Sc,Tc,gamm] = pp_basic(B,A,k,phi)

// Setting up and solving Aryabhatta identity
pause
[Ag,Ab] = polsplit2(A); dAb = length(Ab) - 1;
pause
[Bg,Bb] = polsplit2(B); dBb = length(Bb) - 1;
pause

[zk,dzk] = zpowk(k);

[N,dN] = polmul(Bb,dBb,zk,dzk);
dphi = length(phi) - 1;

[S1,dS1,R1,dR1] = xdync(N,dN,Ab,dAb,phi,dphi);
pause

// Determination of control law
Rc = convol(Bg,R1); Sc = convol(Ag,S1);
Tc = Ag; gamm = sum(phi)/sum(Bb); 

endfunction;

