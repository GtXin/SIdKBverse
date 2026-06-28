---
type: question
domain: progressive-lens
status: needs-review
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

# Question - Does Ben Model Binocular Performance

## Definition

This question asks whether Ben's code evaluates both eyes together, including inter-eye prism, gaze, and binocular fusion constraints.

## Application

### Clinical / Wearer Example

Clinical application is the unresolved consequence if the answer is no: the code may optimize a surface that does not yet predict wearer comfort, binocular performance, or fitting outcomes.

### Engineering / Code Example

Use the question as a code-search task. Search exact terms and adjacent concepts, then record file/function evidence instead of guessing.

### Industrial / Product Example

Industrial application is the unresolved consequence if the design ignores production constraints such as thickness, prism, frame shape, markings, or verification points.

### Measurement / Verification Example

Close the question only with evidence: code references, output plots, measurements, or explicit source comments.

## Meta

### File Purpose

This Round 2 atomic note defines `Does Ben Model Binocular Performance` as a reusable Obsidian knowledge point for progressive lens design. Use it as an independent reference during Ben-code inspection, clinical/application reasoning, or industrial/manufacturing review.

### Source Basis

This note is derived from the current Round 1 study layer, especially [[Study Note 01 - PAL Design Summary]], [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]. It should remain generic and reusable; source-specific details should stay linked rather than copied wholesale.

### Related Notes

- [[Bridge - PAL Theory To Ben MATLAB Code]]

### Open Questions

- Which exact Ben MATLAB file or class implements, approximates, ignores, or validates this concept?
- Is this concept represented as a surface geometry object, optical map, clinical target, manufacturing constraint, or only source-background knowledge?
- What evidence would promote this note from `raw` to `understood` or `validated`?
