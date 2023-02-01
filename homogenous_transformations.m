syms a b g a_0_2 b_0_2 g_0_2
o_0_1 = [5;0;3];
o_1_2 = [0;1;4];
o_0_2 = [3;0;4];

a_0_1   = pi;
b_0_1   = 0;
g_0_1   = 0;

a_0_2   = pi/2;
b_0_2   = pi/4;
g_0_2   = pi/6;

P_E = [2;0;5.3;1]

R_0_1 = X_rot(a_0_1);
% R_0_2 = (X_rot(a_0_2)*Y_rot(b_0_2)*X_rot(g_0_2));

% R_1_2 = Y_rot(b_0_2)*X_rot(g_0_2) %first x_rotation is canceled because the rotation between 1 and two are identical

% T_0_C =[R_0_1, o_0_1;
%     0, 0, 0, 1];
T_0_E = [1,0,0,2;
         0,1,0,0;
         0,0,1,5.3;
         0,0,0,1];

T_C_0 = inv(T_0_E);
T_E_0 = inv(T_0_E);


T_C_E = T_E_0*T_0_C;

T_E_C = inv(T_C_E);

P_C = T_C_E*P_E

P_E_C = P_C - P_E

P_E_T = P_E_C + [1;0;2;1]

ans = T_E_C*[1;0;2;1]
% T_0_2 = [R_0_2, o_0_2;
%     0, 0, 0, 1];
% 
% T_1_2 = [R_1_2, o_1_2;
%          0, 0, 0, 1]