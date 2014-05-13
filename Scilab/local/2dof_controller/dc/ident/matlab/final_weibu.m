clear all
clc
close all
z=fsolve(@weibu,0.1*rand(2,1))
% now pdf for weibull distribution is as follows
beta=z(2);
zeta=z(1);
T1=[16 34 53 75 93 120];
%x=1:6;
T=1:130;
for i=1:length(T)
pdf(i)=(beta/zeta)*(T(i)/zeta)^(beta-1)*exp(-1*(T(i)/zeta)^beta);
cdf(i)=1-exp(-1*(T(i)/zeta)^beta);
mean1(i)=(i-0.3)/(length(T)+0.4);
end
for i=1:length(T1)
    mean2(i)=(i-0.3)/(6+0.4);
end
subplot(211)
plot(T,pdf,'-')
ylabel(' pdf responce ')
grid
subplot(212)
plot(T,cdf,'-')
ylabel('cdf responce')
grid
figure(2)
 loglog(T,mean1,'--')
 hold on 
loglog(T1,mean2,'-*')
hold off
grid on
% it is plot( between mean rank and T (time)
% to calculate mean = (i-0.3)/(N+0.4); N=6 here
% http://www.weibull.com/LifeDataWeb/lifedataweb.htm
