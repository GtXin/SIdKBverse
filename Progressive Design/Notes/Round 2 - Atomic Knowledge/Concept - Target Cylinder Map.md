---
type: concept
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 01 - PAL Design Summary]]"
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
related:
  - "[[Bridge - PAL Theory To Ben MATLAB Code]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "engineering"
  - "code-audit"
---

# Concept - Target Cylinder Map

## Definition

A target cylinder map specifies desired or allowed local cylinder/astigmatism values for optimization or evaluation.

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

This Round 2 atomic note defines `Target Cylinder Map` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 01 - PAL Design Summary]], [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Bridge - PAL Theory To Ben MATLAB Code]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
