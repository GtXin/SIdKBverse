---
type: study-note
domain: progressive-lens
status: understood
source: "Reference/BW Work/01-References_PALdesign/Fundamentals of Progressive Addition Lens Design_MeistgerSOLA1998.pdf"
related:
  - "[[Study Note 01 - PAL Design Summary]]"
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
  - "[[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]"
tags:
  - pal
  - bw-work
  - round-1
  - study-note
  - meister
  - sola
---

# Study Note 04 - Fundamentals of Progressive Addition Lens Design

## File Purpose

This Round 1 study note represents Darryl Meister's SOLA technical article `Fundamentals of Progressive Addition Lens Design`. Use it as a compact source anchor for conventional PAL geometry, contour-map interpretation, unwanted astigmatism, hard/soft design tradeoffs, symmetry/asymmetry, prescription-specific designs, skew distortion, PAL markings, and fitting constraints.

This note is not a final theory note. It should feed Round 2 atomic notes on progressive zones, corridor/add tradeoffs, hard versus soft designs, unwanted astigmatism, asymmetry, fitting geometry, and PAL marking conventions.

## Source

`Reference/BW Work/01-References_PALdesign/Fundamentals of Progressive Addition Lens Design_MeistgerSOLA1998.pdf`

Source title: `Fundamentals of Progressive Addition Lens Design`

Author/source: Darryl Meister, ABOM, SOLA Technical Marketing, Lens Talk Vol. 26, No. 13, April 1998.

PDF metadata:

- Title: `Technical Brief Title`
- Author: Darryl Meister
- Pages: 5
- Creation date: 2000-02-14

## What This Source Appears To Be

This is a practitioner-facing technical brief introducing core progressive addition lens design principles. It is less mathematical than Alonso, but it gives useful design-language anchors for:

- distance, intermediate, and near zones
- progressive corridor / umbilical line
- mean power and power profile plots
- surface astigmatism as the unavoidable cost of progressive power
- hard versus soft PAL design philosophy
- symmetrical versus asymmetrical lens design
- add-specific and prescription-specific design variants
- skew distortion, PAL markings, and fitting rules

## Extraction Method And Limitations

Text was extracted with `pdfplumber` from the 5-page PDF. All pages produced usable text.

The PDF was also rendered to PNG with Poppler `pdftoppm` and visually spot-checked. Pages 1 and 3 were inspected directly because they contain the most important visual evidence: the curvature/zones diagrams, contour plots, hard/soft astigmatism maps, and symmetry/asymmetry figures.

Limitations:

- Figures were summarized visually, not digitized.
- Contour values and plotted gradients were not numerically extracted beyond values explicitly stated in the text.
- The source is an educational technical brief, so it should be used for design vocabulary and tradeoff framing, not as the rigorous mathematical derivation of PAL surface compatibility.
- The source uses product-era terminology such as hard/soft designs and SOLA Design by Prescription. These terms should be preserved but not overgeneralized without newer source support.

## Key Content

### PAL Surface Concept

The article defines conventional PALs as one-piece lenses whose surface curvature changes gradually from the upper distance portion to the lower near portion.

Source-supported meaning:

- Upper distance portion: minimum surface curvature and distance correction.
- Lower near portion: maximum surface curvature and near addition.
- The continuous curvature transition produces a smooth increase in plus power without visible segment lines.
- The changing curvature is the physical basis for progressive power, not just a layout diagram.

Figure 1 visually represents the shorter near radius of curvature producing stronger surface power than the longer distance radius.

### Three Zones Of Vision

The source defines a typical general-purpose PAL as having three zones:

1. Distance zone
2. Near zone
3. Intermediate zone / corridor

Design interpretation:

- The distance zone is the upper region providing distance correction.
- The near zone is the lower region providing the required add power.
- The intermediate corridor connects these zones and increases progressively in plus power from distance to near.
- The three zones blend together without segment boundaries, giving continuous depth of field from near to far.

This is useful Round 2 support for a basic PAL-zone concept note.

### Contour Maps, Mean Power Plots, And Power Profiles

The source identifies contour maps as a convenient way to describe progressive lens surfaces. The analogy is topographic mapping: contour lines connect points of equal power on the surface.

Source details:

- Each contour line or shade represents a power interval, usually 0.50 D.
- A gradual plus-power increase can be represented by a mean power plot.
- It can also be represented by a power profile plot along the progressive corridor / umbilical line.
- The example figure is a +2.00 D add surface.

Important qualification:

- The article explicitly warns that contour plots are mathematical models of the lens surface.
- They may indicate lens performance but are not sufficient to predict patient acceptance.

Design consequence:

- This supports Ben's use of target mean power/cylinder maps as development proxies.
- It also supports the existing caution in [[Study Note 01 - PAL Design Summary]] that surface power/cylinder optimization is not yet full wearer-performance prediction.

### Product Benefits Claimed For PALs

The source names three main optical/product benefits:

- no visible segments or demarcation lines
- clear vision at all distances
- no unwanted image displacement or jump from abrupt segment boundaries

Technical reading:

- The no-jump claim is relative to conventional multifocal segment transitions.
- It does not mean PALs are free of distortion. The source later emphasizes unavoidable surface astigmatism and skew distortion.

### Surface Astigmatism As The Cost Of Progressive Power

The central technical claim of the article is that globally smooth progressive curvature creates unavoidable surface astigmatism.

Source-supported chain:

- The add power changes gradually across a large surface area, not only at the bottom.
- The curvature transition produces unwanted astigmatic error / cylinder error.
- In sufficient quantity, this error blurs vision and limits the clear field.
- The astigmatic error effectively bounds the usable distance, intermediate, and near zones.

The source says this unwanted astigmatism is influenced by:

- add power
- length of the progressive corridor
- width of the distance and near zones

Design interpretation:

- Higher add means more required curvature change and more astigmatism.
- Shorter corridor means faster power change and more astigmatism.
- Wider distance/near zones confine the astigmatism into smaller surface regions, increasing peak levels.

This should become a Round 2 design-rule note because it directly bridges clinical layout variables to surface-error distribution.

### User Inquiry - Mean Power And Astigmatism From Sag Curvature

User question:

```text
How are mean power and astigmatism calculated from curvature, guessing from zxx, zyy, zxy?
```

Source separation:

- Meister states the design consequence: progressive curvature creates unwanted surface astigmatism, and contour maps can show mean power and astigmatic error.
- Meister does not derive the differential-geometry calculation.
- The Hessian-based calculation is supported by the Alonso surface/Hessian machinery captured in [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]].

Codex working judgment:

For a sag surface:

```text
z = z(x, y)
```

use the low-slope Hessian curvature approximation:

```text
H =
[ zxx  zxy
  zxy  zyy ]
```

The approximate principal curvatures are the eigenvalues of `H`:

```text
k1 = (zxx + zyy)/2 + sqrt(((zxx - zyy)/2)^2 + zxy^2)
k2 = (zxx + zyy)/2 - sqrt(((zxx - zyy)/2)^2 + zxy^2)
```

For surface refractive index `n`, approximate local surface powers are:

```text
F1 = (n - 1) k1
F2 = (n - 1) k2
```

Mean power:

```text
mean_power = (F1 + F2)/2
mean_power = (n - 1) (zxx + zyy)/2
```

Surface astigmatism magnitude:

```text
astigmatism = |F1 - F2|
astigmatism = (n - 1) sqrt((zxx - zyy)^2 + 4 zxy^2)
```

Units:

- If `z`, `x`, and `y` are in meters, `zxx`, `zyy`, and `zxy` have units of `1/m`.
- Multiplying by `(n - 1)` gives power in diopters.

Important limitation:

- This is the common low-slope / local tangent-plane calculation.
- Away from the vertex or for steeper surfaces, exact principal curvatures require the first and second fundamental forms and the shape operator, not just the raw Hessian in a fixed global chart.

### Corridor/Add Gradient Example

The article gives a simple corridor-gradient calculation:

```text
add = +2.50 D
corridor length = 17 mm
average change = 2.50 / 17 = 0.15 D/mm
```

Source conclusion:

- Progressive power changes more rapidly as add increases.
- Progressive power changes more rapidly as corridor length decreases.
- The magnitude, distribution, and gradient of astigmatism are performance factors affecting wearer acceptance.

Design consequence:

- This is a compact practical statement of a corridor/add tradeoff.
- It is not a full Minkwitz-theorem derivation, but it is consistent with the same design pressure: steeper corridor progression imposes stronger lateral astigmatic consequences.

### Harder PAL Designs

The source defines harder PAL designs by how they distribute astigmatic error:

- concentrate astigmatic error into smaller regions
- expand areas of perfectly clear vision
- accept higher blur and distortion where the error is concentrated

Compared with softer designs, harder designs generally have:

- wider distance zones
- wider near zones
- shorter, narrower progressive corridors
- higher and more rapidly increasing astigmatic error

Visual evidence:

- Figure 5 shows a harder design with astigmatism concentrated more strongly in localized lateral/lower regions.

Design interpretation:

- "Hard" does not mean optically inferior in every sense. It trades higher peripheral/localized error for larger clear zones and less head/eye movement.

### Softer PAL Designs

The source defines softer PAL designs as spreading astigmatic error across larger regions:

- reduce overall magnitude of blur
- narrow the zones of perfectly clear vision
- may allow astigmatism to encroach into the distance zone

Compared with harder designs, softer designs generally have:

- narrower distance zones
- narrower near zones
- longer, wider progressive corridors
- lower and more slowly increasing astigmatic error

Visual evidence:

- Figure 6 shows a softer design with lower, more distributed astigmatic error.

Design interpretation:

- "Soft" reduces peak astigmatism and swim but can require more head and eye movement because clear zones are smaller.

### Hard/Soft Terminology Caveat

The source explicitly states that modern PALs are seldom absolutely hard or soft and that the terms do not satisfactorily describe many modern designs.

Round 2 implication:

- Create a concept/comparison note preserving the hard/soft definitions as historical design-language anchors.
- Avoid treating hard/soft as a complete design taxonomy for modern freeform/as-worn/customized PALs.

### Symmetrical Versus Asymmetrical Designs

The article describes early PALs as symmetrically designed:

- right and left lenses were identical
- near inset was achieved by rotating blanks 9 or 10 degrees
- this disrupted binocular vision when the wearer gazed laterally because nasal and temporal astigmatism differed across the pair

The article then describes modern asymmetrical designs:

- separate right and left designs
- astigmatic error can be adjusted independently on either side of the progressive corridor

Visual evidence:

- Figure 7 shows early symmetrical designs where distortion rises into the nasal distance zone after rotation.
- Figure 8 shows newer asymmetrical designs.

Design consequence:

- PAL design is not merely a monocular surface-power problem.
- The right/left pairing, near inset, and lateral gaze behavior matter to binocular performance.
- This supports Ben's long-term plan in [[Study Note 01 - PAL Design Summary]] to move from single surface to single lens to binocular lens design.

### Add-Specific And Prescription-Specific Design

The source notes that manufacturers began varying lens design by add power roughly ten years before the article.

Add-specific / multi-design concept:

- a +2.50 add design varies from a +1.50 add design
- the design is customized for stages of presbyopia

Prescription-specific concept:

- SOLA's `Design by Prescription` varies the PAL design by distance refractive error
- the source gives base-curve examples such as 7.25 versus 5.25 base curves
- this concept is identified with SOLA Percepta

Design interpretation:

- This is an early bridge from generic PAL families toward parameterized/customized design.
- It should be compared later with freeform, user-power, and position-of-use optimization in [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]].

### Skew Distortion

The source distinguishes skew distortion from the astigmatic-error discussion.

Source-supported cause:

- power and magnification change through the corridor and near zone
- this causes straight objects, especially vertical lines, to appear curved/skewed through lateral lower regions

Source-supported language:

- The more curved a vertical line appears, the less orthoscopic the lens is through that zone.

Design consequence:

- PAL evaluation needs more than mean power and cylinder maps.
- Magnification variation and perceived spatial distortion are part of wearer performance.

### PAL Markings

The article describes two marking classes:

- removable ink markings
- permanent engraved markings

Removable markings:

- prism reference point / `PRP`: surfacing layout and prism verification
- distance reference point / `DRP`: distance power verification
- fitting cross / `FC`: fitting reference and finishing layout
- near reference point / `NRP`: add power verification

Permanent markings:

- alignment reference markings / `ARM`: axis alignment, re-marking lenses, and lens/manufacturer identification
- add power / `ADD`: add identification
- logo/trademark / `LOGO`: lens/manufacturer identification

Visual evidence:

- Figures 10 and 11 show standardized removable and permanent marking locations.
- The figure text indicates 34 mm between alignment reference marks and 17 mm from each side of center.

### Fitting Rules

The source emphasizes fitting as crucial because PAL clear zones are narrower than conventional multifocals.

Source-supported fitting-point rule:

- For most general-purpose progressives, place the fitting point/cross directly in front of the pupil.
- Use monocular interpupillary distance measurements, preferably with a corneal reflex pupillometer.

Frame fitting guidelines:

- pre-adjust frame before measuring
- maintain short vertex distance to maximize field of view
- acceptable vertex-distance range: 11 to 14 mm
- use pantoscopic tilt to improve near/intermediate field
- acceptable pantoscopic tilt range: 8 to 14 degrees
- some face-form wrap is beneficial
- frame fit and vertical depth must allow the manufacturer's minimum fitting height, often 22 to 24 mm

Design interpretation:

- The source treats fitting geometry as part of realized PAL performance.
- This supports later Round 2 or Round 3 notes connecting nominal surface design to as-worn use.

### Patient Education

The source closes by saying patient education improves success because wearers who know what to expect are more likely to tolerate initial visual discomfort during early wear.

This is clinically useful but less central to Ben's technical implementation. Keep it as context unless the study later turns toward product acceptance or wearer adaptation.

## Candidate Round 2 Notes

- `Concept - Progressive Addition Lens Zones`
  - Define distance, intermediate corridor, near zone, fitting cross, and near reference point as PAL layout primitives.

- `Concept - Progressive Corridor`
  - Define corridor / umbilical line as the path of progressive power change and link to power-profile plots.

- `Design Rule - Corridor Length Add Power And Astigmatism`
  - Capture the source's practical gradient rule: higher add or shorter corridor increases rate of power change and astigmatic burden.

- `Concept - Unwanted Surface Astigmatism In PALs`
  - Explain unwanted astigmatism as the unavoidable cost of smooth progressive curvature and as the boundary of usable zones.

- `Equation - Mean Power And Astigmatism From Sag Hessian`
  - Capture the low-slope formulas from `zxx`, `zyy`, and `zxy`, with a caveat that exact curvature away from the vertex requires the shape operator.

- `Comparison - Hard Versus Soft PAL Designs`
  - Preserve the historical hard/soft design definitions and the source's warning that modern designs are not cleanly classified.

- `Concept - Symmetrical Versus Asymmetrical PAL Designs`
  - Explain blank rotation, near inset, nasal/temporal imbalance, and separate right/left design.

- `Concept - PAL Skew Distortion`
  - Separate magnification/spatial distortion from cylinder blur and connect to wearer perception.

- `Reference - PAL Markings`
  - Capture `PRP`, `DRP`, `FC`, `NRP`, `ARM`, `ADD`, and `LOGO` with their use in verification, fitting, and re-marking.

- `Design Rule - PAL Fitting Geometry`
  - Record fitting cross at pupil center, monocular PD, vertex distance, pantoscopic tilt, wrap, and minimum fitting height.

- `Comparison - Generic Multi-Design And Prescription-Specific PALs`
  - Compare add-specific and prescription-specific design ideas with later freeform/custom/as-worn designs.

## Important Terms / Parameters

- progressive addition lens / `PAL`
- add power
- distance zone
- near zone
- intermediate zone
- progressive corridor
- umbilical line
- contour map
- mean power plot
- power profile plot
- surface astigmatism
- astigmatic error / cylinder error
- hard design
- soft design
- symmetrical design
- asymmetrical design
- near inset
- Design by Prescription
- skew distortion
- orthoscopic
- prism reference point / `PRP`
- distance reference point / `DRP`
- fitting cross / `FC`
- near reference point / `NRP`
- alignment reference marking / `ARM`
- add power marking / `ADD`
- vertex distance
- pantoscopic tilt
- face form wrap
- fitting height

## Links To Other Study Notes

- [[Study Note 01 - PAL Design Summary]]
  - Ben's implementation begins with surface power/cylinder optimization; Meister provides practical support for why power/cylinder maps matter but are incomplete predictors of wearer acceptance.

- [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]
  - This source supports Ben's broader background questions about hard/soft design, corridor tradeoffs, unwanted astigmatism, and fitting constraints.

- [[Study Note 03 - Modern Ophthalmic Optics Alonso Progressive Lenses]]
  - Alonso gives the deeper surface/Hessian and progressive-surface theory behind Meister's practitioner framing.

## Open Questions

- How exactly do Meister's hard/soft contour examples map onto the numerical design variables used in Ben's MATLAB sag function?
- Which of Ben's target and weight regions correspond to Meister's distance-zone width, near-zone width, and corridor-length parameters?
- Does Ben's current surface-only optimization include any proxy for skew distortion or magnification variation, or only mean power/cylinder and gradients?
- How should the historical `Design by Prescription` concept be related to modern user-power, position-of-use, and individualized freeform design?
- Are the 11-14 mm vertex distance, 8-14 degree pantoscopic tilt, and 22-24 mm fitting height ranges consistent with the specific PAL family Ben intended to emulate?
