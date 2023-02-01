syms theta1 theta2 Fx Fy Fz

theta1 = pi/4;
theta2 = -pi/6;

Jv_q = [-sin(theta1)-cos(theta1)*sin(theta2) - cos(theta2)*sin(theta1), -cos(theta1)*sin(theta2) - cos(theta2)*sin(theta1), 0 ; 
    cos(theta1) + cos(theta1)*cos(theta2) - sin(theta1)*sin(theta2), cos(theta1)*cos(theta2) - sin(theta1)*sin(theta2), 0;
    0,0,1;
    ]

Jw_q = [0,0,0;
        0,0,0;
        1,1,0];

J = [Jv_q; Jw_q]
J_transposed = transpose(J)
F = [1;2;3;3;2;1]

F_cart = [Fx,Fy,Fz] 

ans = F_cart*J_transposed

% ans = F_cart*[-0.9659,-0.2588,0;
%                 1.6730,0.9659,0;
%                 0,0,1.0000]

% [-0.9659,-0.2588,0;
%                 1.6730,0.9659,0;
%                 0,0,1.0000;
%                 0,0,0;
%                 0,0,0;
%                 1.0000,1.0000,0]