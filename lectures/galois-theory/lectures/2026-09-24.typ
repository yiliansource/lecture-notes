#import "../preamble.typ": *

#lecture-date("24.09.2026")

#lemma[
  Suppose $phi : KK_1 -> KK_2$ is a field isomorphism and $FF_1 arrow.hook KK_1$ is a subfield. Let $FF_2 := phi(FF_1)$. If $KK_1$ is a splitting field of some $p(x) in FF_1 [x] without FF_1$, then $KK_2$ is a splitting field of $phi(p(x))$.
]

#proof[
  Suppose $p(x) = a (x - alpha_1)(x - alpha_2) dots.c (x - alpha_n)$ in $KK_1[x]$. Then
  $ phi(p(x)) = phi(a) (x - phi(alpha_1))(x - phi(alpha_2)) dots.c (x - phi(alpha_n)) $
  in $KK_2[x]$. So $phi(p(x))$ splits completely over $FF_2$.

  If $phi(p(x))$ splits completly over $LL_2$ for some extension $FF_2 arrow.hook LL_2 arrow.hook KK_2$. Then $p(x)$ splits completely over $LL_1 := phi^(-1)(LL_2)$. If $LL_2 eq.not KK_2$, then $LL_1 eq.not KK_1$, a contradiction.
]

We prove a generalized converse:

#theorem[
  Suppose we have:
  - A field isomorphism $phi : FF_1 -> FF_2$.
  - A polynomial $p(x) in FF_1[x] without FF_1$.
  - A splitting field $KK_1$ of $p(x)$ over $FF_1$.
  - A field extension $FF_2 arrow.hook LL_2$, where $phi(p(x))$ splits completely.
  Then there exists a field homomorphism $psi : KK_1 -> LL_2$, extending $phi$. If $LL_2$ is a splitting field of $phi(p(x))$, then $psi : KK_1 -> LL_1$ is an isomorphism.
]

#proof[
  To prove the last statement, assuming existence of $psi$, note that $phi(KK_1) arrow.hook LL_2$ is a splitting field of $phi(p(x))$, by the previous lemma. So, if $LL_2$ is a splitting field, we have $psi(KK_1) = LL_2$, so $psi$ is an isomorphism.

  We prove the first statement by induction on $[KK_1 : FF_1]$.
  - If $[KK_1 : FF_1] = 1$, then $KK_1 = FF_1$ and there is nothing to prove.
  - Suppose $[KK_1 : FF_1] = n > 1$, and an appropriate $psi$ exists whenever the degree of an appropriate extension is less than $n$. We can write $p(x) = q(x) dot r(x)$ in $FF_1[x]$, where $q(x)$ is monic and irreducible with $deg q > 1$. Since $p(x)$ splits completely in $KK_1[x]$, so $q(x)$ itself splits completely in $KK_1[x]$. Let $alpha in KK_1 without FF_1$ be a root of $q(x)$. Similarly, $phi(q(x))$ is irreducible over $FF_2[x]$ and splits completely over $LL_1$, so let $beta$ be a root of $phi(q(x))$ in $LL_1$. The polynomials $q(x)$ and $phi(q(x))$ are minimal polynomials of $alpha$ and $beta$, respectively. We have a field isomorphisms
  $ FF_1[x] \/ (q(x)) -> FF_1(alpha), quad "and" quad FF_1[x] \/ (phi(q(x))) -> FF_2(beta), $
  which, together with $phi$, induce a field isomorphism $phi' : FF_1(alpha) -> FF_2(beta)$. Note that $KK_1$ is a splitting field for $p(x)$ over $FF_1(alpha)$. Moreover,
  $ [KK_1 : FF_1 (alpha)] = [KK_1 : FF_1]/[FF_1(alpha) : FF_1] ) = [KK_1 : FF_1]/(deg q) < [KK_1 : FF_1]. $
  By the induction hypothesis, there exists a homomorphism $psi : KK_1 -> LL_2$, extending $phi'$ and therefore also $phi$.
]

#lemma[
  Let $p(x) in FF[x]$ with $deg p = n$, and let $KK$ be a splitting field of $p(x)$. Then
  $ [KK : FF] <= n!. $
]

== Splitting fields for a family of polynomials

#definition[
  Let $FF$ be a field, let $P = { p_alpha (x) : alpha in I } subset FF[x] without FF$ be a family of polynomials. A splitting field for $P$ is an extension $FF arrow.hook KK$, such that
  + Every polynomial $p_alpha (x), alpha in P$ splits completely over $KK$.
  + $KK$ is minimal with respect to the first property.
]

#remark[
  If $P$ only consists of finitely many, say $P = {p_1(x), dots, p_n (x)}$, then the splitting field for $P$ is the same as the splitting field for $p_1(x) dots.c p_n (x)$.
]

#theorem[
  For any family of polynomials, there exists a splitting field that is unique up to isomorphism of extensions.
]

#proof[
  Let us prove existence when $P$ is a countably infinite family, i.e. $P = {p_1 (x), p_2 (x), dots} subset FF[x] without FF.$ Construct a sequence of extensions
  $ FF = KK_0 arrow.hook KK_1 arrow.hook KK_2 arrow.hook dots.c arrow.hook KK_n arrow.hook dots.c, $
  where each $KK_n$ is the splitting for $p_n (x)$ over $KK_(n-1)$. Let
  $ KK := union.big_(n=0)^oo KK_n. $
  It is easily checked that $KK$ is indeed a field, and that each $p_n (x)$ splits completely over $KK$. We now claim that $KK$ is already the splitting field, which means it remains to show that it is minimal.

  Suppose we have a proper sub-extension $FF arrow.hook LL arrow.hook KK$. Then there exists an $n in NN$ such that $KK_(n-1) subset.eq LL$, but $KK_n subset.eq.not LL$. Then $LL$ is an extension of $KK_(n-1)$, but $LL$ does not contain a splitting field of $p_n (x)$ over $KK_(n-1)$ (since that splitting field is $KK_n$).

  If $P$ is uncountable, one can use Zorn's Lemma.

  For uniqueness, suppose that $LL_1$ and $LL_2$ are splitting fields for $P$. Consider the set
  $
    X := { (KK_1, KK_2, phi) : FF arrow.hook KK_1 arrow.hook LL_1, FF arrow.hook KK_2 arrow.hook LL_2, phi : KK_1 -> KK_2 "is isomorphism"}.
  $
  The set $X$ can be partially ordered by considering extensions, and satisfies Zorn's Lemma. Therefore, there exists a maximal element $(KK^max_1, KK^max_2, phi^max)$. If $KK^max_1 subset.neq LL_1$, then there exists a $p(x) in P$ that does not split completely over $KK^max_1$. Therefore we have splitting fields $KK^max_1 subset.neq KK_1 subset.eq LL_1, KK^max_2 subset.neq KK_2 subset.eq LL_2$ (for $p(x)$ and $phi^max (p(x))$, respectively). So $phi^max$ extends to an isomorphism $KK_1 -> KK_2$.
]

#definition[
  Let $FF$ be a field. A splitting field of the family $FF[x] without FF$ is called an _algebraic closure_ of $FF$, and is often denoted $overline(FF)$.
]

In particular, we now know that every field $FF$ has an algebraic closure, which is unique up to isomorphism.

#definition[
  A field $LL$ is _algebraically closed_, if every non-constant polynomial in $LL[x]$ splits completely over $LL$. Equivalently, every polynomial such polynomial has a root in $LL$.
]

#theorem[
  The field $CC$ is algebraically closed.
]

#theorem[
  Suppose we have a field extension $FF arrow.hook KK$, then the following are equivalent:
  + $KK$ is an algebraic closure of $FF$.
  + Every non-polynomial over $FF$ splits completely over $KK$ and $KK$ an algebraic extension of $FF$.
  + $KK$ is algebraically closed and $KK$ is an algebraic extension of $FF$.
]
