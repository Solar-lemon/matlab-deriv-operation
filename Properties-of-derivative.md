## Properties of derivative

##### 2021/07/30

Define $z(t)=x_{1}(t)x_{2}(t)$. Then
$$
\begin{align}
z^{(n)} &= x_{1}^{(n)}x_{2}^{(0)} + x_{1}^{(n - 1)}x_{2}^{(1)} + \cdots + x_{1}^{(0)}x_{2}^{(n)} \\
&= \sum_{k=0}^{n}{}_{n}C_{k}x_{1}^{(n - k)}x_{2}^{(k)} \quad (n \ge 0)
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

Suppose that $f, g:\mathbb{R} \rightarrow \mathbb{R}$. According to Faa di Bruno's formula,
$$
\frac{d^{n}}{dt^{n}}f(g(x))=\sum_{k=1}^{n}f^{(k)}(g(x))\cdot B_{n, k}(g^{(1)}(x), g^{(2)}(x), \cdots, g^{(n - k + 1)}(x))
$$
where $B_{n, k}(x_{1}, x_{2}, \cdots, x_{n- k + 1})$​​ is partial Bell polynomials. Values for partial Bell polynomials can be obtained using recursive formula.
$$
\begin{align*}
B_{0, 0} &=1 \\
B_{n, 0} &= 0 \\
B_{n, k} &= \sum_{i=1}^{n-k+1}\binom{n - 1}{i - 1}x_{i}B_{n-i, k - 1}
\end{align*}
$$
Define $\overline{f}, \overline{g}$ as
$$
\overline{f}=\begin{bmatrix}
f^{(1)}(y) \\
\vdots \\
f^{(N)}(y)
\end{bmatrix},\quad \overline{g} = \begin{bmatrix}
g^{(1)}(x) \\
\vdots \\
g^{(N)}(x)
\end{bmatrix}
$$
where $y=g(x)$​. Then
$$
\frac{d^{n}}{dt^{n}}f(g(x)) = \sum_{k=1}^{n}\overline{f}_{k}\cdot B_{n, k}(\overline{g}_{1},\cdots, \overline{g}_{n - k + 1})
$$


#### Functions

Define $f:\mathbb{R} \rightarrow \mathbb{R}$ as $f(x)=x^{r}$ where $r \in \mathbb{R}$. Then
$$
\begin{align*}
f(x) &= x^{r} \\
f^{(1)}(x) &= rx^{r - 1} \\
f^{(2)}(x) &= r(r - 1)x^{r - 2} \\
\vdots \\
f^{(n)}(x) &= r(r - 1)\cdots(r - n + 1)x^{r - n}
\end{align*}
$$
Define $f:\mathbb{R} \rightarrow \mathbb{R}$ as $f(x)=e^{x}$​. Then for all $n \ge 0$,
$$
f^{(n)}(x)=e^{x}
$$
Define $f:\mathbb{R} \rightarrow \mathbb{R}$​ as $f(x)=\log(x)$. Then
$$
\begin{align*}
f(x) &= \log(x) \\
f^{(1)}(x) &= x^{-1} \\
f^{(2)}(x) &= -x^{-2} \\
\vdots \\
f^{(n)}(x) &= (-1)(-2)\cdots (-n + 1)x^{-n}
\end{align*}
$$
