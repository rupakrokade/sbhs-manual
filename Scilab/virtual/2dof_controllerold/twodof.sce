mode(0)
global fdfh fdt fncr fncw m err_count y limits sampling_time m heat temp

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//
getd('DC/scilab');
exec("twodof_para.sce")
exec ("twodof.sci");

ok = init();    

   if ok~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('twodof.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end
