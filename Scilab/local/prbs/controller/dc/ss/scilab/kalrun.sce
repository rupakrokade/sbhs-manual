// Updated(19-7-07)
// 14.3

getf kal_ex.sci;
x = 5; xhat = 2; P = 1; xvec = x; 
xhat_vec = xhat; Pvec = P; yvec = x;
for i = 1:200,
    xline = xhat; M = P;
    [xhat,P,y] = kal_ex(x,xline,M);
    xvec = [xvec;x]; 
    xhat_vec = [xhat_vec;xhat]; 
    Pvec = [Pvec;P]; yvec = [yvec;y];
end
n = 1:201;
plot(Pvec);
xtitle('','n');
halt();
clf();
plot(n,xhat_vec,n,yvec,n,xvec);
xtitle('','n');