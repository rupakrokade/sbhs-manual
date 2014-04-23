mode(0);

global fdfh fdt fncr fncw m err_count y limits sampling_time m

function ok = init()
// For scilab 5.1.1 or lower version users, use scicos command to open scicos diagrams instead of xcos

global fdfh fdt fncr fncw m err_count y limits sampling_time m


fncr =  'scilabread.sce'; 
fdt = mopen(fncr);
mseek(0);

err_count = 0; // initialising error count for network error
m =1;

   A = [0.1,0,100,m];
   fdfh = file('open','scilabwrite.sce','unknown');
   write(fdfh,A,'(7(e11.5,1x))');
   file('close', fdfh);
   sleep(2000);
   ok = mgetl(fdt,1);
   mseek(0);
   
endfunction