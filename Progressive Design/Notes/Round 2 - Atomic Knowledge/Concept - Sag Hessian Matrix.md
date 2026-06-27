---
type: concept
domain: progressive-lens
status: active
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
related:
  - "[[Concept - Sag Surface]]"
  - "[[Equation - Principal Curvatures From Sag Hessian]]"
  - "[[Concept - Hessian Approximation Limit]]"
tags:
  - pal
  - round-2
  - atomic
  - hessian
  - code-audit
---

# Concept - Sag Hessian Matrix

## Definition

For a sag surface:

```text
z = z(x, y)
```

the sag Hessian is:

```text
H =
[ zxx  zxy
  zxy  zyy ]
```

where:

```text
zxx = d2z/dx2
zyy = d2z/dy2
zxy = d2z/dxdy
```

In the low-slope approximation, `H` is used as the local curvature matrix.

## Application

### Engineering

When reading Ben's code, locate the object or calculation that corresponds to `H`. It may appear as:

- second derivatives of sag
- local curvature components
- power/cylinder calculation internals
- wavefront or surface-analysis class methods

Inspection checklist:

- Is `zxy` included, or is the code assuming principal axes align with `x/y`?
- Are derivatives computed at consistent spacing and units?
- Are derivatives of the full sag surface used, including corrections?
- Is the Hessian used only as a local low-slope approximation?

### Clinical / Design

The Hessian is not clinically visible by itself, but it generates the maps clinicians and designers reason about: mean power, unwanted cylinder, hard/soft distribution, and corridor behavior.

### Implementation Hook

Likely Ben-code targets:

- surface power/cylinder methods in `C_PAL_Surface`
- wavefront or surface-analysis methods in `C_Wavefront`
- derivative grids used for target/merit-function comparison

## Meta

### File Purpose

This atomic note defines the sag Hessian matrix as the local second-derivative object that connects `z(x,y)` to curvature, mean power, surface astigmatism, and principal directions in the low-slope PAL model.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] identifies the Hessian as the central local object in Alonso's low-curvature PAL model.

[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] records the practical user inquiry connecting `zxx`, `zyy`, and `zxy` to mean power and astigmatism.

### Related Notes

- [[Concept - Sag Surface]]
- [[Equation - Principal Curvatures From Sag Hessian]]
- [[Equation - Mean Power From Sag Hessian]]
- [[Equation - Surface Astigmatism From Sag Hessian]]
- [[Concept - Hessian Approximation Limit]]

### Open Questions

- Does Ben store `zxx`, `zyy`, `zxy` explicitly?
- Does the code compute principal curvatures by eigenvalue formula or use simplified diagonal assumptions?
- Does the code use exact ray/wavefront power anywhere, or only Hessian-derived surface power/cylinder?
