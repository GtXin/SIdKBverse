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

# Equation - Mean Power From Sag Hessian

## Definition

If `k1` and `k2` are the approximate principal curvatures and `n` is lens refractive index, local mean surface power is:

```text
mean_power = (n - 1) (k1 + k2) / 2
```

Since:

```text
k1 + k2 = zxx + zyy
```

the direct Hessian formula is:

```text
mean_power = (n - 1) (zxx + zyy) / 2
```

### Technical Details

Units matter:

- if `x`, `y`, and `z` are in meters, `zxx` and `zyy` are in `1/m`
- multiplying curvature by `(n - 1)` gives diopters

If coordinates are in millimeters, the derivative scaling must be converted before interpreting power in diopters.

## Application

### Engineering

Code audit questions:

- Is the code multiplying by `(n - 1)`?
- Does it divide by `2` after summing curvature components?
- Are derivative units converted correctly?
- Is mean power calculated from principal curvature sum or from `zxx + zyy` directly?
- Is this surface power later compared against a target power map?

### Clinical / Design

Mean power is the surface-design proxy for progressive add distribution. In Ben's early implementation, it is likely one of the central optimization targets before full ray/user-power modeling.

### Implementation Hook

Search Ben's code for:

- `mean power`
- `power`
- `target_power`
- `SURF.index`
- `PAL.Targets`
- merit-function terms comparing actual and target power

## Meta

### File Purpose

This atomic note gives the low-slope formula for mean surface power from sag second derivatives. Use it as a direct check against Ben's mean-power map calculation.

### Source Basis

[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]] connects sag derivatives and Hessian matrices to local dioptric power.

[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] records the practical formula discussion from the user inquiry.

### Related Notes

- [[Concept - Sag Hessian Matrix]]
- [[Equation - Principal Curvatures From Sag Hessian]]
- [[Equation - Surface Astigmatism From Sag Hessian]]
- [[Concept - Target Power Map]]

### Open Questions

- Does Ben define target power as surface mean power or user/as-worn power?
- Does the code handle front and back surface power together, or only one progressive surface?
