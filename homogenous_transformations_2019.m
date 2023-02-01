syms a b g a_0_2 b_0_2 g_0_2 theta1 theta2
o_0_1 = [3;4;3];
o_1_2 = [0;1;4];
o_0_2 = [3;0;4];

% a_0_1   = pi/2;
% b_0_1   = 0;
% g_0_1   = 0;
% 
% a_0_2   = pi/2;
% b_0_2   = pi/4;
% g_0_2   = pi/6;

% R_0_1 = Z_rot(a_0_1);
R_0_2 = (X_rot(pi/2)*Z_rot(theta2))
simp_R_0_2 = simplify(R_0_2)

% R_1_2 = Y_rot(b_0_2)*X_rot(g_0_2); %first x_rotation is canceled because the rotation between 1 and two are identical

% T_0_1 =[R_0_1, o_0_1;
%     0, 0, 0, 1];

T_0_2 = [R_0_2, o_0_2;
    0, 0, 0, 1];

% T_1_2 = [R_1_2, o_1_2;
%          0, 0, 0, 1]