---
type: concept
domain: progressive-lens
status: active
source:
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
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

# Concept - Hessian Approximation Limit

## Definition

The sag Hessian:

```text
H =
[ zxx  zxy
  zxy  zyy ]
```

is an exact local curvature matrix only at the vertex/local tangent-plane setup where slope is zero. Away from that condition, it is a low-slope approximation, not the exact invariant curvature operator.

### Technical Details

Exact surface curvature depends on the first and second fundamental forms. The exact shape operator is the object whose eigenvalues are the true principal curvatures.

The raw Hessian can be used directly when:

- the surface is represented in a local tangent frame
- slopes are small enough for low-curvature approximation
- the goal is fast design intuition or optimization proxy

It becomes risky when:

- slopes are large
- points are far from the vertex/local tangent point
- the result is interpreted as exact user/as-worn power
- lens tilt, wearer geometry, or ray angle matters

## Application

### Engineering

Code audit questions:

- Is Ben using Hessian maps as a development proxy or final optical performance?
- Does the code later include ray tracing, wavefront power, or user-power calculation?
- Are optimization targets explicitly surface-power/cylinder targets?
- Are results labeled as surface maps rather than as-worn performance?

### Clinical / Design

The low-slope Hessian model can explain why PAL surfaces generate unwanted astigmatism, but wearer performance depends on position of use, eye rotation, lens tilt, frame geometry, binocular effects, and ray/wavefront behavior.

### Implementation Hook

Use this note when reading:

- `C_Wavefront`
- `C_PAL_Surface`
- surface metric methods
- target/merit-function code
- any future raytrace or eye-model code

## Meta

### File Purpose

This atomic note defines the limitation of using the raw sag Hessian as a curvature matrix. Use it when deciding whether Ben's surface-power/cylinder calculations are valid as low-slope design proxies or need exact curvature/ray-trace validation.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] records Alonso's low-curvature use of the Hessian and the explicit sphere caveat.

[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] links the Hessian approximation to practical mean-power and astigmatism calculations used as PAL design proxies.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Comparison - Sphere Versus Paraboloid Curvature]]
- [[Equation - Principal Curvatures From Sag Hessian]]
- [[Concept - Surface Power Versus User Power]]

### Open Questions

- At what stage does Ben intend to replace surface-power/cylinder proxy optimization with full lens/eye or binocular optimization?
- Does any available output compare Hessian-derived maps with ray-traced/user-power maps?
