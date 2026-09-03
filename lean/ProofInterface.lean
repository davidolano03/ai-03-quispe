import QX26AgenticDelegation.PaperInterface

/-!
# Proof Interface: Agentic Delegation and the Language Frontier of Software Developers

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace QX26AgenticDelegation

/--
Lean proof endpoint for `proposition1_frontier_expansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem proposition1_frontier_expansion :
  proposition1_frontier_expansionSpec := by
  unfold proposition1_frontier_expansionSpec
  classical
  intro Language languages preAgent delegated
  have hPointwise : ∀ language,
      (if 0 ≤ preAgent language then (1 : ℕ) else 0) ≤
        (if 0 ≤ max (preAgent language) (delegated language) then 1 else 0) := by
    intro language
    by_cases hActive : 0 ≤ preAgent language
    · have hStillActive :
          0 ≤ max (preAgent language) (delegated language) :=
        hActive.trans (le_max_left _ _)
      simp [hActive, hStillActive]
    · simp [hActive]
  refine ⟨hPointwise, ?_⟩
  apply Finset.sum_le_sum
  intro language _
  exact hPointwise language

/--
Lean proof endpoint for `proposition2_activation_bandSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem proposition2_activation_band :
  proposition2_activation_bandSpec := by
  unfold proposition2_activation_bandSpec
  classical
  refine ⟨?_, ?_, ?_⟩
  · intro delegationThreshold soloThreshold opportunity hThresholds
    by_cases hDelegation : delegationThreshold ≤ opportunity
    · by_cases hSolo : soloThreshold ≤ opportunity
      · have hNotBelow : ¬ opportunity < soloThreshold := not_lt.mpr hSolo
        simp [hDelegation, hSolo, hNotBelow]
      · have hBelow : opportunity < soloThreshold := lt_of_not_ge hSolo
        simp [hDelegation, hSolo, hBelow]
    · have hSolo : ¬ soloThreshold ≤ opportunity := by
        intro hSolo
        exact hDelegation (hThresholds.le.trans hSolo)
      simp [hDelegation, hSolo]
  · intro Ω measurableSpace μ probabilityMeasure opportunity
      delegationThreshold soloThreshold hMeasurable hNoAtoms hThresholds
    exact activationBandMass_eq_cdf_sub μ opportunity delegationThreshold
      soloThreshold hMeasurable hNoAtoms hThresholds
  · intro Language languages cdf generationOneThreshold generationTwoThreshold
      hMonotone hThresholds
    apply Finset.sum_nonneg
    intro language hLanguage
    exact sub_nonneg.mpr
      (hMonotone language hLanguage (hThresholds language hLanguage))

/--
Lean proof endpoint for `proposition3_dynamic_cumulative_effectSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem proposition3_dynamic_cumulative_effect :
  proposition3_dynamic_cumulative_effectSpec := by
  unfold proposition3_dynamic_cumulative_effectSpec
  classical
  intro Language languages p₁ p₂ hHazards
  dsimp only
  constructor
  · intro horizon
    apply Finset.sum_nonneg
    intro language hLanguage
    rcases hHazards language hLanguage with ⟨hP₁Nonneg, hOrdered, hP₂AtMostOne⟩
    apply sub_nonneg.mpr
    exact pow_le_pow_left₀ (by linarith : 0 ≤ 1 - p₂ language)
      (by linarith : 1 - p₂ language ≤ 1 - p₁ language) _
  · intro hNonempty hClosedFrontier horizon
    have hTermIncreases : ∀ language ∈ languages,
        ((1 - p₁ language) ^ (horizon + 1) -
            (1 - p₂ language) ^ (horizon + 1)) <
          ((1 - p₁ language) ^ (horizon + 2) -
            (1 - p₂ language) ^ (horizon + 2)) := by
      intro language hLanguage
      rcases hClosedFrontier language hLanguage with ⟨hP₁, hP₂Pos, hP₂LtOne⟩
      have hPower := pow_lt_pow_right_of_lt_one₀
        (by linarith : 0 < 1 - p₂ language)
        (by linarith : 1 - p₂ language < 1)
        (by omega : horizon + 1 < horizon + 2)
      simpa [hP₁] using sub_lt_sub_left hPower (1 : ℝ)
    constructor
    · apply Finset.sum_lt_sum
        (fun language hLanguage ↦ (hTermIncreases language hLanguage).le)
      rcases hNonempty with ⟨language, hLanguage⟩
      exact ⟨language, hLanguage, hTermIncreases language hLanguage⟩
    · have hTermIncrementsDecrease : ∀ language ∈ languages,
          (((1 - p₁ language) ^ (horizon + 3) -
                (1 - p₂ language) ^ (horizon + 3)) -
              ((1 - p₁ language) ^ (horizon + 2) -
                (1 - p₂ language) ^ (horizon + 2))) <
            (((1 - p₁ language) ^ (horizon + 2) -
                (1 - p₂ language) ^ (horizon + 2)) -
              ((1 - p₁ language) ^ (horizon + 1) -
                (1 - p₂ language) ^ (horizon + 1))) := by
        intro language hLanguage
        rcases hClosedFrontier language hLanguage with ⟨hP₁, hP₂Pos, hP₂LtOne⟩
        have hPower := pow_lt_pow_right_of_lt_one₀
          (by linarith : 0 < 1 - p₂ language)
          (by linarith : 1 - p₂ language < 1)
          (by omega : horizon + 1 < horizon + 2)
        have hScaled := mul_lt_mul_of_pos_right hPower hP₂Pos
        calc
          ((1 - p₁ language) ^ (horizon + 3) -
                (1 - p₂ language) ^ (horizon + 3)) -
              ((1 - p₁ language) ^ (horizon + 2) -
                (1 - p₂ language) ^ (horizon + 2)) =
              (1 - p₂ language) ^ (horizon + 2) * p₂ language := by
            rw [hP₁, show horizon + 3 = (horizon + 2) + 1 by omega, pow_succ]
            simp only [sub_zero, one_pow]
            ring
          _ < (1 - p₂ language) ^ (horizon + 1) * p₂ language := hScaled
          _ = ((1 - p₁ language) ^ (horizon + 2) -
                  (1 - p₂ language) ^ (horizon + 2)) -
                ((1 - p₁ language) ^ (horizon + 1) -
                  (1 - p₂ language) ^ (horizon + 1)) := by
            rw [hP₁, show horizon + 2 = (horizon + 1) + 1 by omega, pow_succ]
            simp only [sub_zero, one_pow]
            ring
      have hSummedIncrementsDecrease :
          (∑ language ∈ languages,
              (((1 - p₁ language) ^ (horizon + 3) -
                    (1 - p₂ language) ^ (horizon + 3)) -
                ((1 - p₁ language) ^ (horizon + 2) -
                    (1 - p₂ language) ^ (horizon + 2)))) <
            ∑ language ∈ languages,
              (((1 - p₁ language) ^ (horizon + 2) -
                    (1 - p₂ language) ^ (horizon + 2)) -
                ((1 - p₁ language) ^ (horizon + 1) -
                    (1 - p₂ language) ^ (horizon + 1))) := by
        apply Finset.sum_lt_sum
          (fun language hLanguage ↦ (hTermIncrementsDecrease language hLanguage).le)
        rcases hNonempty with ⟨language, hLanguage⟩
        exact ⟨language, hLanguage,
          hTermIncrementsDecrease language hLanguage⟩
      simpa only [Finset.sum_sub_distrib] using hSummedIncrementsDecrease

/--
Lean proof endpoint for `proposition4_specialist_heterogeneitySpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem proposition4_specialist_heterogeneity :
  proposition4_specialist_heterogeneitySpec := by
  unfold proposition4_specialist_heterogeneitySpec
  classical
  intro Language unfamiliar ability activation commonActivation hComparable
  constructor
  · calc
      (∑ language ∈ unfamiliar, activation language) =
          ∑ language ∈ unfamiliar, commonActivation ability := by
        apply Finset.sum_congr rfl
        intro language hLanguage
        exact hComparable language hLanguage
      _ = (unfamiliar.card : ℝ) * commonActivation ability := by simp
  constructor
  · intro lowStock highStock hStock hNonnegative
    exact mul_le_mul_of_nonneg_right (Nat.cast_le.mpr hStock) hNonnegative
  · intro stock hMonotone lowAbility highAbility hAbility
    exact mul_le_mul_of_nonneg_left (hMonotone hAbility) (Nat.cast_nonneg stock)

/--
Lean proof endpoint for `proposition5_repository_expansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem proposition5_repository_expansion :
  proposition5_repository_expansionSpec := by
  unfold proposition5_repository_expansionSpec
  classical
  intro Repository Ω measurableSpace repositories μ probabilityMeasure
    opportunity generationOneCost generationTwoCost hMeasurable hCostOrder
  have hWeak : ∀ repository ∈ repositories,
      μ.real ((opportunity repository) ⁻¹' Set.Ici (generationOneCost repository)) ≤
        μ.real ((opportunity repository) ⁻¹' Set.Ici
          (generationTwoCost repository)) := by
    intro repository hRepository
    apply MeasureTheory.measureReal_mono
    · intro state hState
      exact (hCostOrder repository hRepository).trans hState
    · finiteness
  constructor
  · exact Finset.sum_le_sum fun repository hRepository ↦ hWeak repository hRepository
  · rintro ⟨repository, hRepository, hPositiveBand⟩
    apply Finset.sum_lt_sum hWeak
    refine ⟨repository, hRepository, ?_⟩
    have hBandIdentity := upperTailMass_sub_eq_bandMass μ
      (opportunity repository) (generationTwoCost repository)
      (generationOneCost repository) (hMeasurable repository)
      (hCostOrder repository hRepository)
    linarith

end QX26AgenticDelegation
