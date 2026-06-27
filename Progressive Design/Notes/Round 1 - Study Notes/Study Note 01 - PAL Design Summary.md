---
type: study-note
domain: progressive-lens
status: active
source: "Reference/BW Work/00-PowerPointSiummaries/PAL Design Summary.pptx"
related:
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
  - "[[Study Note 06 - PAL Optimization Example 00]]"
  - "[[Study Note 08 - C_PAL]]"
  - "[[Study Note 10 - BW_PAL_SurfaceSAG_V1]]"
  - "[[Study Note 11 - BW_PAL_Targets_03]]"
tags:
  - pal
  - bw-work
  - round-1
  - study-note
---

# Study Note 01 - PAL Design Summary

## File Purpose

This Round 1 study note represents Ben Woolley's `PAL Design Summary.pptx`. It preserves the deck's source-aligned content and identifies candidate Round 2 notes without turning the deck into a final concept map.

## Source

`Reference/BW Work/00-PowerPointSiummaries/PAL Design Summary.pptx`

Slide title/date: `PAL Design Summary`, April 15, 2021.

## Extraction Method

Text was extracted from the PPTX slide XML. The deck contains 11 slides, no speaker notes, and 18 embedded media items.

This note captures the extracted text content and source-supported structure. Embedded plots, images, and layout relationships were not visually interpreted in this pass and should be reviewed later where slide meaning depends on graphics.

## What This Source Appears To Be

This is Ben's compact implementation-status deck for his progressive addition lens design work. It points to the broader `Design of Progressive Spectacle Lenses_V1.pptx` deck for literature/background notes, then states that the best summary of current status is to step through the MATLAB code.

## Why This Matters

This source defines the first mental model for the BW work: Ben is building toward full lens/eye/binocular optimization, but his current implementation begins with MATLAB optimization of surface power and cylinder as a development proxy before full ray tracing and binocular constraints.

## Key Content

### Slide 1 - Title

The deck is titled `PAL Design Summary` and dated April 15, 2021.

### Slide 2 - Summary 1

Ben identifies `Design of Progressive Spectacle Lenses_V1.pptx` as the broader literature and initial optimization note collection.

He names Alonso's `Modern Ophthalmic Optics` as probably the best single reference. The deck states that Alonso recommends optimization using a complete lens in proper configuration with a model eye to compensate oblique aberrations, but does not address binocular considerations.

Ben identifies `Optimization methods for the design of progressive lenses` as the next best detailed reference for single-lens optimization. His takeaway is that splines can describe the optimized surface and that nonlinear constraints on `target_power` and `target_cylinder` may give better results than simple weighting.

Ben did not find detailed references on binocular optimization. His planned approach is incremental:

1. single surface design
2. single lens design
3. binocular lens design

Current implementation starts by optimizing surface power and cylinder, with gradients, as a proxy for full optimization. The deck states this avoids the overhead and inefficiency of full ray tracing while developing surface geometry and optimization capability.

The full intended optimization must be binocular and consider inter-eye differences, especially prism as the eye scans in angle.

### Slide 3 - Summary 2

Ben says the best way to summarize current status is to step through the MATLAB code.

The deck refers to `PAL_Optim_999.m` as the current documented workflow file. In the current folder, the apparent corresponding example scripts are `PAL_Optimization_Example_00.m` and `PAL_Optimization_Example_01.m`; this mapping should be verified.

Key implementation features described:

- optimization is for surface power and cylinder
- surface power/cylinder are defined by `BW_PAL_SurfaceSAG_V1.m`
- input is a structure of the form `SURF.var1`, `SURF.var2`, etc.
- optimization variables can be specified as a list of variable names referring to surface descriptors
- the variable-list mechanism supports staged optimization cycles with changing optimization variables
- the implementation uses MATLAB classes
- results and interim results are saved to PDF

The slide text includes the misspelling `BW_PAL_SuraceSAG_V1.m`; the actual source file is `BW_PAL_SurfaceSAG_V1.m`.

### Slide 4 - Class Definitions

The deck lists the main class architecture:

- `C_PAL`
- `C_PAL_Surface`
- `C_PAL_Coordinates`
- `C_Wavefront`
- `C_EYE`
- `C_Rx`

`C_PAL` appears to be the central orchestrating class. Listed methods/properties include surface initialization, surface metrics, global search, simulated annealing, `fmincon`, merit-function update, variable-vector mapping, spline setup, plotting, and dependent quantities such as front radius, base curve, back power, and current merit function.

`C_PAL_Surface` appears to manage surface description, sag function, PCA/power-cylinder analysis, and power-target-derived sag estimates.

`C_Wavefront` appears to provide wavefront, surface power/cylinder, tangential power, raytrace metrics, and PSF-related fields.

### Slide 5 - PAL Surface Sag Definition

The deck describes `BW_PAL_SurfaceSAG_V1(SURF,x,y)` as the PAL surface sag function.

Source-supported components:

- radially symmetric base portion defined by sphere power, example `5.75D`
- meridian sag and power along the y-axis
- a `Pm*x^2` term that forces first-order cylinder approximately zero along the y-axis, which Ben says is generally desired along the vision corridor
- optional spline surface defined by `griddedInterpolant`
- `SURF` parameters including `index`, `sphere`, `k`, `mid_point_fraction`, `add_profile_shape_factor`, `add`, `y0`, `NRP_y`, `off_edge_y`, and `cx2`

The slide shows example `SURF.cx2` rows, suggesting polynomial correction terms with y-range gating.

### Slide 6 - Meridian Profile

The deck connects meridian power/sag to:

`BW_Meridian_Profile_1(y,SURF.add,SURF.add_profile_shape_factor,SURF.mid_point_fraction,SURF.y0,SURF.NRP_y,SURF.off_edge_y)`

The source states this function allows the shape of the power profile along a meridian to be defined, then analytically calculates sag from the power profile.

Parameters explicitly emphasized:

- `mid_point_fraction`
- `add_profile_shape_factor`
- `add`
- `NRP_y`, described as peak add location
- `y0`, described as add equals zero location
- `off_edge_y`, described as add equals zero farther off edge

The deck says this function is useful both for specifying power targets and for direct control of design intent inside the surface sag definition.

### Slide 7 - `cx2` Polynomial Terms

The deck describes `C(x,y)` polynomial terms of the form involving powers of `x` and `y`.

Example rows use `SURF.cx2(n,:) = [x_power y_start y_end coefficients...]`.

Source-supported interpretation:

- `cx2` terms are active only inside the specified y range
- `C = 0` outside the y range
- terms can use different powers of `x`, such as `x^2`, `x^4`, and `x^6`

The exact coefficient indexing should be verified against `BW_PAL_SurfaceSAG_V1.m`.

### Slide 8 - `PAL_Optim_999.m` Console Output

The deck includes MATLAB console output from `PAL_Optim_999`.

Important behavior shown:

- plotting warnings occur during `M_plot_all`, especially legends and constant `ZData` contours
- MATLAB starts a local parallel pool with four workers
- `fmincon` is used repeatedly
- merit function values decrease substantially across iterations
- spline optimization uses `delta_spline`, `delta_y`, `cyl_wt`, and `fcount`
- long runtime is expected; the shown run ends after roughly 13,200 seconds

The output references `BW_PAL_Weights_01` and at one point `BW_PAL_Targets_02`, while the deck later discusses `BW_PAL_Targets_03`. This likely reflects work-in-progress versioning and should be checked against available code.

### Slide 9 - Target/Weight And Merit Function Summary

The deck states that power and cylinder targets and weights are user input.

It also states that power and cylinder gradients can be included in the merit function, with contributions included along with power and cylinder terms.

The slide identifies `mf_val` as the merit-function value and references:

- difference between mean power after optimization and target power
- difference between cylinder after optimization and target cylinder
- mean power after optimization

This slide likely depends on graphical output that was not visually interpreted in the text-only pass.

### Slide 10 - `BW_PAL_Targets_03`

Ben states he is modifying how targets, weights, and optimization are defined.

The deck says he is implementing something similar to the Penalver PhD thesis, with some regions using absolute targets/weights and other regions, such as lower periphery, using max/min constraints.

The source states this requires changing `BW_PAL_Targets_xxx.m` and how the merit function is calculated.

The deck says `C_PAL.m` already has a framework for adding max/min constraints to `fmincon`, but the new target/weight function and the implementation are not complete.

### Slide 11 - Improvements

Listed planned improvements:

- update targets and weights
- add nonlinear constraints to the merit function
- modify targets/weights toward a myopia-control objective
- add eye model and full geometry to analysis/merit function
- add binocular analysis/merit function

## Candidate Round 2 Notes

- `Concept - Ben's Incremental PAL Optimization Strategy`
- `Concept - Surface Power and Cylinder as Proxy for Full Raytrace`
- `Concept - Complete Lens Plus Eye Model for PAL Optimization`
- `Concept - Binocular PAL Merit Function`
- `Concept - PAL Surface Sag Model`
- `Design Rule - Meridian Cylinder Control with Pm x squared`
- `Design Rule - Target and Weight Regions vs Nonlinear Constraints`
- `Algorithm - Staged Variable List Optimization`
- `Code Map - BW MATLAB Class Architecture`
- `Question - Mapping PAL_Optim_999 to Current Example Scripts`
- `Question - How Gradients Enter The Merit Function`
- `Question - Visual Meaning of PAL Design Summary Slide 9`
- `Question - BW Target Function Version History`

## Important Terms / Parameters

- `PAL_Optim_999.m`
- `PAL_Optimization_Example_00.m`
- `PAL_Optimization_Example_01.m`
- `BW_PAL_SurfaceSAG_V1.m`
- `BW_PAL_Targets_03`
- `BW_PAL_Targets_xxx.m`
- `BW_PAL_Weights_01`
- `target_power`
- `target_cylinder`
- surface power
- cylinder
- power/cylinder gradients
- `mf_val`
- `fmincon`
- nonlinear constraints
- splines
- `griddedInterpolant`
- `SURF.index`
- `SURF.sphere`
- `SURF.k`
- `SURF.mid_point_fraction`
- `SURF.add_profile_shape_factor`
- `SURF.add`
- `SURF.y0`
- `SURF.NRP_y`
- `SURF.off_edge_y`
- `SURF.cx2`
- `delta_spline`
- `delta_y`
- `cyl_wt`

## Links To Other Study Notes

Planned Round 1 links:

- [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]
- [[Study Note 06 - PAL Optimization Example 00]]
- [[Study Note 07 - PAL Optimization Example 01]]
- [[Study Note 08 - C_PAL]]
- [[Study Note 09 - C_PAL_Surface]]
- [[Study Note 12 - C_Wavefront]]
- [[Study Note 10 - BW_PAL_SurfaceSAG_V1]]
- [[Study Note 11 - BW_PAL_Targets_03]]
- [[Study Note 13 - BW_Meridian_Profile_1]]
- [[Study Note 14 - BW_Meridian_Profile_2]]

## Open Questions

- Does `PAL_Optim_999.m` correspond directly to the available `PAL_Optimization_Example_00.m` or is it an older/private script not present in the folder?
- Why does the console output reference `BW_PAL_Targets_02` while the deck discusses `BW_PAL_Targets_03`?
- Where exactly are power/cylinder gradients implemented in the current code?
- How are max/min nonlinear constraints represented in `C_PAL.m`, and how complete is that framework?
- Which slide 9 visual outputs are most important to reproduce in Round 3?
- How should Ben's planned binocular merit function handle inter-eye prism differences during gaze scan?
- Does the current code include an eye model sufficient for full geometry, or is that still mostly planned?
