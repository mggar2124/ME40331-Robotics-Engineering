function [A] = Rev_lin(A)
R_0_0 = [1,0,0;
         0,1,0;
         0,0,1 ]

A = [1      0           0
     0      cos(b)     -sin(b)
     0      sin(b)      cos(b)];
end
