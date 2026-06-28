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
  - "code-audit"
---

# Concept - Gated Polynomial Surface Term

## Definition

A gated polynomial surface term is active only over a selected y-range or region, allowing local correction without changing the whole surface.

## Application

### Clinical / Wearer Example

A clinical application is translating wearer priorities into targets: wider distance zone, tolerable peripheral cylinder, accessible near zone, or smoother adaptation.

### Engineering / Code Example

In Ben's MATLAB, inspect how named design parameters become optimizer variables, how target/weight maps are built, and how the merit function penalizes power/cylinder errors.

### Industrial / Product Example

In production design, these choices determine whether the optimized surface is manufacturable, stable, smooth, and repeatable across prescriptions/adds.

### Measurement / Verification Example

Validate by plotting before/after target residuals, power/cylinder maps, convergence history, and constraints after each optimization stage.

## Meta

### File Purpose

This Round 2 atomic note defines `Gated Polynomial Surface Term` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 01 - PAL Design Summary]], [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
