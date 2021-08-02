clear
clc
close all

addpath(genpath('./'))

fprintf("Given x = [1; t] and z = x/norm(x), \n")
fprintf("suppose that we want to find the value of z_dot and z_2dot when t = 1. \n")
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

zeta = 0.5;
omega = 1;
A = [...
    0, 1;
    -omega^2, -2*zeta*omega];
B = [0; omega^2];
fprintf("Given x = [0; 0], u = 1 with system dynamics x_dot = A*x + B*u, \n")
fprintf("suppose that we want to find the value of x_dot, x_2dot, ... \n")
fprintf("where A: \n")
disp(A)
fprintf("and B: \n")
disp(B)

x = DerivVariable([0; 0]);
u = 1;

x.setDerivVar(A*x + B*u, 1, false); % the value of x^{(1)} has been applied to x.
x.setDerivVar(A*x + B*u, 1, false); % the value of x^{(2)} has been applied to x.

fprintf("1. Using automatic differentiation \n")
fprintf("x_dot: \n")
disp(x.deriv(1))
fprintf("x_2dot: \n")
disp(x.deriv(2))

x_0 = [0; 0];
x_dot = A*x_0 + B*u;
x_2dot = A*x_dot;

fprintf("2. Using analytic differentiation \n")
fprintf("x_dot: \n")
disp(x_dot)
fprintf("x_2dot: \n")
disp(x_2dot)

rmpath(genpath('./'))