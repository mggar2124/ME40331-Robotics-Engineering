clc
clearvars 

syms theta(t) s_1(t)

x = s_1 + sin(theta);

w = diff(x,theta6)