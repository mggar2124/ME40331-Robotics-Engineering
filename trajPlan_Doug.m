% clc
% clearvars

syms thetaf
syms tf1 t t_input_1 
syms theta_0_def_1 theta_f_def_1 vel_0_def_1 vel_tf_def_1
syms a0 a1 a2 a3 a4 a5

% choose how the order of polynomial required to solve for unknowns
% (order = unknowns - 1)
order = 3;

% define a symbolic polynomial in terms of 't' based on desired order
switch order

    case 3
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3;
        A = [a0 a1 a2 a3];

    case 4
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4;
        A = [a0 a1 a2 a3 a4];

    case 5
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4 + a5*t^5;
        A = [a0 a1 a2 a3 a4 a5];
end

% start time (boundary)
t0_1 = 0;
% stop time (boundary)
tf1 = 4;
% intermediate time (input)
t_input_1 = 0;

% symbolic expression for joint velocity
joint_v_1 = diff(theta_t_1,t); 
% symbolic expression for joint acceleration
joint_a_1= diff(joint_v_1,t);   

% input start, mid, and end times into symbolic equations
theta_0_1 = subs(theta_t_1,t,t0_1); 
vel_0_1 = subs(joint_v_1, t, t0_1); 
%
theta_mid_1 = subs(theta_t_1,t,t_input_1);
vel_mid_1 = subs(joint_v_1, t, t_input_1);
%
theta_tf_1 = subs(theta_t_1, t,tf1);
vel_tf_1 = subs(joint_v_1, t, tf1); 
%
accel_0_1 = subs(joint_a_1, t, t0_1);
accel_tf_1 = subs(joint_a_1, t, tf1);

% define boundary conditions
switch order
    case 3
        theta_0_def_1 = 0.6;
        theta_f_def_1 = 0.3;
        vel_0_def_1 = 0;
        vel_tf_def_1 = 0;

        start_cond_1 = [theta_0_def_1; theta_f_def_1; vel_0_def_1; vel_tf_def_1];
    case 4
        theta_0_def_1 = 15;
        theta_mid_def_1 = 35; 
        theta_f_def_1 = 75;
        vel_0_def_1 = 0;
        vel_tf_def_1 = 0;

        start_cond_1 = [theta_0_def_1; theta_mid_def_1; theta_f_def_1; vel_0_def_1; vel_tf_def_1];
    case 5
        theta_0_def_1 = 0;
        theta_f_def_1 = 75;
        vel_0_def_1 = 0;
        vel_tf_def_1 = 0;
        accel_0_def_1 = 10;
        accel_tf_def_1 = 10;

        start_cond_1 = [theta_0_def_1; theta_f_def_1; vel_0_def_1; vel_tf_def_1; accel_0_def_1; accel_tf_def_1];
end


% create time equation matrix
ia = length(A);

switch order

    case 3
        rowsym_1_1 = sym("x", [1 4]);
        rowsym_1_1 = coeffExtract_Doug(theta_0_1,A,rowsym_1_1,order);
        rowsym_1_2 = sym("x", [1 4]);
        rowsym_1_2 = coeffExtract_Doug(theta_tf_1,A,rowsym_1_2,order);
        rowsym_1_3 = sym("x", [1 4]);
        rowsym_1_3 = coeffExtract_Doug(vel_0_1,A,rowsym_1_3,order);
        rowsym_1_4 = sym("x", [1 4]);
        rowsym_1_4 = coeffExtract_Doug(vel_tf_1,A,rowsym_1_4,order);
        rowsym_final_1 = [rowsym_1_1;rowsym_1_2; rowsym_1_3;rowsym_1_4];
        rowsym_final_inv_1 = inv(rowsym_final_1);
    case 4
        rowsym_1_1 = sym("x", [1 5]);
        rowsym_1_1 = coeffExtract_Doug(theta_0_1,A,rowsym_1_1,order);
        rowsym_1_2 = sym("x", [1 5]);
        rowsym_1_2 = coeffExtract_Doug(theta_mid_1,A,rowsym_1_2,order);
        rowsym_1_3 = sym("x", [1 5]);
        rowsym_1_3 = coeffExtract_Doug(theta_tf_1,A,rowsym_1_3,order);
        rowsym_1_4 = sym("x", [1 5]);
        rowsym_1_4 = coeffExtract_Doug(vel_0_1,A,rowsym_1_4,order);
        rowsym_1_5 = sym("x", [1 5]);
        rowsym_1_5 = coeffExtract_Doug(vel_tf_1,A,rowsym_1_5,order);
        rowsym_final_1 = [rowsym_1_1;rowsym_1_2; rowsym_1_3;rowsym_1_4; rowsym_1_5];
        rowsym_final_inv_1 = inv(rowsym_final_1);
    case 5
        rowsym_1_1 = sym("x", [1 6]);
        rowsym_1_1 = coeffExtract_Doug(theta_0_1,A,rowsym_1_1,order);
        rowsym_1_2 = sym("x", [1 6]);
        rowsym_1_2 = coeffExtract_Doug(theta_tf_1,A,rowsym_1_2,order);
        rowsym_1_3 = sym("x", [1 6]);
        rowsym_1_3 = coeffExtract_Doug(vel_0_1,A,rowsym_1_3,order);
        rowsym_1_4 = sym("x", [1 6]);
        rowsym_1_4 = coeffExtract_Doug(vel_tf_1,A,rowsym_1_4,order);
        rowsym_1_5 = sym("x", [1 6]);
        rowsym_1_5 = coeffExtract_Doug(accel_0_1,A,rowsym_1_5,order);
        rowsym_1_6 = sym("x", [1 6]);
        rowsym_1_6 = coeffExtract_Doug(accel_tf_1,A,rowsym_1_6,order);
        rowsym_final_1 = [rowsym_1_1;rowsym_1_2; rowsym_1_3;rowsym_1_4; rowsym_1_5; rowsym_1_6];
        rowsym_final_inv_1 = inv(rowsym_final_1);
end

% solve for coefficients using matrix inversion
% inv[time equations]*[boundary conditions] = ['a' coefficients]
results_1 = rowsym_final_inv_1*start_cond_1;

% recreate symbolic equations with known coefficient values
switch order
    case 3
        a0 = results_1(1);
        a1 = results_1(2);
        a2 = results_1(3);
        a3 = results_1(4);
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3;
        coefficients = [a0 a1 a2 a3];
    case 4
        a0 = results_1(1);
        a1 = results_1(2);
        a2 = results_1(3);
        a3 = results_1(4);
        a4 = results_1(5);
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4;
        coefficients = [a0 a1 a2 a3 a4];
    case 5
        a0 = results_1(1);
        a1 = results_1(2);
        a2 = results_1(3);
        a3 = results_1(4);
        a4 = results_1(5);
        a5 = results_1(6);
        theta_t_1(t) = a0 + a1*t + a2*t^2 + a3*t^3 + a4*t^4 + a5*t^5;
        coefficients = [a0 a1 a2 a3 a4 a5];
end

% recreate symbolic equations with known coefficient values
joint_v_1 = diff(theta_t_1,t);
joint_a_1= diff(joint_v_1,t);

% find joint angle for input value of t
theta_t_input_1 = subs(theta_t_1, t, t_input_1);
% find joint velocity for input value of t
joint_v_input_1 = subs(joint_v_1, t, t_input_1);
% find joint acceleration for input value of t
joint_a_input_1 = subs(joint_a_1, t, t_input_1);

% identify max velocity by solving when acceleration is zero
t_v_max = solve(0 == joint_a_1);
v_max = subs(joint_v_1, t, t_v_max);

disp('Angle (t_symbolic)');
disp(theta_t_1(t));
disp('Angular Velocity (t_symbolic)');
disp(joint_v_1);
disp('Angular Acceleration (t_symbolic)');
disp(joint_a_1);

% Display outputs for given input value of t
disp('Angle (t_input)');
disp(theta_t_input_1);
disp('Angular Velocity (t_input)');
disp(joint_v_input_1);
disp('Angular Acceleration (t_input)');
disp(joint_a_input_1);
disp('Max Angular Velocity (t_zeroAccel)');
disp(v_max);

% Generate Exam Answer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('EXAM ANSWER')
% 1. show equations for when inital and end times subbed in
% theta(t0)
disp('initial theta')
disp(theta_0_1);

% theta(tf)
disp('final theta')
disp(theta_tf_1);

% velocity(t0)
disp('initial velocity')
disp(vel_0_1);

% velocity(tf)
disp('final velocity')
disp(vel_tf_1);

% acceleration (t0)
disp('initial acceleration')
disp(accel_0_1);

% acceleration (tf)
disp('final acceleration')
disp(accel_tf_1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. show matrix of coefficients
disp(rowsym_final_1);

% 3. show inverted matrix to be multiplied with known values to find a
% coefficients
disp(rowsym_final_inv_1);

% 4. show 'a' coefficients
disp(coefficients);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






