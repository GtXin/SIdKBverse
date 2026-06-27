---
type: equation
domain: progressive-lens
status: active
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

### Engineering

In code, check whether principal curvatures are calculated by:

- an explicit eigenvalue calculation
- the closed-form formulas above
- a simplified assumption `k1 = zxx`, `k2 = zyy`

The simplified assumption is only valid when `zxy = 0` and the coordinate axes align with principal directions.

### Clinical / Design

Principal curvatures are the surface-level basis for local sphere/cylinder behavior. Their average maps to mean power; their difference maps to surface astigmatism.

### Implementation Hook

Look for Ben-code variables or methods named around:

- `PCA`
- `power`
- `cylinder`
- `curvature`
- `surface metrics`
- `zxx`, `zyy`, `zxy`

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
