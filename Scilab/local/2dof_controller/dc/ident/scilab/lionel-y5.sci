loadmatfile proj1;
getf pacf.sci;
getf plotacf.sci;
getf label.sci;


//y5
xset ('window',1)
pacf(y5,21);
//decay slowly (=0 from lag=9) => MA process
xset ('window',2)
plotacf(y5,1,21,1);
//decay (=0 from lag=3) but not cut off => mixed process
//we start with an ARMA(1,1) model and compute its residual


ul=length(y5);
u=zeros(1:ul);
[arma_est5,res5]=armax1(1,0,1,y5',u); 

xset('window',3);
plotacf (res5,1,21,1); //cut off
xset('window',4);
pacf(res5,21); //cut off

//=> y5 is a ARMA(1,1) 


arma_est5
// it gives the value of the parameters :
// A(z^-1)y= D(z^-1) e(t)
// A(1) =  0.705694 
// D(1) =  0.232016 
// e(t)=Sig*w(t); w(t) 1-dim white noise
// Sig=  | 0.0100514 |



//y5 :
//	0.705694*y(n-1) + y(n) = 0.232016*e(n-1) +e(n)
//	0.705694*y(n-1) + y(n) = 0.002332*w(n-1) +0.0100514* w(n)	


