// A: polynomial
// cova: co efficients matrix
// type: string

function disp_mod(B,covb)
len = length(covb);
B1 = pol2str(B);
ind = strindex(B1,['+','-']);  
ind = ind - 1;
B2 = strsplit(B1,ind);
covB = string(covb');
  
  if ascii(B2(1)) == 32
  B2 = B2(2:len+1); 
  end; 
  
  B3(1) = ' ';
  for i=1:len
    B3(i) = strsubst(B2(i),'*x','(+-' + covB(i) + ')*x');
  end;

  B4 = B3(1);
  
  for i=2:len
  B4 = B4 + ' ' + B3(i);
  end;

disp(B4);

endfunction;
