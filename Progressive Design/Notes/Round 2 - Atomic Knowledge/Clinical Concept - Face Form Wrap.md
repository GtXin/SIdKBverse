---
type: concept
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
  - "[[Study Note 05 - Understanding Prism Thinning]]"
related:
  - "[[Concept - Progressive Addition Lens]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "clinical"
---

# Clinical Concept - Face Form Wrap

## Definition

Face form wrap is the horizontal curvature or wrap of the frame/lens position around the face, affecting oblique viewing geometry.

## Application

### Clinical / Wearer Example

A clinical example is a correctly designed PAL performing poorly because fitting height, monocular PD, vertex distance, pantoscopic tilt, or wrap shifts the wearer away from the intended viewing geometry.

### Engineering / Code Example

In code, this is the boundary between surface-only optimization and a full position-of-use model with eye rotation, frame geometry, lens tilt, and vertex distance.

### Industrial / Product Example

In product/lab ordering, these values become personalization or fitting inputs and can change the generated freeform surface or verification assumptions.

### Measurement / Verification Example

Verify with fitting measurements, layout marks, wearer-position data, and eventually user/as-worn power maps rather than surface power alone.

## Meta

### File Purpose

This Round 2 atomic note defines `Face Form Wrap` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]], [[Study Note 05 - Understanding Prism Thinning]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
