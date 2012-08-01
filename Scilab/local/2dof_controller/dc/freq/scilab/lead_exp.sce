// Updated(24-7-07)
// 7.3

pol1 = [1 -0.9]; pol2 = [1 -0.8];
G1 = trfu(pol1,[1 0],-1);
G2 = trfu(pol2,[1 0],-1);
w = linspace(0.001,%pi,1000);
xset('window',1);
bode([G1;G2],w);
G = tf(pol1,pol2,-1);
xset('window',2);
bode(G,w);



