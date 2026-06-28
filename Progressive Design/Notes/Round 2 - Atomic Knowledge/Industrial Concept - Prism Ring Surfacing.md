---
type: concept
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 05 - Understanding Prism Thinning]]"
related:
  - "[[Clinical Concept - Yoked Vertical Prism]]"
  - "[[Clinical Concept - Vertical Prism Imbalance]]"
tags:
  - "pal"
  - "round-2"
  - "atomic"
  - "industrial"
---

# Industrial Concept - Prism Ring Surfacing

## Definition

Prism ring surfacing tilts the lens during conventional generation to create prismatic effect for thinning.

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

This Round 2 atomic note defines `Prism Ring Surfacing` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 05 - Understanding Prism Thinning]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Clinical Concept - Yoked Vertical Prism]]
- [[Clinical Concept - Vertical Prism Imbalance]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
