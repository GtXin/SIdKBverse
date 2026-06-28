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

# Industrial Concept - PAL Permanent Engravings

## Definition

PAL permanent engravings identify lens type, add, alignment, and re-marking references after ink marks are removed.

## Application

### Clinical / Wearer Example

A real patient example is replacing one PAL lens: if the new lens is prism-thinned differently from the mate, vertical image mismatch can produce eyestrain or diplopia.

### Engineering / Code Example

In design/code, check whether thickness, frame shape, PRP location, vertical prism, or prism-thinning is modeled at all, or left to downstream lab software.

### Industrial / Product Example

In lab production, this is a surfacing/verification issue: PRP prism readings, engravings, frame cutout, center/edge thickness, and computed thinning all affect whether the pair is acceptable.

### Measurement / Verification Example

Measure vertical prism at the PRP for both eyes, compare net imbalance, and check center/edge thickness before and after thinning or replacement.

## Meta

### File Purpose

This Round 2 atomic note defines `PAL Permanent Engravings` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 02 - Design of Progressive Spectacle Lenses V1]], [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]], [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Concept - Progressive Addition Lens]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
