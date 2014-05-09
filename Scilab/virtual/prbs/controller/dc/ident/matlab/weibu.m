function F= weibu(T1);
% mle solution
beta=T1(2);
zeta=T1(1);
T=[16 34 53 75 93 120];
F2=1/100*[10.91 26.44 42.14 57.86 73.56 89.1];
F(1)=[-6+sum((T/zeta).^beta)];
for i=1:length(T)
    man1(i)=(T(i)/zeta)^beta*log(T(i)/zeta);
    man2(i)=log(T(i)/zeta);
end
F(2)=[6/beta+sum(man2)-sum(man1)];
% least square soluton of the problem
y=log(-log(1-F2));
x=log(T);
b_=(sum(x.*y)-sum(x)*sum(y)/6)/(sum(x.^2)-(1/6)*(sum(x))^2);
a_=sum(y)/6-b_*sum(x)/6;
zeta_new=exp(-a_/b_);
