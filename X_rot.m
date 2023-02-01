function [A] = X_rot(b)
A = [1      0           0
     0      cos(b)     -sin(b)
     0      sin(b)      cos(b)];
end