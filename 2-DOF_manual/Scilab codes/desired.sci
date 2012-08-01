// Updated(26-7-07) 
// 9.4
function [phi,dphi] = desired(Ts,rise,epsilon)

Nr = rise/Ts; omega = %pi/2/Nr; rho = epsilon^(omega/%pi); 
phi = [1 -2*rho*cos(omega) rho^2]; dphi = length(phi)-1;
endfunction;
