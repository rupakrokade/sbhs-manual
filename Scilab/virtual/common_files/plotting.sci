function [] = plotting(var)
    
    global heatdisp fandisp tempdisp setpointdisp sampling_time m
    
    timeTitle = "No. of samples with sampling time = "+string(sampling_time)
    
    if length(var)==3
          heat = var(1);
          fan = var(2);
          temp = var(3);
          
          heatdisp=[heatdisp;heat];
          subplot(311);
          xtitle("",timeTitle,"Heat in percentage")
          plot2d(heatdisp,rect=[0,0,1000,100],style=1)
         
          fandisp=[fandisp;fan];
          subplot(312);
          xtitle("",timeTitle,"Fan in percentage")
          plot2d(fandisp,rect=[0,0,1000,100],style=2)
         
          tempdisp=[tempdisp;temp];
          subplot(313)
          xtitle("",timeTitle,"Temperature (deg celcius)")
          plot2d(tempdisp,rect=[0,20,1000,90],style=5)
          
          
      elseif length(var) == 4
          
          heat = var(1);
          fan = var(2);
          temp = var(3);
          setpoint = var(4);
          
          heatdisp=[heatdisp;heat];
          subplot(311);
          xtitle("",timeTitle,"Heat in percentage")
          plot2d(heatdisp,rect=[0,0,1000,100],style=1)
         
          fandisp=[fandisp;fan];
          subplot(312);
          xtitle("",timeTitle,"Fan in percentage")
          plot2d(fandisp,rect=[0,0,1000,100],style=2)
         
          tempdisp=[tempdisp;temp];
          setpointdisp=[setpointdisp;setpoint]
          subplot(313)
          xtitle("",timeTitle,"Temperature (deg celcius)")
          plot2d(tempdisp,rect=[0,20,1000,90],style=5)
          plot2d(setpointdisp,rect=[0,20,1000,90],style=1)
          
    end
endfunction
