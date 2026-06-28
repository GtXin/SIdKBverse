---
type: design-rule
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

# Design Rule - Avoid Unintended Vertical Imbalance

## Definition

Unintended vertical imbalance should be minimized because vertical fusional reserves are limited and symptoms can occur at small differences.

## Application

### Clinical / Wearer Example

In a PAL consultation, `Avoid Unintended Vertical Imbalance` is relevant when explaining why a wearer may experience blur, distortion, adaptation difficulty, or a fitting-dependent change in usable vision.

### Engineering / Code Example

In Ben-code inspection, `Avoid Unintended Vertical Imbalance` is a named concept to map to a specific variable, function, plot, target, constraint, or class method before deciding whether the implementation covers it.

### Industrial / Product Example

In a lab/product workflow, `Avoid Unintended Vertical Imbalance` should be checked against what can be manufactured, marked, verified, edged, fitted, or sold as a repeatable PAL design feature.

### Measurement / Verification Example

In verification, `Avoid Unintended Vertical Imbalance` should have an observable or computable check: a map, curve, prism reading, fitting measurement, tolerance, or before/after comparison.

## Meta

### File Purpose

This Round 2 atomic note defines `Avoid Unintended Vertical Imbalance` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
