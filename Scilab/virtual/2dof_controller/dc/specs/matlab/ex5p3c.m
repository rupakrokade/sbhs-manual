yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; r = 1; vec = [];
for i = 1:100,
    e = r - yold;
    u = 0.8187*uold+9.15*(e-0.9802*eold);
    y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
    vec = [vec; [u,y]];
    uolder = uold; uold = u; yolder = yold; yold = y; eold = e;
end