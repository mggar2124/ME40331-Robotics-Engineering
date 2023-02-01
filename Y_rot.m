function [A] = Y_rot(b)
A = [cos(b)      0      sin(b)
     0           1      0
     -sin(b)     0      cos(b)];
end