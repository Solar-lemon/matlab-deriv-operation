clear
clc
close all

% Given x = [1; t] and z = x/norm(x), suppose that we want to find
% the value of z_dot and z_2dot when t = 1.
evalTime = 1;
derivOrder = 2;

t = IndepVariable(evalTime, derivOrder);
x = [1; t];
z = x/norm(x);

fprintf("1. Using automatic differentiation \n")
fprintf("z: \n")
disp(z.deriv(0))
fprintf("z_dot: \n")
disp(z.deriv(1))
fprintf("z_2dot: \n")
disp(z.deriv(2))

t_0 = evalTime;
z_0 = ...
    [1/sqrt(1 + t_0^2); t_0/sqrt(1 + t_0^2)];
z_1 = ...
    [-t_0/(1 + t_0^2)^(3/2); 1/(1 + t_0^2)^(3/2)];
z_2 = ...
    [(2*t_0^2 - 1)/(1 + t_0^2)^(5/2); -3*t_0/(1 + t_0^2)^(5/2)];
fprintf("2. Using analytic differentiation \n")
fprintf("z: \n")
disp(z_0)
fprintf("z_dot: \n")
disp(z_1)
fprintf("z_2dot: \n")
disp(z_2)