#import "../preamble.typ": *

#lecture-date("19.11.2026")

#theorem([Fundamental Theorem of Algebra])[
  The field $CC$ is algebraically closed.
]

#proof[
  We construct the proof in smaller steps.

  _Claim 1:_ Suppose $RR arrow.hook KK$, $[KK : RR] = 2 n + 1$. Then $KK = RR$.

  _Proof:_ By the primitive element theorem $KK = RR(alpha)$ for some $alpha in KK$. Thus $KK tilde.equiv RR[x] \/ (m_(alpha,RR)(x))$ and therefore $[KK : RR] = deg m_(alpha, RR)(x) = 2 n + 1$. But a real polynomial of odd degree always has a real root, so $m_(alpha, RR)(x)$ can only be irreducible if $deg m_(alpha,RR)(x) = 1$, thus $[KK : RR] = 1$ and $KK = RR$.

  _Claim 2:_ There does not exist a field extension $CC arrow.hook KK$ such that $[KK : CC] = 2$.

  _Proof:_ Suppose $[KK : CC] = 2$, then $KK = CC(sqrt(alpha))$ for some $alpha in CC$. But for all $alpha in CC$ also $sqrt(alpha) in CC$, so $KK = CC$, a contradiction.

  _Claim 3:_ There does not exist a Galois extension of $CC arrow.hook KK$ such that $[KK : CC] = 2^ell$ for $ell != 0$.

  _Proof:_ Suppose $CC arrow.hook KK$ is such an extension. Let $G = Gal_CC (KK)$, then $bar(G) = 2^ell$. By standard arguments for $p$-groups, $G$ has a subgroup $G_0 subset.eq G$ of index 2. But then, by Galois theory, $[KK^(G_0) : KK^G] = 2 = [KK^(G_0) : CC]$, a contradiction to Claim 2.

  We now move on to the main proof. Let $f(x) in CC[x]$ and let $overline(f)(x)$ be the complex conjugate. Our goal is to show that $f(x)$ has a root in $CC$. Note that $f(z) = 0$ if and only $overline(f)(overline(z)) = 0$. So it is enough to show that $f(x) overline(f)(x)$ has a root in $CC$. Note that $f(x) overline(f)(x) in RR[x]$, so it is enough to show that every polynomial $f in RR[x]$ has a root in $CC$.

  Let $f(x) in RR[x]$ and let $KK$ be the splitting field of $f(x)$ over $RR$. Let $KK(i)$ be the splitting field of $f(x)(x^2 + 1)$. Then $KK(i)$ is a Galois extension of $RR$, we have $RR arrow.hook CC = RR(i) arrow.hook KK(i)$. In particular, $CC arrow.hook KK(i)$ is also Galois.

  Suppose $[KK(i) : RR] = m 2^ell$ where $m$ is odd. Let $P_2 subset.eq Gal_RR (KK(i))$ be a $2$-Sylow subgroup. Then
  $
    [KK(i)^(P_2) : RR] = [KK(i)^(P_2) : KK(i)^(Gal_RR (KK(i)))] = [Gal_RR (KK(i)) : P_2] = m,
  $
  which is odd. By Claim 1, it follows that $m=1$ and $[KK(i) : RR] = 2^ell$, therefore $[KK(i) : CC] = 2^(ell - 1)$ where the extension is Galois, therefore by Claim 3 $KK(i) = CC$. So all the roots of $f(x)$ are in $CC$.
]

== Galois groups of polynomials

Let $FF$ be a fixed field and assume $p(x) in FF[x]$ is separable. Let $FF arrow.hook KK$ be a splitting field of $p(x)$.

#definition[
  The Galois group of $p(x)$ is $Gal_FF (KK)$, which we also denote by $Gal(p)$.
]

#remark[
  Let $alpha_1, dots, alpha_n in KK$ be the roots of $p(x)$. Then $KK = FF(alpha_1, dots, alpha_n)$. Furthermore, $Gal_FF (KK)$ acts by permutation on the set ${alpha_1, dots, alpha_n}$. The action of a $sigma in Gal_FF (KK)$ is determined by this permutation. In other words, there is a monomorphism $Gal_FF (KK) arrow.hook Sigma_n = Sigma(alpha_1, dots, alpha_n)$.

  Recall that if $p(x)$ is irreducible, then $Gal_FF (KK)$ acts tranvitely on ${alpha_1, dots, alpha_n}$. Indeed, let $alpha_1, alpha_2$ be two roots, then $FF(alpha_1) tilde.equiv FF[x] \/ (p(x)) tilde.equiv FF(alpha_2)$. So there is a field isomorphism $FF(alpha_1) -> FF(alpha_2)$ over $FF$. By a theorem from before it extends to an automorphism of $KK$ fixing $FF$.

  More generally, if $p(x)$ has a decomposition $p = p_1 dot p_2 dots.c p_k$ into irreducible factors of degrees $n_1, n_2, dots, n_k$ respectively, then it partitions the set of roots of $p(x)$ into subsets of sizes $n_1, dots, n_k$. In this case
  $
    Gal (p) subset.eq Sigma_(n_1) times Sigma_(n_2) times dots.c times Sigma_(n_k)
  $
  and $Gal(p)$ acts transitively on the roots of every irreducible component.
]

#remark[
  Suppose $p(x) = a_0 + a_1 x + dots + a_(n-1) x^(n-1) + x^n in FF[x]$ is a monic, separable polynomial. Let $KK$ be a splitting field of $p(x)$ over $FF$. Then in $KK[x]$
  $
    p(x) = (x - alpha_1) dots.c (x - alpha_m).
  $
  To "solve" the equation $p(x) = 0$ we need to express $alpha_1, dots, alpha_m$ in terms of $a_0, dots, a_n$. This is hard. But the converse, that is expressing the coefficients in terms of the roots, is much easier (but still interesting).

  For example, when $n=3$,
  $
    (x - alpha)(x - beta)(x - gamma) = x^3 - (alpha + beta + gamma) x^2 + (alpha beta + alpha gamma + beta gamma) x - alpha beta gamma.
  $
  More generally, define the _elementary symmetric polynomials_
  $
    S_1 (x_1, dots, x_n) & := x_1 + x_2 + dots + x_n, \
    S_2 (x_1, dots, x_n) & := x_1 x_2 + x_1 x_3 + dots + x_1 x_n + x_2 x_3 + dots + x_2 x_n + dots + x_(n-1) x_n \
    & = sum_(1 <= i_1 < i_2 <= n) x_(i_1) x_(i_2), \
    & dots.v \
    S_k (x_1, dots, x_n) &:= sum_(1 <= i_1 < i_2 < dots < i_k <= n) x_(i_1) dots.c x_(i_k) = sum_({i_1, dots, i_k} in binom(n, k)) x_(i_1) dots.c x_(i_k), \
    & dots.v \
    S_n (x_1, dots, x_n) &:= x_1 x_2 dots.c x_n.
  $
  Then
  $
    (x - alpha_1) dots.c (x - alpha_m) = x^m - s_1 (alpha_1, dots, alpha_m) x^(m-1) + dots + (-1)^k S_k (alpha_1, dots, alpha_m) x^(n-k) + dots.
  $
]

A function $f$ of $n$ variables is called symmetric if for every permutation $sigma in Sigma_n$ we have $f(x_1, dots, x_n) = f(x_(sigma(1)), dots, x_(sigma(n)))$.

#example[
  $f(x, y) = x^2 y$ is not symmetric.

  $f(x, y, z) = x^2 y + y^2 z + z^2 x$ is _cyclic_, but not symmetric.

  The polynomials $S_k (x_1, dots, x_n)$ are symmetric.
]

#theorem[
  Let $f(x_1, dots, x_n)$ be a symmetric polynomial. Then there exists a polynomial $g(t_1, dots, t_n)$ such that
  $
    f(x_1, dots, x_n) = g(S_1 (x_1, dots, x_n), dots, S_n (x_1, dots, x_n)).
  $
]

#example[
  We have
  $
    x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2 x_1 x_2 = S_1 (x_1, x_2)^2 - 2 S_2 (x_1, x_2).
  $
]

#corollary[
  Let $p(x) = a_0 + a_1 x + dots + a_(n-1) x^(n-1) + x^n$ have roots $alpha_1, dots, alpha_n$. Then any symmetric polynomial in $alpha_1, dots, alpha_n$ can be expressed as a polynomial in $a_0, dots, a_(n-1)$.
]

#example[
  Let $alpha_1, dots, alpha_n$ be the roots of a monic, separable polynomial $p(x)$. Define
  $
    Delta(p) := Delta (alpha_1, dots, alpha_n) := product_(1 <= i < j <= n) (alpha_i - alpha_j).
  $
  In general, $Delta (alpha_(sigma(1)), dots, alpha_(sigma(n))) = "sgn" sigma dot Delta(alpha_1, dots, alpha_n).$ In particular $Delta(alpha_1, dots, alpha_n)$ is fixed by the alternating group $A_n$ and not by $Sigma_n$ (assuming $"char" FF != 2$).
]

#definition[
  The _discriminant_ of a polynomial $p(x)$ is $D(p) := Delta(p)^2$.
]

$D(p)$ is a symmetric function of the roots $alpha_1, dots, alpha_n$. So if $p(x) = a_0 + a_1 x + dots + a_(n-1) x^(n-1) + x^n$, then $D(p)$ is a polynomial in $a_0, dots, a_(n-1)$ that can be calculated explicitly.

#example[
  Let $n=2$ and consider $p(x) = x^2 + b x + c = (x - alpha)(x - beta)$. Then
  $ D(p) = (alpha - beta)^2 = alpha^2 + beta^2 + 2 alpha beta = S_1 (alpha, beta)^2 - 4 S_2 (alpha, beta) = b^2 - 4c. $

  Let $n=3$ and consider $p(x) = x^3 + a x^2 + b x + c = (x - alpha)(x - beta)(x - gamma)$, then
  $
    D(p) = (alpha - beta)^2 (beta - gamma)^2 (alpha - gamma)^2 = a^2 b^2 - 4 b^3 - 4 a^3 c - 27 c^2 + 18 a b c.
  $

  Actually, (assuming $"char" FF != 3$) one can get rid of $a$ by considering the polynomial $q(x) = p(x - a/3)$. The roots of $q(x)$ are $alpha + a/3, beta + a/3, gamma + a/3$. Their sum is $alpha + beta + gamma + a = 0$.
]

#theorem[
  Let $p(x) = a_0 + a_1 x + dots + a_(n-1) x^(n-1) + x^n in FF[x]$ be a separable polynomial. Then $Gal(p) subset.eq Sigma_n$. Assuming that $"char" FF != 2$, then $Gal (p) subset.eq A_n$ if and only if $D(p)$ is a square in $FF$.
]

#proof[
  Recall that $Delta(p) = product_(1 <= i < j <= n) (alpha_i - alpha_j) in KK$, where $KK$ is the splitting field of $p(x)$ over $FF$. For every $sigma in Gal(p)$, $sigma(Delta(p)) = plus.minus Delta(p)$ and $sigma(Delta(p)) = Delta(p)$ if and only if $sigma in A_n$. Therefore $Gal(p) subset.eq A_n$ if and only if $Delta(p) in KK^(Gal(p)) = FF$ which is equivalent to $D(p) = Delta(p)^2$ being the square of an element of $FF$.
]
