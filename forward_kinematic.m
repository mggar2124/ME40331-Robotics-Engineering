% forward kinematic of a 2R robotic arm

clc
clearvars

syms theta1 theta2 theta3 theta4 theta5 theta6 
syms l1 l2 l3 l4 l5 l6
syms d1 d2 d3 d4 d5 d6

% l1 = 1;   l2 = 0.5;
% l3 = 0.5; l4 = 1;
% l5 = 0.5; l6 = 0.5;


% DH parameters
% link 1
a1 = 0;    alpha1 = 0;     d1 = 2;     theta1 = 0;
% Link 2
% a2 = 0;    alpha2 = -pi/2;     d2 = d2;     theta2 = -pi/2;

% link 3
% a3 = 0;    alpha3 = 0;         d3 = d3;     theta3 = 0;
% % Link 4
% a4 = 0;    alpha4 = pi/2;     d4 = d4;     theta4 = theta4;
% 
% % % link 5
% a5 = 0;    alpha5 = -pi/2;     d5 = 0;     theta5 = theta5;
% % % Link 6
% a6 = 0;    alpha6 = 0;     d6 = d6;     theta6 = theta6;

H0_1 = DH_1(a1, alpha1, d1, theta1)
% H1_2 = DH_1(a2, alpha2, d2, theta2);
% H2_3 = DH_1(a3, alpha3, d3, theta3);
% H3_4 = DH(a4, alpha4, d4, theta4)
% H4_5 = DH(a5, alpha5, d5, theta5)
% H5_6 = DH(a6, alpha6, d6, theta6)

% H0_6 = H0_1*H1_2*H2_3*H3_4*H4_5*H5_6;
% H0_3 = H0_1*H1_2*H2_3;
% simpH0_3 = simplify(H0_3);

% H3_6 = H3_4*H4_5*H5_6
% simplify(H3_6);
% 
% R = sym("r", [3 3])
% f = [0,0,1;
%      0,-1,1;
%      1,0,0]
% ans = f'*R

