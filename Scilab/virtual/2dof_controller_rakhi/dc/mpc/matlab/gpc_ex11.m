% Camacho and Bordon's GPC example; model formation
%
A=[1 -0.8]; dA=1; B=[0.4 0.6]; dB=1; N=3; k=1;
D=[1 -1]; dD=1; AD=conv(A,D); dAD=dA+1; Nu=N+1;
zj = 1; dzj = 0; G = zeros(Nu); 
H1 = zeros(Nu,k-1+dB); H2 = zeros(Nu,dA+1);
for j = 1:Nu,
    zj = conv(zj,[0,1]); dzj = dzj + 1;
    [Fj,dFj,Ej,dEj] = xdync(zj,dzj,AD,dAD,1,0);
    [Gj,dGj] = polmul(B,dB,Ej,dEj);
    G(j,1:dGj) = flip(Gj(1:dGj));
    H1(j,1:k-1+dB) = Gj(dGj+1:dGj+k-1+dB);
    H2(j,1:dA+1) = Fj;
end
G, H1, H2
