---
type: concept
domain: progressive-lens
status: needs-review
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

### Clinical / Wearer Example

A wearer never sees the Hessian directly, but its derived mean-power and cylinder maps predict where the PAL will give clear distance/near zones versus unwanted blur.

### Engineering / Code Example

In Ben's MATLAB, inspect the derivative path from sag to `zxx`, `zyy`, `zxy`, then to principal curvatures, mean power, and cylinder. Verify unit scaling before comparing to diopters.

### Industrial / Product Example

In freeform design software, this is the internal surface-analysis layer that converts a generated sag surface into maps used for design approval and production release.

### Measurement / Verification Example

Compare computed power/cylinder maps against plotted contour maps or surface-analysis output; if possible, later compare against Rotlex/lensmeter/freeform verification data.

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
