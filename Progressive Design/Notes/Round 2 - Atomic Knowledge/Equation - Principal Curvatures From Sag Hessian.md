---
type: equation
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
related:
  - "[[Concept - Sag Hessian Matrix]]"
  - "[[Equation - Mean Power From Sag Hessian]]"
  - "[[Equation - Surface Astigmatism From Sag Hessian]]"
tags:
  - pal
  - round-2
  - atomic
  - equation
  - code-audit
---

# Equation - Principal Curvatures From Sag Hessian

## Definition

For:

```text
H =
[ zxx  zxy
  zxy  zyy ]
```

the approximate principal curvatures are the eigenvalues:

```text
k1 = (zxx + zyy)/2 + sqrt(((zxx - zyy)/2)^2 + zxy^2)
k2 = (zxx + zyy)/2 - sqrt(((zxx - zyy)/2)^2 + zxy^2)
```

Equivalently, `k1` and `k2` are `eig(H)` in the low-slope model.

### Technical Details

The eigenvalue split is:

```text
k1 - k2 = sqrt((zxx - zyy)^2 + 4 zxy^2)
```

The eigenvalue sum is:

```text
k1 + k2 = zxx + zyy
```

These two identities are the basis for mean power and surface astigmatism calculations.

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

This atomic note gives the low-slope formula for computing approximate principal curvatures from the sag Hessian. Use it to audit code that converts sag derivatives into local curvature, mean power, and cylinder.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] records Alonso's use of Hessian eigenvalues as principal-curvature proxies in the low-curvature PAL construction.

[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] captures the user inquiry that connected these curvatures to mean power and astigmatism formulas.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Equation - Mean Power From Sag Hessian]]
- [[Equation - Surface Astigmatism From Sag Hessian]]
- [[Concept - Principal Curvature Directions]]
- [[Concept - Hessian Approximation Limit]]

### Open Questions

- Does Ben preserve axis/principal-direction information, or only magnitudes?
- Does any code compare Hessian-derived curvature against ray-traced/user power?
