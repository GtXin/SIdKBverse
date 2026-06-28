---
type: comparison
domain: progressive-lens
status: needs-review
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
related:
  - "[[Concept - Sag Surface]]"
  - "[[Concept - Sag Hessian Matrix]]"
  - "[[Concept - Hessian Approximation Limit]]"
tags:
  - pal
  - round-2
  - atomic
  - surface-geometry
  - code-audit
---

# Comparison - Sphere Versus Paraboloid Curvature

## Definition

A sphere has constant true principal curvature everywhere:

```text
k1 = k2 = 1/R
```

But the raw Hessian of a sphere written as sag over a fixed global `x-y` plane changes away from the vertex.

A paraboloid:

```text
z = (x^2 + y^2) / (2R)
```

has a constant Hessian:

```text
H =
[ 1/R  0
  0    1/R ]
```

The paraboloid is the local second-order approximation to the sphere near the vertex, not the same surface globally.

### Technical Details

Exact sphere sag over the tangent plane:

```text
z = R - sqrt(R^2 - x^2 - y^2)
```

At the vertex, where slope is zero, the sag Hessian equals the true local curvature matrix.

Away from the vertex:

- the surface normal tilts
- the fixed `x-y` chart is no longer the local tangent frame
- exact curvature requires the first and second fundamental forms or shape operator

## Application

### Clinical / Wearer Example

For the wearer, the surface type matters through effective power, peripheral error, distortion, thickness, and how stable the image feels away from the fitting cross.

### Engineering / Code Example

In Ben's sag code, identify whether the base term is exact sphere/conic sag, a local paraboloid approximation, a toric/cylindrical component, or a progressive/freeform correction.

### Industrial / Product Example

In manufacturing, this maps to whether the surface can be generated as a standard base curve, toric/aspheric surface, or freeform digital surface.

### Measurement / Verification Example

Check sag, slope, and curvature maps over aperture; for a sphere/paraboloid comparison, verify that exact curvature and raw sag Hessian are not being conflated off vertex.

## Meta

### File Purpose

This atomic comparison explains why a sphere and its local paraboloid approximation can agree at the vertex but differ globally in raw sag-Hessian behavior. Use it to avoid misreading Ben's base-sphere or conic sag derivatives.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] captures the user challenge about sphere curvature and the correction: true sphere curvature remains `1/R`, but the raw Hessian in a fixed Monge chart is not the exact shape operator away from the vertex.

### Related Notes

- [[Concept - Sag Surface]]
- [[Concept - Sag Hessian Matrix]]
- [[Concept - Hessian Approximation Limit]]
- [[Equation - Mean Power From Sag Hessian]]

### Open Questions

- Does Ben use exact spherical/conic sag or a quadratic/parabolic approximation for the base surface?
- Is the Hessian evaluated over a range where low-slope assumptions remain adequate?
