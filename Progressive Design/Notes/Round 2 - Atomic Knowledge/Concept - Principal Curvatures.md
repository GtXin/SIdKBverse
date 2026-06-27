---
type: concept
domain: progressive-lens
status: raw
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
related:
  - "[[Concept - Sag Hessian Matrix]]"
  - "[[Concept - Sag Surface]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "engineering"
---

# Concept - Principal Curvatures

## Definition

Principal curvatures are the maximum and minimum normal curvatures at a surface point. Their average drives mean power; their difference drives surface astigmatism.

## Application

### Engineering

Use this note as a checklist item when reading design equations, target maps, optimizer variables, or surface-analysis code. Confirm the code object, variable, or calculation that corresponds to this concept before assuming the implementation matches the optical intent.

### Clinical / Application

Record how this concept affects wearer performance, usable zones, adaptation, binocular comfort, or fitting decisions when that connection is known. If the clinical relevance is indirect, keep the link explicit rather than overstating it.

### Industrial / Product

Record how this concept affects manufacturing, verification, markings, frame/lab workflow, product design, or commercial PAL constraints when applicable.

### Implementation Hook

During Ben-code review, search for names, comments, plots, target functions, or class methods that correspond to `Principal Curvatures`. Add exact file/function references here after the code is read.

## Meta

### File Purpose

This Round 2 atomic note defines `Principal Curvatures` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Concept - Sag Surface]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
