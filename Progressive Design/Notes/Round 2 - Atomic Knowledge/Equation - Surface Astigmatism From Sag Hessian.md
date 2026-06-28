---
type: equation
domain: progressive-lens
status: needs-review
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
