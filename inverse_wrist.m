syms theta1 theta2 theta3 theta4 theta5 theta6 
syms L1 L2 L3 L4 L5 L6
syms a1 a2 a3 a4 a5 a6
syms alpha1 alpha2 alpha3 alpha4 alpha5 alpha6
syms d1 d2 d3 d4 d5 d6
syms r1_1 r1_2 r1_3 r2_1 r2_2 r2_3 r3_1 r3_2 r3_3
syms dx dy dz
syms x5 y5 z5

R = [r1_1, r1_2, r1_3;
     r2_1, r2_2, r2_3;
     r3_1, r3_2, r3_3 ];

O_0_C = [dx;dy;dz];
O_0_5 = [x5,y5,z5];

O_0_C = O_0_5 - L5*R*[0;0;1];
Xc_def = dx - L5*R(1,3);
Yc_def = dy - L5*R(2,3);
Zc_def = dz - L5*R(3,3);


% L1 = 1;   L2 = 0.5;
% L3 = 0.5; L4 = 1;
% L5 = 0.5; L6 = 0.5;


% DH parameters
% link 1
a1 = a1;   alpha1 = pi/2;       d1 = 0;     theta1 = theta1;
% Link 2
a2 = 0;    alpha2 = 0;          d2 = L2;     theta2 = 0;

% link 3
a3 = 0;    alpha3 = -pi/2;      d3 = L3;     theta3 = theta3;
% Link 4
a4 = 0;    alpha4 = pi/2;       d4 = 0;     theta4 = theta4;

% % link 5
a5 = 0;    alpha5 = 0;          d5 = L5;     theta5 = theta5;
% % Link 6
% a6 = 0;    alpha6 = 0;     d6 = 0;     theta6 = theta6;

H0_1 = DH(a1, alpha1, d1, theta1);
H1_2 = DH(a2, alpha2, d2, theta2);
H2_3 = DH(a3, alpha3, d3, theta3);
H3_4 = DH(a4, alpha4, d4, theta4);
H4_5 = DH(a5, alpha5, d5, theta5);
% H5_6 = DH(a6, alpha6, d6, theta6);
% 
T0_2 = H0_1*H1_2;
simpT0_2 = simplify(T0_2);
T0_3 = H0_1*H1_2*H2_3;
simpT0_3 = simplify(T0_3);
T0_4 = H0_1*H1_2*H2_3*H3_4;
simpT0_4 = simplify(T0_4);
T0_5 = H0_1*H1_2*H2_3*H3_4*H4_5;
simpT0_5 = simplify(T0_5);
% T0_6 = H0_1*H1_2*H2_3*H3_4*H4_5*H5_6;
% simpT0_6 = simplify(T0_6);

Xc = T0_3(1,4)
Xc_def
Yc = T0_3(2,4)
Yc_def
Zc = T0_3(3,4)
Zc_def

T2_5 = H2_3*H3_4*H4_5;
R2_5_def = simplify(T2_5(1:3,1:3));

R2_5 = simplify(T0_2(1:3,1:3)*R)