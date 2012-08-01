// Updated(18-7-07)
// 5.3

w = 0:0.01:%pi;
subplot(2,1,1);
plot2d1("gll",w,abs(1+2*cos(w))/3,style = 2);
label('',4,' ','Magnitude',4);
subplot(2,1,2);
plot2d1("gln",w,phasemag(1+2*cos(w)),style = 2,rect  =[0.01 -0.5 10 200]);
label('',4,'w','Phase',4)

