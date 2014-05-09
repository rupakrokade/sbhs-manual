// Updated(18-7-07)
// 8.1

sys = tf(10,[5 1]);
sysd = ss2tf(dscr(sys,0.5));
