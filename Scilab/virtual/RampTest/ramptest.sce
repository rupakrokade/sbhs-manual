mode(0);
// For scilab 5.1.1 or lower version users, use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y dt1 dt2


//**********************
sampling_time=0.4;   //In seconds. Fractions are allowed
//**********************//
graph =0;

dt1 = 0;
dt2 = 1;

fncr =  'scilabread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; // initialising error count for network error
m =1;
exec ("ramptest.sci");
   A = [0.1,m,0,100];
   fdfh = file('open','scilabwrite.sce','unknown');
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(2000);
   a = mgetl(fdt,1);
   mseek(0);    
   if a~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('ramptest.xcos');
   else
     disp("NO NETWORK CONNECTION!");
     return
end
