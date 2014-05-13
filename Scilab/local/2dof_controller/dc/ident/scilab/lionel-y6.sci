loadmatfile proj1.mat
getf plotacf.sci;
getf pacf.sci;
getf label.sci;


//y6
xset ('window',5)
plotacf(y6,1,21,1)
//decay slowly (=0 from lag=12) => AR process
xset ('window',6)
pacf(y6,21); //this graph is shifted from 1 on the right, i don't know why ; i take it in consideration ;
//cut off (=0 from lag=1) => AR process
//we dertermine the order with the PACF ; PACF becomes zero at j=1 => the order is 0

//y6 is a AR(0)

//We saw that y6 is a AR(0) model, equivalent to ARMA(0,0), so A(0)=D(0)=1 ;
//we can calculate the PACF of the residue to check
vl=length(y6);
v=zeros(1:vl);
[arma_est6,res6]=armax1(0,0,0,y6',v); 

xset('window',7);
pacf(res6,21); //cut off
xset('window',8);
plotacf(res6,1,21,1) ; // declay slowly 
//=> we can improve the model, the ARMA(0,0) is not good ; we try AR(1), that's to say ARMA(1,0) ;

[arma_est6a,res6a]=armax1(1,0,0,y6',v); 
xset('window',9);
pacf(res6a,21); // closed to zero everywhere
xset('window',10);
plotacf(res6a,1,21,1) ; // cut off

//the coefficients are given by :
arma_est6a
// A(z^-1)y= D(z^-1) e(t) , e(t)=Sig*w(t); w(t) 1-dim white noise
// A(1)=1.7951148
// D(1)= 0
// Sig=  0.0100222


//y6 :
//	1.7951148*y(n-1) + y(n) = 0.0100222*w(n)
//	1.7951148*y(n-1) + y(n) = e(n)
