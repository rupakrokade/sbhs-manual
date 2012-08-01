A = [1 0.1; 0 1]; b = [0.005; 0.1];
p = roots([1 -1.4 0.49]);
K = place(A,b,p)
c = [1 0];
pe = [0.5+0.5*j 0.5-0.5*j];
Lp = place(A',c',pe);
Lp = Lp'

