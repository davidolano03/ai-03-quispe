# Agentic Delegation and the Language Frontier of Software Developers

This repository studies Quispe and Xu (2026), *Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub* (arXiv:2605.25438v2).

## Research question

Does an agentic coding tool expand the set of programming languages in which developers work, especially beyond their prior experience? The paper combines a delegation model with a staggered-adoption event study of Claude Code on GitHub. The sample contains 5,346 developers (2,813 early adopters and 2,533 not-yet-treated controls), 149,688 developer-months, and activity from January 2024 through April 2026.

## Agent problem

For language \(\ell\), a developer works without an agent when expected value \(V^0_\ell\ge 0\). With delegation, the relevant value is \(\max\{V^0_\ell,V^A_\ell\}\). A language is newly activated when \(V^0_\ell<0\le V^A_\ell\). Agentic AI is therefore modeled as information and delegation that changes the extensive margin, not simply as a productivity multiplier on an already chosen input.

## Main result and conditions

At adoption, developers use 2.528 more languages relative to a pre-period mean of 0.90; the estimate falls to 1.227 one month later and 0.693 two months later. New-language use rises by 1.193 at adoption relative to a 0.31 baseline, but the flow effect fades rapidly. Excluding the first Claude-associated language or all Claude-coauthored commits still leaves substantial diversification, although voluntary adoption and project shocks prevent a clean causal interpretation.

The formal result is weak frontier expansion whenever delegated value weakly dominates the solo option. Strict expansion additionally needs positive probability mass in at least one activation band. The dynamic cumulative effect is nonnegative for \(0\le p_1\le p_2\le1\). The paper's strict growth/strict concavity statement needs two missing endpoint conditions: the unfamiliar-language set must be nonempty and \(0<p_2<1\). It is false at \(p_2=1\), where the cumulative gap becomes flat after the first period.

## Repository map

- `presentation.pdf`: 20-minute presentation imported from the approved pilot repository.
- `lean/`: EconCSLib paper folder, including five proposition specifications and compiling proof endpoints.
- `hand/DERIVATION.md`: exact derivation to reproduce by hand; replace the placeholder with an authentic photo before submission.
- `prompts.md`: prompt/answer log and citation-discrepancy exercise.
- `analysis/check_prop3.py`: numerical endpoint check for Proposition 3.
- `LEAN_CHECK.md`: formal verification and contribution-check record.

## Reproducibility

The Lean endpoints were compiled against EconCSLib/Mathlib on 2026-09-03. No `sorry`, `admit`, or new axioms are used in the submitted proof files. The empirical numbers are transcribed from arXiv v2; no confidential GitHub credentials are stored in this repository.
