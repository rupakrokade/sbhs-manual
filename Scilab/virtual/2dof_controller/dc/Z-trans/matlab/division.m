num = [11 -15 6];
den = conv([1 -2], conv([1 -1],[1 -1]));
u = [1 zeros(1,4)];
y = filter(num,den,u)
G = tf(num,den,-1)
impulse(G)

