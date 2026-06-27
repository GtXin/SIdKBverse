---
type: study-note
domain: progressive-lens
status: understood
source:
  - "Reference/BW Work/01-References_PALdesign/ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf"
  - "Reference/Modern Ophthalmic Optics (José Alonso, José A. Gómez-Pedrero etc.) (z-library.sk, 1lib.sk, z-lib.sk).pdf"
related:
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
tags:
  - pal
  - bw-work
  - round-1
  - study-note
  - alonso
---

# Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses

## File Purpose

This Round 1 study note represents the Alonso progressive-lens chapter as a targeted source-support note. Use it to anchor the concepts that Ben's overview deck depends on before extracting Round 2 atomic notes.

## Source

`Reference/BW Work/01-References_PALdesign/ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`

Supplemental full-book source:

`Reference/Modern Ophthalmic Optics (José Alonso, José A. Gómez-Pedrero etc.) (z-library.sk, 1lib.sk, z-lib.sk).pdf`

## Reading Status

Status: understood for Round 1.

The chapter has been used for targeted study of PAL geometry, Minkwitz theorem, progressive-surface compatibility, and center-of-rotation context. The full book was scanned through its outline and relevant sections. Chapter 2, Appendix C, Appendix D, and section 8.4 were read for surface/Hessian and progressive-lens support.

Section 8.4 has now been read across the full chapter range for key concepts and design applications. A figure-by-figure visual review is still optional, mainly for preserving map interpretation and figure-specific details.

## Extraction Method And Limitations

- PDF metadata reports 45 pages.
- The PDF is scanned/image-based; `pypdf` and `pdfplumber` did not extract useful embedded text.
- Codex visually inspected rendered pages from the chapter opening and used them only for targeted support.
- Figures, equations, and page-specific claims still need fuller visual review before this note is considered complete.

Supplemental full-book extraction:

- The full book PDF has 565 PDF pages and extractable text.
- The relevant full-book locations are:
  - Chapter 2, `Surfaces in Ophthalmic Lenses`: book pages 21-61, PDF pages 40-80.
  - Section 8.4, `Progressive Lenses`: book pages 284-328, PDF pages 303-347.
  - Appendix C, `Introduction to Surface Geometry`: book pages 468-487, PDF pages 487-506.
  - Appendix D, `Local Dioptric Power Matrix`: book pages 488-491, PDF pages 507-510.
- Page numbering in this note distinguishes book page numbers from PDF page numbers when needed.

## Full-Book Source Context

Use the BW extracted chapter PDF for quick reading of section 8.4. Use the full book PDF when the progressive chapter refers backward to surface geometry, Hessian matrices, parabolic approximation, or local dioptric power.

Relevant book structure:

- Chapter 2 establishes the surface-first view of ophthalmic optics. Lens behavior is built from the geometry of front and back surfaces.
- Chapter 2 moves from classical surfaces to freeform surfaces:
  - revolution-symmetric surfaces such as spheres and conicoids
  - axial/astigmatic surfaces such as cylinders and tori
  - many-degree-of-freedom surfaces such as meshes and polynomial descriptions
- Appendix C gives the differential-geometry support that Chapter 2 and Chapter 8 rely on.
- Appendix D connects sag derivatives and the Hessian to local dioptric power matrices.
- Section 8.4 applies this machinery to progressive power lenses.

Study interpretation:

- Alonso's PAL chapter should not be read in isolation. It assumes Chapter 2's surface vocabulary and Appendix C's curvature definitions.
- The Hessian is the central local object for the low-curvature model, but Alonso is explicit that the Hessian of a Monge sag chart is exact curvature only at the vertex under the standard tangent-plane setup, and approximate away from it.
- For a real lens workflow, the low-curvature model is explanatory and design-intuition level. As-worn performance requires ray/wavefront power, user power, and frame/eye geometry.

## Extract - Surface Chapter And Hessian Machinery

Source: full book Chapter 2, especially book pages 21-61 / PDF pages 40-80.

### Why Chapter 2 Matters

Chapter 2 frames ophthalmic lens design as surface design. A modern lens may not fit cleanly into the old categories of "sphere plus cylinder" or "sphere plus toric." Freeform and progressive designs can use surfaces that lack simple symmetry, so the designer needs a more general representation of sag, curvature, and local power.

For progressive lens study, this means:

- do not start from a power map as the primitive object
- start from one or two physical sag surfaces
- derive local curvature, mean power, cylinder, prism, and eventually user power from those surfaces

### Hessian As Curvature Matrix

For a Monge sag surface:

```text
z = z(x,y)
```

Alonso defines the surface Hessian matrix as:

```text
H =
[ z_xx  z_xy
  z_xy  z_yy ]
```

Local meaning in the low-slope model:

- `z_xx` approximates curvature in the `X` direction.
- `z_yy` approximates curvature in the `Y` direction.
- `z_xy` captures the mixed/twist term and rotates the local principal directions.
- mean curvature proxy:

```text
H_mean = (z_xx + z_yy) / 2
```

- Gaussian curvature proxy:

```text
K = z_xx z_yy - z_xy^2
```

- principal curvature proxy:

```text
kappa_plus, kappa_minus = H_mean +/- sqrt(H_mean^2 - K)
```

Important qualification:

- At the surface vertex, when the surface is represented in its standard tangent-plane coordinate system, the Hessian gives the exact local curvature matrix.
- For shallow surfaces, it remains a useful approximation away from the vertex.
- For non-shallow or far-from-vertex points, exact curvature requires Appendix C's first and second fundamental forms.

### Sphere Example And The Hessian Trap

Chapter 2 explicitly supports the correction we discussed during study:

- A true sphere has constant principal curvature `1/R` everywhere.
- The raw Hessian of the sphere's sag chart changes away from the vertex because the chart is projected onto a fixed `X-Y` plane while the surface normal tilts.
- Therefore, a changing Hessian away from the vertex does not mean the sphere's true intrinsic curvature changed.
- It means the Hessian is no longer the exact shape operator in that global chart.

Study consequence:

- Your instinct was right to question the Hessian-as-curvature statement away from the vertex.
- The clean judgment is: Hessian equals exact curvature matrix only in the local tangent setup / parabolic approximation. For exact surface curvature, use the shape operator.

### Many-Degree-Of-Freedom Surfaces

Chapter 2 section 2.4 is the bridge to progressive and freeform lenses.

Mesh-defined surfaces:

- An arbitrary lens surface can be described by sampled sag heights on a finite grid.
- The book gives the example of an 80 mm square region sampled at 1 mm spacing.
- The surface between samples is recovered by interpolation.
- In ophthalmic surface ranges, a dense enough grid plus cubic interpolation can give curvature accuracy suitable for lens work.
- This maps naturally to manufacturing files and freeform generators.

Polynomial-defined surfaces:

- A general surface can also be represented by a polynomial expansion:

```text
z(x,y) = sum a_nm x^n y^m
```

- The second-order coefficients define the curvature matrix at the origin:

```text
H(0,0) =
[ 2 a_20   a_11
  a_11     2 a_02 ]
```

- Higher-order coefficients control sag, slope, and curvature away from the vertex.
- A high-order polynomial has enough degrees of freedom to approximate complex continuous surfaces, including progressive surfaces.
- Alonso notes that simple monomial polynomials can become numerically awkward, so orthogonal polynomial bases are often better for fitting and optimization.
- For complex progressive lens surfaces, the book states that on the order of 150 to 250 polynomials may be needed, depending on size and geometric subtlety.

Study consequence:

- Ben's MATLAB sag-function view and Alonso's surface-representation view are compatible.
- Ben can implement sag analytically, by coefficients, or by interpolated delta-sag grids; Alonso gives the underlying geometry language for all three.

## Extract - Appendix C Surface Geometry

Source: full book Appendix C, book pages 468-487 / PDF pages 487-506.

Appendix C defines the exact geometry that sits behind the low-curvature shortcut.

Surface representation:

```text
r(u,v) = [ x(u,v), y(u,v), z(u,v) ]
```

Most ophthalmic discussion is then specialized to Monge's chart:

```text
r(x,y) = [ x, y, z(x,y) ]
```

Normal vector for a Monge chart:

```text
N = [ -z_x, -z_y, 1 ] / sqrt(1 + z_x^2 + z_y^2)
```

First fundamental form:

```text
E = 1 + z_x^2
F = z_x z_y
G = 1 + z_y^2
```

Exact-curvature meaning:

- First derivatives set tangent plane and normal direction.
- Second derivatives enter the second fundamental form.
- Principal curvatures are invariant surface quantities obtained from the fundamental forms, not merely from the raw Hessian in a global chart.

Parabolic approximation:

- Near the vertex, the surface can be approximated by a second-order sag.
- In that regime, the projected normal obeys:

```text
n = -H r
```

where `H` is the Hessian and `r = [x, y]^T`.

Study consequence:

- This is the precise reason Alonso can use the Hessian in the progressive-lens chapter. He is deliberately working in a flattened, local, low-curvature model.
- It is also the reason the model is not enough by itself for final real-life lens design.

## Extract - Appendix D Local Dioptric Power Matrix

Source: full book Appendix D, book pages 488-491 / PDF pages 507-510.

Appendix D connects sag curvature to local power.

For a lens with front and back surface sags:

```text
z_1(x,y)
z_2(x,y)
```

and Hessians:

```text
H_1(x,y)
H_2(x,y)
```

the local dioptric power matrix in the paraxial approximation is:

```text
P(x,y) = (n - 1) (H_1(x,y) - H_2(x,y))
```

Equivalently, with thickness/sag-difference function:

```text
t(x,y) = z_1(x,y) - z_2(x,y)
P(x,y) = (n - 1)
         [ t_xx  t_xy
           t_xy  t_yy ]
```

Study consequence:

- A PAL power/cylinder map is a derived map from surface derivatives, not a separate physical surface.
- If the front surface is simple and the back surface carries the progressive/freeform shape, the back-surface Hessian becomes the dominant local-power design object.
- This is still paraxial/local power. Alonso later warns that user power / eye-point power can differ significantly from curvature-based or lensmeter maps.

## Extract - Progressive Lenses Chapter

Source: full book section 8.4, book pages 284-328 / PDF pages 303-347. The BW source PDF is this section as a standalone scanned extract.

### 8.4.1 Introduction

Progressive lenses are introduced as a response to bifocal/trifocal limitations:

- abrupt power jump at the segment boundary
- visible segment line
- image jump and ghost reflections
- lack of continuous intermediate additions

The design wish is a smooth transition from distance to near power. But a surface whose curvature changes smoothly across a significant lens region cannot generally keep both principal curvatures equal everywhere. The desired power progression produces unwanted astigmatism outside selected lines or regions.

### Simple Progressive-Cylinder Model

Alonso first builds intuition with progressive cylinders and crossed progressive cylinders.

The important result is:

```text
dC/dx = 2 dP/dy
```

Meaning:

- if spherical power changes along the vertical coordinate, cylinder grows laterally
- the lateral growth rate of cylinder is twice the vertical slope of the power profile in this simplified construction
- this is the intuitive doorway into Minkwitz-type behavior

Study consequence:

- The model is not a final lens design method.
- It explains why the cost of a smooth addition profile appears as lateral astigmatism.

### 8.4.2 Low-Curvature Model Of A Progressive Surface

Alonso then switches to a Monge chart:

```text
z = z(x,y)
```

and treats the Hessian as a coordinate-dependent local curvature matrix:

```text
H(x,y) =
[ z_xx(x,y)  z_xy(x,y)
  z_xy(x,y)  z_yy(x,y) ]
```

From this, in the low-curvature approximation:

```text
K = z_xx z_yy - z_xy^2
H_mean = (z_xx + z_yy) / 2
kappa_plus, kappa_minus = H_mean +/- sqrt(H_mean^2 - K)
```

The modeling objectives are:

- place far and near points on the `Y` axis
- let one surface carry the progressive power change
- keep the progressive meridian free of unwanted astigmatism
- treat that meridian as an umbilical line

Umbilical-line condition:

```text
kappa_plus(0,y) = kappa_minus(0,y)
```

Alonso represents the progressive surface as:

```text
z(x,y) = sum_n q_n(y) x^n
```

The vertical meridian curvature profile is:

```text
kappa_p(y)
```

The meridian conditions become:

```text
z_xx(0,y) = z_yy(0,y) = kappa_p(y)
z_xy(0,y) = 0
```

which produce the constructive form:

```text
z(x,y) = double_integral kappa_p(y) dy^2
       + (kappa_p(y) / 2) x^2
       + q_3(y) x^3
       + ...
       + q_N(y) x^N
```

Study consequence:

- `kappa_p(y)` controls the wanted addition profile along the meridian.
- Higher-order `q_n(y)` terms control how the off-meridian astigmatism and mean-power distortions are distributed.
- The surface is a compatible sag function first; the power/cylinder maps are derivative consequences.

### Minkwitz-Type Local Result

For the simplified member of this surface family, close to the umbilical line:

```text
C(x,y) = 2 | kappa_p'(y) x |
```

Meaning:

- lateral unwanted cylinder is proportional to distance from the umbilical line
- the proportionality is set by twice the slope of the meridian curvature profile
- where the addition profile changes fastest, the corridor becomes narrowest and cylinder grows fastest

Alonso also qualifies the simple statement:

- adding a cubic term `q_3(y) x^3` can make the near-line cylinder growth faster than the standard simple formula
- modern PALs do not behave like the simplest parabolic horizontal-section model over the full lens
- the local result remains useful near the principal/umbilical line

Study consequence:

- Minkwitz is a local constraint, not a complete recipe for the whole lens.
- Design freedom is mostly about redistributing unavoidable error, choosing progression length, shaping off-meridian power, and optimizing user power.

### Corridor, Slope, And Progression Length

Alonso links corridor width to the local slope of the power profile along the principal line.

Key design meaning:

- a wider corridor at a given point requires a smaller local power slope there
- the total addition still has to fit between distance and near reference regions
- reducing slope generally requires a longer progression length or a redistribution of slope
- a longer progression can demand more downward gaze, which can be worse than a narrow corridor for some users

The chapter describes a logistic-style power profile and defines progression/corridor length using the vertical distance between the 10 percent and 90 percent addition points.

Study consequence:

- "wide corridor" is not a free technology claim. It is coupled to addition, profile slope, fitting height, and reference-point placement.

### Characteristics And Performance

The later section covers practical PAL characteristics:

- fitting cross and reference points
- principal line and nasal inset for convergence
- distance, intermediate, and near regions
- hard versus soft designs as gradients and spacing of sphere/cylinder isolines
- measurement/rating approaches such as area and zone width
- limitations of lensmeter/curvature maps
- user power / as-worn / eye-point power as the performance-relevant target
- compensated power and customization
- freeform as an enabling manufacturing technology, especially for back-side PALs

Study consequence:

- Early surface/Hessian maps are necessary for understanding the geometry.
- They are insufficient for judging final lens performance.
- The real design question eventually becomes: how does the chosen sag surface perform under as-worn ray/wavefront tracing for the user's prescription, frame, eye rotation, convergence, and fitting geometry?

## Chapter Study Notes - Key Concepts And Applications

Source: Alonso section 8.4, book pages 284-328 / PDF pages 303-347.

Purpose: this section is the expert study layer for the progressive-lens chapter. It extracts the concepts that should guide later Round 2 atomic notes and Round 3 code reading.

### 1. PAL Design Starts As A Surface Compatibility Problem

Key concept:

- A PAL tries to give a continuous distance-to-near power change without bifocal/trifocal discontinuities.
- The desired smooth power transition is not the hard part by itself.
- The hard part is that changing curvature along one path on a continuous surface forces unwanted astigmatism into surrounding regions.
- The progressive surface is therefore a geometric compromise: create useful addition along the principal path while distributing unavoidable off-path error.

Application to study:

- Do not interpret a PAL design only as a mean-power map.
- Ask which sag surface, surface pair, or refracted wavefront produces the map.
- When reading Ben's code, identify whether the implementation controls:
  - sag directly
  - meridian profile
  - surface Hessian / curvature
  - local power matrix
  - user power after ray tracing

### 2. The Crossed-Cylinder Model Is A Mental Model For Minkwitz

Key concept:

- Alonso's simple crossed-progressive-cylinder construction shows why lateral cylinder grows when vertical spherical power changes.
- The local result is:

```text
dC/dx = 2 dP/dy
```

- In the later low-curvature PAL surface model, the corresponding local form near the umbilical line is:

```text
C(x,y) = 2 | kappa_p'(y) x |
```

Application to study:

- Use Minkwitz as a near-corridor local diagnostic, not as a full-lens design algorithm.
- The local slope of the addition profile is the first-order driver of corridor width.
- Faster power progression gives a narrower corridor and faster lateral cylinder growth.
- A design can redistribute peripheral astigmatism, but it cannot make the geometric cost disappear.

### 3. The Low-Curvature Model Explains The PAL Surface Skeleton

Key concept:

- Alonso represents the surface as a Monge chart:

```text
z = z(x,y)
```

- In the low-curvature approximation, the Hessian acts as the local curvature matrix:

```text
H(x,y) =
[ z_xx  z_xy
  z_xy  z_yy ]
```

- The progressive meridian is modeled as an umbilical line, meaning the two principal curvatures are equal along that line.
- The constructive surface family is:

```text
z(x,y) = double_integral kappa_p(y) dy^2
       + (kappa_p(y) / 2) x^2
       + q_3(y) x^3
       + ...
       + q_N(y) x^N
```

Application to study:

- `kappa_p(y)` is the backbone addition profile.
- The higher-order `q_n(y)` terms are design freedoms for shaping off-meridian behavior.
- If Ben's code has a "meridian profile" plus additive sag terms or delta sag grids, this is the same conceptual split:
  - prescribed corridor behavior
  - adjustable peripheral distribution
- The low-curvature model is explanatory. It should not be mistaken for a complete as-worn design engine.

### 4. Reference Points Are Design And Verification Anchors

Key concept:

- `FC` / fitting cross: aligned with the pupil at the main viewing position.
- `FRP` / far reference point: location where the lens should deliver the distance prescription.
- `PRP` / prism reference point: point where prism is checked, commonly including thinning prism.
- `NRP` / near reference point: location where the lens should deliver the near prescription, usually inset nasally.
- Permanent engravings allow the temporary marks to be reconstructed.

Application to study:

- Any code or measurement workflow must define the coordinate origin and reference-point layout.
- The PRP is not necessarily the optical center; PALs do not have the same symmetry-based optical-center concept as simple single vision lenses.
- Prism thinning should be understood as a surface-orientation/thickness management choice checked at PRP, not as a mysterious add-on to the optical design.

### 5. Front-Side, Back-Side, And Double-Side PALs Are Different Surface Allocations

Key concept:

- Front-side PAL:
  - the front surface carries the progressive addition
  - the back side supplies prescription sphere/cylinder
  - historically convenient for molded progressive blanks
  - positive addition requires increased front-surface curvature toward near
- Back-side PAL:
  - a usually simpler front surface is paired with a freeform back progressive surface
  - now common because freeform lab machinery cuts the back side
  - positive addition corresponds to a reduced back-surface curvature toward near because back-surface power has the opposite sign convention
  - prescription cylinder and progressive behavior can both live on the back surface
- Double-side PAL:
  - addition is split or coordinated across both surfaces
  - this can redistribute astigmatism but does not evade the underlying Minkwitz-type wavefront constraint

Application to study:

- "Back-side" is not automatically optically superior. Alonso treats it mainly as a manufacturing/freeform consequence plus a design opportunity.
- When reading a design implementation, identify which surface carries:
  - base curve
  - prescription cylinder
  - addition
  - astigmatic compensation
  - personalization
- A two-surface representation matters if the target is user power, not only surface power.

### 6. Principal Curve And Power Profile Are The PAL Backbone

Key concept:

- Alonso prefers "principal curve" over "meridian" because modern PAL paths can be nasally inset and because "principal meridian" already has a geometric meaning.
- The principal curve joins the important viewing/reference regions.
- The principal power profile gives power along that curve.
- This pair determines:
  - which gaze angle gives far, intermediate, or near power
  - the local corridor width through profile slope
  - the required nasal inset for convergence

Application to study:

- A presbyopic wearer loses some freedom to trade head motion and eye rotation because each working distance demands looking through a specific region of the lens.
- Inset is not cosmetic. It aligns the useful corridor with converged near/intermediate gaze.
- For code reading, find whether the principal curve is:
  - vertical
  - rotated
  - nasally inset
  - prescription/user-parameter dependent
  - surface-based or wavefront/user-power based

### 7. Corridor Width Is Governed By Profile Slope, Not Marketing Language

Key concept:

- Near the principal curve, for a cylinder threshold `C_th`, Alonso writes corridor width as approximately:

```text
w(y) = C_th / |P'(y)|
```

- For a logistic-style profile, the minimum width scales like:

```text
w_min = 2 L C_th / (A ln 9)
```

where:

- `L` is progression length
- `A` is addition
- `C_th` is the selected cylinder threshold

Application to study:

- Larger addition narrows the corridor if other variables are fixed.
- Longer progression length widens the corridor but pushes required gaze farther downward.
- A wider minimum corridor is not universally better; profile shape changes task ergonomics.
- `MFH` alone is not enough to characterize the design. Alonso argues that `y10`, `L`, and `MFH` together better describe near-corridor behavior.

### 8. Peripheral Astigmatism Distribution Is An Optimization Problem

Key concept:

- The principal curve and profile determine the near-corridor/Minkwitz region.
- The rest of the lens still needs design: peripheral mean power and unwanted cylinder must be distributed.
- Alonso gives a generic merit function over sampled lens points:

```text
Phi(c) = sum_k chi_k [C(x_k,y_k,c) - C0(x_k,y_k)]^2
       + sum_k eta_k [H(x_k,y_k,c) - H0(x_k,y_k)]^2
```

Interpretation:

- `c` are surface coefficients or design variables.
- `C0` and `H0` are target cylinder and mean-curvature maps.
- `chi_k` and `eta_k` are spatial weights.
- Poor targets or poor weights can make optimization converge to useless surfaces.

Application to study:

- There are two broad design strategies:
  - define realistic target maps and use moderate weighting
  - define simple impossible targets, such as low cylinder everywhere, and use carefully shaped weights
- The weight map is a design language. It decides where the optimizer is allowed to spend error.
- Ben's MATLAB optimization should be read through this lens:
  - What is the target?
  - What is weighted?
  - What is allowed to fail?
  - What smoothness or manufacturability terms are present?

### 9. Hard And Soft Designs Are About Gradients, Not Just Maximum Cylinder

Key concept:

- A hard PAL has closer isolines, steeper gradients, shorter corridor, or more concentrated astigmatism.
- A soft PAL spreads astigmatism and/or uses a longer corridor.
- Corridor length and astigmatism spread are partly independent; a lens can be short-and-soft or long-and-hard depending on distribution.
- Maximum unwanted cylinder alone does not describe the wearer experience.

Application to study:

- When comparing designs, inspect isoline spacing and gradient distribution, not just peak cylinder.
- "Soft" is a perceptual/ergonomic design tendency, but it must be mapped to quantitative properties:
  - power slope
  - cylinder gradient
  - zone width
  - near/intermediate region area
  - distortion/swim-relevant spatial changes

### 10. Performance Evidence Is Messy And User Dependent

Key concept:

- Clinical acceptance and preference studies are confounded by wearer history, add level, prescription, fitting accuracy, task, and adaptation.
- Alonso highlights that comparing commercial designs is hard because many variables change at once.
- More informative studies isolate one feature, such as near width or corridor length.
- Fitting accuracy is a real performance variable, not just dispensing housekeeping.

Application to study:

- Do not expect a single geometric metric to predict satisfaction.
- Study design evaluation should separate:
  - physical map metrics
  - user-power metrics
  - subjective preference
  - task-specific performance
  - adaptation history
- This aligns with vision-science thinking: the lens design is only one component of a closed user-task-eye-head system.

### 11. Lensmeter / Surface Maps Are Not The Same As User Power

Key concept:

- Curvature maps and lensmeter maps are not necessarily what the wearer experiences.
- User power, also called as-worn or eye-point power, is the power of the refracted wavefront at the eye's vertex sphere.
- It depends on:
  - base curve
  - prescription
  - lens thickness
  - refractive index
  - pantoscopic/wrap/position
  - gaze angle
  - chief-ray obliquity to the surfaces
  - convergence and working distance

Application to study:

- Curvature-based maps are useful for surface reasoning but insufficient for final PAL performance.
- Scoring systems should ideally use user-power maps, not only mapper/lensmeter maps.
- If Ben's implementation stops at surface sag or lensmeter-style local power, then it is a prototype/design-intuition layer.
- If it traces rays to the eye and optimizes perceived power over gaze, then it is closer to modern as-worn PAL design.

### 12. Freeform, Custom Design, User Power, And Back-Side PAL Are Related But Not Equivalent

Key concept:

- Freeform is a manufacturing capability.
- Back-side PAL is a common manufacturing allocation enabled by freeform labs.
- Custom design means the power distribution or optimization depends on user/task parameters.
- User-power design means the target is perceived/as-worn power, not local surface or lensmeter power.
- Compensated power is the manufactured lens power required to deliver the desired user power.

Application to study:

- Avoid treating "freeform" as a magic optical category.
- A freeform lens can still be a standard design if no user-power or personalized optimization is performed.
- A custom lens can be task-customized without full user-power correction.
- A user-power optimized lens can use default parameters if measured user parameters are unavailable, but measured position-of-wear data should improve the target.

### 13. Position-Of-Use Optimization Is The Modern Endpoint

Key concept:

- Alonso's modern endpoint is not just designing a progressive surface and then checking it.
- The lens-eye system is modeled before optimization.
- The merit function is over gaze directions, not just Cartesian surface coordinates.
- Power is compared as a matrix, so sphere/cylinder/axis are handled consistently.

Generic user-power optimization structure:

```text
Phi(c) = sum_{u,v} w(u,v) || P_T(u,v) - P(u,v,c) ||^2
```

where:

- `(u,v)` are gaze angles
- `P_T` is target user-power matrix
- `P` is computed user-power matrix for the temporary surface
- `w(u,v)` is a gaze-dependent weight
- `c` are surface design variables

Application to study:

- This is the conceptual bridge between Ben's MATLAB implementation and Zemax/ray-tracing approaches.
- The key question is not "MATLAB or Zemax?" It is whether the model optimizes:
  - local surface curvature
  - local lensmeter/back-vertex power
  - refracted wavefront/user power over gaze
  - task-weighted vision metrics
- If Ben is using MATLAB, he may still be doing serious design work if the ray/wavefront/user-power model is implemented correctly.
- If others use Zemax, they may simply be using a commercial ray-tracing environment for the same position-of-use optimization layer.

### Study Applications For Ben's Work

When reading Ben's MATLAB files, use these checks:

- Coordinate system:
  - What is the origin?
  - Which axis is vertical?
  - Are coordinates lens-surface coordinates, gaze angles, or both?
- Surface representation:
  - Is sag analytic, polynomial, mesh/interpolated, or composed from multiple terms?
  - Are derivatives analytic or numerical?
- Principal curve:
  - Is it vertical, tilted, or nasally inset?
  - Is inset fixed or computed from wearer geometry?
- Power target:
  - Is the target mean/cylinder map, local power matrix, or user-power matrix?
  - Is prescription added scalar-wise or matrix-wise?
- Merit function:
  - What variables are optimized?
  - What regions have high/low weights?
  - Is smoothness, manufacturability, or thickness penalized?
- Performance layer:
  - Are outputs surface maps, lensmeter maps, user-power maps, or ray-traced visual metrics?
  - Are frame position, pantoscopic tilt, wrap, vertex distance, pupil distance, and working distance included?

Working judgment:

- Alonso makes "advanced PAL" less about a single secret theorem and more about layered modeling.
- The layers are: sag surface, local Hessian/power, principal profile, peripheral optimization, as-worn ray/wavefront power, and task/user weighting.
- That is the lens through which Ben's code should be read.

## Target Concepts

- [[Conventional PAL]]
- [[Minkwitz theorem]]
- [[Unwanted astigmatism]]
- [[Progressive corridor]]
- [[Center of rotation in spectacle lens optimization]]
- [[Surface compatibility]]
- [[Surface Hessian matrix]]
- [[Local dioptric power matrix]]
- [[Monge chart]]
- [[Freeform progressive lens]]

## Source-Supported Working Points

- Progressive lenses are introduced as a response to limitations of bifocals and trifocals, including visible segment boundaries, image jump, and lack of smooth intermediate vision.
- A progressive surface changes curvature/power smoothly from distance through intermediate into near.
- Smooth power progression along a corridor cannot eliminate unwanted astigmatism; lateral astigmatism is a geometric consequence of changing curvature on a continuous surface.
- The chapter supports the use of low-curvature/local-surface reasoning before moving into complete as-worn ray-tracing models.

## User Inquiry - Alonso Surface Definition And Format

Question captured during study: in Alonso's book, how is the progressive surface defined, in what format, and how is it represented?

Working judgment:

- Alonso's local surface model is geometric first: a surface is represented as a Monge chart `z(x,y)`.
- In the low-curvature approximation, the Hessian of `z(x,y)` represents the local curvature structure:

```text
H(x,y) = [ z_xx(x,y)  z_xy(x,y)
           z_xy(x,y)  z_yy(x,y) ]
```

- From the Hessian, Alonso derives Gaussian curvature, mean curvature, principal curvatures, and the local orientation axis.
- For progressive lenses, Alonso then specializes this general surface to a surface whose main progressive meridian is the `Y` axis.
- The `Y` axis is treated as an umbilical line: along `x = 0`, the two principal curvatures are equal, so local cylinder/astigmatism is zero on the meridian.
- The progressive prescription is encoded by allowing the meridional curvature/power function to vary with `y`.

Alonso's constructive representation:

```text
z(x,y) = sum_n q_n(y) x^n
```

where the `q_n(y)` functions are coefficient functions along the vertical coordinate.

With the `Y` axis as the umbilical meridian, the key meridian conditions are:

```text
z_xx(0,y) = z_yy(0,y) = k_p(y)
z_xy(0,y) = 0
```

Alonso then sets the first terms so that the surface can be written in the simple form:

```text
z(x,y) = double_integral k_p(y) dy^2 + (k_p(y)/2) x^2 + q_3(y) x^3 + ... + q_N(y) x^N
```

Interpretation:

- `double_integral k_p(y) dy^2` gives the meridian sag profile.
- `(k_p(y)/2) x^2` gives the local parabolic cross-section that matches curvature on the meridian.
- Higher-order terms such as `q_3(y) x^3 ... q_N(y) x^N` shape the off-meridian surface and control how astigmatism is distributed.

Study significance: Alonso's representation is not primarily a sampled power map. It is a smooth sag function with coefficient functions of `y`, chosen so that the meridian has prescribed progressive curvature while the surrounding surface remains geometrically compatible.

## User Hypothesis - Sphere Curvature Away From Vertex

User prompt: if the Hessian is the curvature matrix at a coordinate, then even for a sphere, points away from the vertex should not have curvature `1/R`.

Working judgment:

- The true principal curvatures of a sphere are `1/R` everywhere on the sphere.
- However, the raw Hessian of the Monge sag function `z(x,y)` is not the exact shape operator away from the vertex when the slope is nonzero.
- For a sphere written as a sag over the tangent plane, `z = R - sqrt(R^2 - x^2 - y^2)`, the Hessian entries change with `(x,y)`.
- At the vertex, where slope is zero, the Hessian equals the true local curvature matrix and gives `1/R`.
- Away from the vertex, exact curvature requires the first and second fundamental forms, or equivalently the shape operator, not just the Hessian in projected coordinates.
- Alonso's use of the Hessian is therefore best understood as a low-curvature / small-slope approximation. It is accurate near the vertex or when the surface slope is small.

Study significance: this is an important coordinate-system warning. In Alonso's approximation, the Hessian is treated as the curvature matrix, but exact curvature is coordinate/geometric and must account for local surface tilt. Do not confuse Hessian components in the chart with invariant principal curvatures away from the paraxial region.

## User Requested Addition - Hessian Matrix And Surface Applications

Purpose: clarify how the Hessian matrix is used as a local curvature representation for different surfaces, and how to apply it to progressive lenses in Alonso's framework.

### Hessian As Local Curvature Proxy

For a Monge surface:

```text
z = z(x,y)
```

the Hessian is:

```text
H(x,y) =
[ z_xx(x,y)  z_xy(x,y)
  z_xy(x,y)  z_yy(x,y) ]
```

In Alonso's low-curvature / small-slope approximation, this matrix is treated as the local curvature matrix.

Its eigenvalues approximate the local principal curvatures:

```text
k_1, k_2 = eigenvalues of H
```

Its eigenvectors approximate the local principal directions.

From the Hessian:

```text
mean curvature proxy = (z_xx + z_yy) / 2
cylinder curvature proxy = sqrt((z_xx - z_yy)^2 + 4 z_xy^2)
axis angle = 0.5 atan2(2 z_xy, z_xx - z_yy)
```

Optical surface power is approximately proportional to curvature:

```text
surface power ~= (n - 1) * curvature
```

where curvature must be in `1/m` if power is in diopters. If `x`, `y`, and `z` are in millimeters, unit conversion is required.

### Surface Examples

Plane:

```text
z = ax + by + c
H = [0 0
     0 0]
```

Interpretation: no curvature, no surface power.

Paraxial sphere / paraboloid:

```text
z ~= (x^2 + y^2) / (2R)
H = [1/R   0
     0   1/R]
```

Interpretation: equal curvature in all directions; this is an umbilic surface locally.

Exact sphere sag:

```text
z = R - sqrt(R^2 - x^2 - y^2)
```

Interpretation: true principal curvatures are `1/R` everywhere, but the raw Hessian in the global `x-y` chart changes away from the vertex because the surface normal tilts relative to the global `z` axis.

Cylinder:

```text
z ~= x^2 / (2R)
H = [1/R  0
     0    0]
```

Interpretation: one curved meridian and one flat meridian; this corresponds to pure surface cylinder in the low-slope model.

Toric / sphero-cylindrical local model:

```text
z ~= x^2/(2R_x) + y^2/(2R_y)
H = [1/R_x  0
     0      1/R_y]
```

Interpretation: two principal curvatures. Mean power comes from the average; cylinder comes from the difference.

General progressive surface:

```text
z = z(x,y)
H = H(x,y)
```

Interpretation: curvature changes across the aperture. The designer wants a smooth change of mean curvature along the corridor, while controlling the eigenvalue split away from the corridor.

### How To Use The Hessian For A Progressive Lens

1. Choose lens coordinates.

   Use `x` as horizontal lens coordinate and `y` as vertical coordinate. In Alonso's construction, the progressive meridian is the `Y` axis, so the corridor is at `x = 0`.

2. Define the desired meridian curvature profile.

   Alonso represents the prescribed progressive curvature along the meridian as:

```text
k_p(y)
```

   This profile encodes the distance-to-near power progression.

3. Enforce the umbilical meridian condition.

   Along `x = 0`, require:

```text
z_xx(0,y) = z_yy(0,y) = k_p(y)
z_xy(0,y) = 0
```

   This means no cylinder on the main progressive meridian in the low-slope model.

4. Construct a compatible sag surface.

   Alonso writes the surface as:

```text
z(x,y) = sum_n q_n(y) x^n
```

   The first terms are chosen to satisfy the meridian curvature prescription:

```text
z(x,y) = double_integral k_p(y) dy^2
       + (k_p(y)/2) x^2
       + q_3(y) x^3
       + ...
       + q_N(y) x^N
```

5. Compute the Hessian over the aperture.

   For analytic `z(x,y)`, differentiate symbolically or analytically. For a sampled/freeform sag grid, use smoothed numerical derivatives or fit a local polynomial/spline before differentiating.

6. Convert Hessian fields into design maps.

   At each `(x,y)`:

```text
mean curvature proxy = trace(H) / 2
cylinder curvature proxy = eigenvalue difference of H
axis = eigenvector direction
```

   These become approximate mean-power, cylinder, and axis maps.

7. Interpret the PAL tradeoff.

   If `k_p(y)` changes along the corridor but the corridor remains umbilical, the surrounding Hessian field must develop eigenvalue splitting away from the meridian. This is the local surface-geometry source of unwanted astigmatism.

### Exact Geometry Warning

The Hessian is a curvature proxy only under the low-slope approximation.

For exact curvature of a graph surface, use the first and second fundamental forms:

```text
I  = [1 + z_x^2    z_x z_y
      z_x z_y      1 + z_y^2]

II = 1 / sqrt(1 + z_x^2 + z_y^2)
     [z_xx  z_xy
      z_xy  z_yy]
```

The exact shape operator is:

```text
S = I^-1 II
```

and the exact principal curvatures are the eigenvalues of `S`, not of the raw Hessian. Alonso's chapter uses the Hessian because the approximation simplifies the PAL construction and gives useful design intuition.

## User Inquiries Already Linked From Step 02

- closed-loop / exact-differential compatibility behind Minkwitz
- finite lens-size qualification for global design comparisons
- eye center of rotation as a key parameter for PAL ray tracing

## Candidate Round 2 Notes

- `Design Rule - Minkwitz Channel Width Add Tradeoff.md`
- `Concept - Center Of Rotation In Spectacle Lens Optimization.md`
- `Concept - Conventional PAL.md`
- `Concept - Surface Compatibility In PAL Design.md`
- `Concept - Alonso Monge Chart PAL Surface Representation.md`
- `Concept - Umbilical Meridian In PAL Design.md`
- `Concept - Hessian Approximation vs True Surface Curvature.md`
- `Concept - Hessian To Power Cylinder Map.md`
- `Concept - Surface Hessian Matrix In Ophthalmic Optics.md`
- `Concept - Local Dioptric Power Matrix.md`
- `Concept - Mesh Defined Lens Surface.md`
- `Concept - Polynomial Lens Surface Representation.md`
- `Concept - Progressive Lens Reference Points.md`
- `Concept - Principal Curve In PAL Design.md`
- `Concept - Principal Power Profile.md`
- `Concept - PAL Lateral Inset.md`
- `Concept - User Power vs Lensmeter Power.md`
- `Concept - Compensated Power In PAL Design.md`
- `Comparison - Front Side Back Side Double Side PAL.md`
- `Comparison - Freeform vs Custom vs User Power PAL Design.md`
- `Design Rule - Umbilical Corridor Hessian Condition.md`
- `Design Rule - Corridor Width And Power Profile Slope.md`
- `Design Rule - MFH y10 And Progression Length.md`
- `Algorithm - Peripheral Power Distribution Optimization.md`
- `Algorithm - Position Of Use PAL Optimization.md`
- `Question - Which Power Layer Does Ben Optimize.md`

## Open Questions

- Which Alonso figures should be visually reviewed in full before closing this note?
- What exact notation does Alonso use for mean curvature, cylinder, and the Minkwitz relation?
- Which statements in Ben's deck are direct Alonso claims versus Ben's interpretation?
- How closely does Ben's MATLAB representation match Alonso's mesh/polynomial surface examples versus a custom sag-function composition?
- Does Ben's current optimizer target surface power, local dioptric power, lensmeter power, or user/as-worn power?
