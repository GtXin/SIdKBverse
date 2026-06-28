---
type: concept
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
  - "engineering"
---

# Concept - Principal Curvature Directions

## Definition

Principal curvature directions are the local axes associated with the principal curvatures. They carry the surface-axis information behind cylinder orientation.

## Application

### Clinical / Wearer Example

A wearer never sees the Hessian directly, but its derived mean-power and cylinder maps predict where the PAL will give clear distance/near zones versus unwanted blur.

### Engineering / Code Example

In Ben's MATLAB, inspect the derivative path from sag to `zxx`, `zyy`, `zxy`, then to principal curvatures, mean power, and cylinder. Verify unit scaling before comparing to diopters.

### Industrial / Product Example

In freeform design software, this is the internal surface-analysis layer that converts a generated sag surface into maps used for design approval and production release.

### Measurement / Verification Example

Compare computed power/cylinder maps against plotted contour maps or surface-analysis output; if possible, later compare against Rotlex/lensmeter/freeform verification data.

## Meta

### File Purpose

This Round 2 atomic note defines `Principal Curvature Directions` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Concept - Sag Surface]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
