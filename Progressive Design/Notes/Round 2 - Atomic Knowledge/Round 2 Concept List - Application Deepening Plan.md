---
type: synthesis
domain: progressive-lens
status: active
source:
  - "[[Study Note 01 - PAL Design Summary]]"
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
  - "[[Study Note 05 - Understanding Prism Thinning]]"
related:
  - "[[Bridge - PAL Theory To Ben MATLAB Code]]"
tags:
  - pal
  - round-2
  - concept-list
  - application-deepening
---

# Round 2 Concept List - Application Deepening Plan

## Definition

This note is the working concept list for Round 2 atomic PAL notes. It is not a MOC and not a chapter outline. It is a deepening checklist for converting raw atoms into useful independent notes.

Each atom should eventually contain:

- a direct definition
- real-life application examples
- source-backed evidence from `Reference/` and targeted literature/internet search where Round 1 notes are not enough
- links to engineering/code, clinical/wearer, industrial/product, or measurement/verification consequences

Important status note: the current Round 2 folder is a raw scaffold. The application sections give first-pass example directions, not final MD/PhD-level evidence. A note becomes deepened only after its application examples are tied to cited literature, standards, textbooks, patents, manufacturer/lab documents, or exact Ben-code evidence.

## Application

### Deepening Standard

A deepened atom must include:

- a precise definition
- at least one concrete application observation
- a citation or exact local source/code reference supporting that observation
- clear separation between source fact, engineering judgment, and open uncertainty

### Source Standard

Preferred source order:

1. Local `Reference/` files already in the vault.
2. PubMed or comparable peer-reviewed clinical/vision-science literature for clinical atoms.
3. Primary papers, standards, textbooks, patents, and professional technical references for engineering atoms.
4. Manufacturer technical documents, lab documentation, and product verification material for industrial atoms.
5. Internet sources only when they are authoritative enough for the claim.

### Batch Rule

Deepen 3-8 connected notes at a time. Do not bulk-fill all notes with uncited observations. Prefer clusters whose evidence overlaps:

- Hessian / power / cylinder
- prism / binocular fusion
- fitting / position of use
- target map / merit function
- hard-soft design / clinical adaptation

## Concept List

### Surface Geometry / Mathematical Atoms

These notes need application examples that connect the mathematical object to surface analysis, optical power, and Ben-code inspection.

- [[Concept - Sag Surface]]
  - Application examples to add: Ben sag function; exact versus sampled sag; manufacturing/freeform surface file.
- [[Concept - Spherical Sag Surface]]
  - Application examples to add: base curve, base sphere in Ben `SURF.sphere`, true curvature versus sag chart.
- [[Concept - Paraboloid Sag Surface]]
  - Application examples to add: paraxial approximation to sphere; local second-order model used for Hessian intuition.
- [[Comparison - Sphere Versus Paraboloid Curvature]]
  - Application examples to add: why a sphere's exact curvature is constant but raw sag Hessian changes off vertex.
- [[Concept - Cylindrical Sag Surface]]
  - Application examples to add: one-meridian curvature and orthogonal zero curvature; simple cylinder lens analogy.
- [[Concept - Toric Sag Surface]]
  - Application examples to add: sphere-cylinder ophthalmic surface; principal curvatures in orthogonal meridians.
- [[Concept - Aspheric Sag Surface]]
  - Application examples to add: conic constant, aberration control, non-spherical base designs.
- [[Concept - Progressive Sag Surface]]
  - Application examples to add: curvature increasing from distance to near; lateral unwanted astigmatism.
- [[Concept - Surface Curvature]]
  - Application examples to add: local surface power, curvature maps, cylinder maps.
- [[Concept - Principal Curvatures]]
  - Application examples to add: mean/cylinder decomposition; toric and PAL local curvature interpretation.
- [[Concept - Principal Curvature Directions]]
  - Application examples to add: cylinder axis, local principal meridians, eigenvector direction.
- [[Concept - Sag Hessian Matrix]]
  - Application examples to add: `zxx`, `zyy`, `zxy` in code; curvature proxy over PAL aperture.
- [[Equation - Principal Curvatures From Sag Hessian]]
  - Application examples to add: eigenvalue calculation in code; simplified diagonal failure when `zxy` is ignored.
- [[Equation - Mean Power From Sag Hessian]]
  - Application examples to add: target mean power map; unit scaling from mm to m.
- [[Equation - Surface Astigmatism From Sag Hessian]]
  - Application examples to add: cylinder map; hard/soft PAL comparison; corridor zero-cylinder check.
- [[Concept - Hessian Approximation Limit]]
  - Application examples to add: sphere off-vertex caveat; transition from design proxy to ray/user power.
- [[Concept - Low Curvature Approximation]]
  - Application examples to add: why early optimization may use surface metrics before ray tracing.
- [[Concept - Exact Curvature Shape Operator]]
  - Application examples to add: first/second fundamental forms; exact curvature validation case.
- [[Concept - Surface Compatibility]]
  - Application examples to add: why arbitrary target curvature maps may not integrate to a surface.
- [[Concept - Minkwitz Theorem]]
  - Application examples to add: add gradient causing lateral astigmatism; design impossibility constraint.

### PAL Optical Design Atoms

These notes need application examples that connect a PAL design variable to wearer performance and/or a target map.

- [[Concept - Progressive Addition Lens]]
- [[Concept - Distance Zone]]
- [[Concept - Intermediate Zone]]
- [[Concept - Near Zone]]
- [[Concept - Progressive Corridor]]
- [[Concept - Umbilical Line]]
- [[Concept - Add Power]]
- [[Concept - Add Power Profile]]
- [[Concept - Corridor Power Gradient]]
- [[Design Rule - Higher Add Increases Astigmatism]]
- [[Design Rule - Shorter Corridor Increases Astigmatism]]
- [[Design Rule - Wider Clear Zones Concentrate Astigmatism]]
- [[Concept - Unwanted Surface Astigmatism]]
- [[Concept - Surface Power Map]]
- [[Concept - Cylinder Map]]
- [[Concept - Mean Power Plot]]
- [[Concept - Power Profile Plot]]
- [[Concept - Contour Map]]
- [[Concept - Zero Cylinder Along Corridor]]
- [[Comparison - Hard Versus Soft PAL Design]]
- [[Concept - Hard PAL Design]]
- [[Concept - Soft PAL Design]]
- [[Concept - Skew Distortion]]
- [[Concept - User Power]]
- [[Concept - Surface Power Versus User Power]]
- [[Concept - Position Of Use Optimization]]

Application examples to add across this cluster:

- patient task zones: driving, computer, reading
- hard/soft design maps from Meister/SOLA and Sheedy/Rotlex references
- add/corridor examples such as `+2.50 D / 17 mm = 0.15 D/mm`
- zero-cylinder corridor as an implementation target
- surface power versus user power as the reason to move from surface proxy to full eye/lens geometry

### Surface Parameterization / Code-Audit Atoms

These notes need application examples from Ben's MATLAB files and should become the main code-inspection checklist.

- [[Concept - Base Sphere Plus Progressive Correction]]
- [[Concept - Meridian Sag Profile]]
- [[Concept - Meridian Power Profile]]
- [[Concept - Polynomial Sag Correction]]
- [[Concept - Gated Polynomial Surface Term]]
- [[Concept - Spline Sag Correction]]
- [[Concept - Gridded Surface Interpolant]]
- [[Concept - Target Power Map]]
- [[Concept - Target Cylinder Map]]
- [[Concept - Power Weight Map]]
- [[Concept - Cylinder Weight Map]]
- [[Concept - Merit Function]]
- [[Concept - Optimization Variable Vector]]
- [[Concept - Variable List To Optimizer Vector]]
- [[Concept - Staged Optimization]]
- [[Concept - Nonlinear Constraint Targeting]]
- [[Question - Does Ben Optimize Thickness]]
- [[Question - Does Ben Model Binocular Performance]]
- [[Question - Does Ben Model Prism Or Fitting Geometry]]

Application examples to add across this cluster:

- exact function/class references from Ben code
- `SURF.sphere`, `SURF.k`, `SURF.add`, `SURF.y0`, `SURF.NRP_y`, `SURF.off_edge_y`, `SURF.cx2`
- `griddedInterpolant` or spline correction usage
- target/weight maps for distance, corridor, near, periphery
- merit-function terms and nonlinear constraints

### Clinical / Wearer Application Atoms

These notes need real patient/wearer scenarios and should avoid code-only framing.

- [[Clinical Concept - Clear Zone Width]]
- [[Clinical Concept - Peripheral Blur]]
- [[Clinical Concept - Swim]]
- [[Clinical Concept - PAL Adaptation]]
- [[Clinical Concept - Head Movement Versus Eye Movement]]
- [[Clinical Concept - Binocular Image Mismatch]]
- [[Clinical Concept - Vertical Prism Imbalance]]
- [[Clinical Concept - Yoked Vertical Prism]]
- [[Clinical Concept - Prism Diopter]]
- [[Clinical Concept - Ghost Reflections From Prism]]
- [[Clinical Concept - Fitting Cross]]
- [[Clinical Concept - Monocular PD In PAL Fitting]]
- [[Clinical Concept - Fitting Height]]
- [[Clinical Concept - Vertex Distance]]
- [[Clinical Concept - Pantoscopic Tilt]]
- [[Clinical Concept - Face Form Wrap]]
- [[Clinical Concept - PRP Prism Verification]]
- [[Design Rule - Prism Thinning Must Be Yoked]]
- [[Design Rule - Avoid Unintended Vertical Imbalance]]

Application examples to add across this cluster:

- first-time PAL wearer adaptation
- computer corridor complaints
- stair/ground swim and peripheral blur
- vertical diplopia risk from unmatched prism-thinning
- monocular PD and fitting-height failure modes
- vertex distance, pantoscopic tilt, and wrap effects on position of use

### Industrial / Manufacturing / Product Atoms

These notes need lab, manufacturing, verification, product-marking, and commercial-design examples.

- [[Industrial Concept - Prism Thinning]]
- [[Industrial Concept - Equi-Thinning]]
- [[Industrial Concept - Base Down Prism Thinning]]
- [[Industrial Concept - Base Up Prism Thinning]]
- [[Industrial Concept - Rule Of Thumb Prism Thinning]]
- [[Industrial Concept - Computed Prism Thinning]]
- [[Industrial Concept - Center Thickness]]
- [[Industrial Concept - Edge Thickness Balance]]
- [[Industrial Concept - Blank Geometry]]
- [[Industrial Concept - Frame Shape Dependence]]
- [[Industrial Concept - Prism Ring Surfacing]]
- [[Industrial Concept - Three Axis Generator]]
- [[Industrial Concept - PRP]]
- [[Industrial Concept - DRP]]
- [[Industrial Concept - NRP]]
- [[Industrial Concept - Alignment Reference Marks]]
- [[Industrial Concept - PAL Permanent Engravings]]
- [[Industrial Concept - Product Marking And Verification Workflow]]
- [[Industrial Concept - Replacement Lens Risk]]
- [[Industrial Concept - Add Specific PAL Design]]
- [[Industrial Concept - Prescription Specific PAL Design]]
- [[Industrial Concept - Symmetrical PAL Design]]
- [[Industrial Concept - Asymmetrical PAL Design]]
- [[Industrial Concept - Freeform PAL]]
- [[Industrial Concept - Personalized PAL]]
- [[Industrial Concept - Lab Tolerance Versus Clinical Tolerance]]

Application examples to add across this cluster:

- prism-thinning worked examples from Meister/SOLA
- replacement of one PAL lens and vertical prism mismatch
- PRP/DRP/NRP verification workflow
- frame shape and edge thickness calculation
- add-specific and prescription-specific PAL product families
- freeform/personalized PAL manufacturing workflow

### Bridge Atoms

These notes should connect at least two domains and should be deepened only after their endpoint atoms have stronger applications.

- [[Bridge - Sag Hessian To Surface Power Map]]
- [[Bridge - Surface Astigmatism To Wearer Blur]]
- [[Bridge - Corridor Gradient To Clinical Adaptation]]
- [[Bridge - Cylinder Map To Hard Soft Design]]
- [[Bridge - Fitting Geometry To Position Of Use]]
- [[Bridge - Prism Thinning To Binocular Fusion]]
- [[Bridge - Surface Design To Manufacturing Thickness]]
- [[Bridge - Ben Sag Function To PAL Optical Intent]]
- [[Bridge - Ben Optimization Targets To Clinical Zones]]
- [[Bridge - PAL Theory To Ben MATLAB Code]]

Application examples to add across this cluster:

- explicit equation-to-map-to-code examples
- clinical meaning of a plotted map
- manufacturing constraints ignored by early optimization
- how a Ben MATLAB target or variable maps to PAL optical intent

## Meta

### File Purpose

This file updates the Round 2 concept list to match the revised application rule. It is a planning/checklist note, not a substitute for the individual atomic notes.

### Source Basis

The list is based on the current Round 1 study notes, the user-defined requirement for MD/PhD-level application examples, and the current active `PLAN.md` rule for Round 2 deepening.

### Related Notes

- [[Bridge - PAL Theory To Ben MATLAB Code]]
- [[Concept - Sag Hessian Matrix]]
- [[Clinical Concept - Prism Diopter]]
- [[Industrial Concept - Prism Thinning]]

### Open Questions

- Which cluster should be deepened first: Hessian/code audit, prism/binocular, or clinical fitting?
- Which internet/literature sources should be treated as authoritative enough for PAL clinical/application examples?
