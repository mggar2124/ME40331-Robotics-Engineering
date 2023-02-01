% forward kinematic of a 2R robotic arm

clc
clearvars

syms theta1 theta2 theta3 theta4 theta5 theta6 
syms l1 l2 l3 l4 l5 l6 d1 d2 d3 d4 d5 d6

% l1 = 1;   l2 = 0.5;
% l3 = 0.5; l4 = 1;
% l5 = 0.5; l6 = 0.5;

prismatic_jw = [0;0;0]
% DH parameters
% link 1
a1 = 1;    alpha1 = 0;     d1 = 1;     theta1 = pi/4;
% Link 2
a2 = 1;    alpha2 = pi;     d2 = 0;     theta2 = -pi/6;

% link 3
a3 = 0;    alpha3 = 0;     d3 = 1;     theta3 = 0;

% % Link 4
% a4 = l4;    alpha4 = 0;     d4 = 0;     theta4 = theta4;
% 
% % link 5
% a5 = l5;    alpha5 = 0;     d5 = 0;     theta5 = theta5;
% % Link 6
% a6 = l6;    alpha6 = 0;     d6 = 0;     theta6 = theta6;

H0_1 = DH_1(a1, alpha1, d1, theta1);
H1_2 = DH_1(a2, alpha2, d2, theta2);
H2_3 = DH_1(a3, alpha3, d3, theta3);
% H3_4 = DH(a4, alpha4, d4, theta4);
% H4_5 = DH(a5, alpha5, d5, theta5);
% H5_6 = DH(a5, alpha5, d5, theta5);

% H0_6 = H0_1*H1_2*H2_3*H3_4*H4_5*H5_6
% simp_H0_6 = simplify(H0_6);

T_0_1 = H0_1
T_0_2 = H0_1*H1_2
T_0_3 = H0_1*H1_2*H2_3
% simp_H0_3 = simplify(T_0_3)
% T_0_4 = H0_1*H1_2*H2_3*H3_4;
% T_0_5 = H0_1*H1_2*H2_3*H3_4*H4_5;
% T_0_6 = H0_6;

R_0_0 = [1,0,0;
         0,1,0;
         0,0,1 ];

z_0_0 = [0;0;1];
o_0_0 = [0;0;0];

z_0_1 = [T_0_1(1,3); T_0_1(2,3); T_0_1(3,3)];
o_0_1 = [T_0_1(1,4); T_0_1(2,4); T_0_1(3,4)];

z_0_2 = [T_0_2(1,3); T_0_2(2,3); T_0_2(3,3)];
o_0_2 = [T_0_2(1,4); T_0_2(2,4); T_0_2(3,4)];

z_0_3 = [T_0_3(1,3); T_0_3(2,3); T_0_3(3,3)];
o_0_3 = [T_0_3(1,4); T_0_3(2,4); T_0_3(3,4)]; 

% z_0_4 = [T_0_4(1,3); T_0_4(2,3); T_0_4(3,3)];
% o_0_4 = [T_0_4(1,4); T_0_4(2,4); T_0_4(3,4)];
% 
% z_0_5 = [T_0_5(1,3); T_0_5(2,3); T_0_5(3,3)];
% o_0_5 = [T_0_5(1,4); T_0_5(2,4); T_0_5(3,4)];
% 
% z_0_6 = [T_0_6(1,3); T_0_6(2,3); T_0_6(3,3)];
% o_0_6 = [T_0_6(1,4); T_0_6(2,4); T_0_6(3,4)];


%%%%%%%%%%%%%%%%%%%%
% Set Revolutes and Prismatics


% Jv_q = [cross(z_0_0,(o_0_3-o_0_0)), cross(z_0_1,(o_0_3-o_0_1)), cross(z_0_2,(o_0_3-o_0_2))];
Jv_q = [cross(z_0_0,(o_0_3-o_0_0)), cross(z_0_1,(o_0_3-o_0_1)), z_0_2]

% Jw_q = [z_0_0, z_0_1, z_0_2]
Jw_q = [z_0_0, z_0_1, prismatic_jw]


J = [Jv_q; Jw_q]
% J_simp = simplify(J)

% direct_diff_inverse = inv(J_simp(1:2,1:2))
ans = J'*[1;2;3;-3;-2;-1]


