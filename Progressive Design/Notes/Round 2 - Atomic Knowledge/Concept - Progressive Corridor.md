---
type: concept
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
---

# Concept - Progressive Corridor

## Definition

The progressive corridor is the path along which power increases from distance to near; it is a primary design constraint for add gradient and wearer movement.

## Application

### Clinical / Wearer Example

A patient example is choosing a short-corridor PAL for a shallow frame: near access improves, but peripheral unwanted astigmatism and adaptation load can increase.

### Engineering / Code Example

In Ben's code, inspect the meridian/add profile and whether the corridor is treated as an umbilical or low-cylinder path while lateral correction terms redistribute cylinder.

### Industrial / Product Example

In product design, this drives the trade between compact-frame designs, soft designs, wide clear zones, add range, and market positioning.

### Measurement / Verification Example

Check corridor power profile, cylinder contours beside the corridor, and map spacing/gradient for add and corridor-length comparisons.

## Meta

### File Purpose

This Round 2 atomic note defines `Progressive Corridor` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
