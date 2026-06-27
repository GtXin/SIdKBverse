---
type: equation
domain: progressive-lens
status: active
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
related:
  - "[[Concept - Sag Hessian Matrix]]"
  - "[[Equation - Principal Curvatures From Sag Hessian]]"
tags:
  - pal
  - round-2
  - atomic
  - equation
  - code-audit
---

# Equation - Surface Astigmatism From Sag Hessian

## Definition

If `k1` and `k2` are approximate principal curvatures, local surface astigmatism magnitude is:

```text
astigmatism = (n - 1) |k1 - k2|
```

Using Hessian components directly:

```text
astigmatism = (n - 1) sqrt((zxx - zyy)^2 + 4 zxy^2)
```

### Technical Details

The formula measures magnitude, not signed cylinder axis. Axis information requires the eigenvectors of the Hessian.

If `zxy = 0`, the formula reduces to:

```text
astigmatism = (n - 1) |zxx - zyy|
```

If `zxx = zyy` and `zxy = 0`, the local surface is umbilical in the low-slope model and surface astigmatism is zero.

## Application

### Engineering

Code audit questions:

- Does the code include the `4 zxy^2` term?
- Does the code use absolute eigenvalue difference?
- Is cylinder reported as magnitude only or with axis?
- Are surface-cylinder targets or penalties based on this formula?
- Does Ben enforce or approximate zero cylinder along the progressive corridor?

### Clinical / Design

This formula produces the surface-level unwanted-cylinder map that maps to blur, clear-zone width, hard/soft distribution, and corridor tradeoffs. It is not the same as full as-worn user cylinder, but it is an important design proxy.

### Implementation Hook

Search Ben's code for:

- `cyl`
- `cylinder`
- `astig`
- `target_cylinder`
- `cyl_wt`
- `PCA`
- surface metric methods

## Meta

### File Purpose

This atomic note gives the low-slope formula for local surface astigmatism/cylinder from sag second derivatives. Use it to audit Ben's cylinder map and unwanted-astigmatism target calculations.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] records that Hessian eigenvalue splitting is the local curvature source of cylinder/astigmatism.

[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] frames unwanted surface astigmatism as the practical cost of progressive curvature and records the user-requested formula from `zxx`, `zyy`, and `zxy`.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Equation - Principal Curvatures From Sag Hessian]]
- [[Equation - Mean Power From Sag Hessian]]
- [[Concept - Unwanted Surface Astigmatism]]
- [[Concept - Target Cylinder Map]]

### Open Questions

- Does Ben's cylinder calculation use surface curvature only or wavefront/ray-traced cylinder?
- Does the target map allow maximum/minimum constraints or only weighted least squares?
