import Mathlib

/-!
# Paper-Facing Theorems: Agentic Delegation and the Language Frontier of Software Developers

This file is the implementation theorem layer for the source paper. Keep
source-faithful definitions and theorem wrappers here, and expose only the
compact human-review subset in `PaperInterface.lean`.

During the statement-first phase, each exact paper-facing proposition lives in a
transparent `<name>Spec : Prop` declaration in `PaperInterface.lean`; the paired
theorem/lemma endpoint belongs in `ProofInterface.lean` and has exactly that
type. Add proof implementations here only after those specifications pass v11
raw-source-to-expanded-Spec review and recursive premise provenance audit. Before full closeout, the v11
realization audit independently binds pinned source atoms to the elaborated Spec
and accounts for the complete Lean closure; a proof hole or a declaration name
is never evidence for that correspondence.
-/

namespace QX26AgenticDelegation

/-- With no atoms at thresholds, the mass of a half-open activation band is a
CDF difference. -/
lemma activationBandMass_eq_cdf_sub
    {Ω : Type} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    [MeasureTheory.IsFiniteMeasure μ] (opportunity : Ω → ℝ)
    (low high : ℝ) (hMeasurable : Measurable opportunity)
    (hNoAtoms : ∀ threshold : ℝ,
      μ (opportunity ⁻¹' ({threshold} : Set ℝ)) = 0)
    (hThresholds : low < high) :
    μ.real (opportunity ⁻¹' Set.Ico low high) =
      μ.real (opportunity ⁻¹' Set.Iic high) -
        μ.real (opportunity ⁻¹' Set.Iic low) := by
  have hLowNull : μ.real (opportunity ⁻¹' ({low} : Set ℝ)) = 0 :=
    (MeasureTheory.measureReal_eq_zero_iff
      (μ := μ) (s := opportunity ⁻¹' ({low} : Set ℝ))).mpr (hNoAtoms low)
  have hHighNull : μ.real (opportunity ⁻¹' ({high} : Set ℝ)) = 0 :=
    (MeasureTheory.measureReal_eq_zero_iff
      (μ := μ) (s := opportunity ⁻¹' ({high} : Set ℝ))).mpr (hNoAtoms high)
  have hIooIco :
      μ.real (opportunity ⁻¹' Set.Ioo low high) =
        μ.real (opportunity ⁻¹' Set.Ico low high) := by
    apply MeasureTheory.measureReal_eq_measureReal_of_null_diff
      (Set.preimage_mono Set.Ioo_subset_Ico_self)
    have hDifference :
        (opportunity ⁻¹' Set.Ico low high) \
            (opportunity ⁻¹' Set.Ioo low high) =
          opportunity ⁻¹' ({low} : Set ℝ) := by
      rw [← Set.preimage_diff, Set.Ico_diff_Ioo_same hThresholds]
    simpa [hDifference] using hLowNull
  have hIooIoc :
      μ.real (opportunity ⁻¹' Set.Ioo low high) =
        μ.real (opportunity ⁻¹' Set.Ioc low high) := by
    apply MeasureTheory.measureReal_eq_measureReal_of_null_diff
      (Set.preimage_mono Set.Ioo_subset_Ioc_self)
    have hDifference :
        (opportunity ⁻¹' Set.Ioc low high) \
            (opportunity ⁻¹' Set.Ioo low high) =
          opportunity ⁻¹' ({high} : Set ℝ) := by
      rw [← Set.preimage_diff, Set.Ioc_diff_Ioo_same hThresholds]
    simpa [hDifference] using hHighNull
  have hSubset :
      opportunity ⁻¹' Set.Iic low ⊆ opportunity ⁻¹' Set.Iic high :=
    Set.preimage_mono (Set.Iic_subset_Iic.mpr hThresholds.le)
  have hMeasurableLow : MeasurableSet (opportunity ⁻¹' Set.Iic low) :=
    measurableSet_Iic.preimage hMeasurable
  have hDifference :
      (opportunity ⁻¹' Set.Iic high) \
          (opportunity ⁻¹' Set.Iic low) =
        opportunity ⁻¹' Set.Ioc low high := by
    ext state
    simp only [Set.mem_diff, Set.mem_preimage, Set.mem_Iic, Set.mem_Ioc]
    constructor
    · rintro ⟨hAtMostHigh, hNotAtMostLow⟩
      exact ⟨lt_of_not_ge hNotAtMostLow, hAtMostHigh⟩
    · rintro ⟨hAboveLow, hAtMostHigh⟩
      exact ⟨hAtMostHigh, not_le_of_gt hAboveLow⟩
  calc
    μ.real (opportunity ⁻¹' Set.Ico low high) =
        μ.real (opportunity ⁻¹' Set.Ioo low high) := hIooIco.symm
    _ = μ.real (opportunity ⁻¹' Set.Ioc low high) := hIooIoc
    _ = μ.real (opportunity ⁻¹' Set.Iic high) -
          μ.real (opportunity ⁻¹' Set.Iic low) := by
      rw [← hDifference]
      exact MeasureTheory.measureReal_diff hSubset hMeasurableLow

/-- Lowering a repository-entry threshold adds exactly the intervening band. -/
lemma upperTailMass_sub_eq_bandMass
    {Ω : Type} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    [MeasureTheory.IsFiniteMeasure μ] (opportunity : Ω → ℝ)
    (low high : ℝ) (hMeasurable : Measurable opportunity)
    (hThresholds : low ≤ high) :
    μ.real (opportunity ⁻¹' Set.Ici low) -
        μ.real (opportunity ⁻¹' Set.Ici high) =
      μ.real (opportunity ⁻¹' Set.Ico low high) := by
  have hSubset :
      opportunity ⁻¹' Set.Ici high ⊆ opportunity ⁻¹' Set.Ici low := by
    intro state hState
    exact hThresholds.trans hState
  have hMeasurableHigh : MeasurableSet (opportunity ⁻¹' Set.Ici high) :=
    measurableSet_Ici.preimage hMeasurable
  have hDifference :
      (opportunity ⁻¹' Set.Ici low) \
          (opportunity ⁻¹' Set.Ici high) =
        opportunity ⁻¹' Set.Ico low high := by
    ext state
    simp only [Set.mem_diff, Set.mem_preimage, Set.mem_Ici, Set.mem_Ico]
    exact and_congr_right fun _ ↦ not_le
  rw [← hDifference]
  exact (MeasureTheory.measureReal_diff hSubset hMeasurableHigh).symm

/-- The printed strict-growth clause of Proposition 3 fails at the allowed
endpoint `p₂ = 1`: the cumulative gap is already saturated at horizon zero. -/
theorem proposition3_strict_growth_fails_at_unit_hazard :
    ¬ ∀ horizon : ℕ,
      ((1 - (0 : ℝ)) ^ (horizon + 1) - (1 - (1 : ℝ)) ^ (horizon + 1)) <
        ((1 - (0 : ℝ)) ^ (horizon + 2) - (1 - (1 : ℝ)) ^ (horizon + 2)) := by
  intro hStrict
  have hAtZero := hStrict 0
  norm_num at hAtZero

end QX26AgenticDelegation
