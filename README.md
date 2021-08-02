# matlab-deriv-operation

`matlab-deriv-operation` is a MATLAB module for performing auto differentiation base on OOP(object-oriented programming). Currently, `matlab-deriv-operation` is on develop and supports only the basic features.



#### A simple demonstration

The most important component in this module is `DerivVariable` class. An object of `DerivVariable` can store not only the value of a variable but also values of its first, second, ... order derivative with respect to the specified independent variable. The syntax for defining an object of `DerivVariable` class is

```matlab
derivVar = DerivVariable(value, value_of_first_order_deriv, value_of_second_order_deriv, ..., value_of_the_highest_order_deriv);
```

The number of input arguments to the constructor of `DerivVariable` depends on the highest order of the derivative for which we want to track. For example, assume that the value and time derivatives of variable $x$​​​​ at some instant are given as
$$
x=\begin{bmatrix}
1 \\ 0
\end{bmatrix},\, \dot{x}=\begin{bmatrix}
-1 \\ 1
\end{bmatrix}0.5,\, \ddot{x}=\begin{bmatrix}
1 \\ -1
\end{bmatrix}
$$
and we want to track derivatives of any other variable expressed with $x$ up to second order. In this case, an object of `DerivVariable` can be defined as

```matlab
x = DerivVariable([1; 0], [-1; 1], [1; -1]);
```

Denoting the value of `x` (0th order derivative) as `x_0` and its first and second order time derivatives as `x_1`, `x_2` respectively, each value can be get using `deriv` method as the following:

```matlab
x_0 = x.deriv(0); % x_0 = [1; 0]
x_1 = x.deriv(1); % x_1 = [-1; 1]
x_2 = x.deriv(2); % x_2 = [1; -1]
```

Now let's define a new variable $z$ as
$$
z = {\Vert x \Vert}
$$
With counting on various results and properties from the calculus, first and second order derivatives for $z$​​ can be expressed as
$$
\begin{align*}
\dot{z} &= \frac{x^{T}}{\Vert x\Vert}\dot{x} = \frac{1}{\Vert x \Vert}{x^{T}\dot{x}} \\
\ddot{z} &= \left(-\frac{1}{\Vert x\Vert^{2}}\frac{x^{T}}{\Vert x \Vert}\dot{x} \right)x^{T}\dot{x} + \frac{1}{\Vert x \Vert}\left( \dot{x}^{T}\dot{x} + x^{T}\ddot{x} \right)
\end{align*}
$$
, where the expression for $\ddot{z}$​​ is already cumbersome to find analytically with hands. Denoting the first and second derivatives of $z$​​​ as `z_1` and `z_2` respectively, each value can be simply get as the following:

```matlab
z = norm(x); % same as z = x.norm()
z_1 = z.deriv(1); % z_1 = -1
z_2 = z.deriv(2); % z_2 = 2
```



The independent variable with which the differentiation is performed can be explicitly defined using `IndepVariable` class. The syntax for defining an object of `IndepVariable` class is

```matlab
indepVar = IndepVariable(value, the_highest_order_to_track)
```

`value` represents the current value of the independent variable and `the_highest_order_to_track` represents the highest order of the derivative to be tracked. Using the defined independent variable, any other variable can be defined and derivatives of the new variable can be easily get just by calling `deriv` method of the variable. For example, assume that a rotation matrix $R$​ is defined with respect to time as
$$
R = \begin{bmatrix}
1 & 0 & 0 \\
0 & \cos(0.1\pi t) & \sin(0.1\pi t) \\
0 & -\sin(0.1\pi t) & \cos(0.1\pi t)
\end{bmatrix}
$$
and we want to find the first and second derivatives of $R$ at the instant $t=1$​. This task can be done with the following simple codes:

```matlab
t = IndepVariable(1, 2);
R = [1, 0, 0;
    0, cos(0.1*pi*t), sin(0.1*pi*t);
    0, -sin(0.1*pi*t), cos(0.1*pi*t)];
R_1 = R.deriv(1); % R_1 = [0, 0, 0; 0, -0.0971, 0.2988; 0, -0.2988, -0.0971]
R_2 = R.deriv(2); % R_2 = [0, 0, 0; 0, -0.0939, -0.0305; 0, 0.0305, -0.0939]
```

where `R_1` and `R_2` denotes the first and second derivatives, respectively.





