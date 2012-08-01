% Experimental procedure for determining order of system driven by noise
% S.No 7 V.Sornam Viswanathan

%plotting the acf,pacf for the data
figure,plotacf(y7,1e-03,11,1),title('ACF OF OUPUT DATA')
figure,pacf(y7,10),title('PACF OF OUPUT DATA')

%Trying to model as arma(1,0)
nav_model=armax(y7,[1 0])
error=pe(nav_model,y7)
figure,plotacf(error,1e-03,11,1),title('ACF OF RESIDUALS FOR ARMA(1,0)')
figure,pacf(error,10),title('PACF OF RESIDUALS FOR ARMA(1,0)')
%trying to model as arma(1,1)
nav_model1=armax(y7,[1 1])
error1=pe(nav_model1,y7)
figure,plotacf(error1,1e-03,11,1),title('ACF OF RESIDUALS FOR ARMA(1,1)')
figure,pacf(error1,10),title('PACF OF RESIDUALS FOR ARMA(1,1)')
%presenting final model
present(nav_model1)

%PRESENTED MODEL...
% Discrete-time IDPOLY model: A(q)y(t) = C(q)e(t)
% A(q) = 1 + 0.8084 (+-0.00717) q^-1             
%                                                
% C(q) = 1 - 0.06948 (+-0.01217) q^-1            
%                                                
% Estimated using ARMAX from data set y7         
% Loss function 0.0100173 and FPE 0.0100213      
% Sampling interval: 1                           
% Created:       16-Sep-2005 00:28:59            
% Last modified: 16-Sep-2005 00:28:59            
%                                                
