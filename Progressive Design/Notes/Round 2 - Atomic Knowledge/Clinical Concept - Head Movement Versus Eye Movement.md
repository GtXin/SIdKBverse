---
type: concept
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
related:
  - "[[Concept - Progressive Addition Lens]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "clinical"
---

# Clinical Concept - Head Movement Versus Eye Movement

## Definition

Head movement versus eye movement describes the behavioral tradeoff created by clear-zone width and corridor placement.

## Application

### Clinical / Wearer Example

A real fitting example is a wearer reporting narrow computer vision, lateral blur, swim on stairs, or needing more head movement; this concept identifies which map or zone explains the complaint.

### Engineering / Code Example

In Ben's target maps, inspect whether distance, corridor, near, and periphery receive different power/cylinder targets and weights matching the intended hard/soft behavior.

### Industrial / Product Example

In product comparison, this is how brands differentiate designs: wider distance/near fields, softer periphery, shorter corridors, or task-specific occupational variants.

### Measurement / Verification Example

Use mean-power and cylinder contour maps, power-profile plots, and possibly measured commercial PAL maps to compare the intended distribution with actual lens behavior.

## Meta

### File Purpose

This Round 2 atomic note defines `Head Movement Versus Eye Movement` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
