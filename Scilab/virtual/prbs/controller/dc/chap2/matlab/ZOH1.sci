
// Display mode
mode(0);

// Display warning for floating point exception
ieee(1);

F = [-1,0;1,0];G = [1;0];
C = [0,1];D = 0;Ts = 1;
// !! L.3: Unknown function ss not converted, original calling sequence used
sys = ss(F,G,C,D);
