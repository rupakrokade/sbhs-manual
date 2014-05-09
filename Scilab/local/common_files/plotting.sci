function [] = plotting(var,low_lim,high_lim)
    
    global heatdisp fandisp tempdisp setpointdisp sampling_time m low_lim high_lim
    
    timeTitle = "No. of samples with sampling time = "+string(sampling_time)
    if low_lim~=[] & high_lim~=[]
        heat_min = low_lim(1)
        fan_min = low_lim(2)
        temp_min = low_lim(3)
        time_min = low_lim(4) 
        
        heat_max = high_lim(1)
        fan_max = high_lim(2)
        temp_max = high_lim(3)
        time_max = high_lim(4) 
        
    else
        heat_min = 0
        fan_min = 0
        temp_min = 20
        time_min = 0
        
        heat_max = 100
        fan_max = 100
        temp_max = 100
        time_max = 1000            
    end
    
    
    
    if length(var)==3
          heat = var(1);
          fan = var(2);
          temp = var(3);
          
          heatdisp=[heatdisp;heat];
          subplot(311);
          xtitle("",timeTitle,"Heat in percentage")
          plot2d(heatdisp,rect=[time_min,heat_min,time_max,heat_max],style=1)
         
          fandisp=[fandisp;fan];
          subplot(312);
          xtitle("",timeTitle,"Fan in percentage")
          plot2d(fandisp,rect=[time_min,fan_min,time_max,fan_max],style=2)
         
          tempdisp=[tempdisp;temp];
          subplot(313)
          xtitle("",timeTitle,"Temperature (deg celcius)")
          plot2d(tempdisp,rect=[time_min,temp_min,time_max,temp_max],style=5)
          
          
      elseif length(var) == 4
          
          heat = var(1);
          fan = var(2);
          temp = var(3);
          setpoint = var(4);
          
          heatdisp=[heatdisp;heat];
          subplot(311);
          xtitle("",timeTitle,"Heat in percentage")
          plot2d(heatdisp,rect=[time_min,heat_min,time_max,heat_max],style=1)
         
          fandisp=[fandisp;fan];
          subplot(312);
          xtitle("",timeTitle,"Fan in percentage")
          plot2d(fandisp,rect=[time_min,fan_min,time_max,fan_max],style=2)
         
          tempdisp=[tempdisp;temp];
          setpointdisp=[setpointdisp;setpoint]
          subplot(313)
          xtitle("",timeTitle,"Temperature (deg celcius)")
          plot2d(tempdisp,rect=[time_min,temp_min,time_max,temp_max],style=5)
          plot2d(setpointdisp,rect=[time_min,temp_min,time_max,temp_max],style=1)
          
    end
endfunction
