mode(0)
global temp heat fan sampling_time m heatdisp fandisp tempdisp x name

//**Sampling Time**//
sampling_time = 1;
///////****/////////

m = 1;

dt = getdate();
year = dt(1);
month = dt(2);
day = dt(6);
hour = dt(7);
minutes = dt(8);
seconds = dt(9);

file1 = strcat(string([year month day hour minutes seconds]),'-');
string txt;
filename = strcat([file1, "txt"],'.');

function temp = step_test(heat,fan)
    temp = comm(heat,fan);
    
    plotting([heat fan temp],)
    
    m=m+1;
endfunction

