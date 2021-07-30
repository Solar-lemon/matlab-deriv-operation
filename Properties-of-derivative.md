## Properties of derivative

##### 2021/07/30

Define $z(t)=x_{1}(t)x_{2}(t)$. Then
$$
\begin{align}
z^{(n)} &= x_{1}^{(n)}x_{2}^{(0)} + x_{1}^{(n - 1)}x_{2}^{(1)} + \cdots + x_{1}^{(0)}x_{2}^{(n)} \\
&= \sum_{k=0}^{n}{}_{n}C_{k}x_{1}^{(n - k)}x_{2}^{(k)}
\end{align}
$$
For example,
$$
\begin{align}
\dot{z} &= \dot{x}_{1}x_{2} + x_{1}\dot{x}_{2} \\
\ddot{z} &= \ddot{x}_{1}x_{2} + 2\dot{x}_{1}\dot{x}_{2} + x_{1}\ddot{x}_{2}
\end{align}
$$
Define $z(t)=x^{-1}(t)$, which means $xz=I$. Taking n-th derivative of both sides of the equality,
$$
\begin{align}
\sum_{k=0}^{n}{}_{n}C_{k}x^{(n-k)}z^{(k)} &= O \quad (n \ge 1) \\
\sum_{k=0}^{n - 1}{}_{n}C_{k}x^{(n - k)}z^{(k)} + xz^{(n)} &= O \\
\therefore z^{(n)} &= -x^{-1}\sum_{k=0}^{n-1}{}_{n}C_{k}x^{(n - k)}z^{(k)} \\
&=-z^{(0)}\sum_{k=0}^{n-1}{}_{n}C_{k}x^{(n - k)}z^{(k)}
\end{align}
$$
and $z^{(0)}=x^{-1}$.