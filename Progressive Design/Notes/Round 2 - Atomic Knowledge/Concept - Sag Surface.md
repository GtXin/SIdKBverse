---
type: concept
domain: progressive-lens
status: active
source:
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
related:
  - "[[Concept - Sag Hessian Matrix]]"
  - "[[Comparison - Sphere Versus Paraboloid Curvature]]"
tags:
  - pal
  - round-2
  - atomic
  - surface-geometry
  - code-audit
---

# Concept - Sag Surface

## Definition

A sag surface represents lens surface height as a scalar function over transverse coordinates:

```text
z = z(x, y)
```

In this vault, `x` and `y` are lens/surface coordinates and `z` is surface sag or departure. Once `z(x,y)` is known, local slope, curvature, mean power, cylinder, and principal directions can be derived.

## Application

### Engineering

For code inspection, first identify where the implementation defines:

- coordinate arrays: `x`, `y`
- sag values: `z`, `SAG`, or equivalent
- surface parameters controlling base curvature, add profile, and correction terms
- derivative calculations used to turn sag into power and cylinder maps

The code should preserve the direction:

```text
sag surface -> derivatives -> curvature/power/cylinder maps
```

If the code assigns power/cylinder maps directly, check whether those maps are targets/weights or derived measurements.

### Clinical / Design

PAL clinical behavior is not specified directly by a sag surface alone. The sag surface is the physical carrier from which power progression, unwanted astigmatism, skew/distortion, prism, and eventually user power are derived.

### Implementation Hook

Likely Ben-code targets:

- `BW_PAL_SurfaceSAG_V1`
- `SURF.sphere`
- `SURF.k`
- `SURF.add`
- `SURF.y0`
- `SURF.NRP_y`
- `SURF.off_edge_y`
- `SURF.cx2`
- spline or `griddedInterpolant` fields

## Meta

### File Purpose

This atomic note defines a sag surface as the primary mathematical object for PAL surface design. Use it when checking whether Ben's code treats power maps as derived quantities from a surface, rather than as the surface definition itself.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] frames ophthalmic lens design as surface design and uses the Monge chart `z(x,y)` as the local surface representation.

[[Study Note 02 - Design of Progressive Spectacle Lenses V1]] records that Ben's PAL work uses a sag-function pattern and surface parameters such as `sphere`, `k`, `add`, `y0`, `NRP_y`, `off_edge_y`, `cx1`, `cx2`, and optional interpolation terms.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Equation - Mean Power From Sag Hessian]]
- [[Equation - Surface Astigmatism From Sag Hessian]]
- [[Comparison - Sphere Versus Paraboloid Curvature]]

### Open Questions

- Does Ben's code compute derivatives analytically, by finite differences, or through a helper object?
- Are coordinate and sag units consistently meters, millimeters, or mixed?
- Does the sag function include both base surface and PAL corrections, or are some corrections applied downstream?
