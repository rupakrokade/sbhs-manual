function ajj = pacf_mat(rvv0,rvv_rest,p,k)
if nargin == 3,
  k = 1;
end
for i = 1:p
  for j = 1:p
    index = (k+i-1)-j;
    if index == 0, 
      A(i,j) = rvv0;
    elseif index < 0,
      A(i,j) = rvv_rest(-index);
    else 
      A(i,j) = rvv_rest(index);
    end
  end
  b(i) = -rvv_rest(k+i-1);
end
a = A\b';
ajj = a(p);

