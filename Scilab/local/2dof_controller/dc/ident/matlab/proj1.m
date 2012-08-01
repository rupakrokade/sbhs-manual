e = 0.1*randn(10000,1);

m25 = idpoly(1,[],[1,-0.4,-0.21]); %y1
y25 = sim(m25,e);

m24 = idpoly([1 -0.6],[],1);  %y2
y24 = sim(m24,e);

m23 = idpoly([],[1 0.9 0.08],1);  %y3
y23 = sim(m23,e);

m22 = idpoly([1 0.5],[1 -0.5],1);  %y4
y22 = sim(m22,e);

m20 = idpoly(1,[],[1,-0.5,-0.14]);  %y5
y20 = sim(m20,e);

m19 = idpoly([1 0.8],[],1);  %y6
y19 = sim(m19,e);

m18 = idpoly([1 0.9 0.08],[],1);  %y7
y18 = sim(m18,e);

m17 = idpoly([1 -0.5],[1 0.5],1);  %y8
y17 = sim(m17,e);

m16 = idpoly([1 0.3],[1 -0.7],1);  %y9
y16 = sim(m16,e);

m15 = idpoly(1,[],[1,-0.3,-0.1]);  %y10
y15 = sim(m15,e);

m14 = idpoly([1 -0.4 -0.21],[],1); %y11
y14 = sim(m14,e);

%y12 idpoly([1 0.8],[1 -0.4],1)

m13 = idpoly(1,[],[1,-0.3,-0.1]);
y13 = sim(m13,e);

m12 = idpoly([1 -0.5 -0.14],[],1);  %y14
y12 = sim(m12,e);

m11 = idpoly([1 0.3],[1 -0.4],1);  %y15
y11 = sim(m11,e);

m10 = idpoly([1 -0.4 -0.21],[],1);  %y16
y10 = sim(m10,e);

m9 = idpoly([1 0.8],[1 -0.4],1);
y9 = sim(m9,e);

m8 = idpoly([1 2 1.28 0.256],[],1);  %y17
y8 = sim(m8,e);

m7 = idpoly(1,[],[1,-0.1,-0.72]);  %y18
y7 = sim(m7,e);

m6 = idpoly([1 1.6 0.64],[],1);  %y19
y6 = sim(m6,e);

m5 = idpoly([1 1 0.8],[],1);  %y20
y5 = sim(m5,e);

m4 = idpoly([1 0.3],[1 -0.4],1);
y4 = sim(m4,e);

m3 = idpoly(1,[],[1 2.1 1.44 0.32]);
y3 = sim(m3,e);

m2 = idpoly([1 -0.9],[1 0.4],1);
y2 = sim(m2,e);

m1 = idpoly(1,[],[1,0,-0.04]);
y1 = sim(m1,e);

m21 = idpoly([1 0.9],[1 0.4],1);
y21 = sim(m21,e);

%y = y8;
%plotacf(y,1,11,1); figure
%pacf(y,11);
%M = armax(y,[3 0]);
%present(M)
