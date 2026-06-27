# Progressive Design Study Plan

## File Purpose

This file is the task/status board for studying Ben's progressive lens design work. It should answer: what was done, what is active, what is next, and which note documents each step.

Detailed Codex behavior rules live in `AGENTS.md`. Folder architecture lives in `ARCHITECTURE.md`.

## Status Key

- `done`: read and documented enough for now
- `active`: current study step
- `next`: next planned step
- `pending`: planned but not ready yet
- `optional`: useful support step, not blocking
- `blocked`: cannot continue without missing input or decision
- `skipped`: intentionally deferred

## Current Focus

- Active step: Step 06 - Branch Decision
- Completed step: Step 05 - Prism Thinning
- Current decision: proceed to Round 2 atomic concept harmonization before Round 3 code reading. Round 2 notes must be Obsidian-compliant, generic/reusable, and useful for engineering code inspection, clinical application, and industrial/manufacturing reasoning.

## Source Hygiene Notes

- Files larger than 300 MB from Ben's imported `Reference/BW Work` folder have been removed or omitted from this study copy. Current scan found no files over 300 MB inside `Reference/BW Work`.
- Git history cleanup target: historical 350.3 MB blob `Progressive Design/Reference/BW Work/02-ExampleMatlabDesignScripts/PAL_Optimization_Example_00.mat` should not remain in pushable history.

## Task Track

1. **Step 01 - PAL Design Summary**
   - Status: `done`
   - Source: `Reference/BW Work/00-PowerPointSiummaries/PAL Design Summary.pptx`
   - Note: `Notes/Round 1 - Study Notes/Study Note 01 - PAL Design Summary.md`
   - Purpose: orient to Ben's current MATLAB implementation, file roles, optimization status, and planned improvements.
   - Last update: 2026-06-26
   - Next action: none.

2. **Step 02 - Design of Progressive Spectacle Lenses V1**
   - Status: `done`
   - Source: `Reference/BW Work/00-PowerPointSiummaries/Design of Progressive Spectacle Lenses_V1.pptx`
   - Note: `Notes/Round 1 - Study Notes/Study Note 02 - Design of Progressive Spectacle Lenses V1.md`
   - Purpose: capture Ben's broader PAL design notebook, literature map, design questions, and early optimization context.
   - Last update: 2026-06-26
   - Next action: none; live inquiry blocks are already captured in the note.

3. **Step 03 - Alonso Progressive Lenses Chapter**
   - Status: `done`
   - Sources:
     - `Reference/BW Work/01-References_PALdesign/ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`
     - `Reference/Modern Ophthalmic Optics (José Alonso, José A. Gómez-Pedrero etc.) (z-library.sk, 1lib.sk, z-lib.sk).pdf`
   - Note: `Notes/Round 1 - Study Notes/Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses.md`
   - Purpose: validate PAL geometry, surface/Hessian representation, Minkwitz theorem, low-curvature model, local dioptric power, reference points, user power, optimization framing, and surface compatibility.
   - Last update: 2026-06-27
   - Next action: optional figure-level review only; otherwise use this note as support for Step 04 and later Round 2 extraction.

4. **Step 04 - SOLA / Meister PAL Fundamentals**
   - Status: `done`
   - Source: `Reference/BW Work/01-References_PALdesign/Fundamentals of Progressive Addition Lens Design_MeistgerSOLA1998.pdf`
   - Note: `Notes/Round 1 - Study Notes/Study Note 04 - Fundamentals of Progressive Addition Lens Design.md`
   - Purpose: validate conventional PAL geometry, hard/soft design, corridor/add tradeoffs, and unwanted astigmatism distribution.
   - Last update: 2026-06-27
   - Next action: optional figure-level review only; otherwise use this note as support for Step 06 and later Round 2 extraction.

5. **Step 05 - Prism Thinning**
   - Status: `done`
   - Source: `Reference/BW Work/01-References_PALdesign/understanding prism-thinning_Meister_SOLA_1998.pdf`
   - Note: `Notes/Round 1 - Study Notes/Study Note 05 - Understanding Prism Thinning.md`
   - Purpose: document equi-thinning, yoked vertical prism, frame/fitting dependencies, and thickness results.
   - Last update: 2026-06-27
   - Next action: use as support for Round 2 notes on PAL thickness geometry, equi-thinning, yoked prism, and PRP verification.

6. **Step 06 - Branch Decision**
   - Status: `done`
   - Source: current Round 1 notes
   - Note: none yet
   - Purpose: decide whether to continue targeted references, begin Round 2 concept harmonization, or start reading Ben's code.
   - Last update: 2026-06-27
   - Decision: begin Round 2 atomic concept harmonization before Round 3 code reading.
   - Round 2 rule: notes must be independent Obsidian atoms, not chapter sections or Ben-code-only checklists. Each note should answer one precise engineering, clinical, industrial, equation, design-rule, comparison, algorithm, or open-question prompt when opened alone.
   - Extraction priorities:
     - Engineering/code inspection: sag surface, sphere/paraboloid examples, sag Hessian matrix, principal curvatures, mean power, surface astigmatism, Hessian approximation limit, meridian profile, polynomial/spline correction, target maps, merit function.
     - Clinical/application: unwanted astigmatism, clear zones, hard/soft design, corridor/add tradeoffs, swim/skew distortion, fitting geometry, yoked prism, vertical prism imbalance.
     - Industrial/product: prism thinning, equi-thinning, center/edge thickness, PRP/DRP/NRP markings, frame shape dependence, computed prism thinning, symmetrical/asymmetrical and prescription-specific PAL design.
   - Next action: start Step 10 Round 2 extraction in small batches, beginning with atoms needed to audit Ben's sag, power, cylinder, target, and optimizer code.

## Backlog

7. **Ray / Wavefront Optimization References**
   - Status: `pending`
   - Sources:
     - `Reference/BW Work/01-References_PALdesign/UsingWavefrontTracingVisualizationOptimizationPALS_Loos1998.pdf`
     - `Reference/BW Work/01-References_PALdesign/loos_Greiner_Seidel_PAL.pdf`
   - Purpose: compare surface power/cylinder optimization with as-worn ray tracing.

8. **Sheedy / Rotlex Measurement References**
   - Status: `pending`
   - Sources:
     - `Reference/BW Work/01-References_PALdesign/Sheedy Correlation Analysis OVS2004.pdf`
     - `Reference/BW Work/01-References_PALdesign/Sheedy PAL Rotlex Comparison.pdf`
     - `Reference/BW Work/01-References_PALdesign/Progressive_addition_lenses_-_Matching_the_specifi._Sheedy2004pdf.pdf`
   - Purpose: understand measured PAL maps and commercial-design comparison.

9. **Freeform / Personalized PAL References**
   - Status: `pending`
   - Source: `Reference/BW Work/01-References_PALdesign/Optics_of_Freeform_progressive_lenses_Meister CE credit.pdf`
   - Purpose: understand freeform/as-worn/personalized PAL design.

10. **Round 2 Concept Harmonization**
   - Status: `active`
   - Source: completed Round 1 study notes
   - Purpose: create Obsidian-compliant atomic notes across engineering/mathematical, clinical/application, and industrial/product layers. The first batch should support detailed review of Ben's MATLAB implementation while remaining generic and reusable.
   - Current state: full candidate concept pool has been created as raw Round 2 atomic notes. The first engineering/code-audit batch is more detailed; the remaining notes are concise raw atoms ready to deepen during source/code review.
   - Created first engineering/code-audit atom batch:
     - `Notes/Round 2 - Atomic Knowledge/Concept - Sag Surface.md`
     - `Notes/Round 2 - Atomic Knowledge/Concept - Sag Hessian Matrix.md`
     - `Notes/Round 2 - Atomic Knowledge/Equation - Principal Curvatures From Sag Hessian.md`
     - `Notes/Round 2 - Atomic Knowledge/Equation - Mean Power From Sag Hessian.md`
     - `Notes/Round 2 - Atomic Knowledge/Equation - Surface Astigmatism From Sag Hessian.md`
     - `Notes/Round 2 - Atomic Knowledge/Comparison - Sphere Versus Paraboloid Curvature.md`
     - `Notes/Round 2 - Atomic Knowledge/Concept - Hessian Approximation Limit.md`
   - Created full raw atom coverage for the agreed concept list: surface geometry/math, PAL optical design, code-audit parameterization, clinical/wearer application, industrial/manufacturing/product, and bridge atoms.
   - Next action: deepen and validate notes in small batches while reading Ben's code, beginning with PAL-specific sag construction: progressive sag surface, meridian power/sag profile, zero-cylinder corridor condition, polynomial correction terms, spline correction, target power map, target cylinder map, and merit function.

11. **Round 3 Ben Code Reading / Running**
   - Status: `pending`
   - Sources:
     - `Reference/BW Work/02-ExampleMatlabDesignScripts/PAL_Optimization_Example_00.m`
     - `Reference/BW Work/02-ExampleMatlabDesignScripts/PAL_Optimization_Example_01.m`
     - `Reference/BW Work/03-MatlabCodeForExamples/MatlabFiles/`
   - Purpose: understand and validate Ben's executable MATLAB implementation after concept support is stable.

## Update Log

- 2026-06-26: Converted `PLAN.md` into a task/status board focused on numbered study steps and editable statuses.
- 2026-06-26: Existing study notes numbered as Step 01 and Step 02.
- 2026-06-26: Step 03 Alonso source-support note created as raw/active.
- 2026-06-26: Templates and note-format instructions moved to `AGENTS.md`.
- 2026-06-26: Added Step 02 inquiry on PAL surface representation and Ben's read-only sag-function code pattern.
- 2026-06-26: Added Alonso-specific surface representation to Step 03: Monge chart `z(x,y)`, Hessian, umbilical meridian, and `q_n(y) x^n` expansion.
- 2026-06-26: Added Step 03 hypothesis on Hessian approximation versus true sphere curvature away from the vertex.
- 2026-06-26: Workflow rule updated: conceptual chat is not automatically added to study notes; notes are updated only when explicitly requested.
- 2026-06-27: Added Step 03 Hessian matrix section covering surface examples, PAL application, and exact-geometry warning.
- 2026-06-27: Expanded Step 03 with full-book Alonso context: Chapter 2 surface/Hessian machinery, Appendix C surface geometry, Appendix D local dioptric power matrix, and section 8.4 progressive-lens extract.
- 2026-06-27: Added an `AGENTS.md` rule to check for fuller source versions in `Reference/` when working from extracted chapters or duplicate PDFs.
- 2026-06-27: Read Alonso section 8.4 across the full chapter range and added key concepts/applications to Step 03, including reference points, surface allocation, principal curve/profile, corridor slope, peripheral optimization, performance evidence, user power, freeform/custom distinctions, and position-of-use optimization.
- 2026-06-27: Added source-hygiene note that files larger than 300 MB from Ben's imported `Reference/BW Work` folder were removed or omitted from this study copy.
- 2026-06-27: Added an `AGENTS.md` rule to document intentional size-based source omissions and not infer technical absence from them.
- 2026-06-27: Identified oversized git-history blob `Progressive Design/Reference/BW Work/02-ExampleMatlabDesignScripts/PAL_Optimization_Example_00.mat` at 350.3 MB as the cleanup target before pushing.
- 2026-06-27: Created Step 04 Meister/SOLA Round 1 study note and moved the plan focus to Step 06 branch decision.
- 2026-06-27: Created Step 05 prism-thinning Round 1 study note and marked the optional prism-thinning step done.
- 2026-06-27: Resolved Step 06: proceed to Round 2 Obsidian-compliant atomic concept harmonization before code reading, with engineering, clinical/application, and industrial/product atoms prioritized for later Ben-code inspection.
- 2026-06-27: Created the first Round 2 engineering/code-audit atom batch covering sag surface, sag Hessian, principal curvatures, mean power, surface astigmatism, sphere/paraboloid curvature, and Hessian approximation limits.
- 2026-06-27: Materialized the full agreed Round 2 candidate concept list as raw atomic notes under `Notes/Round 2 - Atomic Knowledge/`; detailed validation will proceed in small batches during code/source review.
