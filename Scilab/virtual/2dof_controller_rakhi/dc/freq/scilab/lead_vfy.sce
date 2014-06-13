// Updated(24-7-07)
// 7.5

w = linspace(0.001,%pi,1000);
G = trfu([1 -0.8],[1 -0.24],-1);
bode(G,w)

