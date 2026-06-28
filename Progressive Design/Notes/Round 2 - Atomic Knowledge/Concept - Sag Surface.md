---
type: concept
domain: progressive-lens
status: needs-review
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
