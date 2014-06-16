function u=PRBS(active)
if active == 0 then
u = 0;
else
global PRBSu PRBScount;
if PRBSu == [] then
PRBSu = 1;
PRBScount = 30;
end
if PRBScount == 0 then
PRBSu = -1 * PRBSu;
PRBScount = int(rand()*40)+10;
else
PRBScount = PRBScount - 1;
end
u = PRBSu;
global PRBSu PRBScount;
end
endfunction