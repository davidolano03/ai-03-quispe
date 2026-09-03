<!-- BEGIN GENERATED PAPER FOLDER README -->
# Agentic Delegation and the Language Frontier of Software Developers

| Field | Value |
|---|---|
| Final status | Partially formalized: five proposition endpoints compile; full source-semantic audit remains open |
| Paper reference | Agentic Delegation and the Language Frontier of Software Developers by Alexander Quispe and Kevin Xu; arXiv v2, 2026-07-07. |
| Lines of Code | 281 |

## Key Links

- Final validation report: [FINAL_VALIDATION_REPORT.md](FINAL_VALIDATION_REPORT.md)
- Dependency DAG: [DependencyDAG.tex](docs/DependencyDAG.tex)
- Compact Lean interface: [PaperInterface.lean](PaperInterface.lean)
- Source/status JSON: [status.json](status.json); [paper statement map](audit/paper_statement_map.json); [paper coverage audit](audit/paper_coverage_llm.json); [defect support audit](audit/defect_support_match_llm.json); [statement match audit](audit/statement_match_llm.json).
- Additional documentation: [FORMALIZATION_NOTES.md](docs/FORMALIZATION_NOTES.md)

## Submission note

All five paper-facing specifications have exact-type proofs in `ProofInterface.lean`. The required fast contribution check passes. The formalization is reported as partial because the generated v11 source-semantic audit ledgers have not received independent human/model closeout. Proposition 3 is proved after exposing the missing strictness conditions: a nonempty unfamiliar-language set and an interior post-agent hazard `0 < p₂ < 1`.
<!-- END GENERATED PAPER FOLDER README -->
