#import "../preamble.typ": *

#lecture-date("29.10.2026")

Suppose $p(x) in FF[x]$ is a separable polynomial. Consider the splitting field $EE$ of $p(x)$ over $FF$, then $Gal_FF (EE)$ permutes the roots of $p(x)$.

*Question:* Given a polynomial $p(x)$, what is the Galois group of $p(x)$, i.e. the Galois group of the splitting field? For example, suppose $u in FF$. What is the Galois group of $x^n - u$?

In the following we consider the case $u = 1$, i.e. the Galois group of $x^n - 1$.

Solutions of the equation $x^n - 1 = 0$ in $FF$ are called _roots of unity_.

#remark[
  We observe the following:
  + In any field $FF$ there are at most $n$ roots of unity.
  + If $xi, eta$ are roots of unity, then so are $xi eta$ and $xi / eta$.
    Therefore, the set of roots of unity is a finite subgroup of $FF^*$. Such a subgroup is always cyclic.
  + Suppose $FF$ has $d$ $n$-th roots of unity and $xi_d$ is a generator of this group. Then $xi_d^d = 1$, but $xi_d^k != 1$ for $1 <= k < d$. Then $d$ is the _order_ of $xi_d$ in $FF^*$. But on the other hand, $xi_d^n = 1$, therefore $d divides n$.
]

#corollary[
  The number of $n$-th roots of unity in any field $FF$ divides $n$.
]

#definition[
  $xi_n$ is called a _primitive root of unity_ if $xi_n^n = 1$, but $xi_n^k != 1$ for $1 <= k < n$.
]

If $FF$ has a primitive root of unity $xi_n$, then $1, xi_n, xi_n^2, dots, xi_n^(n-1)$ are $n$ distinct roots of unity. So every $n$-th root of unity is $xi_n^j$ for some $j$.

Suppose $FF arrow.hook KK$ and $xi_n in KK$ is a primitive root of unity. Then $FF(xi_n)$ is a splitting field of $x^n - 1$ over $FF$.

We also note that if $"char" FF divides.not n$ then the polynomial $x^n - 1$ is separable. Indeed, $D(x^n - 1) = n x^(n-1)$. If $"char" FF divides.not n$ then $gcd (x^n - 1, n x^(n-1)) = gcd(x^n - 1, x^(n-1)) = 1$. It follows that $QQ(xi_n)$ is a Galois extension of $QQ$. Such extensions are also called _cyclotomic extensions_.

$xi_n^j$ is a primitive root of unity if and only if $gcd(j, n) = 1$. More generally:

#lemma[
  $xi_n^j$ has order $n/gcd(j, n)$ in $FF^*$.
]

Note that
$ x^n - 1 = product_(xi : xi^n = 1) (x - xi) = product_(j=0)^(n-1) (x - xi_n^j) $
in $QQ(xi_n)[x]$.

Define
$
  Phi_n (x) = product_(xi "primitive" n"-th" \ "root of unity") (x - xi) = product_(1 <= j <= n-1 \ gcd(j, n) = 1) (x - xi_n^j),
$
where in the lastmost expression $xi_n$ can be any fixed primitive $n$-th root.

Suppose $1 <= d divides n$. Then
$
  Phi_d (x) = product_(0 <= j <= d-1 \ gcd(j, d) = 1) (x - xi_d^j) = product_(0 <= j <= d-1 \ gcd(j, d) = 1) (x - xi_n^((n j)/d)) = product_(0 <= j <= n-1 \ gcd(j, n) = d) (x - xi_n^j)
$

#corollary[
  $
    x^n - 1 = product_(j=0)^(n-1) (x - xi_n^j) = product_(1 <= d divides n) product_(0 <= j <= n - 1 \ gcd(j, n) = d) (x - xi_n^j) = product_(1 <= d divides n) Phi_d (x).
  $
]

#example[
  - $Phi_1 (x) = x - 1$
  - $Phi_2 (x) = x + 1$
  - $Phi_3 (x) = x - (-1/2 + sqrt(3)/2 i)(-1/2 - sqrt(3)/2 i) = (x + 1/2)^2 + 3/4 =x^2 + x + 1$
  - $Phi_4 (x) = (x - i)(x + i) = x^2 + 1$
]

#proposition[
  $Phi_n (x)$ is a monic polynomial of degree $phi(n)$ with integer coefficients.
]

#proof[
  We have
  $ Phi_n (x) = product_(0 <= j <= n - 1 \ gcd(j, n) = 1) (x - xi_n^j), $
  so it is clearly monic of degree $phi(n)$.

  Suppose by induction $Phi_d (x)$ has integer coefficients for all $d < n$. Then
  $ Phi_n (x) = (x^n - 1)/(product_(d divides n \ 1 <= d < n) Phi_d (x)), $
  where the denominator is a monic polynomial with integer coefficients. Since
  $ product_(d divides n \ 1 <= d < n) Phi_d (x) divides x^n - 1 quad "in" CC[x], $
  and $product_(1<= d divides n) Phi_d (x)$ is monic in $ZZ[x]$, it follows that the quotient is in $ZZ[x] subset CC[x]$. Indeed since the denominator is monic, one can divide with remainder in $ZZ[x]$. So
  $ x^n - 1 = product_(d divides n \ 1 <= d < n) Phi_d(x) q(x) + r(x) $
  where $q(x), r(x) in ZZ[x]$ and $deg r < deg product_(d divides n, 1 <= d < n) Phi_d$. We know that $r(x) = 0$ in $CC[x]$, so $r(x) = 0$ in $ZZ[x]$. So
  $ q(x) = (x^n - 1)/(product_(d divides n \ 1 <= d < n) Phi_d (x)) $
  is in $ZZ[x]$ and is equal to $Phi_n (x)$.
]

#theorem[
  $Phi_n (x)$ is irreducible in $ZZ[x]$, and by Gauss' lemma therefore also in $QQ[x]$.
]

#proof[
  Suppose towards a contradiction that $Phi_n (x)$ is reducible, i.e. it can be written as $Phi_n (x) = f(x) g(x)$ where $f(x), g(x)$ are monic in $ZZ[x]$ and $f(x)$ is irreducible. Let $xi$ be a root of $f(x)$, then $xi in QQ(xi_n) subset CC$ and $xi$ is a primitive $n$-th root of unity. Let $p in PP$ such that $p divides.not n$. Then $xi^p$ is another primitive $n$-th root of unity. Then
  $ Phi_n (xi^p) = f(xi^p) g(xi^p) = 0. $
  We claim that $f(xi^p) = 0$. Suppose towards a contradiction that $g(xi^p) = 0$. Let $h(x) = g(x^p)$, then $h(xi) = g(xi^p) = 0$. But $f(x)$ is the minimal polynomial of $xi$, therefore $f(x) divides h(x)$, thus $f(x) divides g(x^p)$. Let us reduce modulo $p$; let $dash(f)(x), dash(g)(x)$ etc. denote their images in $FF_p [x]$. Then $dash(f)(x) divides dash(g)(x^p) = dash(g)(x)^p$ and $dash(f) = dash(f_1) dot.c dash(f_2)$, where $dash(f_1) in FF_p [x]$ is irreducible and $dash(f_1) divides dash(g)(x)$. Therefore we can write
  $ dash(Phi_n) (x) = dash(f)(x) dot.c dash(g)(x) = dash(f_1)(x)^2 dot.c dash(h)(x), $
  where $dash(f_1)(x) in FF_p[x]$ is irreducible. Therefore $dash(Phi_n)(x)$ is not separable over $FF_p$. Moreover, $dash(Phi_n) divides dash(x^n - 1)$, so $dash(x^n - 1)$ is not separable over $FF_p$. But $gcd(dash(x^n - 1), dash(n x^(n-1))) = gcd(dash(x^n - 1), dash(x^(n-1))) = 1$, so $dash(x^n - 1)$ is separable, a contradiction. Therefore $f(xi^p) = 0$.

  So for every root $xi$ of $f(x)$ and every prime $p divides.not n$, it holds that $xi^p$ is another root of $f(x)$. Therefore, for any $a$ such that $gcd(a, n) = 1$, $xi^a$ is a root of $f(x)$. To see this, write $a = p_1 dots.c p_ell$, where $p_j$ are primes not dividing $n$. By iterating the argument, $xi^a$ is a root.

  Therefore any primitive $n$-th root of unity is a root of $f(x)$. Therefore $f(x) = Phi_n (x)$ and $Phi_n (x)$ is reducible.
]

#corollary[
  + $Phi_n (x)$ is the minimal polynomial of $xi_n$.
  + There is an isomorphism of fields $QQ[x] \/ (Phi_n (x))$ and $QQ(xi_n)$ with $x |-> xi_n$.
  + $[QQ(xi_n) : QQ] = deg Phi_n (x) = phi(n)$
]

#remark[
  For every $a$ such that $gcd(a, n) = 1$, we have an automorphism
  #align(center)[
    #diagram(
      spacing: (2em, 2em),
      {
        node((0, 0), $QQ[x] \/ (Phi_n (x))$, name: <QxPhin>)
        node((0, 1), $QQ(xi_n)$, name: <Qxin1>)
        node((1, 1), $QQ(xi_n)$, name: <Qxin2>)

        edge(<QxPhin>, <Qxin1>, $tilde.equiv$, "->")
        edge(<QxPhin>, <Qxin2>, $x |-> xi_n^a$, "->")
        edge(<Qxin1>, <Qxin2>, $mu_a$, "->")
      },
    )
  ]
  This satisfies
  $ mu_a compose mu_b (xi_n) = (xi_n^b)^a = mu_(a b) (xi_n). $
  The assignment $a |-> mu_a$ defines a homomorphism
  $ (ZZ\/_n)^* -> Gal_QQ (QQ(xi_n)). $
  This is a monomorphism, and since the sizes are the same it is an isomorphism. Therefore
  $ Gal_QQ (QQ(xi_n)) tilde.equiv (ZZ\/_n)^*. $
]

#remark[
  If $n = p_1^(ell_1) dots.c p_n^(ell_n)$ where $p_1, dots, p_n$ are distinct primes, then
  $ ZZ\/_n tilde.equiv ZZ\/_(p_1^(ell_1)) times dots.c times ZZ\/_(p_n^(ell_n)) $
  as rings, by the Chinese remainder theorem. Therefore
  $ (ZZ\/_n)^* tilde.equiv (ZZ\/_(p_1^(ell_1)))^* times dots.c times (ZZ\/_(p_n^(ell_n)))^*. $
  By the primitive root theorem, if $p$ is an odd prime, then
  $ (ZZ\/_(p^ell))^* tilde.equiv ZZ\/_(p^ell - p^(ell - 1)), $
  otherwise
  $ (ZZ\/_(2^ell))^* tilde.equiv ZZ\/_(2^(ell-2)). $
]

From this, one can conclude:

#theorem[
  For every finite abelian group $A$ there exists an integer $n$ and a subgroup $B <= (ZZ\/_n)^*$ such that $(ZZ\/_n)^*\/B tilde.equiv A$.
]

#theorem[
  For every finite abelian group $A$ there exists a Galois extension $QQ arrow.hook FF$ with $Gal_QQ (FF) = A$. Namely, $FF = QQ(xi_n)^B$, where $B$ is as in the theorem above.
]
