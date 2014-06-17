mode(0)
global fdfh fdt fncr fncw m err_count y limits sampling_time m

global scn scd tcn tcd rcn rcd gamm

getd "dc/scilab"

//**********************
sampling_time=1;   //In seconds. Fractions are allowed
//**********************//
exec ("prbstest-virtual.sci");
exec ("twodof_para.sce");
//exec ("sbhs_control.sci");



//[scn,scd,tcn,tcd,rcn,rcd,gamm] = sbhs_control()

ok = init();    

   if ok~= []  // open xcos only if communication is through (ie reply has come from server)
      xcos('prbstest-virtual.xcos');
     else
     disp("NO NETWORK CONNECTION!");
     return
end
