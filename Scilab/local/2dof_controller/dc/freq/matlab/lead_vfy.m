w = linspace(0.001,pi,1000);
G = tf([1 -0.8],[1 -0.24],-1);
bode(G,w), grid
