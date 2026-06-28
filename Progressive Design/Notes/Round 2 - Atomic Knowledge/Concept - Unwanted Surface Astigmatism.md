---
type: concept
domain: progressive-lens
status: active
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

# Concept - Unwanted Surface Astigmatism

## Definition

Unwanted surface astigmatism is the cylinder-like error generated outside the desired clear zones by the geometric cost of progressive curvature.

## Application

### Clinical / Wearer Example

A real fitting example is a wearer reporting narrow computer vision, lateral blur, swim on stairs, or needing more head movement; this concept identifies which map or zone explains the complaint. The source-backed observation is that unwanted astigmatism is intrinsic to smooth progressive curvature, not merely an avoidable polishing defect.

### Engineering / Code Example

In Ben's target maps, inspect whether distance, corridor, near, and periphery receive different power/cylinder targets and weights matching the intended hard/soft behavior. A realistic target map should accept that peripheral cylinder must be redistributed, minimized, or constrained, not set to zero everywhere while mean power varies.

### Industrial / Product Example

In product comparison, this is how brands differentiate designs: wider distance/near fields, softer periphery, shorter corridors, or task-specific occupational variants. The industrial design question is where to place the unavoidable astigmatic burden so the product fits its use case.

### Measurement / Verification Example

Use mean-power and cylinder contour maps, power-profile plots, and measured commercial PAL maps to compare the intended distribution with actual lens behavior. Cylinder contours adjacent to the corridor should be interpreted relative to add, corridor length, aperture, and design softness.

## Meta

### File Purpose

This Round 2 atomic note defines `Unwanted Surface Astigmatism` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

Additional literature observation: Barbero and Gonzalez state that the major PAL limitation is the intrinsic impossibility of providing spatially varying mean curvature without introducing undesired astigmatism, except along umbilical lines. This supports treating unwanted astigmatism as a geometric design consequence.

Citation: Sergio Barbero and Maria del Mar Gonzalez, `Admissible surfaces in progressive addition lenses`, 2020, https://arxiv.org/abs/2007.02710.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Concept - Sag Surface]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
