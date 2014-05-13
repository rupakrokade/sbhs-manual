% function [R,S,T,gamma] = pp_psi(B,A,k,Ts,rise,epsilon)
% Determines transient specifications and then calculates
% pole placement controller.  T1=psi in this code
%
function [R,S,T,gamma] = pp_psi(B,A,k,Ts,rise,epsilon)

N = rise/Ts; omega = pi/2/N; r = epsilon^(omega/pi); 
phi = [1 -2*r*cos(omega) r^2]; dphi = length(phi)-1;
%
% Setting up and solving Aryabhatta identity
[Ag,Ab] = polsplit2(A); dAb = length(Ab) - 1;
[Bg,Bb] = polsplit2(B); dBb = length(Bb) - 1;
[zk,dzk] = zpowk(k);
Bf = flip(Bb);
[N,dN] = polmul(Bb,dBb,zk,dzk);
[phi,dphi] = polmul(phi,dphi,Bf,dBb);
[S1,dS1,R1,dR1] = xdync(N,dN,Ab,dAb,phi,dphi);
%
% Determination of control law
R = conv(Bg,R1); S = conv(Ag,S1);
psi = [1-r*cos(omega) (r^2-r*cos(omega))];
T = conv(Ag,psi); gamma = 1;
