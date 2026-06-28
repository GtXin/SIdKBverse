---
type: concept
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 01 - PAL Design Summary]]"
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
related:
  - "[[Concept - Progressive Addition Lens]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "engineering"
---

# Concept - Toric Sag Surface

## Definition

A toric sag surface has two different principal curvatures in orthogonal meridians and is the classical surface form for combining sphere and cylinder.

## Application

### Clinical / Wearer Example

For the wearer, the surface type matters through effective power, peripheral error, distortion, thickness, and how stable the image feels away from the fitting cross.

### Engineering / Code Example

In Ben's sag code, identify whether the base term is exact sphere/conic sag, a local paraboloid approximation, a toric/cylindrical component, or a progressive/freeform correction.

### Industrial / Product Example

In manufacturing, this maps to whether the surface can be generated as a standard base curve, toric/aspheric surface, or freeform digital surface.

### Measurement / Verification Example

Check sag, slope, and curvature maps over aperture; for a sphere/paraboloid comparison, verify that exact curvature and raw sag Hessian are not being conflated off vertex.

## Meta

### File Purpose

This Round 2 atomic note defines `Toric Sag Surface` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 01 - PAL Design Summary]], [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
