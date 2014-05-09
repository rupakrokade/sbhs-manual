H = tf(1,[1 -1 0],-1);
evans(H)

H = tf(1,[1 -1 1 0],-1);
evans(H) // Default
xset('window',1)
evans(H,5)  // kmax = 5
k=-1/real(horner(H,[1,%i]*locate(1)))

