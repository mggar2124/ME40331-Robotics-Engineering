clc
clearvars

syms theta(t) x1(t) m1 m2 g r t I2 t2

x2 = x1 + r*sin(theta);      x2_dot = diff(x2,t)
y2 =      r*cos(theta);      y2_dot = diff(y2,t)

% intertia_2 = 0.5*I2*diff(theta,t)^";
intertia_2 = 0;

squared_x2y2_dot = x2_dot^2 + y2_dot^2;
simp_squared_x2y2_dot = simplify(squared_x2y2_dot);

KE_1 = 0.5*m1*diff(x1)^2;
PE_1 = 0;

KE_2 = 0.5*m2*(simp_squared_x2y2_dot) + intertia_2;
PE_2 = -m2*g*y2;

KE = simplify(KE_1 + KE_2);
PE = simplify(PE_1 +PE_2);

L = KE - PE;

% for theta
L_diff_dt_theta = simplify(diff(L,diff(theta,t)));
dt_L_diff_theta = diff(L_diff_dt_theta,t);
L_diff_theta = diff(L,theta);

F_theta = dt_L_diff_theta - L_diff_theta;

% for x1
L_diff_dt_x1 = simplify(diff(L,diff(x1,t)));
dt_L_diff_x1 = simplify(diff(L_diff_dt_x1,t));
L_diff_x1 = diff(L,x1);

F_x1 = simplify(dt_L_diff_x1 - L_diff_x1)
