#import "../preamble.typ": *

#lecture-date("15.10.2026")

#proposition[
  Let $phi_1, dots, phi_n : FF -> KK$ be pairwise distinct field homomorphisms. Suppose there exist $a_1, a_2, dots, a_n in KK$ such that
  $ a_1 phi_1(x) + a_2 phi_2 (x) + dots + a_n phi_n (x) = 0, quad "for all" x in FF. $
  Then $a_1 = a_2 = dots = a_n = 0$.
]

#proof[
  Suppose $a_1, dots, a_n$ is a non-trivial $n$-tuple that satisfies the above hypothesis. Suppose $a_(i_1), dots, a_(i_k)$ is a non-trivial $k$-tuple that satisfies
  $ a_(i_1) phi_(i_1) (x) + dots + a_(i_k) phi_(i_k) (x) = 0, quad "for all" x in FF. $
  Without loss of generality, we can assume $k$ to be minimal. There exists an element $x_0 in FF$ such that $phi_(i_1) (x_0) != phi_(i_k) (x_0)$. For all $x in FF$ we have the identity
  $ a_(i_1) phi_(i_1) (x_0) phi_(i_1) (x) + dots + a_(i_k) phi_(i_k) (x_0) phi_(i_k) (x) = 0, $
  $ a_(i_1) phi_(i_k) (x_0) phi_(i_0) (x) + dots + a_(i_k) phi_(i_k) (x_0) phi_(i_k) (x) = 0. $
  Subtracting yields
  $
    a_(i_1) ( phi_(i_1) (x_0) - phi_(i_k) (x_0) ) phi_(i_1) (x) + dots + a_(i_(k-1)) ( phi_(i_(k-1)) (x_0) - phi_(i_k) (x_0) ) phi_(i_(k-1)) (x) = 0, quad "for all" x in FF,
  $
  contradicting minimality of $k$.
]

#proof([(Theorem 1.88)])[
  Let $G = { e, g_2, dots, g_n }$ and $w_1, dots, w_m in KK$. We want to prove:
  + If $m < n$ then $w_1, dots, w_m$ do not span $KK$ over $KK^G$.
  + If $m > n$ then $w_1, dots, w_m$ are linearly dependent over $KK^G$.
  Suppose $m < n$. Consider the system of equations
  $ (g_1 w_1) x_1 + (g_2 w_1) x_2 + dots + (g_n w_1) x_n = 0, $
  $ (g_1 w_2) x_1 + (g_2 w_2) x_2 + dots + (g_n w_2) x_n = 0, $
  $ dots.v $
  $ (g_1 w_m) x_1 + (g_2 w_m) x_2 + dots + (g_n w_m) x_n = 0. $
  This is a system of $m$ equations with $n$ unknowns. Since $m < n$ there exists a non-trivial solution $(beta_1, dots, beta_n) in KK^n without {0}$. So for all $a_1, a_2, dots, a_m in KK^G$, the following holds
  $ (g_1 (a_1 w_1)) beta_1 + dots + (g_n (a_1 w_1)) beta_n = 0, $
  $ dots.v $
  $ (g_1 (a_m w_m)) beta_1 + dots + (g_n (a_m w_m)) beta_n = 0. $
  It follows that
  $ g_1 (sum_(i=1)^m a_i w_i) beta_1 + dots + g_n (sum_(i=1)^m a_i w_i) beta_n = 0. $
  If $w_1, dots, w_m$ generate $KK$ over $KK^G$, it follows that $g_1, dots, g_n$ are linearly dependent over $KK$ as functions from $KK$ to $KK$, contradicting the previous proposition.

  The second assertion is proved similarly.
]

#theorem[
  Let $FF arrow.hook KK$ be a finite degree extension. The following are equivalent:
  + $KK$ is the splitting field of some separable polynomial over $FF$.
  + $FF = KK^(Gal_FF (KK))$
  + $[ KK : FF] = |Gal_FF (KK)|$
]

#proof[
  We already proved that $(1) <==> (2)$.

  To prove that $(2) ==> (3)$, we just need to note that $Gal_FF (KK)$ is finite.

  To prove that $(3) ==> (2)$, we notice that
  $ [KK:FF] = |Gal_FF (KK)| = [KK:KK^(Gal_FF (KK))]. $
  Since $FF subset.eq KK^(Gal_FF (KK))$ it follows that $[KK^(Gal_FF (KK)) : FF] = 1$, so $FF = KK^(Gal_FF (KK))$.
]

#definition[
  We say that a finite extension is _Galois_, if it satisfies any of the (equivalent) conditions in the theorem above.
]

#theorem([The Fundamental Theorem of Galois Theory])[
  Let $FF arrow.hook KK$ be a finite Galois extension. Then there order-reversing, mutally inverse bijections $Phi, Gamma$ of posets
  $ { "Subgroups of " Gal_FF (KK) } <--> { "Intermediate fields" FF arrow.hook EE arrow.hook KK} $
  with $Phi(H) = KK^H$ and $Gamma (EE) = Gal_EE (KK)$.
]

#proof[
  The only remaining to prove is that for all subgroups $H subset.eq Gal_FF (KK)$ it holds that $Gamma(Phi(H)) = H$. In other words, $H = Gal_(KK^H) (KK) =: hat(H)$. In general $H subset.eq hat(H)$. Also $KK^(hat(H)) = KK^H$. It follows that $|H| = [KK:KK^H] = [KK:KK^(hat(H))]=|hat(H)|$, therefore $H = hat(H)$.
]

#example([Finite fields])[
  We know that $FF_(p^n)$ is the splitting field of $x^(p^n) - x$ over $FF_p$. The extension $FF_p arrow.hook FF_(p^n)$ is separable because $FF_p$ is perfect, so it is a Galois extension. So $|Gal_(FF_p) (FF_(p^n))| = [FF_(p^n) : FF_p] = n$. The Frobenius map $Phi : FF_(p^n) -> FF_(p^n), x |-> x^p$ is an element of the Galois group. Note that $Phi^n = id$. On the other hand, if $1 <= k < n$, then $Phi^k$ is not the identity. Indeed, if $Phi^k = id$ then $x^(p^k) - x = 0$ for every $x in FF_(p^n)$. But this polynomial can have at most $p^k$ roots. So $Phi$ is a generator of the Galois group. It follows that
  $ Gal_(FF_p) (FF_(p^n)) tilde.equiv ZZ\/_n $
  is a cyclic group of order $n$.

  It follows that there is a bijection of posets between subfields of $FF_(p^n)$ and subfields of $ZZ \/_n$. The latter is isomorphic to the set of positive divisors of $n$.

  Suppose $k divides n$ and $ZZ\/_k subset.eq Gal_(FF_p)(FF_(p^n))$, then
  $ [FF_(p^n) : (FF_(p^n))^(ZZ\/_k)] = k. $
  It follows that $|(FF_(p^n))^(ZZ\/_k)| = (p^n)^(1/k) = p^(n/k)$. So
  $ (FF_(p^n))^(ZZ\/_k) tilde.equiv FF_(p^(n/k)). $
]

#example[
  The poset of subfields of $FF_16 = FF_(2^4)$ is isomorphic to the poset of subgroups of $ZZ\/_(4)$, which is isomorphic to the poset of divisors of $4$.
]

#remark[
  Suppose $f(x) in ZZ[x]$ is of degree $n$. If the image of $f(x)$ in $FF_p [x]$ is irreducible of degree $n$ for some $p$, then $f(x)$ is irreducible in $ZZ[x]$ (and also in $QQ[x]$).

  What about the converse? Suppose $f(x)$ is reducible of degree $n$ over $FF_p$ for every prime $p$. Does it follow that $f(x)$ is reducible in $ZZ[x]$? The answer is _no_.
]

#lemma[
  The polynomial $x^4 + 1$ is reducible over $FF_p$ for every prime $p$, but is irreducible in $QQ[x]$ and $ZZ[x]$.
]

#proof[
  If $p = 2$, then $x^4 + 1 = (x+1)^4$, so reducible. Suppose $p$ is odd. We have
  $ x^4 + 1 divides x^8 - 1 divides x^(p^2 - 1) - 1 divides x^(p^2) - x $
  in $ZZ[x]$ (or $FF_p [x]$). $FF_(p^2)$ is the splitting field of $x^(p^2) - x$. It follows that $x^4 + 1$ splits completely in $FF_(p^2) [x]$. So the splitting field of $x^4 + 1$ over $FF_p$ has degree at most 2. But if $x^4 + 1$ is irreducible over $FF_p$, then its splitting field contains a copy of $FF_p [x] \/ (x^4 + 1)$, which has degree 4, a contradiction.
]
