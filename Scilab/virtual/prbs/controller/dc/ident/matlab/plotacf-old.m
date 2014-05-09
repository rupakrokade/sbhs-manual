% FILE: PLOTACF.M ......Plots normalized autocorrelation function
%
% USAGE:: [acf]=plotacf(x,errlim,len,print_code)
%
% WHERE:: acf       = autocorrelation values

%          x = time series data
%          errlim > 0; then calculates error limit as 2/sqrt(data_len)
%          len = length of acf that need to to be plotted
%          NOTE: if len=0 then len=data_length/2;
%          print_code = 0 ==> does not plot OR ELSE plots
%

% Pranob Banerjee,

     function [x]=plotacf(y,errlim,len,code)

     x=xcov(y); l=length(y); x=x/x(l);

     r=l:2*(l-1); lim=2/sqrt(l); rl=1:length(r) ; N=length(rl);

     x=x(r); if len>0 & len<N, rl=1:len; x=x(rl); N=len; end;


      axis([0 length(rl) min(min(x),-lim-0.1) 1.1]);
    if(code > 0 )
    if(errlim > 0 )
    rl=rl-1;
    plot(rl,x,rl,x,'o' , rl,lim*ones(N,1),'--', rl,-lim*ones(N,1),'--')
    else
    plot(rl,x )
end
end;
ylabel('ACF'),xlabel('Lag')
    
