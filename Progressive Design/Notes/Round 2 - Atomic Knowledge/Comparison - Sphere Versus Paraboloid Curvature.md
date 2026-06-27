---
type: comparison
domain: progressive-lens
status: active
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

### Engineering

When inspecting Ben's base sphere/asphere code:

- do not treat a changing raw Hessian of exact sphere sag as proof that the sphere's true curvature changed
- check whether the code intentionally uses the low-slope/paraboloid approximation
- identify whether `SURF.sphere` and `SURF.k` produce exact conic sag or local quadratic sag

### Clinical / Design

For typical ophthalmic PAL design maps, low-slope Hessian methods can be useful and fast. But full as-worn/user-power evaluation should not confuse projected sag-Hessian behavior with invariant surface curvature or ray-traced power.

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
