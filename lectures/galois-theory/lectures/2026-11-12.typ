#import "../preamble.typ": *

#lecture-date("12.11.2026")

#remark[
  Consider the quadratic equation
  $ x^2 + p x + q = 0, $
  which has solutions
  $ x_(1,2) = (-p plus.minus sqrt(p^2 - 4 q))/2. $
  If $p, q in QQ$ and $Delta := p^2 - 4 q$, then the solutions live in the quadratic extension $QQ(sqrt(Delta))$.
]

#definition[
  A _simple radical extension_ is a field extension $FF arrow.hook KK$ such that $KK = FF (root(n, a))$ where $a in FF$ and $root(n, a) in KK$ is a solution of $x^n - a = 0$.

  More generally, we say that a _root extension_ is a field extension $FF arrow.hook KK$ that can be refined to a tower of extensions
  $ FF = KK_0 arrow.hook KK_1 arrow.hook dots.c arrow.hook KK_m = KK $
  where for each $j$ we have that $KK_(j+1) = KK_j (root(n, a_j))$ is a simple radical extension of $KK_j$.
]

#definition[
  A polynomial $p(x) in FF[x]$ can be _solved by radicals_ if every root of $p(x)$ lives in some root extension of $FF$.
]

#definition[
  A finite group $G$ is _solvable_ if there exists a chain of subgroups
  $ {1} = G_0 triangle.l G_1 triangle.l dots.c triangle.l G_n = G $
  and for each $j$ we have that $G_(j+1)\/G_j = ZZ\/_(n_j)$ is cyclic.
]

#example[
  $Sigma_2, Sigma_3, Sigma_4$ are solvable, as are all their subgroups.
  $ ZZ\/_3 tilde.equiv A_3 triangle.l Sigma_3 arrow.squiggly Sigma_3\/A_3 tilde.equiv ZZ\/_2 $
  On the other hand, $Sigma_5$ is not solvable.
]

#theorem[
  Let $"char" FF = 0$. A polynomial $p(x) in FF[x]$ is solvable by radicals if and only if the Galois group of $p(x)$ (i.e. the Galois group of the splitting field) is solvable.
]

#corollary[
  Polynomials of degree at most $4$ are solvable by radicals. There exist non-solvable polynomials of degree 5.
]

#definition[
  A _cyclic extension_ is a finite Galois extension $FF arrow.hook KK$ whose Galois group is $ZZ\/_n$ for some $n in NN$.
]

#proposition[
  Suppose $"char" FF divides.not n$ (e.g. if $"char" FF = 0$) and $FF$ contains all the $n$-th roots of unity (i.e. $x^n - 1$ splits completely over $FF$). Then a simple radical extension $FF arrow.hook KK = FF(root(n, a))$ is cyclic of order $d divides n$.
]

#proof[
  Let $xi in FF$ be a primitive $n$-th root of unity. Then
  $ root(n, a), xi root(n, a), xi^2 root(n, a), dots, xi^(n-1) root(n, a) $
  are $n$ distinct solutions of the equation $x^n - a = 0$. Thus $x^n - a$ splits completely over $FF(root(n, a))$, but not over any proper subextensions. In other words, $FF(root(n, a))$ is the splitting field of $x^n - a$ over $FF$. Therefore $FF(root(n, a))$ is Galois over $FF$.

  Let $sigma : FF(root(n, a)) -> FF(root(n, a))$ be a field automorphism fixing $FF$. Then $sigma(root(n, a)) = xi^(j_sigma) root(n, a)$ for some $0 <= i_sigma <= n - 1$. This defines a function
  $ Gal_FF (FF(root(n, a))) -> { 1, xi, dots, xi^(n-1)}, quad sigma |-> xi^(i_sigma). $
  One verifies that this is an injective homomorphism. This shows that the Galois group is isomorphic to $ZZ\/_d$ for some $d divides n$.
]

#proposition[
  Suppose $"char" FF divides.not n$, $FF$ contains all the $n$-th roots of unity and $FF arrow.hook KK$ is a cyclic extension of order $n$. Then $KK = FF(root(n, a))$ for some $a in FF$.
]

#proof[
  Let $sigma$ be a generator of the Galois group of $Gal_FF (KK) tilde.equiv ZZ\/_n$. For every $alpha in KK$ and a primitive $n$-th root of unity $xi$, define the element
  $ (alpha, xi) = alpha + xi sigma(alpha) + xi^2 sigma^2 (alpha) + dots + xi^(n-1) sigma^(n-1) (alpha) in KK. $
  Then
  $
    sigma((alpha, xi)) &= sigma(alpha) + xi sigma^2 (alpha) + xi^2 sigma^3 (alpha) + dots + xi^(n-2) sigma^(n-1) + xi^(n-1) alpha \
    &= xi^(-1) (xi sigma(alpha) + xi^2 sigma^2 (alpha) + dots + xi^(n-1) sigma^(n-1) (alpha) + alpha) \
    &= xi^(-1) (alpha, xi).
  $
  Therefore
  $
    sigma((alpha, xi)^n) = xi^(-n) (alpha, xi)^n = (alpha, xi)^n
  $
  and $(alpha, xi)^n in KK^(ZZ\/_n) = FF$.

  The endomorphisms $id, sigma, dots, sigma^(n-1)$ are linearly independent over $KK$. It follows that there exists some $alpha in KK$ for which $(alpha, xi) != 0$. Let $a := (alpha, xi)^n in FF$, we can say that $(alpha, xi) = root(n, a)$. It remains to show that $FF(root(n, a)) = KK$. Note that for every $1 <= j <= n - 1$, $sigma^j ((alpha, xi)) = xi^(-j) (alpha, xi) != (alpha, xi)$. So $(alpha, xi) = root(n, a)$ is not fixed by any non-identity element of $Gal_FF (KK)$, therefore $root(n, a)$ does not lie in any proper subextension of $KK$, therefore $KK = FF(root(n, a))$.
]

Suppose we have intermediate fields $FF arrow.hook KK_1 KK_2 arrow.hook LL$. Recall that the compositum $KK_1 KK_2$ is the smallest subfield of $LL$ is the smallest subfield of $LL$ containing $KK_1$ and $KK_2$.

#lemma[
  All the fields are between $FF$ and $LL$.
  + If $K_1 arrow.hook KK'_1$ is a simple radical extension, then $KK_1 KK_2 arrow.hook KK'_1 KK_2$ is a simple radical extension.
  + If $KK_1, KK_2$ are root extensions of $FF$, then $KK_1 KK_2$ is a root extension.
  + If $KK_1 arrow.hook KK'_1$ is a cyclic extension, then $KK_1 KK_2 arrow.hook KK'_1 KK_2$ is a cyclic extension.
  + If $KK_1, KK_2$ fit into towers of cyclic extensions, then $KK_1 KK_2$ sits at the top of a tower of cyclic extensions.
  + If $KK_1, KK_2$ are Galois over $FF$, then $KK_1 KK_2$ is Galois over $FF$.
]

#proposition[
  Suppose $"char" FF = 0$. Suppose $alpha$ lives in a root extension $KK$ of $FF$. Then there exists a Galois extension $FF arrow.hook LL$ such that $alpha in LL$ and $LL$ fits in a tower
  $ FF = LL_0 arrow.hook LL_1 arrow.hook dots.c arrow.hook LL_m = LL, $
  where each extension is cyclic.
]

#proof[
  Let $LL$ be the Galois closure of $KK$ over $FF$. Then for each $sigma in Gal_FF (LL)$ we have extensions
  $ FF = sigma(FF) = sigma(KK_0) arrow.hook sigma(KK_1) arrow.hook dots.c arrow.hook sigma(KK_m) = sigma(KK) $
  where $sigma(KK_(j+1)) = sigma(KK_j (root(n, a_j))) = sigma(KK_j) (root(n, a_j))$. It follows that the compositum $product_(sigma in Gal_FF (LL)) sigma(KK)$ is a root extension of $FF$. We claim that this compositum equals $LL$. This is because the compositum is a Galois subfield of $LL$ containing $KK$. By minimality of $LL$, the claim follows. So $LL$ is a root extension of $FF$. Let $FF arrow.hook FF'$ be obtained by adjoining all the $n_j$-th roots of unity, where the $n_j$ are the numbers that occur as degrees of the tower of extensions occurring in $LL$. We have field extensions
  $ FF arrow.hook FF' arrow.hook FF' LL_1 arrow.hook FF' LL_2 arrow.hook dots.c arrow.hook FF' LL, $
  where the lastmost field is Galois. From $FF'$ onwards, the simple radical extensions are cyclic. The first extension is abelian, therefore solvable and can be refined into a sequence of cyclic extensions.
]

#proof([Theorem 1.9.18])[
  "$==>$": Suppose $p(x)$ is solvable by radicals. Then each root $alpha$ of $p(x)$ is in some root extension of $FF$. By the previous proposition, each root $alpha$ is in a Galois extension of $FF$ that is at the top of a tower of cyclic extensions. Their compositum $LL$ is a Galois extension of $FF$ containing all the roots of $p(x)$, and there is a tower
  $ FF = LL_0 arrow.hook LL_1 arrow.hook dots.c arrow.hook LL_t = LL, $
  where each $LL_(j+1)$ is cyclic over $LL_j$. This means that the Galois group $G := Gal_FF (LL)$ has a sequence of subgroups ${1} = G_t triangle.l G_(t-1) triangle.l dots.c triangle.l G_0 = G$. Where $LL_j = LL^(G_j)$. These exhibit $G$ as a solvable group. Furthermore, the splitting field of $p(x)$ is a Galois subextension of $LL$. So the Galois group of $p(x)$ is a quotient of the solvable group, and therefore is solvable.

  "$<==$": Works essentially by working the previous construction backwards.
]
