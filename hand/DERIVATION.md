# Hand derivation required before submission

This folder intentionally does **not** contain a fabricated handwriting image. Write the derivation below by hand, photograph it clearly, and save the image as `hand/derivation.jpg`. The presentation will display it automatically when compiled.

For one unfamiliar language, let the pre-agent activation hazard be \(p_1\) and the post-agent hazard be \(p_2\), with \(0\le p_1\le p_2\le1\). By horizon \(t\), activation probability is

\[A_j(t)=1-(1-p_j)^{t+1},\qquad j\in\{1,2\}.\]

Therefore the cumulative treatment gap is

\[G(t)=A_2(t)-A_1(t)=(1-p_1)^{t+1}-(1-p_2)^{t+1}\ge0.\]

Under the paper's closed-frontier comparison \(p_1=0\),

\[G(t)=1-(1-p_2)^{t+1},\qquad \Delta G(t)=p_2(1-p_2)^{t+1}.\]

Thus \(\Delta G(t)>0\) only if \(0<p_2<1\). At \(p_2=1\), \(G(t)=1\) for every \(t\), so strict growth fails. Moreover,

\[\Delta^2G(t)=-p_2^2(1-p_2)^{t+1}<0\]

only for \(0<p_2<1\). Summing gives strict statements only when at least one unfamiliar language is present.

**Verdict to write at the bottom:** “Weak result verified; strict result needs a nonempty unfamiliar set and \(0<p_2<1\).”
