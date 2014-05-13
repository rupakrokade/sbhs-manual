function [pa,ci,nr]=pacf(z,M)
%PAUTOCF [r,ci,nr]=pacf(z,M)
%	Computes the partial autocorrelation function for the vector z and the
%	confidence intervals. z is an [N,1] vector where N=number of data 
%	points.
%
%	The partial autocorrelation function of z is computed and displayed. 
%	The 2-standard deviation confidence limits (95%) for these values 
%	are given by 2/sqrt(N).

%	E. M. Heaven
%	April, 1989

[N,nz]=size(z);

   r=covf(z,(M+1));
   r=r/r(1);
   yw=zeros(length(r)-1);
   for k=1:(M),
	yw(k,k:(M))=r(1:(M-k+1));
	yw(k,k)=yw(k,k)/2;   
   end
   yw=yw+yw';
   pa=yw\r(2:M+1)';
   pa=[1 pa']';
   sdre=2/sqrt(N)*ones((M+1),1);
   ci=[sdre -sdre];
   nr=0:M;
   z=zeros(M+1);
   plot(nr,pa,'+k',nr,pa,':k',nr,z,'k',nr,sdre,':k',nr,-sdre,':k');
   title('Partial-autocorrelation Function'),xlabel('lag');
