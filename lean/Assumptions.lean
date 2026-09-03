import QX26AgenticDelegation.MainTheorems

/-!
# Paper Assumptions: Agentic Delegation and the Language Frontier of Software Developers

This file is the only paper-local place for assumptions that are not derived in
Lean. Keep it small. Each declaration must be explicitly stated by the paper,
listed in `status.json` `review_surface.assumption_names`, and judged in
`audit/assumption_match_llm.json` as a true source/model assumption rather than a
proof convenience.

Use `-- audit-premise: <exact Lean binder>` comments to route hidden theorem
premises to an approved assumption declaration when the audit reports an exact
binder string.

Start empty. Add a proposition here only after locating it as a literal source
antecedent. Never move an unproved lemma or target conclusion here merely to
make a statement skeleton compile.
-/

namespace QX26AgenticDelegation

/-- Assumption 1: conversational augmentation pays only where the developer
already has a language-specific foothold. -/
def augmentationRequiresFoothold
    (unfamiliarSkill familiarSkill productivityGain interactionCost : ℝ) : Prop :=
  productivityGain * unfamiliarSkill - interactionCost ≤ 0 ∧
    0 < productivityGain * familiarSkill - interactionCost

/-- Assumption 2, represented through its order implications: verification
cost and residual error weakly fall with ability, familiarity, and agent
capability. The paper writes the corresponding derivative signs. -/
def verificationTechnology
    (verificationCost : ℝ → ℝ → ℝ)
    (residualError : ℝ → ℝ → ℝ → ℝ) : Prop :=
  (Antitone fun ability ↦ verificationCost ability) ∧
    (∀ ability, Antitone fun skill ↦ verificationCost ability skill) ∧
    (∀ skill capability, Antitone fun ability ↦ residualError ability skill capability) ∧
    (∀ ability capability, Antitone fun skill ↦ residualError ability skill capability) ∧
    (∀ ability skill, Antitone fun capability ↦ residualError ability skill capability)

/-- Assumption 3: unfamiliar-language candidates have a common nonnegative
activation increment, increasing with general ability when verification
improves with ability. -/
def comparableUnfamiliarCandidates
    {Language : Type} (unfamiliar : Finset Language) (ability capability : ℝ)
    (activation : Language → ℝ) (commonActivation : ℝ → ℝ → ℝ) : Prop :=
  (∀ language ∈ unfamiliar,
      activation language = commonActivation ability capability) ∧
    (∀ candidateAbility, 0 ≤ commonActivation candidateAbility capability) ∧
    Monotone fun candidateAbility ↦ commonActivation candidateAbility capability

end QX26AgenticDelegation
