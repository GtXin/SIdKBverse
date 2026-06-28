---
type: concept
domain: progressive-lens
status: active
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

# Concept - Merit Function

## Definition

A merit function reduces optical and design errors into a scalar objective for optimization.

## Application

### Clinical / Wearer Example

A clinical application is translating wearer priorities into targets: wider distance zone, tolerable peripheral cylinder, accessible near zone, or smoother adaptation.

### Engineering / Code Example

In Ben's MATLAB, inspect how named design parameters become optimizer variables, how target/weight maps are built, and how the merit function penalizes power/cylinder errors. Barbero and Gonzalez give a PAL optimization example in which the functional penalizes cylinder and deviation from target mean curvature over the lens domain using weighting functions.

### Industrial / Product Example

In production design, these choices determine whether the optimized surface is manufacturable, stable, smooth, and repeatable across prescriptions/adds. A merit function should eventually coexist with manufacturing limits such as maximum attainable curvature or tool constraints, not only optical targets.

### Measurement / Verification Example

Validate by plotting before/after target residuals, power/cylinder maps, convergence history, and constraints after each optimization stage. A good validation plot separates power residuals from cylinder penalties so the tradeoff is visible.

## Meta

### File Purpose

This Round 2 atomic note defines `Merit Function` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 01 - PAL Design Summary]], [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

Additional literature observation: Barbero and Gonzalez write a PAL design functional over the lens domain that includes a cylinder penalty term and a target mean-curvature deviation term, each controlled by weighting functions. This directly supports reading Ben's target and weight maps as a local tradeoff specification rather than just plotting aids.

Citation: Sergio Barbero and Maria del Mar Gonzalez, `Admissible surfaces in progressive addition lenses`, 2020, https://arxiv.org/abs/2007.02710.

### Related Notes

- [[Bridge - PAL Theory To Ben MATLAB Code]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
