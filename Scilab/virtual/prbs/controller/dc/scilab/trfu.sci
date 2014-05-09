//User defined function
//Forms a transfer function
//Scilab: Co efficients are given in increasing power of variable
//Matlab: Co efficients are given in decreasing power of variable
//Hence co efficients are flipped here

//Input arguments: (1) Numerator co efficients(decreasing order)
//(2) Denominator co efficients
//(3) Variable to specify domain

// Updated(27-7-07)
// System is continuous => a is not passed
// System is discrete => a = -1
// System is discretized (sampled system) => a = Ts
// Uses syslin

function trafunc = trfu(num,den,a)
  if argn(2) == 2 
  d = 'c';
  elseif a == -1
  d = 'd';
  else 
  d = a
  end;
num = clean(num);
den = clean(den);
num1 = poly(num(length(num):-1:1),'x','coeff');
den1 = poly(den(length(den):-1:1),'x','coeff');
trafunc = syslin(d,num1,den1);
endfunction;



