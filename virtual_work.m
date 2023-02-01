clc
clearvars

syms Tm1 Tm2 theta_m1(t) theta_m2(t) alpha1 alpha2 tau1 tau2

x = 0;
y = alpha1*sin(theta_m1);

dy_dtheta = diff(y,theta_m1);

F1 = tau1*diff(theta_m1) + Fy

dW = 0;