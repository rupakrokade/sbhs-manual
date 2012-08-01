




     yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; eolder = 0;
     r = 1; vec = [];
     for i = 1:100,
         e = r - yold;
         u = -0.1021*uold + 0.8849*uolder ...
           + 54.86* (e - 1.7232*eold + 0.7238*eolder);
         y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
         vec = [vec; [u,y]];
         uolder = uold; uold = u; yolder = yold; yold = y; eolder = eold; 
         eold = e;
     end
     
     
     yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; eolder = 0;
     r = 1; vec = [];
     for i = 1:100,
         e = r - yold;
         u = -0.0604*uold + 0.9263*uolder ...
           + 33.81* (e - 1.669*eold + 0.6753*eolder);
         y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
         vec = [vec; [u,y]];
         uolder = uold; uold = u; yolder = yold; yold = y; eolder = eold; 
         eold = e;
     end
     
     
     yold = 0; yolder = 0; uold = 0; uolder = 0; eold = 0; r = 1; vec = [];
     for i = 1:100,
         e = r - yold;
         u = 0.8187*uold+9.15*(e-0.9802*eold);
         y = 1.9802*yold - 0.9802*yolder + 0.00199*uold + 0.001977*uolder;
         vec = [vec; [u,y]];
         uolder = uold; uold = u; yolder = yold; yold = y; eold = e;
     end
