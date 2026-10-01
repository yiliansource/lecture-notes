#import "../preamble.typ": *

#lecture-date("01.10.2026")

== Separability

Let $FF$ be a field and $p(x) in FF[x] without FF$. Let $FF arrow.hook KK$ be an extension where $p(x)$ splits completely. Thus
$ p(x) = a (x - alpha_1) dots.c (x - alpha_n), quad a in FF^*, quad alpha_1, dots, alpha_n in KK, $
where the roots are not necessarily distinct.

#definition[
  A polynomial $p(x) in FF[x]$ is called _separable_ if in some (and therefore any) extension of $FF$ where $p(x)$ splits completely, the roots of $p(x)$ are pairwise distinct.
]

#example[
  + The polynomial $x^2 - 2x + 1 in QQ[x]$ is not separable.
  + The polynomial $x^2 - 2 in QQ[x]$ factors as $(x - sqrt(2))(x + sqrt(2))$, and is therefore separable.
]

Does there exist an irreducible polynomial over $p(x) in QQ[x]$ that is not separable? We will see later that this is not the case.

#definition[
  Let $p(x) = a_0 + a_1 x + dots + a_n x^n in FF[x]$. We define the _formal derivative_ of $p(x)$ by
  $ p'(x) := D(p(x)) := a_1 + 2 a_2 x + dots + k a_k a^(k-1) + dots + n a_n x^(n-1). $
]

#lemma[
  It holds that:
  - $D(p(x) + q(x)) = D(p(x)) + D(q(x))$
  - $D(p(x) q(x)) = D(p(x)) q(x) + D(q(x)) p(x)$
  - $D(p(q(x))) = p'(q(x)) q'(x)$
  - $deg p'(x) <= deg p(x) - 1$
]

#lemma[
  Let $p(x) in FF[x]$ and $FF arrow.hook KK$. An element $alpha in KK$ is a multiple root of $p(x)$ in $KK[x]$ if and only if $(x-alpha) divides p(x)$ and $(x - alpha) divides D(p(x))$ in $KK[x]$.
]

#proof[
  Suppose $alpha$ is a multiple root. Then $p(x) = (x-alpha)^2 q(x)$ for some polynomial $q(x) in KK[x]$. But then
  $ D(p(x)) = 2(x-alpha) q(x) + (x-alpha)^2 D(q(x)) = (x-alpha)(2q(x) + (x-alpha) D(q(x))), $
  hence $(x-alpha) divides D(p(x))$.

  Conversely, suppose $(x-alpha)$ divides both $p(x)$ and $D(p(x))$. Then we can write $p(x) = (x-alpha) q(x)$, hence
  $ D(p(x)) = q(x) + (x-alpha) D(q(x)). $
  Since $(x-alpha) divides D(p(x))$ it also divides $q(x)$, therefore
  $ p(x) = (x-alpha)^2 r(x) $
  and $alpha$ is a multiple root.
]

#lemma[
  Suppose $FF arrow.hook KK$ and $p(x), q(x) in FF[x]$. Then
  $ gcd_(FF[x]) (p(x), q(x)) = gcd_(KK[x]) (p(x), q(x)). $
]

#proof[
  Recall that a polynomial $d(x) in FF[x]$ is a $gcd$ of $p(x)$ and $q(x)$ if and only if (a) $d(x) divides p(x)$ and $d(x) divides q(x)$ in $FF[x]$ and (b) there exist $s(x), t(x) in FF[x]$ such that $d(x) = s(x) p(x) + t(x) q(x)$. So let $d(x) = gcd_(FF[x]) (p(x), q(x))$, then it is immediate that $d(x)$ satisfies (a) and (b) over $KK$ aswell.
]

#proposition[
  A polynomial $p(x) in FF[x]$ is separable if and only if it is relatively prime (in $FF[x]$) to its derivative.
]

#proof[
  Let $FF arrow.hook KK$ be an extension where $p(x)$ splits completely, so
  $ p(x) = a (x - alpha_1) dots.c (x - alpha_n), quad a in FF^*, quad alpha_1, dots, alpha_n in KK. $
  By the previous lemma, it is enough to show that $alpha_1, dots, alpha_n$ are pairwise distinct if and only if $gcd_(KK[x])(p(x), D(p(x))) = 1$. If they are not distinct, then $p(x)$ has a multiple root $alpha$, and we have shown previously that $(x-alpha) divides gcd_(KK[x])(p(x), D(p(x)))$. If they are distinct, then an easy calculation shows that $alpha_1, dots, alpha_n$ are not roots of $D(p(x))$. So $p(x)$ and $D(p(x))$ have no common roots. But since $p(x)$ splits completely in $KK[x]$, it follows that $gcd_(KK[x])(p(x), D(p(x))) = 1$.
]

#corollary[
  Suppose $p(x) in FF[x]$ is irreducible. Then $p(x)$ is separable if and only if $D(p(x)) != 0$.
]

#proof[
  If $p(x)$ is irreducible, then $gcd (p(x), D(p(x)))$ is either $1$ or $p(x)$. But $deg D(p(x)) < deg p(x)$, therefore $p(x)$ cannot be a divisor of $D(p(x))$, unless $D(p(x)) = 0$, in which case $gcd(p(x), D(p(x))) = p(x)$.
]

#corollary[
  If $"char" FF = 0$, then any irreducible polynomial over $FF$ is separable.
]

#definition[
  A field $FF$ is called _perfect_ if every irreducible polynomial over $FF$ is also separable.
]

#definition[
  An algebraic extension $FF arrow.hook KK$ is called _separable_ if for every $alpha in KK$, the minimal polynomial $m_(alpha,KK)(x)$ is separable.
]

#example[
  Suppose $EE$ is a field of characteristic $p in PP$, and $alpha in EE$ such that
  $ eta^p != alpha, quad forall eta in EE. $
  Consider the polynomial $q(x) := x^p - alpha$. Then $D(q(x)) = p x^(p-1) = 0$, so $q(x)$ is not separable. We can also verify this manually: let $EE arrow.hook LL$ be an extension where $q(x)$ splits completely. So there exists an element $alpha^(1/p) in LL$ such that $(alpha^(1/p))^p = alpha in EE$. In $LL[x]$, it holds that
  $ x^p - alpha = x^p - (alpha^(1/p))^p = (x - alpha^(1/p))^p. $
  We now want to show that $x^p - alpha$ is irreducible in $EE[x]$. Suppose $x^p - alpha = f(x) g(x)$ where $f(x) in EE[x]$ is irreducible with $1 <= deg f(x) < p$. In $LL[x]$, the decomposition has the form
  $ (x - alpha^(1/p))^p = (x - alpha^(1/p))^a (x - alpha^(1/p))^b, $
  where $1 <= a < p$, therefore $(x - alpha^(1/p))^a in EE[x]$. This shows that $(alpha^(1/p))^a in EE$. Since $1 <= a < p$ we can find $s, t in ZZ$ such that $s a + t p = 1$. Therefore
  $ alpha^(1/p) = (alpha^(1/p))^(s a + t p) in EE, $
  a contradiction to $alpha$ not being a $p$-th power.
]

#example[
  Let $FF_p (t)$ be the quotient field of $FF_p [t]$. The elements of this field are expressions of the form
  $ f(t)/g(t), quad f(t), g(t) in FF_p [t], quad g(t) != 0. $
  In this field, not every element is a $p$-th power. Indeed,
  $
    ((a_0 + a_1 t + dots + a_n t^n)/(b_0 + b_1 t + dots + b_m t^m))^p = (a_0^p + a_1^p t^p + dots + a_n t^(n p))/(b_0^p + b_1^p t^p + dots + b_m t^(m p)).
  $
  So, by the previous example, $x^p - t$ is an irreducible non-separable polynomial in $FF_p (t)[x]$.
]

#definition[
  Suppose $"char" FF = p$. Define the _Frobenius map_ by
  $ sigma : FF -> FF, alpha |-> alpha^p. $
]

Since the field has characteristic $p$, this map is a field monomorphism.

#theorem[
  A field $FF$ of characteristic $p in PP$ is perfect if and only the Frobenius map is an automorphism.
]

#proof[
  We saw in the previous examples that, if $sigma$ is not surjective, then $FF$ is not perfect.

  Conversely, suppose that $sigma$ is surjective, in particular an automorphism. Suppose towards a contradiction that $q(x) = a_0 + a_1 x + dots + a_n x^n in FF[x]$ is irreducible and non-separable. By a previous lemma, this implies that $D(q(x)) = 0$, therefore $ell a_ell = 0$ in $FF$ for all $ell = 1, dots, n$. It follows that $a_k = 0$ whenever $p divides.not k$.

  So $q(x) = a_0 + a_p x^p + a_(2p) x^(2p) + dots + a_(k p) x^(k p)$. Since $sigma$ is surjective, we can write $a_(ell p) = b_(ell)^p$ for some $b_ell in FF$, for $ell = 0, dots, k$. Therefore
  $ q(x) = b_0^p + (b_1 x)^p + (b_2 x^2)^p + dots (b_k x^k)^p = (b_0 + b_1 x + dots + b_k x^k)^p $
  and $q(x)$ is not irreducible, a contradiction.
]

#corollary[
  A finite field is perfect.
]

#theorem[
  For every $p in PP$ and $k in NN$ there exists a field, which we will denote $FF_(p^k)$ with $p^k$ elements. Any two fields with $p^k$ elements are isomorphic.
]

#proof[
  Consider the polynomial $q(x) := x^(p^k) - x in FF_p [x]$ and satisfies $D(q(x)) = -1$, and is therefore separable. Let $FF_p arrow.hook KK$ be a splitting field of this polynomial. In $KK$, there are $p^k$ distinct elements $alpha_1, dots, alpha_(p^k)$ that are roots of $q(x)$. We claim that these elements already constitute a subfield of $KK$.
  - Clearly $0$ and $1$ are roots.
  - If $alpha, beta$ are roots, then $(alpha plus.minus beta)^(p^k) = alpha^(p^k) plus.minus beta^(p^k) = alpha plus.minus beta$, as well as $(alpha beta)^(p^k) = alpha beta$ and $(alpha/beta)^(p^k) = alpha/beta$.
  In this subfield $q(x)$ splits completely, and by minimality of $KK$ it follows that
  $ KK = { alpha_1, dots, alpha_(p^k) }. $
  Therefore we can define $FF_(p^k)$ as the splitting field of $q(x)$ over $FF_p$.

  On the other hand, if $EE$ is another field with $p^k$ elements, then every $alpha in EE$ satisfies $alpha^(p^k) = alpha$, in other words, $alpha$ is a root of $q(x)$. So $q(x)$ splits completely over $EE$, and since it cannot split in any smaller field (there are not enough elements) it follows that $EE$ is a splitting field of $q(x)$.
]
