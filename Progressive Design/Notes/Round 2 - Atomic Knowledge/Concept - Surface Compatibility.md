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

# Concept - Surface Compatibility

## Definition

Surface compatibility means a proposed local curvature or Hessian field must be integrable into one continuous sag surface; curvature maps cannot be chosen independently at every point.

## Application

### Clinical / Wearer Example

For the wearer, surface compatibility is why a PAL cannot offer a full-field smooth add progression with no unwanted cylinder. The clinical application is expectation-setting: design can redistribute blur and distortion, but it cannot remove the geometric cost of progressive curvature.

### Engineering / Code Example

In Ben's code, treat target power and target cylinder maps as proposals that must be checked against an integrable sag surface. A merit function can penalize power and cylinder errors, but if target maps violate surface compatibility, optimization will redistribute error rather than satisfy all targets.

### Industrial / Product Example

In manufacturing, compatibility constrains whether a desired PAL optical map can become a smooth manufacturable freeform surface. Barbero and Gonzalez explicitly distinguish manufacturing constraints, such as tool-radius limits on attainable curvatures, from mathematical compatibility constraints between cylinder and mean curvature.

### Measurement / Verification Example

Check sag, slope, mean-curvature/power maps, and cylinder maps together. A surface map that looks attractive in target form still needs verification as an actual generated surface with compatible curvature fields.

## Meta

### File Purpose

This Round 2 atomic note defines `Surface Compatibility` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

Additional literature observation: Barbero and Gonzalez frame PAL optimization as a tradeoff functional between cylinder and target mean curvature, weighted over the lens domain. They argue that admissible surfaces must also satisfy compatibility conditions, so optimization should not be understood as choosing arbitrary local optical properties point by point.

Citation: Sergio Barbero and Maria del Mar Gonzalez, `Admissible surfaces in progressive addition lenses`, 2020, https://arxiv.org/abs/2007.02710.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
