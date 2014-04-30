mode(0);
// For scilab 5.1.1 or lower version users, use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y limits sampling_time

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//


fncr =  'scilabread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; // initialising error count for network error
m =1;
exec ("prbstest.sci");
exec ("prbs.sci");
//exec("label.sci")
   A = [0.1,0,100,m];
   fdfh = file('open','scilabwrite.sce','unknown');
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(2000);
   a = mgetl(fdt,1);
   mseek(0);    
   if a~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('prbstest.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end
