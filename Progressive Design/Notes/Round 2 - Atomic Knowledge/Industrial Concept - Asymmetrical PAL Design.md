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
  - "industrial"
---

# Industrial Concept - Asymmetrical PAL Design

## Definition

An asymmetrical PAL uses distinct right/left designs to control nasal and temporal astigmatism distributions independently.

## Application

### Clinical / Wearer Example

A wearer-facing example is a personalized or asymmetric PAL improving gaze-zone alignment or nasal/temporal balance compared with a generic symmetric design.

### Engineering / Code Example

In code, look for whether design parameters change by add, prescription, eye side, frame, or wearer geometry rather than using one generic surface.

### Industrial / Product Example

In product design, this corresponds to multi-design, prescription-specific, right/left, and freeform manufacturing strategies.

### Measurement / Verification Example

Compare right/left maps, add-specific design variants, or personalized order data against the delivered lens markings and measured maps.

## Meta

### File Purpose

This Round 2 atomic note defines `Asymmetrical PAL Design` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
