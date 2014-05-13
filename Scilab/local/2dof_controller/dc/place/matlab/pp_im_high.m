% function [R,S,T,gamma,Delta] = ...
% pp_im_high(B,A,k,Ts,rise,epsilon,t1,delta)
% Determines transient specifications and then calculates
% pole placement controller.  By choosing delta as 1, 
% internal model of a step is introduced.
% By choosing t1 as 1, T1 is achieved as 1
%
function [R,S,T,gamma,Delta] = ...
pp_im_stb(B,A,k,Ts,rise,epsilon,t1,delta)

N = rise/Ts; omega = pi/2/N; r = epsilon^(omega/pi); 
phi = [1 -2*r*cos(omega) r^2]; 
phi = conv(phi,phi);
dphi = length(phi)-1;
%
% Setting up and solving Aryabhatta identity
[Ag,Ab] = polsplit2(A); dAb = length(Ab) - 1;
[Bg,Bb] = polsplit2(B); dBb = length(Bb) - 1;
[zk,dzk] = zpowk(k);
[N,dN] = polmul(Bb,dBb,zk,dzk);
if delta == 1
   Delta = [1 -1]; dDelta = 1;
   [D,dD] = polmul(Ab,dAb,Delta,dDelta);
else
   D = Ab; dD = dAb;
   Delta = 1;
end
[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi);
%
% Determination of control law
R = conv(Bg,R1); S = conv(Ag,S1);
if t1 == 1
   T = Ag; gamma = sum(phi)/sum(Bb); 
else
   psi = [1-r*cos(omega) (r^2-r*cos(omega))];
   T = conv(Ag,psi); gamma = 1/sum(Bb);
end
