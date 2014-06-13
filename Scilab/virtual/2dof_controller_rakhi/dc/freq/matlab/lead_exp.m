pol1 = [1 -0.9]; pol2 = [1 -0.8];
G1 = tf(pol1,[1 0],-1);
G2 = tf(pol2,[1 0],-1);
w = linspace(0.001,pi,1000);
bode(G1,'-',G2,'--',w), grid
figure
G = tf(pol1,pol2,-1);
bode(G,w), grid

