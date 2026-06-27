# Progressive Design Vault Architecture

## File Purpose

This file proposes the folder and note architecture for the progressive lens design vault. It explains where source material, study notes, concept notes, run notes, and synthesis maps should live so the vault stays clean while supporting Codex, Obsidian, and GitHub workflows.

## Architecture Principle

The vault should separate evidence, study, synthesis, and execution.

```text
Reference/          immutable source material
Notes/              derived Obsidian notes layer
Workspaces/         optional writable copies and experiments
```

`Reference/` is read-only. Do not write, rename, edit, or reorganize files there.

`Notes/` is the main Obsidian knowledge layer. It contains study notes, atomic concepts, MOCs, questions, comparisons, glossaries, and run notes.

`Workspaces/` is optional. Use it only when code must be copied out of `Reference/` for execution, debugging, or controlled experiments.

## Proposed Root Structure

```text
Progressive Design/
  AGENTS.md
  PLAN.md
  ARCHITECTURE.md
  Reference/
  Notes/
  Workspaces/
```

## Reference

```text
Reference/
  BW Work/
    00-PowerPointSiummaries/
    01-References_PALdesign/
    02-ExampleMatlabDesignScripts/
    03-MatlabCodeForExamples/
```

Purpose:

- preserve Ben Woolley's original material
- preserve external PDFs, slides, scripts, spreadsheets, data, and archives
- provide stable source paths for all derived notes

Rules:

- read only
- no formatting cleanup
- no renaming for aesthetics
- no code edits to make examples run

## Notes

Recommended structure:

```text
Notes/
  Round 1 - Study Notes/
  Round 2 - Atomic Knowledge/
    MOCs/
  Round 3 - Run and Validation/
```

This structure is a working proposal. It should be created when needed, not all at once unless the user asks for scaffolding.

Naming principle:

- folders show the workflow stage
- filenames show the note type
- MOCs live under `Round 2 - Atomic Knowledge/` because they are concept-graph navigation surfaces. They can later link Round 1 and Round 3 notes, but they should not sit beside the round folders.

Avoid making separate top-level folders for every note type unless the vault becomes large enough to need that split. Early on, `Round 2 - Atomic Knowledge/` can contain concepts, equations, design rules, algorithms, comparisons, questions, glossaries, and synthesis notes together because their filenames already identify their role.

## Round Mapping

### Round 1 - Source Study Notes

Folder:

```text
Notes/Round 1 - Study Notes/
```

Purpose:

- one study note per important source file or source item
- preserve source context before synthesis
- collect candidate concepts and questions
- avoid formal MOCs until Round 2, unless a temporary source index is needed

Example files:

```text
Study Note 01 - PAL Design Summary.md
Study Note 02 - Design of Progressive Spectacle Lenses V1.md
Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses.md
Study Note 04 - Fundamentals of Progressive Addition Lens Design.md
Study Note 05 - Understanding Prism Thinning.md
Study Note 06 - PAL Optimization Example 00.md
```

### Round 2 - Atomic Concept Graph

Folders:

```text
Notes/Round 2 - Atomic Knowledge/
Notes/Round 2 - Atomic Knowledge/MOCs/
```

Purpose:

- extract coherent concepts from Round 1 study notes
- link concepts across multiple sources
- create MOCs as navigation surfaces after enough atomic notes exist
- separate source facts from interpretation

Example files:

```text
Concept - PAL Surface Sag Model.md
Design Rule - Meridian Power Profile.md
Algorithm - Variable List to Optimizer Vector.md
Comparison - Ben MATLAB Workflow vs Zemax Ray Tracing.md
MOC - BW Progressive Lens Work.md
```

### Round 3 - Code Execution And Validation

Folder:

```text
Notes/Round 3 - Run and Validation/
```

Optional writable code area:

```text
Workspaces/
  BW Matlab Reproduction/
```

Purpose:

- document runnable examples
- record environment assumptions
- compare generated outputs against Ben's expected artifacts
- capture warnings, errors, dependencies, and behavior

Example files:

```text
Run Note - PAL Optimization Example 00.md
Environment Note - BW MATLAB Dependencies.md
Validation Note - Example 00 Output Comparison.md
Question - Runtime Differences From Ben Outputs.md
```

## Naming Rules

Use descriptive note prefixes:

```text
Study Note NN - <source file stem>.md
Concept - <name>.md
Equation - <name>.md
Design Rule - <name>.md
Algorithm - <name>.md
Code Map - <module or workflow>.md
Comparison - <A vs B>.md
Question - <uncertainty>.md
Glossary - <scope>.md
MOC - <topic>.md
Run Note - <script or workflow>.md
Validation Note - <output or behavior>.md
Environment Note - <environment>.md
```

Every markdown file should include `## File Purpose` near the top.

## When To Create Folders

Create folders lazily.

- If there are only a few notes, keeping them directly under `Notes/` is acceptable.
- Once a category grows beyond a handful of files, create the corresponding subfolder.
- Do not create empty scaffolding unless it clarifies the next work step.
- Do not move existing notes just to satisfy the architecture unless the user asks.

## GitHub Role

Git should track the evolution of understanding.

Good commits should be small and meaningful:

```text
Add Round 1 study note for PAL Design Summary
Extract surface sag concept from BW study notes
Document MATLAB dependency assumptions
Add validation note for Example 00 run
```

Before committing:

- confirm `Reference/` has no changes
- confirm new markdown files include `## File Purpose`
- confirm study notes link to source paths
- confirm concept notes link back to study notes
- confirm run notes record environment and commands
