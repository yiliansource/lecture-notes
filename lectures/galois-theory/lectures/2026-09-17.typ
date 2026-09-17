#import "../preamble.typ": *

#lecture-date("17.09.2026")

#remark[
  Suppose $FF arrow.hook KK$ is a field extension and $alpha_1, dots, alpha_m in KK$ are algebraic. Then $FF(alpha_1, dots, alpha_m)$ is a finite degree (and therefore algebraic) extension of $FF$.
]

#lemma[
  If $FF arrow.hook KK$ and $KK arrow.hook LL$ are algebraic extensions, then the extension $FF arrow.hook LL$ is also algebraic.
]

#proof[
  Let $alpha in LL$, then $alpha$ is algebraic over $KK$. Therefore the exists a polynomial $p(x) = a_0 + a_1 x + dots + a_n x^n in KK[x]$ such that $p(alpha) = 0$. Note that all $a_0, dots, a_n$ are algebraic over $FF$. Furthermore, $p(x) in FF(a_0, dots, a_n)[x]$, so $alpha$ is algebraic over $FF(a_0, dots, a_n)$. Therefore
  $
    [FF(a_0, dots, a_n, alpha) : FF] = [FF(a_0, dots, a_n, alpha) : FF(a_0, dots, a_n)] dot [FF(a_0, dots, a_n) : FF] < oo.
  $
]

== Splitting fields

#definition[
  Let $FF arrow.hook KK$ be a field extension and $p(x) in FF[x]$, $deg p >= 1$. We say that $p(x)$ splits completely over $KK$ if $p(x)$ is a product of linear polynomials over $KK$.
]

#example[
  + The polynomial $x^2 - 2 in QQ[x]$ splits completely over $RR$, since
    $ x^2 - 2 = (x + sqrt(2))(x - sqrt(2)). $
  + The polynomial $x^2 + 2 in QQ[x]$ splits completly over $CC$, since
    $ x^2 + 2 = (x + i sqrt(2))(x - i sqrt(2)). $
]

#remark[
  If $FF arrow.hook KK arrow.hook LL$ and $p(x) in FF[x]$ splits completely over $KK$, then it also splits completely over $LL$.
]

#remark[
  Suppose $FF arrow.hook KK$ and $p(x) = a_0 + a_1 x + dots + a_n x^n in FF[x]$. Then $p(x)$ splits completely over $KK$ if and only if there exist $alpha_1, dots, alpha_n in KK$ such that
  $ p(x) = a_n (x - alpha_1) (x - alpha_2) dots.c (x - alpha_n). $
  Note that ${ alpha_1, dots, alpha_n }$ is uniquely determined by $p(x)$.

  Suppose $p(x) in FF[x]$ splits completely over $KK$ as above. Consider the sub-extension $FF arrow.hook FF(alpha_1, dots, alpha_n) arrow.hook KK$. This intermediate extension has the following properties:
  + $p(x)$ splits completely over $FF(alpha_1, dots, alpha_n)$.
  + For any proper sub-extension $FF arrow.hook LL arrow.hook FF(alpha_1, dots, alpha_n)$, $p(x)$ does not split completely over $LL$.
]

#definition[
  Let $p(x) in FF[x]$. A _splitting field_ over $FF$ is any field extension $FF arrow.hook KK$ such that:
  + $p(x)$ splits completely over $KK$.
  + $p(x)$ does not split completely over any proper sub-extension $FF arrow.hook LL arrow.hook KK$.
]

We have already shown:

#lemma[
  If $FF arrow.hook LL$ is an extension such that $p(x) in FF[x]$ splits completely over $LL$, then $LL$ contains a splitting field of $p(x)$.
]

#proposition[
  For any $p(x) in FF[x]$, $deg p >= 1$, there exists an extension $FF arrow.hook KK$ such that $p(x)$ splits completely over $KK$. It follows that every polynomial has a splitting field.
]

#proof[
  Suppose $p(x) = a_0 + a_1 x + dots + a_n x^n in FF[x]$. We argue by induction on $n$.
  - If $n=1$, then $p(x)$ splits completely over $FF$.
  - Suppose $n > 1$ and assume that any polynomial of degree $n-1$ over any field splits completely over some field extension. If $p(x)$ splits completely over $FF$ there is nothing to show. So assume that $p(x)$ does not split completely over $FF$. Then we can write (in $FF[x]$) that $p(x) = q(x) dot r(x)$, where $q(x)$ is irreducible over $FF$ and $deg q > 1$. View $q(x)$ as a minimal polynomial of a root $alpha$ and consider the induced extension $FF arrow.hook LL$. By assumption, we can write $q(x) = (x - alpha) dot q_1(x)$. Consider the polynomial $q_1(x) dot r(x) in LL[x]$, then $deg (q_1 dot r) = n-1$. By inducation hypothesis, there is an extension $LL arrow.hook KK$ such that $q_1(x) dot r(x)$ splits completely over $KK$. So we have extensions $FF arrow.hook LL arrow.hook KK$ and $p(x) = (x - alpha) dot q_1(x) dot r(x)$. It follows that $p(x)$ splits completely over $KK$.
]

#remark[
  Suppose $phi : FF -> KK$ is a field isomorphism. Then $phi$ induces a ring isomorphism
  $ phi_x : FF[x] -> KK[x], p(x) |-> phi(p(x)). $
  A polynomial $p(x) in FF[x]$ is irreducible if and only if $phi_x (p(x))$ is irreducible in $KK[x]$.

  For any polynomial $p(x) in FF[x]$, $phi$ also induces an isomorphism of quotient rings
  $ FF[x] \/ (p(x)) tilde.equiv KK[x] \/ (phi(p(x))). $
]

#theorem[
  Suppose $phi : KK_1 -> KK_2$ is an isomorphism of fields and $p(x) in FF[x]$. Suppose $LL_1$ is any splitting field of $p(x)$ and $LL_2$ is any splitting field of $phi(p(x))$. Then there exists a field isomorphism $psi : LL_1 -> LL_2$ such that the following diagram commutes:
  #align(center)[
    #diagram(
      cell-size: 10mm,
      $
                            LL_1 edge(psi, ->) & LL_2 \
        KK_1 edge(phi, ->) edge("u", "hook->") & KK_2 edge("u", "hook->")
      $,
    )
  ]
  In
  other words, $phi$ can be extended to an isomorphism $psi$ of splitting fields.
]

#proof[
  Suppose $p(x) = a_0 + a_1 x + dots + a_n x^n in KK_1[x]$. We prove the statement by induction on $n$.
  - If $n=1$, then $LL_1 = KK_1$ and $LL_2 = KK_2$, thus there is nothing to show.
  - Assume that the theorem holds if $deg p < n$. If $p(x)$ splits completely over $KK_1$, there is nothing to prove. If we assume that $p(x)$ does not split completely over $KK_1$, then $KK_1 subset.neq LL_1$, so we can choose some root $alpha in LL_1 without KK_1$ of $p(x)$. We therefore have extensions
    $ KK_1 subset.neq KK_1(alpha) subset.eq LL_1. $
    Let $m_(alpha, KK_1)(x) in KK_1[x]$ be the minimal polynomial of $alpha$. Then we have isomorphisms
    $ KK_1[x] \/ (m_(alpha, KK_1)(x)) tilde.equiv KK_1(alpha), $
    and $phi_x (m_(alpha, KK_1)(x))$ is irreducible over $KK_2$. Therefore $KK_2[x] \/ (phi_x (m_(alpha, KK_1)(x)))$ is a field extension of $KK_2$. Note that $m_(alpha, KK_1)(x) divides p(x)$ and therefore $phi_x (m_(alpha, KK_1) (x)) divides phi_x (p(x))$. Since $phi_x (p(x))$ splits completly over $LL_2$, we have that $phi_x (m_(alpha, KK_1) (x))$ splits completely over $LL_2$. Therefore there is a field homomorphism $KK_2[x] \/ (phi_x (m_(alpha, KK_1) (x)))$ into $LL_2$, that sends $x$ to a root of $phi_x (m_(alpha, KK_1)(x))$.

    In $KK_1(alpha)[x]$ we have $p(x) = (x - alpha) dot q(x)$ for some $q(x) in FF(alpha)[x]$. Similarly, $phi_x (p(x)) = (x - alpha_1) dot phi_x (q(x))$ in $KK_2(alpha_1)[x]$. Since $p(x) = (x - alpha) dot q(x)$ splits completely in $LL_1$, $q(x)$ must split completely in $LL_1$. On the other hand, $q(x)$ does not split completely in any proper subextension of $LL_1$, since if it did, then $p(x)$ would also split completely, contradicting the minimality of $LL_1$ for $p(x)$. Thus $LL_1$ is the splitting field of $q(x) in KK_1(alpha)[x]$. Similarly, $LL_2$ is the splitting field of $phi_x (q(x)) in KK_2(alpha_1)[x]$. But $deg q < deg p$, so by induction hypothesis there is an isomorphism $psi : LL_1 -> LL_2$ extending $KK_1(alpha) -> KK_2(alpha_1)$, which in turn extends $phi : KK_1 -> KK_2$.
]

#example[
  1. The splitting field of $x^2 - 2 in QQ[x]$ is $QQ(sqrt(2), -sqrt(2)) = QQ(sqrt(2))$. Notice that $[QQ(sqrt(2)) : QQ] = 2$.
  2. Consider the polynomial $x^3 - 2 in QQ[x]$. The field $QQ[x] \/ (x^2 - 2) tilde.equiv QQ(root(3, 2))$ contains a root of $x^3 - 2$. Therefore, in $QQ(root(3, 2))[x]$, it holds that
    $ x^3 - 2 = (x - root(3, 2)) (x^2 + root(3, 2) x + root(3, 4)). $
    The polynomial splits, but not completely. Indeed, the roots of $x^3 - 2$ are $root(3, 2), root(3, 2) omega, root(3, 2) omega^2$, where $omega = e^((2 pi i)/3).$ The splitting field of $x^3 - 2$ therefore is $QQ(root(3, 2), omega)$. Note that, in this case, $[QQ(root(3, 2), omega) : QQ] = 3! eq.not 3$.
]
