---
type: study-note
domain: progressive-lens
status: active
source: "Reference/BW Work/00-PowerPointSiummaries/Design of Progressive Spectacle Lenses_V1.pptx"
related:
  - "[[Study Note 01 - PAL Design Summary]]"
  - "[[Study Note 06 - PAL Optimization Example 00]]"
  - "[[Study Note 08 - C_PAL]]"
  - "[[Study Note 10 - BW_PAL_SurfaceSAG_V1]]"
tags:
  - pal
  - bw-work
  - round-1
  - study-note
---

# Study Note 02 - Design of Progressive Spectacle Lenses V1

## File Purpose

This Round 1 study note represents Ben Woolley's `Design of Progressive Spectacle Lenses_V1.pptx`. It captures the deck slide by slide as a source-aligned working notebook for PAL design background, literature triage, design questions, and early MATLAB optimization experiments.

## Source

Primary source:

`Reference/BW Work/00-PowerPointSiummaries/Design of Progressive Spectacle Lenses_V1.pptx`

Companion rendering:

`Reference/BW Work/00-PowerPointSiummaries/Design of Progressive Spectacle Lenses_V1.pdf`

## Extraction Method

Text was extracted from the PPTX slide XML. The deck contains 39 slides, no speaker notes, and 52 embedded media items.

This note captures source-supported text content and deck structure. Embedded screenshots, plots, scanned figures, and layout-dependent meaning were not visually interpreted in this pass. Slides that appear to depend heavily on figures or optimization plots should be reviewed visually later.

## What This Source Appears To Be

This is not a polished presentation. Ben describes it as a way to share information and notes about progress on developing PAL design capability and to support discussion. It combines literature review, design context, reference notes, and early optimization experiment logs.

## Why This Matters

This deck gives the broader design context behind the shorter `PAL Design Summary.pptx`. It explains what Ben thinks industry and academic groups are doing, which references he considers useful, which PAL design variables matter, and what early MATLAB optimization attempts taught him before the later summary deck.

## Slide-by-Slide Study Notes

### Slide 1 - Design of Progressive Spectacle Lenses

Title slide.

Source-supported role: establishes the deck subject as progressive spectacle lens design.

### Slide 2 - Working-Notebook Purpose

Ben states this PowerPoint is not intended as a polished presentation. It is a way to share information and notes about progress on developing PAL design capability and to support discussion.

The slide also references a password-protected OneDrive location for shared files.

Study significance: this deck should be read as a working engineering notebook, not as a final design specification.

### Slide 3 - Literature Search And Review

Ben introduces a literature-search section with general PAL resources, including books, journal articles, and websites.

He states that PDF files are in the shared `References` folder and that he has comments in some PDFs and in this document.

Study significance: this slide frames the deck as both a literature map and a design-progress note.

#### Filename-Derived Key Concepts From Reference Folder

These are provisional concepts inferred from the filenames in `Reference/BW Work/01-References_PALdesign/` and Ben's adjacent slide comments. They are useful as an orientation glossary, but each definition should be validated when the corresponding PDF or spreadsheet is read.

**Progressive addition lens design**

- Provisional definition: Design of spectacle lenses with spatially varying optical power, usually moving from distance correction to near addition while managing unwanted astigmatism and distortion.
- Reference filename cues: `Fundamentals of Progressive Addition Lens Design_MeistgerSOLA1998.pdf`, `PAL_review by SOLA.pdf`, `ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`.

**Advanced PAL versus conventional PAL**

- Provisional definition: Comparison between newer PAL design methods and conventional progressive lens design, likely involving improved personalization, freeform surface control, or optimized aberration distribution.
- Reference filename cue: `Advance_design_of_progressive_addition_lens_over_conventional_2019.pdf`.

**Superposition / delta-sag design**

- Provisional definition: A design technique where multiple lens designs or delta-sag maps are blended, possibly by weighted averaging, to create a new progressive surface.
- Reference filename cue: `aoeasy_whitepaper.pdf`, plus Ben's slide comment.

**Dual-surface PAL**

- Provisional definition: A PAL design where progressive or compensating optical behavior is distributed across both front and back surfaces rather than only one surface.
- Reference filename cues: `dual surface PAL 2020 osac-3-3-580.pdf`, `US8931898_DAL_DirectADDLens_2018.pdf`.

**PAL dissertation-level research**

- Provisional definition: Deep academic treatment of progressive lens design, optimization, perception, or wearer performance, usually with broader literature review and methodological detail.
- Reference filename cues: `Dulce Gonzalez_Dissertation_2018.pdf`, `Spatial perception and pals phd thesis hendicott 2007.pdf`, `OptimizationMethods for PALs phd thesis TGCP1de1.pdf`.

**Digital work and pre-presbyopes**

- Provisional definition: Evaluation of PAL effects for users doing digital work before full presbyopia, possibly relevant to early add, accommodative lag, or myopia-control use cases.
- Reference filename cue: `Effects_of_PALS_on_DigitalWork_pre-presbyopes_2018_opx-95-457.pdf`.

**Essilor / Varilux design language**

- Provisional definition: Industry/product framing around PAL design quality, distortion control, personalization, and marketed design improvements.
- Reference filename cues: `EssilorSummaryPDF_1.pdf`, `Varilux Nanoptix White Paper.pdf`, `Varilux S Series, breaking the limits (1).pdf`, `Varilux_Fitting_N_Dispensing_Guide_LR.pdf`, `PanamicDesign2000_JeanLouisMercierEssilor.pdf`.

**Freeform manufacturing**

- Provisional definition: Manufacturing approach that can directly create complex/freeform progressive surfaces, enabling more personalized or as-worn optimized designs.
- Reference filename cues: `Optics_of_Freeform_progressive_lenses_Meister CE credit.pdf`, `freeform mfg for PALS fast tool servo Cai_2017_IOP_Conf._Ser.__Earth_Environ._Sci._69_012130.pdf`.

**Fast tool servo manufacturing**

- Provisional definition: A fabrication method for producing non-rotationally symmetric or freeform optical surfaces using high-speed controlled tool motion.
- Reference filename cue: `freeform mfg for PALS fast tool servo Cai_2017_IOP_Conf._Ser.__Earth_Environ._Sci._69_012130.pdf`.

**Binocular visual aberration representation**

- Provisional definition: Methods for graphically or mathematically representing aberrations seen by both eyes, especially when each eye views through different lens regions.
- Reference filename cue: `Graphical_representation_of_visual_aberrations_biocular_magnifiers_ThalesOptics.pdf`.

**High myopia presentation context**

- Provisional definition: Background or clinical/design considerations for high myopes, potentially relevant to lens thickness, base curves, peripheral optics, or myopia-control goals.
- Reference filename cue: `highmyopiatopresent-160711124239_SAbinaPoudel.pdf`.

**Wavefront tracing for PALs**

- Provisional definition: Ray/wavefront-based analysis and optimization method that evaluates optical performance through the lens-eye system rather than only local surface power.
- Reference filename cues: `UsingWavefrontTracingVisualizationOptimizationPALS_Loos1998.pdf`, `loos_Greiner_Seidel_PAL.pdf`.

**Eye model with accommodation**

- Provisional definition: Optical model including eye geometry and accommodative state, useful when optimizing lens performance for gaze and object distance.
- Reference filename cue: `loos_Greiner_Seidel_PAL.pdf`, plus Ben's slide comment.

**Modern ophthalmic optics framework**

- Provisional definition: Broad textbook framework covering spectacle lens optics, surface math, progressive lenses, and reference literature.
- Reference filename cues: `ModernOphthalmicOptics_Alonso2019_Contents.pdf`, `ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`, `ModernOphthalmicOptics_Alonso2019_References.pdf`, `ophthaloptics_Alonso_Alda_MarcelDecker.pdf`.

**PAL design software / designer tool**

- Provisional definition: Software or design environment for creating progressive lens surfaces or evaluating designs.
- Reference filename cue: `NovarDesigner.pdf`.

**Optimization methods for PALs**

- Provisional definition: Mathematical and numerical strategies for fitting PAL surface parameters to power, cylinder, prism, distortion, or other merit-function targets.
- Reference filename cue: `OptimizationMethods for PALs phd thesis TGCP1de1.pdf`.

**Literature summary / reading index**

- Provisional definition: Spreadsheet or document used to organize source references, comments, priorities, and bibliographic orientation.
- Reference filename cue: `PAL Literature Summary v1.xlsx`.

**PAL design presentation**

- Provisional definition: Educational or project presentation that may summarize PAL design variables, methods, or implementation choices.
- Reference filename cue: `PAL_Design_Presentation_SabinaPoudel_2017.pdf`.

**Peripheral PAL design**

- Provisional definition: Design of PAL peripheral optics, including effects on accommodative behavior, myopia, distortion, or wearer adaptation outside the central corridor.
- Reference filename cue: `PeripheralDesignofPALS_Lag_of_Accommodation_Myopes.pdf`.

**Lag of accommodation in myopes**

- Provisional definition: Difference between accommodative demand and accommodative response in myopic users, potentially influenced by PAL add/peripheral design.
- Reference filename cue: `PeripheralDesignofPALS_Lag_of_Accommodation_Myopes.pdf`.

**Personalized PAL design**

- Provisional definition: Progressive lens design using individual wearer parameters, prescription, frame geometry, or visual behavior rather than generic design assumptions.
- Reference filename cue: `PersonalizedDesignForPAL_SuzhouU_oe-25-23-28100.pdf`.

**Ophthalmic lens principles**

- Provisional definition: Foundational theory of spectacle lens optics, power, cylinder, prism, surfaces, and dispensing geometry.
- Reference filename cues: `Principles of Ophthalmic Lenses Jalie 1984.pdf`, `Spectacle Lens Design - a review (Atchison  AO july92).pdf`.

**Matching PAL specifications**

- Provisional definition: Matching PAL design to prescribed or desired wearer-specific optical specifications, possibly including near/distance zones, corridor, or power distribution.
- Reference filename cue: `Progressive_addition_lenses_-_Matching_the_specifi._Sheedy2004pdf.pdf`.

**Rotlex / measured PAL comparison**

- Provisional definition: Instrument-based measurement and comparison of PAL power and residual cylinder maps across commercial designs.
- Reference filename cues: `Sheedy Correlation Analysis OVS2004.pdf`, `Sheedy PAL Rotlex Comparison.pdf`.

**Spatial perception with PALs**

- Provisional definition: How progressive lens distortion, power gradients, and peripheral aberrations affect perceived space, motion, and adaptation.
- Reference filename cue: `Spatial perception and pals phd thesis hendicott 2007.pdf`.

**Near triad**

- Provisional definition: Coupled visual response involving convergence, accommodation, and pupil size during near viewing; relevant to binocular PAL use and myopia-control thinking.
- Reference filename cue: `The_near_triad_and_associated_visual_problems.pdf`.

**Prism thinning**

- Provisional definition: Intentional prism/base-down strategy to reduce lens thickness imbalance in PAL blanks while managing OD/OS prism balance.
- Reference filename cue: `understanding prism-thinning_Meister_SOLA_1998.pdf`.

**PAL patent landscape**

- Provisional definition: Protected design approaches, surface definitions, direct-add methods, or product-specific optimization claims.
- Reference filename cues: `US06955433.pdf`, `US20120262668A1_2012_essilor.pdf`, `US8882268.pdf`, `US8931898_DAL_DirectADDLens_2018.pdf`.

**Fitting and dispensing guide**

- Provisional definition: Practical rules for placing, marking, measuring, and dispensing progressive lenses relative to frame and wearer reference points.
- Reference filename cue: `Varilux_Fitting_N_Dispensing_Guide_LR.pdf`.

**Product-specific PAL generations**

- Provisional definition: Named commercial PAL design families that may encode different strategies for corridor, distortion, binocular behavior, or personalization.
- Reference filename cues: `Varilux Nanoptix White Paper.pdf`, `Varilux S Series, breaking the limits (1).pdf`, `PanamicDesign2000_JeanLouisMercierEssilor.pdf`.

### Slide 4 - Reference Inventory And Comments

This slide lists many PDFs and includes short source comments.

Important source-supported comments:

- `aoeasy_whitepaper.pdf`: mentions a superposition design technique using weighted average of delta sag from two or more designs.
- `Fundamentals of Progressive Addition Lens Design_MeistgerSOLA1998.pdf`: described as very basic general information.
- `Graphical_representation_of_visual_aberrations_biocular_magnifiers_ThalesOptics.pdf`: flagged as helpful for modeling two eyes looking through different portions of OD and OS lenses.
- `loos_Greiner_Seidel_PAL.pdf`: described as same work as the next paper, PAL optimization with ray tracing, including an eye model with accommodation.
- `ophthaloptics_Alonso_Alda_MarcelDecker.pdf`: described as summarizing monocular spectacle analysis with the eye, including power, astigmatism, and prism effects; Ben says it duplicates Alonso's book.
- `PAL_review by SOLA.pdf`: described as an early-2000s white paper showing ray trace metrics beyond power/cylinder, including prism and rates of change of prism/power.
- `PanamicDesign2000_JeanLouisMercierEssilor.pdf`: Ben says Mercier was a main Essilor lens designer, and that Essilor was doing ray tracing and considering distortion and inter-eye distortion differences by 2000. Ben notes the presentation is high level and light on technical details.
- Sheedy papers: Ben says Sheedy used Rotlex measurements to compare power and residual cylinder profiles across designs, and that Alonso refers to this work as partial verification of theory connecting ADD, maximum unwanted astigmatism, meridional power change, and channel width.
- `understanding prism-thinning_Meister_SOLA_1998.pdf`: prism thinning reduces top-bottom thickness difference and some center thickness; designs must avoid prism imbalance between OD and OS; amount depends on distance power, add, fitting cross height, fitting cross decentration, and frame shape.

Candidate Round 2 direction: this slide can seed `Concept - Ben's PAL Literature Map`.

### Slide 5 - Modern Ophthalmic Optics As Framework

Ben recommends getting Alonso's `Modern Ophthalmic Optics` book.

Source-supported reasons:

- it includes a progressive lenses section
- it has useful surface math
- it contains an extensive reference list
- Ben treats it as a strong framework for starting the design effort

Study significance: this slide identifies Alonso as the primary background reference for Ben's PAL design thinking.

### Slide 6 - Modern Ophthalmic Optics Scanned Sections

The slide references `ModernOphthalmicOptics_Alonso2019_References.pdf`.

Ben says the PDF is the book table of contents and that scanned sections marked in red are included in the shared folder, with select figures/text embedded in some slides.

Visual review needed: the red markings and embedded figures are not captured in text extraction.

### Slide 7 - Alonso Design Approach And Missing Terms

Ben states that Alonso's recommended design approach is recent enough to reflect current manufacturer practice and is essentially the approach he would recommend.

Source-supported approach:

- optimize the lens in conjunction with an eye model
- use a merit function with targets and weights for desired power profile and other vision-impacting aberrations
- higher-order aberrations beyond power and cylinder are unimportant along line of sight

Ben's possible additions:

- manufacturing constraints
- cosmetic constraints
- peripheral aberrations, especially for myopia control if relevant
- binocular metrics that evaluate both eyes simultaneously
- consistent prism/distortion profiles as eyes scan the field

Technical concern: adding peripheral aberration grids for each gaze direction can explode the number of analysis points.

Candidate Round 2 direction: `Concept - Alonso Complete Lens Eye Model Approach`.

### Slide 8 - How Others Design PALs

Ben says manufacturers now optimize PALs using exact ray tracing with lenses in as-used position relative to the eye.

He also notes some binocular and distortion considerations, but says details mostly come from academic publications and manufacturer marketing/white papers.

Study significance: this slide frames industry baseline as ray-tracing/as-worn optimization, not only surface power/cylinder maps.

### Slide 9 - Essilor / Varilux References

The slide lists:

- `Varilux S Series, breaking the limits (1).pdf`
- `EssilorSummaryPDF_1.pdf`
- `Varilux Nanoptix White Paper.pdf`
- `FullPresentationWebJeanLouisMercier.pdf`

Ben says these are short on details but give insight into what Essilor was doing even 20 years earlier.

Study significance: read these as product/design-language references and clues about industry practice, not as complete technical disclosure.

#### User Inquiry - Swim Effect And Unequal Binocular Distortion

Question captured during study: is swim mainly the result of unequal distortion between the two eyes?

Working answer:

- Swim is a dynamic distortion effect: the perceived world warps, rolls, or moves as gaze/head position changes through the PAL.
- It can exist monocularly because each lens has spatially varying power, prism, magnification, and distortion.
- Binocular mismatch can amplify swim when OD and OS produce different spatial mappings at corresponding gaze positions.
- The important design quantity is not only absolute unequal distortion. It is the spatial change rate of distortion and, binocularly, the change rate of the OD/OS difference.
- In field notation, if the two eyes have mappings `F_R(x, y)` and `F_L(x, y)`, discomfort is related not only to `F_R - F_L`, but also to `grad(F_R - F_L)` and motion-driven `d/dt(F_R - F_L)`.

Study significance: this inquiry links Essilor/Varilux product language about distortion control to a more technical binocular metric: control the dynamic distortion field and its interocular gradient, not only local cylinder magnitude.

Candidate Round 2 directions:

- `Concept - Swim Effect`
- `Concept - Binocular Distortion Gradient`
- `Design Rule - Control Dynamic Distortion Change Rate`

### Slide 10 - Carl Zeiss / Freeform Progressive Lenses

The slide references `Optics_of_Freeform_progressive_lenses_Meister CE credit.pdf`.

Ben notes that freeform manufacturing may enable custom lens designs based on individual requirements.

He also notes a prior concern: they thought lenses could not be optimized "as worn" because ECPs expected Rx at FRP and NRP to measure prescribed Rx with a focimeter. He hopes freeform designs have changed that expectation.

Study significance: links manufacturing capability, dispensing conventions, and design freedom.

### Slide 11 - Minkwitz Theorem

The slide states a channel-width relation: the width of the progressive channel is proportional to its length and inversely proportional to add power.

Ben's qualitative explanation: if cylinder is zero along a vertical meridian while curvature increases along that axis, cylindrical shapes must appear away from the meridian.

Referenced source: `ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`, page 292.

#### User Inquiry - Closed-Loop Compatibility Behind Minkwitz

Question captured during study: is the theorem related to the fact that the derivative around every closed loop must be zero?

Working answer:

- Yes, in the differential-geometry sense. A PAL surface is a single-valued smooth sag function `z(x, y)`, so its differential is exact.
- Around any closed path on the surface domain, the net sag change must be zero: `closed_loop_integral dz = 0`.
- Equivalently, mixed derivatives must be compatible, such as `z_xy = z_yx`.
- This means curvature components cannot be assigned independently point by point. The local Hessian/curvature field must be integrable into one continuous surface.
- Minkwitz can be read as one local consequence of that compatibility: if mean curvature/power changes along an astigmatism-free meridian, neighboring points must develop lateral curvature difference, which appears optically as unwanted cylinder.

Study significance: this connects the theorem to the same kind of exact-differential / curl-free logic used in wavefront and surface reconstruction. The PAL designer can redistribute the unwanted astigmatism, but cannot choose a progressive power field that violates surface compatibility.

#### User Hypothesis - Finite Lens Size Qualification

User prompt: some statements about Minkwitz may require the same lens diameter or usable lens area; otherwise the theorem may not be true.

Working judgment:

- The local Minkwitz relation does not require a fixed lens diameter. It is a local theorem about a smooth surface near an astigmatism-free progressive meridian.
- However, many practical statements derived from it do require a fixed aperture, frame size, usable lens area, corridor length, or comparison zone.
- If the available lens area is larger, unwanted astigmatism can be pushed farther out or spread over more area. That changes the observed maximum cylinder, perceived softness, and usable-zone width.
- Therefore, comparisons such as "design A has less unwanted astigmatism than design B" are only meaningful when the same aperture, add, corridor length, fitting geometry, and evaluation metric are held fixed.
- The theorem says the astigmatism must be generated laterally from the power gradient. It does not by itself say where all of that astigmatism must end up on a finite commercial lens.

Study significance: separate the local geometric constraint from global design claims. The local theorem survives changes in lens size; global channel-width, maximum-cylinder, and hard/soft-design comparisons need controlled lens area and boundary conditions.

Candidate Round 2 direction: `Design Rule - Minkwitz Channel Width Add Tradeoff`.

### Slide 12 - Binocular Vision Metrics

The slide flags binocular vision metrics for spectacles and AR/VR.

Source-supported items:

- keep visual cues consistent when introducing an optical system
- near triad: convergence, accommodation, pupil size
- distortion

Study significance: this is an early pointer toward binocular merit-function terms.

#### User Inquiry - Distortion In Binocular Vision

Question captured during study: what does distortion mean for binocular vision in PAL design?

Working judgment:

- Monocular distortion is the spatial mapping error from object field to retinal/perceived direction for one eye.
- Binocular distortion is not just the amount of distortion in each lens. It is how the two eye mappings differ when the eyes look at the same object field.
- If OD and OS have similar distortion, the wearer may perceive common-mode world warping, but fusion can remain relatively stable.
- If OD and OS have different distortion, prism, or magnification gradients, the brain receives a gaze-dependent disparity field. This can create unstable depth, tilt, floor roll, vergence stress, and swim.
- The hard terms are often differential prism, differential magnification, vertical disparity, and the spatial gradients of those quantities across gaze.
- In field notation, if `F_R(x, y)` and `F_L(x, y)` are the right and left eye mappings, common-mode distortion relates to `(F_R + F_L) / 2`, while binocular stress relates to `F_R - F_L` and especially `grad(F_R - F_L)`.

Design implication:

- A PAL can have acceptable monocular power/cylinder maps but still be uncomfortable binocularly if the two eyes generate incompatible spatial mappings.
- Advanced PAL optimization should evaluate the pair of lenses as a binocular system in as-worn geometry, not as two independent monocular surfaces.
- Useful merit-function targets may include controlling differential prism, distortion gradient, magnification imbalance, gaze-dependent disparity, and consistency of perceived object position during scanning.

Candidate Round 2 directions:

- `Concept - Binocular Distortion`
- `Concept - Differential Prism Field`
- `Design Rule - Optimize PALs As A Binocular System`

### Slide 13 - PAL Reference Points

References:

- `Varilux_Fitting_N_Dispensing_Guide_LR.pdf`
- `ModernOphthalmicOptics_Alonso2019_ProgressiveLenses.pdf`, page 303

Source-supported points:

- PAL reference points vary by design
- two engraved micro-circles and engravings identify design, ADD, and material
- other points are not physically marked but are set in lens specifications

Study significance: connects surface/design coordinate systems to dispensing reference marks.

### Slide 14 - Reference Points Visual

The slide again references `Varilux_Fitting_N_Dispensing_Guide_LR.pdf`.

Text extraction provides little detail beyond the reference. Visual review needed to capture the actual reference-point diagram.

### Slide 15 - NRP Placement

Ben asks where to place the NRP, especially for pediatrics and myopia control.

Source-supported questions:

- Does spectacle location relative to eye center of rotation differ between children and adults?
- What is the proper inset for children?
- NRP is inset nasally because eyes converge when looking down at near objects.

Candidate Round 2 direction: `Concept - Pediatric NRP Placement`.

### Slide 16 - Optometrika

The slide points to Optometrika, described as MATLAB-based ray tracing.

Links:

- MathWorks File Exchange entry
- GitHub repository

Study significance: possible external ray-tracing comparison or helper framework for Round 3/alternate implementation.

### Slide 17 - Base Curves And True Power

Ben defines base curve as front surface power and says base curve depends on lens Rx.

The slide distinguishes marked power from true power:

- marked power uses lens clock and `F1 + F2 = FT`
- true power accounts for material refractive index
- true power correction factor is `(n - 1) / (1.53 - 1)`

Example:

- flint glass index `1.61`
- front surface `+10.00`
- back surface `-4.00`
- marked power `+6.00`
- correction factor `1.15`
- true power `+6.91`

Candidate Round 2 direction: `Concept - Marked Power vs True Power`.

### Slide 18 - Center Of Rotation Of Eye

Ben states that the location of the eye center of rotation relative to the back surface of the lens is important for PAL specification and optimization.

Reason: it determines the `(x,y)` location on the lens used for a given off-axis object position and eye rotation angle.

He says child data is needed before completing a design.

Working adult assumption: distance from back vertex of spectacle to eye center of rotation is `27 mm`, based on TSLG experience and quick literature search.

#### User Inquiry - Measuring Eye Center Of Rotation In Children

Question captured during study: how can the eye center of rotation be measured for children?

Working judgment:

- For spectacle/PAL design, the required quantity is usually an effective center of rotation relative to the fitted spectacle lens, not a purely anatomical center in isolation.
- The rigorous measurement is dynamic: track gaze over known angular targets while also measuring head/frame pose and eye features, then fit the rotation center that best explains the observed eye rotations.
- Practical inputs include monocular PD, fitting height, vertex distance, pantoscopic tilt, wrap angle, corneal apex or pupil center position, and the child's natural near posture.
- Direct pediatric measurement is difficult because fixation, head stability, cooperation, and repeatability are weaker than in adults.
- If direct measurement is not available, use a pediatric model scaled by ocular biometry or axial length, then validate sensitivity by sweeping center-of-rotation distance in the ray trace.

Possible measurement routes:

- video eye tracker or stereo cameras with calibrated targets and head/frame tracking
- Purkinje-image or corneal-reflex based eye rotation tracking
- optical biometry plus eye model to estimate rotation center relative to cornea/entrance pupil
- MRI/OCT research method if anatomical precision is needed, usually not practical for routine PAL design
- design sensitivity study using plausible pediatric center-of-rotation ranges rather than assuming a single adult value

Design implication: for children, a robust PAL design should probably treat center of rotation as a variable with uncertainty, not a fixed adult constant.

Candidate Round 2 direction: `Concept - Center Of Rotation In Spectacle Lens Optimization`.

### Slide 19 - Lens Surface Definition

The slide asks how to parameterize the surface.

Text terms:

- ray tracing
- optimization variables

Visual/context limitation: this slide likely served as a discussion placeholder. More detail may come from later code notes rather than this slide alone.

#### User Inquiry - How Is A PAL Surface Defined And Represented?

Question captured during study: how is the surface defined, in what format, and how is it represented in the context of progressive lenses?

Working judgment:

- The fundamental mathematical object is a sag surface `z = f(x, y)` over the lens aperture.
- `x` and `y` are lens coordinates, usually horizontal and vertical coordinates in millimeters relative to a design/fitting reference.
- `z` is surface sag/departure, also in length units. Once `z(x,y)` is known, local slopes and second derivatives define curvature, mean power, cylinder, and axis.
- In a PAL, the sag surface is not just a sphere. It is shaped so mean power changes from distance to near while unwanted astigmatism is managed laterally.
- The optical maps shown to designers, such as mean power, cylinder, distortion, and prism, are derived from the surface and ray geometry. They are not the primary surface definition.

Common representation formats:

- analytic formula: sphere/asphere plus polynomial or special progressive terms
- coefficient vector: optimizer variables that generate a sag function
- spline or freeform control points: a smooth surface built from sampled degrees of freedom
- sag grid / height map: sampled `z(x,y)` values over the aperture
- interpolant delta surface: a correction map added to a base analytic surface
- manufacturing/freeform file: machine-facing sag/normal/toolpath representation derived from the design surface

Read-only Ben code peek:

- `BW_PAL_SurfaceSAG_V1(SURF,x,y)` returns `sag`, so Ben's immediate representation is a callable sag function.
- `C_PAL_Surface` exposes a dependent `SAG_Function` built from `Surface_Description.SAG_Function_Name`.
- Ben's surface description includes parameters such as `sphere`, `k`, `add`, `y0`, `NRP_y`, `off_edge_y`, `cx1`, `cx2`, and optional `F`.
- In `BW_PAL_SurfaceSAG_V1`, the surface is constructed as base aspheric sag plus progressive meridian/add sag plus terms such as `p.*x.^2`, with optional `SURF.F(x,y)` as a `griddedInterpolant` delta sag.
- The comment says `p.*x.^2` "forces cyl=0 along meridian," which matches the PAL idea of defining a cleaner progressive corridor and accepting/controlling lateral astigmatism.

Study significance: surface definition is the bridge from optical intent to implementation. The designer thinks in power/cylinder/corridor targets, but the optimizer/manufacturer needs a smooth integrable sag surface `z(x,y)`.

Clarification after follow-up: this block explains the general PAL/Ben-code representation. Alonso's book-specific representation is captured in [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]].

Candidate Round 2 directions:

- `Concept - PAL Surface Sag Representation`
- `Concept - Sag Surface vs Power Map`
- `Concept - Delta Sag Freeform Correction`
- `Code Map - BW_PAL_SurfaceSAG_V1`

### Slide 20 - Merit Function

The slide lists merit-function categories:

- monocular elements
- binocular elements

Study significance: this is a high-level placeholder for later concept notes on merit-function construction.

### Slide 21 - Prism Thinning

References:

- `EssilorSummaryPDF_1.pdf`
- `understanding prism-thinning_Meister_SOLA_1998.pdf`

Ben states that PAL designs must eventually integrate with eyeglass frame data.

Required inputs include:

- patient optical prescription: power, cylinder, axis, add, etc.
- pupil distance
- frame selection
- segment height, defined as distance from bottom of frame to FRP

Source-supported result from `understanding prism-thinning_Meister_SOLA_1998.pdf`:

- A conventional progressive surface steepens toward the bottom to create add power.
- This can make the upper edge thicker than the lower edge and force a larger center thickness, especially for plus-powered lenses or higher adds.
- Prism thinning, also called equi-thinning, grinds vertical prism into the PAL blank to reduce the top-bottom thickness difference.
- The common case is base-down prism thinning for plus-powered PALs; some minus-powered/high-fitting cases may require base-up prism thinning.
- The same vertical prism should be used in both lenses to avoid vertical prismatic imbalance. In that case it is yoked prism rather than net binocular prism.
- A rule of thumb in the paper is `Prism = 0.6 * Add`, roughly two-thirds of the add, often considered when vertical-meridian power exceeds about `+1.50 D`.
- The paper also says lab software can compute the exact amount from distance power, add, fitting cross height, fitting cross decentration, and frame shape.

Example result from the paper:

- Baseline example: `+2.00 DS` distance Rx with `+2.00 D` add, no prism thinning, center thickness about `4.2 mm`, weight `9.4 g`, and about `2 mm` top-bottom edge thickness difference.
- Rule-of-thumb thinning: `1.33 prism diopters` base-down, center thickness about `3.53 mm`, about `16%` thickness reduction and `19%` weight reduction.
- Computed thinning: `1.76 prism diopters` base-down, center thickness about `3.3 mm`, weight `7.1 g`, about `21%` thickness reduction and `25%` weight reduction; thickness differential is described as virtually eliminated.

Working judgment:

- Prism thinning does not improve the progressive optical design itself. It is a geometric/lab surfacing compensation that makes the finished lens thinner, lighter, and cosmetically better.
- The optical risk is vertical prismatic imbalance if the two eyes are not balanced at the PRP, plus possible ghost/reflection effects when larger vertical prism is used.

Study significance: prism thinning is not isolated surface math; it links optical design, frame geometry, Rx, OD/OS balance, and dispensing workflow.

### Slide 22 - Peripheral PAL Design And Myopia

The slide links an IOVS article and `PeripheralDesignofPALS_Lag_of_Accommodation_Myopes.pdf`.

Study significance: candidate source for myopia-control/peripheral-optics motivation.

### Slide 23 - Developing Basic PAL Design Capability

Section transition slide.

Study significance: marks the move from literature/design context into Ben's own capability-building and optimization experiments.

### Slide 24 - Central And Peripheral Vision Goals

Central vision goals:

- correct power profile for ADD
- good acuity
- control binocular prismatic effects

Peripheral vision goals:

- limit swimming effect by controlling distortion
- objects moving at constant rate should appear to move at constant rate

Candidate Round 2 direction: `Concept - PAL Central vs Peripheral Vision Objectives`.

### Slide 25 - PAL_Optim_7, Delta Spline 2

Source text:

- date: `1/17/21`
- `delta_spline = 2`
- script: `PAL_Optim_7.m`
- mentions `delta_spline = 10 then 5 then 2`

Visual review needed: likely contains an optimization plot or output not captured in text.

Study significance: early experiment comparing spline spacing.

### Slide 26 - PAL_Optim_7, Delta Spline 5

Source text:

- date: `1/17/21`
- `delta_spline = 5`
- script: `PAL_Optim_7.m`
- start after optimization with `delta = 2`, with `mf = 2`
- `fmincon` before/after: `1324.3747 / 30.1789`

Study significance: records a major merit-function reduction for this configuration.

### Slide 27 - PAL_Optim_7, Delta Spline 10

Source text:

- date: `1/17/21`
- `delta_spline = 10`
- script: `PAL_Optim_7.m`
- `fmincon` before/after: `1026.4311 / 234.0712`

Study significance: suggests coarser spline spacing may underperform relative to `delta_spline = 5`, but the visual result should be checked.

### Slide 28 - PAL_Optim_7 Lessons

Ben states that using a target function with known solution did not reveal a reasonable optimization approach and sag definition except using spline points.

He says `PAL_type6.m` can get the correct meridian profile, but `f(y)*x^n` terms could not, or at least he could not, be optimized to give the sag solution.

Ben dislikes spline points because resulting designs often become lumpy.

Proposed mitigation:

1. slowly evolve power/cylinder targets and weights over multiple optimization iterations so targets are never too far from the initial design
2. add merit-function constraints so signs of slopes of power and cylinder cannot undulate within a small window

Candidate Round 2 directions:

- `Design Rule - Avoid Lumpy Spline Optimization`
- `Algorithm - Slowly Evolving Targets And Weights`

### Slide 29 - No Extracted Text

No text was extracted from this slide.

Visual review needed: determine whether the slide is blank, image-only, or a plot-only slide.

### Slide 30 - No Extracted Text

No text was extracted from this slide.

Visual review needed.

### Slide 31 - No Extracted Text

No text was extracted from this slide.

Visual review needed.

### Slide 32 - PAL_Optim_9 / PAL_Optim_8

Source text:

- `PAL_Optim_9.m`
- `cyl_wt = 1`
- `delta_spline = 5` gives better results than `delta_spline = 10`
- run did not complete and timed out by function calls
- `PAL_Optim_8.m`
- `delta_spline = 10`

Study significance: supports a recurring preference for `delta_spline = 5` over `10` in these early experiments.

### Slide 33 - PAL_Optim_10

Source text:

- `PAL_Optim_10.m`
- `delta_spline = 5`
- tried to speed up by limiting spline optimization to lower half, `y < 6`
- added `sphere` and `k`
- meridian profile was not controlled
- not really faster

Study significance: limiting optimization domain and adding base parameters did not solve the control/runtime issue.

### Slide 34 - PAL_Optim_11

Source text:

- `PAL_Optim_11`
- `delta_spline = 5`
- reran `PAL_Optim_9` with test to continue if max function calls exceeded
- first pass took much longer than expected
- Ben identifies computer sleep as the problem

Study significance: runtime observations may reflect system state, not only algorithm performance.

### Slide 35 - PAL_Optim_12

Source text:

- `PAL_Optim_12.m`
- `delta_spline = 5`
- full optimization leaves power profile not continuous
- continued optimization with `delta_spline = 2` improves merit slowly but never completely smooths power profile

Study significance: finer spline spacing may improve merit but does not automatically solve smoothness.

### Slide 36 - Gradients And Max/Min Constraints

Ben notes that the literature discusses adding gradients of power and cylinder to the merit function.

He recognized this as needed to remove lumpy undulations in power/cylinder when using splines.

The slide also mentions adding max/min constraints rather than only targets and weights.

Candidate Round 2 directions:

- `Design Rule - Gradient Penalties For Spline Smoothness`
- `Design Rule - Target Weights vs Max Min Constraints`

### Slide 37 - Decoupling Delta Y And Delta Spline

Source text:

- `PAL_Optim_16.m`
- changed code to allow `delta_y` used to describe the surface separately from spline point spacing
- `delta_y` is step size for derivative increments and `ndgrid`
- ran five cases:
  - `Adelta_y = [2 2 1 1 .5]`
  - `Adelta_spline = [5 2 2 1 1]`
- smaller steps took longer but did not show much improvement

Candidate Round 2 direction: `Algorithm - Decoupling Delta Y From Delta Spline`.

### Slide 38 - PAL_Optim_19

Source text indicates:

- `PAL_Optim_19`
- date: `3/1/2021`
- `delta_spline = 5`
- initial grid merit value around `4848.2666`
- repeated `fmincon` passes
- `cyl_wt = 10`
- `delta_y = 2`
- weight function name appears as `BW_PAL_Weights_01_cyl_meridian_only`
- `mf_val` is progressively reduced over many iterations, reaching values around the low teens in the extracted log

Study significance: this is an important long-run optimization log showing repeated continuation after function-call limits and slow improvement.

Visual review needed: the slide likely includes plots or screenshots that explain the optical quality beyond numeric merit values.

### Slide 39 - PAL_Optim_20

Source text indicates:

- `PAL_Optim_20`
- repeated `fmincon` passes
- very long runtime, with extracted values around `971` to `1002` minutes
- function counts exceed 15 million
- `delta_spline = 5`
- `cyl_wt = 10`
- `delta_y = 2`
- merit values decrease only slightly around `87.8`

Study significance: this slide documents a pathological or plateaued optimization behavior, useful for understanding why Ben later wanted improved constraints, gradients, or target strategy.

Visual review needed: determine what design state corresponds to this slow merit improvement.

## Candidate Round 2 Notes

- `Concept - Ben's PAL Literature Map`
- `Concept - Alonso Complete Lens Eye Model Approach`
- `Concept - Exact Ray Tracing As Industry PAL Workflow`
- `Concept - Binocular Distortion Consistency`
- `Concept - Pediatric NRP Placement`
- `Concept - Center Of Rotation In Spectacle Lens Optimization`
- `Concept - Marked Power vs True Power`
- `Concept - Spline Surface Parameterization For PAL`
- `Concept - PAL Central vs Peripheral Vision Objectives`
- `Design Rule - Minkwitz Channel Width Add Tradeoff`
- `Design Rule - Prism Thinning Depends On Frame And Rx`
- `Design Rule - Avoid Lumpy Spline Optimization`
- `Design Rule - Gradient Penalties For Spline Smoothness`
- `Design Rule - Target Weights vs Max Min Constraints`
- `Algorithm - Slowly Evolving Targets And Weights`
- `Algorithm - Decoupling Delta Y From Delta Spline`
- `Comparison - Ben MATLAB Optimizer vs Industry Exact Ray Tracing`
- `Question - How To Add Binocular Merit Function Terms`
- `Question - What Pediatric Eye Geometry Should Replace Adult 27 mm Assumption`
- `Question - Which Optimization Plots Explain PAL_Optim_7 Through PAL_Optim_20`

## Important Terms / Parameters

- PAL
- ADD
- FRP
- NRP
- PRP
- OD / OS
- base curve
- marked power
- true power
- center of rotation of eye
- back vertex
- prism thinning
- binocular distortion
- near triad
- `u,v` gaze angles
- `thetax,thetay` peripheral aberration angles
- `delta_spline`
- `delta_y`
- `cyl_wt`
- `mf_val`
- `fmincon`
- splines
- gradients of power and cylinder
- max/min constraints
- target power
- target cylinder
- `PAL_Optim_7`
- `PAL_Optim_8`
- `PAL_Optim_9`
- `PAL_Optim_10`
- `PAL_Optim_11`
- `PAL_Optim_12`
- `PAL_Optim_16`
- `PAL_Optim_19`
- `PAL_Optim_20`
- `PAL_type6.m`

## Links To Other Study Notes

- [[Study Note 01 - PAL Design Summary]]
- [[Study Note 06 - PAL Optimization Example 00]]
- [[Study Note 07 - PAL Optimization Example 01]]
- [[Study Note 08 - C_PAL]]
- [[Study Note 09 - C_PAL_Surface]]
- [[Study Note 10 - BW_PAL_SurfaceSAG_V1]]
- [[Study Note 11 - BW_PAL_Targets_03]]
- [[Study Note 13 - BW_Meridian_Profile_1]]
- [[Study Note 14 - BW_Meridian_Profile_2]]

## Open Questions

- Which embedded figures on slides 5-7 define surface math that text extraction did not capture?
- Are slides 29-31 blank, visual-only, or failed text extraction?
- How directly do `PAL_Optim_7` through `PAL_Optim_20` map to the available example scripts?
- Where are gradient penalties implemented in the current code, if at all?
- Which `PAL_Optim_*` experiments are obsolete versus still important for understanding Ben's final approach?
- What exact binocular distortion/prism metric did Ben intend to use?
- Is the adult 27 mm back-vertex-to-center-of-rotation assumption adequate for initial code reproduction, and what pediatric data source should replace it?
- How should Optometrika be evaluated relative to Ben's own MATLAB framework?
