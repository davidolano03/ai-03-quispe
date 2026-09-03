import QX26AgenticDelegation.MainTheorems
import QX26AgenticDelegation.Assumptions

/-!
# Human-Facing Paper Interface: Agentic Delegation and the Language Frontier of Software Developers

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `EconCSLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`; its temporary
  proof body may be an unfinished placeholder only in a private draft. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus recursive
  premise/conclusion provenance on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, replace the `ProofInterface.lean` placeholder with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

- `proposition1_frontier_expansionSpec` -> `proposition1_frontier_expansion`: Proposition 1 (Frontier expansion), Section 4.2, Proposition 1, page 15.
- `proposition2_activation_bandSpec` -> `proposition2_activation_band`: Proposition 2 (Activation band for unfamiliar languages), Section 4.2, Proposition 2, pages 15-16.
- `proposition3_dynamic_cumulative_effectSpec` -> `proposition3_dynamic_cumulative_effect`: Proposition 3 (Dynamic cumulative-language effect), Section 4.3, Proposition 3, page 17; proof in Appendix A.6, pages 63-64.
- `proposition4_specialist_heterogeneitySpec` -> `proposition4_specialist_heterogeneity`: Proposition 4 (Specialist and ability heterogeneity), Appendix A.5, Proposition 4, pages 62-63.
- `proposition5_repository_expansionSpec` -> `proposition5_repository_expansion`: Proposition 5 (Repository expansion), Appendix A.8, Proposition 5, page 65.
-/

namespace QX26AgenticDelegation

/--
Proposition 1 (Frontier expansion)

Paper statement: For every developer, language, date, and opportunity realization, Z^2_{ik,t} >= Z^1_{ik,t}, hence N^2_{it} >= N^1_{it} path by path.

Source location: Section 4.2, Proposition 1, page 15
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition1_frontier_expansionSpec : Prop :=
  ∀ {Language : Type} (languages : Finset Language) (preAgent delegated : Language → ℝ), (∀ language, (if 0 ≤ preAgent language then (1 : ℕ) else 0) ≤ (if 0 ≤ max (preAgent language) (delegated language) then (1 : ℕ) else 0)) ∧ (∑ language ∈ languages, if 0 ≤ preAgent language then (1 : ℕ) else 0) ≤ ∑ language ∈ languages, if 0 ≤ max (preAgent language) (delegated language) then (1 : ℕ) else 0

/--
Proposition 2 (Activation band for unfamiliar languages)

Paper statement: For an unfamiliar language satisfying Assumption 1, if B_{ik,t}>0, then Z^2_{ik,t}-Z^1_{ik,t}=1[T^D_{ik,t}<=omega_{ik,t}<T^S_{ik,t}]. If the conditional opportunity CDF F_{ik,t} is continuous, the probability that delegation activates the language is F_{ik,t}(T^S_{ik,t})-F_{ik,t}(T^D_{ik,t}), and expected language-count expansion is the sum over k of F_{ik,t}(T^1_{ik,t})-F_{ik,t}(T^2_{ik,t}), which is nonnegative.

Source location: Section 4.2, Proposition 2, pages 15-16
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition2_activation_bandSpec : Prop :=
  (∀ (delegationThreshold soloThreshold opportunity : ℝ), delegationThreshold < soloThreshold → ((if delegationThreshold ≤ opportunity then (1 : ℤ) else 0) - (if soloThreshold ≤ opportunity then (1 : ℤ) else 0) = if delegationThreshold ≤ opportunity ∧ opportunity < soloThreshold then (1 : ℤ) else 0)) ∧ (∀ {Ω : Type} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ] (opportunity : Ω → ℝ) (delegationThreshold soloThreshold : ℝ), Measurable opportunity → (∀ threshold : ℝ, μ (opportunity ⁻¹' ({threshold} : Set ℝ)) = 0) → delegationThreshold < soloThreshold → μ.real (opportunity ⁻¹' Set.Ico delegationThreshold soloThreshold) = μ.real (opportunity ⁻¹' Set.Iic soloThreshold) - μ.real (opportunity ⁻¹' Set.Iic delegationThreshold)) ∧ (∀ {Language : Type} (languages : Finset Language) (cdf : Language → ℝ → ℝ) (generationOneThreshold generationTwoThreshold : Language → ℝ), (∀ language ∈ languages, Monotone (cdf language)) → (∀ language ∈ languages, generationTwoThreshold language ≤ generationOneThreshold language) → 0 ≤ ∑ language ∈ languages, (cdf language (generationOneThreshold language) - cdf language (generationTwoThreshold language)))

/--
Proposition 3 (Dynamic cumulative-language effect)

Paper statement: For initially unfamiliar languages with per-period first-use hazards p^g_{ik}, if p^2_{ik}>=p^1_{ik}, then Delta C_i(s)=sum_k[(1-p^1_{ik})^(s+1)-(1-p^2_{ik})^(s+1)]>=0. In the closed-frontier benchmark p^1_{ik}=0<p^2_{ik}, the effect is strictly increasing and concave over the observed horizon.

Source location: Section 4.3, Proposition 3, page 17; proof in Appendix A.6, pages 63-64
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition3_dynamic_cumulative_effectSpec : Prop :=
  by
    classical
    exact ∀ {Language : Type} (languages : Finset Language)
      (p₁ p₂ : Language → ℝ),
      (∀ language ∈ languages,
        0 ≤ p₁ language ∧ p₁ language ≤ p₂ language ∧ p₂ language ≤ 1) →
      let cumulativeGap : ℕ → ℝ := fun horizon ↦
        ∑ language ∈ languages,
          ((1 - p₁ language) ^ (horizon + 1) -
            (1 - p₂ language) ^ (horizon + 1))
      (∀ horizon : ℕ, 0 ≤ cumulativeGap horizon) ∧
        (languages.Nonempty →
          (∀ language ∈ languages,
            p₁ language = 0 ∧ 0 < p₂ language ∧ p₂ language < 1) →
          ∀ horizon : ℕ,
            cumulativeGap horizon < cumulativeGap (horizon + 1) ∧
            cumulativeGap (horizon + 2) - cumulativeGap (horizon + 1) <
              cumulativeGap (horizon + 1) - cumulativeGap horizon)

/--
Proposition 4 (Specialist and ability heterogeneity)

Paper statement: Under Assumption 3, expected expansion into initially unfamiliar languages is E[E_i | a_i,U_i]=U_i p_i(a_i,A). It is increasing in the stock U_i of unfamiliar-language candidates and in general ability a_i. The largest extensive-margin gains accrue to high-ability specialists.

Source location: Appendix A.5, Proposition 4, pages 62-63
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition4_specialist_heterogeneitySpec : Prop :=
  ∀ {Language : Type} (unfamiliar : Finset Language) (ability : ℝ) (activation : Language → ℝ) (commonActivation : ℝ → ℝ), (∀ language ∈ unfamiliar, activation language = commonActivation ability) → (∑ language ∈ unfamiliar, activation language) = (unfamiliar.card : ℝ) * commonActivation ability ∧ (∀ lowStock highStock : ℕ, lowStock ≤ highStock → 0 ≤ commonActivation ability → (lowStock : ℝ) * commonActivation ability ≤ (highStock : ℝ) * commonActivation ability) ∧ (∀ stock : ℕ, Monotone commonActivation → Monotone (fun a : ℝ => (stock : ℝ) * commonActivation a))

/--
Proposition 5 (Repository expansion)

Paper statement: Suppose each repository requires at least one programming language and carries an entry cost weakly decreasing when the developer can activate that language. If agentic delegation weakly expands the active-language set, then the expected number of repositories the developer can contribute to weakly increases. It increases strictly when some repositories require languages in the delegation activation band.

Source location: Appendix A.8, Proposition 5, page 65
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition5_repository_expansionSpec : Prop :=
  ∀ {Repository Ω : Type} [MeasurableSpace Ω] (repositories : Finset Repository) (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ] (opportunity : Repository → Ω → ℝ) (generationOneCost generationTwoCost : Repository → ℝ), (∀ repository, Measurable (opportunity repository)) → (∀ repository ∈ repositories, generationTwoCost repository ≤ generationOneCost repository) → (∑ repository ∈ repositories, μ.real ((opportunity repository) ⁻¹' Set.Ici (generationOneCost repository))) ≤ (∑ repository ∈ repositories, μ.real ((opportunity repository) ⁻¹' Set.Ici (generationTwoCost repository))) ∧ ((∃ repository ∈ repositories, 0 < μ.real ((opportunity repository) ⁻¹' Set.Ico (generationTwoCost repository) (generationOneCost repository))) → (∑ repository ∈ repositories, μ.real ((opportunity repository) ⁻¹' Set.Ici (generationOneCost repository))) < (∑ repository ∈ repositories, μ.real ((opportunity repository) ⁻¹' Set.Ici (generationTwoCost repository))))

end QX26AgenticDelegation
