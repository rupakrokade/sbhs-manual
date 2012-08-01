function [Kp,Ki,Kd] = ...
gpc_pid(A,dA,B,dB,C,dC,N1,N2,Nu,lambda,gamma,gamma_y)
Adelta=conv(A,[1 -1]); G=[];
for i=N1:N2
    zi=zpowk(i);
    [E,dE,F,dF]=xdync(Adelta,dA+1,zi,i,C,dC);
    [Gtilda,dGtilda,Gbar,dGbar] = ...
      xdync(C,dC,zi,i,E*B,dE+dB);
    for j = 1:i, Gtilda1(j)=Gtilda(i+1-j); end
    if i<=Nu-1
       G=[G;[Gtilda1,zeros(1,Nu-i)]];
    else
       G=[G;Gtilda1(1:Nu)];
    end
end
es=sum(C)/sum(A); gs=sum(B)/sum(A); F_s=es*A; G_s=[];
for i=1:Nu
    row=gs*ones(1,i); row=[row,zeros(Nu-i)];
    G_s=[G_s;row];
end
lambda_mat=lambda*(diag(ones(1,Nu)));
gamma_mat=gamma*(diag(ones(1,Nu)));
gamma_y_mat=gamma_y*(diag(ones(1,N2-N1+1))); 
mat1=inv(G'*gamma_y_mat*G+lambda_mat+G_s'*gamma_mat*G_s);
% Note: inverse need not be calculated
mat2=mat1*(G'*gamma_y_mat);
mat2_s=mat1*(G_s'*gamma_mat);
h_s=sum(mat2_s(1,:)); h=mat2(1,:);
T=C; R=C*(sum(h(:))+h_s); S=0;
for i=N1:N2
    zi=zpowk(i);
    [E,dE,F,dF]=xdync(Adelta,dA+1,zi,i,C,dC);
    [Gtilda,dGtilda,Gbar,dGbar]=...
      xdync(C,dC,zi,i,E*B,dE+dB);
    S=S+F*h(i);
end
S=S+F_s*h_s;
if length(A)==3
   Kp=S(1)-R-S(3); Ki=R; Kd=S(3);
else
   Kp=S(1)-R; Ki=R; Kd=0;
end
