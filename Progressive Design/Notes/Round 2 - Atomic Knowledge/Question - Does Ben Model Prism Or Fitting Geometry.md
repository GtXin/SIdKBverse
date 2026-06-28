---
type: question
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 05 - Understanding Prism Thinning]]"
related:
  - "[[Clinical Concept - Yoked Vertical Prism]]"
  - "[[Clinical Concept - Vertical Prism Imbalance]]"
  - "[[Bridge - PAL Theory To Ben MATLAB Code]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "engineering"
  - "code-audit"
---

# Question - Does Ben Model Prism Or Fitting Geometry

## Definition

This question asks whether Ben's implementation includes PRP, fitting height, vertex distance, pantoscopic tilt, wrap, or prism effects.

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

This Round 2 atomic note defines `Does Ben Model Prism Or Fitting Geometry` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 05 - Understanding Prism Thinning]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Clinical Concept - Yoked Vertical Prism]]
- [[Clinical Concept - Vertical Prism Imbalance]]
- [[Bridge - PAL Theory To Ben MATLAB Code]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
