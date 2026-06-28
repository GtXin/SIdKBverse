---
type: concept
domain: progressive-lens
status: active
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
  - "engineering"
---

# Concept - Minkwitz Theorem

## Definition

Minkwitz theorem captures the local PAL constraint that a changing addition profile along an astigmatism-free corridor forces lateral unwanted astigmatism.

## Application

### Clinical / Wearer Example

A patient example is choosing a short-corridor PAL for a shallow frame: near access improves, but peripheral unwanted astigmatism and adaptation load can increase. The key observation is that a smooth addition profile cannot be made astigmatism-free over the whole lens; the designer chooses where the lateral astigmatism is placed and how abruptly it rises.

### Engineering / Code Example

In Ben's code, inspect the meridian/add profile and whether the corridor is treated as an umbilical or low-cylinder path while lateral correction terms redistribute cylinder. Barbero and Gonzalez summarize the classical Minkwitz theorem as linking the lateral cylinder derivative to the derivative of principal curvature along the principal line, while also showing that exact admissibility requires broader compatibility conditions.

### Industrial / Product Example

In product design, this drives the trade between compact-frame designs, soft designs, wide clear zones, add range, and market positioning. A manufacturer cannot specify arbitrary mean-power progression and zero cylinder everywhere; the optical map must still come from an admissible surface.

### Measurement / Verification Example

Check corridor power profile, cylinder contours beside the corridor, and map spacing/gradient for add and corridor-length comparisons. If add changes along an intended low-cylinder corridor, lateral cylinder growth is expected evidence of the PAL geometry, not automatically a fabrication defect.

## Meta

### File Purpose

This Round 2 atomic note defines `Minkwitz Theorem` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

Additional literature observation: Barbero and Gonzalez describe PALs as surfaces with spatially varying curvature and state that smooth PAL surfaces cannot generally provide spatially varying mean curvature without introducing undesired astigmatism except along umbilical lines. They also show that exact compatibility involves more than the classical Minkwitz expression, including geodesic curvature terms along orthogonal lines of curvature.

Citation: Sergio Barbero and Maria del Mar Gonzalez, `Admissible surfaces in progressive addition lenses`, 2020, https://arxiv.org/abs/2007.02710.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
