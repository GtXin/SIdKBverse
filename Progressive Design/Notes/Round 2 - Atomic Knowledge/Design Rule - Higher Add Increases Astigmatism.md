---
type: design-rule
domain: progressive-lens
status: needs-review
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
---

# Design Rule - Higher Add Increases Astigmatism

## Definition

For a comparable design and aperture, higher add requires a larger curvature change and tends to increase unwanted astigmatism.

## Application

### Clinical / Wearer Example

A patient example is choosing a short-corridor PAL for a shallow frame: near access improves, but peripheral unwanted astigmatism and adaptation load can increase.

### Engineering / Code Example

In Ben's code, inspect the meridian/add profile and whether the corridor is treated as an umbilical or low-cylinder path while lateral correction terms redistribute cylinder.

### Industrial / Product Example

In product design, this drives the trade between compact-frame designs, soft designs, wide clear zones, add range, and market positioning.

### Measurement / Verification Example

Check corridor power profile, cylinder contours beside the corridor, and map spacing/gradient for add and corridor-length comparisons.

## Meta

### File Purpose

This Round 2 atomic note defines `Higher Add Increases Astigmatism` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Concept - Sag Surface]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
