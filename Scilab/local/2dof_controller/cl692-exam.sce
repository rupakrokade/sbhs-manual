//Ankur

Bb=[1 1.042]

dBb= 1

D=[1 -1.904 1]

dD= 2

phi=[1 -1.7502 0.7791]

dphi = 2


[zk,dzk] = zpowk(1)

[N,dN] = polmul(Bb,dBb,zk,dzk)


[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi)

 dR1  =
 
    1.  
 R1  =
 
    1.    0.0975908  
 dS1  =
 
    1.  
 S1  =
 
    0.0562092  - 0.0936572  


////////////////////////////////////////////////
//##############################################
////////////////////////////////////////////////

//Abhishek

Bb=[1.03355 1]

dBb= 1

D=[1 -1]

dD= 1

phi=[1 -1.9 0.905]

dphi = 2


[zk,dzk] = zpowk(1)

[N,dN] = polmul(Bb,dBb,zk,dzk)


[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi)


//Answer
dR1  =
 
    1.  
 R1  =
 
    1.  - 0.9025412  
 dS1  =
 
    0.  
 S1  =
 
    0.0024588 

