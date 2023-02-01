function [A] = Z_rot(b)
A = [cos(b)     -sin(b)     0
     sin(b)      cos(b)     0
     0           0          1];
end