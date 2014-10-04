function y = second_order(u, params)
    // Do not change anything here
    a1 = params(1);
    a2 = params(2);
    b1 = params(3);
    b2 = params(4);
    global delay;
    // End
    
    /// You should write your code below this line
    N=length(u);
    
    //Defining y vector
    //from t=0 up to t=delay-1, y=0, so in scilab y at indices i=1 up to i=delay is 0
    y(1:1:delay) = 0; 
    //First nonzero output is only due to input u at t=0, i.e. in scilab input u at i=1
    y(delay+1) = b1*u(1);
    //After that y(i) can be defined as follows  
    for i=delay+2:1:N
        y(i)=-a1*y(i-1)-a2*y(i-2)+b1*u(i-delay)+b2*u(i-1-delay);
    end
    
    // y = ?
    
endfunction
