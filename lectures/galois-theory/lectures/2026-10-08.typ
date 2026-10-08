#import "../preamble.typ": *

#lecture-date("08.10.2026")

== Field homomorphisms (embeddings) and automorphisms

Let $KK$ be a field and $phi : KK -> KK$ a field homomorphism#footnote([Recall that $phi$ is automatically a monomorphism, i.e. an embedding.]). Define the _field field_ by
$ KK^phi := { x in KK : phi(x) = x}. $

#lemma[
  $KK^phi$ is a subfield of $KK$.
]

#proof[Follows immediately by computation.]

Let $Aut(KK)$ be the group of automorphisms of $KK$ and suppose $H subset.eq Aut(KK).$ Define
$ KK^H := { x in KK : phi(x) in x "for all" phi in H} = inter.big_(phi in H) KK^phi. $
By the above lemma, it follows that $KK^H$ is a subfield of $KK$.

#example[
  Complex conjugation $c : CC -> CC, z |-> overline(z)$ is a field automorphism, with $CC^c = RR$. Furthermore ${ id, c } tilde.equiv ZZ_2$ is a group acting on $CC$ by automorphisms, and it holds that $CC^{id,c} = RR$.
]

Suppose $FF arrow.hook KK$ is a field extension. Define
$ Aut_FF (KK) := Gal_FF (KK) := "G"_FF (KK) := { phi in Aut(KK) : phi(x) = x "for all" x in FF}. $

#lemma[
  Suppose $FF arrow.hook KK$, $phi in Gal_FF (KK)$, $p(x) in FF[x]$ and $alpha in KK$ is a root of $p(x)$. Then $phi(alpha)$ is also of a root of $p(x)$.
]

#proof[
  Suppose $p(x) = a_0 + a_1 x + dots + a_n x^n in FF[x]$. Then
  $
    p(phi(alpha)) & = a_0 + a_1 phi(alpha) + dots + a_n phi(alpha)^n \
                  & = phi(a_0) + phi(a_1) phi(alpha) + dots + phi(a_n) phi(alpha^n) \
                  & = phi(p(alpha)) = 0.
  $
]

#corollary[
  The group $Gal_FF (KK)$ acts by permutation on the set of roots of any polynomial over $FF$.
]

#corollary[
  Suppose $FF arrow.hook KK$ is an algebraic extension. Then $Gal_FF (KK) = "End"_FF (KK)$.
]

#proof[
  Let $phi : KK -> KK$ be a homomorphism fixing $FF$. We know that $phi$ is injective, we only need to show surjectivity. Let $alpha in KK$, then $phi$ permutes the set of roots of $m_(alpha, FF)(x)$. Therefore there exists a root $beta in KK$ of $m_(alpha, KK) (x)$ such that $phi(beta) = alpha$.
]

#remark[
  Suppose $FF arrow.hook KK$ is a field extension. We obtain a function $Phi$ from the set of subgroups of $Gal_FF (KK)$ to the set of intermediate fields between $FF$ and $KK$, via $Phi(H) := KK^H$ for a subgroup $H$ of $Gal_FF (KK)$. Conversely, we also obtain a function $Gamma$ in the other direction, by $Gamma(EE) = Gal_EE (KK) = { phi in Gal_FF (KK) : phi(x) = x "for all" x in EE }$ for an intermediate field $FF arrow.hook EE arrow.hook KK$.

  However, in general $Phi$ and $Gamma$ are not inverses.
]

#example[
  We consider the extension $QQ arrow.hook QQ(root(3, 2)) arrow.hook RR$. What is $Gal_QQ (QQ(root(3, 2)))$? More generally: Suppose $QQ arrow.hook LL$ is any extension, what is $"Hom"_QQ (QQ(root(3, 2)), LL)$?

  Answer: We have
  $
    "Hom"_QQ (QQ(root(3, 2)), LL) & = "Hom"_QQ (QQ[x] \/ (x^3 - 2), LL) \
                                  & = { beta in LL : beta^3 = 2 }.
  $
  Therefore $"Hom"_QQ (QQ(root(3, 2)), RR) = {1}$ and $Gal_QQ (QQ(root(3, 2))) = {1}$. However, $Gamma(QQ) = {1}$ and $Phi({1}) = (QQ(root(3, 2)))^{1} = QQ(root(3, 2))$.
]

#remark[
  We have the following "formal" properties of $Phi$ and $Gamma$:
  +
    + If $H_1 subset.eq H_2 subset.eq Gal_FF (KK)$, then $Phi(H_1) supset.eq Phi(H_2)$.
    + If $FF arrow.hook EE_1 arrow.hook EE_2 arrow.hook KK$, then $Gamma(EE_1) supset.eq Gamma(EE_2)$.
  +
    + For every $H subset.eq Gal_FF (KK)$, it holds that $H subset.eq Gamma(Phi(H))$.
    + For every $FF arrow.hook EE arrow.hook KK$, it holds that $EE arrow.hook Phi(Gamma(EE))$.
  +
    + For every element $EE in im Phi$, it holds that $Phi(Gamma(EE)) = EE$.
    + For every element $H in im Gamma$, it holds that $Gamma(Phi(H)) = H$.

  To the see the last property, suppose that $EE = Phi(H)$ for some subgroup $H$. Then
  $ Phi(H) subset.eq Phi(Gamma(Phi(H))), $
  but also $H subset.eq Gamma(Phi(H))$, therefore $Phi(H) supset.eq Phi(Gamma(Phi(H)))$. Therefore
  $ EE = Phi(H) = Phi(Gamma(Phi(H))) = Phi(Gamma(E)). $

  So, while $Gamma$ and $Phi$ are not inverses in general, they are bijections between their images.
]

Suppose $FF arrow.hook KK$ is a field extension. In general, by the above,
$ FF subset.eq KK^(Gal_FF (KK)) subset.eq KK. $

#theorem[
  Suppose $FF arrow.hook KK$ is an algebraic extension. Then the following are equivalent:
  + $FF = KK^(Gal_FF (KK))$
  + The extension is both normal and separable.
]

Recall that an extension being normal means that it is the splitting field of a family of polynomials over $FF$, or equivalently, the minimal polynomial of every $alpha in KK$ splits completely over $KK$.

The extension being separable means that the minimal polynomial of every $alpha in KK$ splits into distinct linear factors over the splitting field.

#proof[
  Suppose $FF arrow.hook KK$ is normal and separable. Let $alpha in KK without FF$. We need to show that there is a homomorphism $phi : KK -> KK$ fixing $FF$ pointwise but not $alpha$. Consider the minimal polynomial of $m_(alpha, FF)(x) in FF[x]$, which has degree $>= 2$. By assumption, $m_(alpha, FF)(x)$ has another root $beta in KK$ with $beta != alpha$, then $m_(alpha, FF)(x) = m_(beta, FF)(x)$. It follows that the fields $FF(alpha)$ and $FF(beta)$ are isomorphic extensions of $FF$. Moreover, there is a (unique) isomorphism $phi_0 : FF(alpha) -> FF(beta)$ which fixes $FF$ and satisfies $phi(alpha) = beta$. We obtain an embedding $FF(alpha) arrow.hook FF(beta) subset.eq KK$. Now, $KK$ is a splitting field over $FF(alpha)$, therefore any embedding $phi_0 : FF(alpha) -> KK$ fixing $FF$ extends to a homomorphism $phi : KK -> KK$ satisfying $phi(alpha) = beta != alpha$.

  Now suppose that $FF = KK^(Gal_FF (KK))$. Let $alpha in KK$ and $m_(alpha, FF)(x)$ be the minimal polynomial of $alpha$. Let $alpha_1, dots, alpha_n$ denote the distinct roots of $m_(alpha, FF)(x)$ and suppose $alpha = alpha_1$. The group $Gal_FF (KK)$ acts on ${alpha_1, dots, alpha_n}$ by permutation. Consider the polynomial
  $ p(x) = (x - alpha_1) (x - alpha_2) dots.c (x - alpha_n) in KK[x]. $
  For any $phi in Gal_FF (KK)$, it holds that $phi(p(x)) = p(x)$. Therefore
  $ p(x) in KK^(Gal_FF (KK))[x] = FF[x]. $
  It follows that $m_(alpha, FF)(x) divides p(x)$. In fact $p(x) = m_(alpha, FF)(x)$, because each $alpha_k$ is a root of $m_(alpha, FF)(x)$. In particular, $m_(alpha, FF)(x)$ splits as a product of distinct linear factors.
]

#definition[
  An algebraic extension is _Galois_ if it satisfies any of the (equivalent) conditions of the theorem above.
]

#corollary[
  If $FF arrow.hook KK$ is a Galois extension (i.e. algebraic, normal and separable), then $Phi$ is injective and $Gamma$ is surjective.
]

#proof[
  If $FF arrow.hook KK$ is normal and separable, then for every intermediate extension $EE$ it holds that also $KK$ is normal and separable over $EE$. So $EE = KK^(Gal_EE (KK)) = Phi(Gamma(EE))$.
]

#theorem[
  Let $KK$ be a field and let $G subset.eq Aut(KK)$ be a finite subgroup. Then
  $ [KK : KK^G] = |G|. $
]

#corollary[
  For any field extension $FF arrow.hook KK$, the finite subgroups of $Gal_FF (KK)$ are in the image of $Gamma$.
]

#proof[
  Let $G$ be a such a finite subgroup. We know that $G subset.eq Gamma(Phi(G)) = Gal_(KK^G) (KK)$. On the other hand
  $ |Gamma(Phi(G))| = [ KK : KK^(Gamma(Phi(G))) ] = [KK : Phi(Gamma(Phi(G)))] = [KK : Phi(G)] = [KK : KK^G] = |G|, $
  and therefore $G = Gamma(Phi(G))$.
]

Ultimately, if $KK \/ FF$ is a finite Galois extension, then $Phi, Gamma$ are inverse bijections.

