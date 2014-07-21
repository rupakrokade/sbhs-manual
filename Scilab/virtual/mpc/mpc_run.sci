function [u_new] = mpc_run(T,u_prev,Tset)
global p q xk_old  

A = [0.9780 0 0 0 0 0 0 0;
        1   0 0 0 0 0 0 0;
        0   1 0 0 0 0 0 0;
        0   0 1 0 0 0 0 0;
        0   0 0 1 0 0 0 0;
        0   0 0 0 1 0 0 0;
        0   0 0 0 0 1 0 0;
        0   0 0 0 0 0 1 0];
B = [1; 0; 0; 0; 0; 0; 0; 0];
C = [0 0 0 0 0 0 0 0.0079];
 
Tmax = 70;              // Maximum Temperature
We = 2*eye(p,p);      // Error Weighting Matrix, We
Wu = 100*eye(q,q);       // Control Weighting Matrix, Wu
xk=A*xk_old+B*u_prev;

// Formation of Su Matrix for Quadtratic term of optimization
for i = 1:1:p
    for j = 1:1:q
        if i <= q
           if(i-j) >= 0
               Su(i,j)= C*A^(i-j)*B;
           else
               Su(i,j)= 0;
           end
        else
            if j < q
                Su(i,j)= C*A^(i-j)*B;
            else
                Su(i,j) = Su(i-1,j) + C*A^(i-j)*B;
            end
        end
    end
end

du_matrix=ones(q,q);

//  Lambda Matrix for Quadtratic term of optimization
for i = 1:1:q
    for j = 1:1:q
        if i == j
            du_matrix(i,j) = 1;
            if i >1
                du_matrix(i,j-1) = -1;
            end
        else
            du_matrix(i,j) = 0;
        end
    end
end

du_matrix_0 = eye(1,q);    // Declaration of Lambda_0 vector

// Formation of Sx Matrix for Linear term of optimization
for i = 1:1:p
    Sx(i,:) = C * A^i;
end

// Declaration of S_eta Matrix
S_eta = ones(1,p);

// Declaration of Set Point Vector
R = ones(1,p)*Tset;

// Temperature Prediction using information till previous instant
T_pred = C*xk;

// Measurement Error
eta = T - T_pred; 

// Quadratic Term for Optimization
Su_t=Su';
du_matrix_t=du_matrix';
Q=2*((Su_t*We*Su)+(du_matrix_t*Wu*du_matrix));

// Linear Term in Optimization
R_t=R';
S_eta_t=S_eta';
du_matrix_0_t=du_matrix_0';
F_term1_t=(R_t-(Sx*xk)-(S_eta_t*eta))';
F=-2*((F_term1_t*We*Su)+((du_matrix_0_t*u_prev)'*Wu*du_matrix));

// Inequality Matrices and Vectors
A_ineq = [eye(q,q);-1*eye(q,q)];

b_ineq_term1_1=-Sx*xk-S_eta';
b_ineq_term1_2=(Tmax*ones(1,p))';
b_ineq_term1=(b_ineq_term1_1*eta+b_ineq_term1_2)';
b_ineq_term2_1=-Sx*xk-S_eta'*eta;
b_ineq_term2_2=(Tmax*ones(1,p))';
b_ineq_term2=-1*(b_ineq_term2_1+b_ineq_term2_2)';
b_ineq = [100*ones(1,q) zeros(1,q)];  

me=0;
ci=zeros(q,1);
cs=40*ones(q,1);

[x,iact,iter,f]=qpsolve(Q,F,A_ineq,b_ineq');

u_new=x(1);
xk_old=xk;
endfunction
