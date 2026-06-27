---
type: study-note
domain: progressive-lens
status: understood
source: "Reference/BW Work/01-References_PALdesign/understanding prism-thinning_Meister_SOLA_1998.pdf"
related:
  - "[[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]"
  - "[[Study Note 02 - Design of Progressive Spectacle Lenses V1]]"
tags:
  - pal
  - bw-work
  - round-1
  - study-note
  - meister
  - sola
  - prism-thinning
---

# Study Note 05 - Understanding Prism Thinning

## File Purpose

This Round 1 study note represents Darryl Meister's SOLA technical article `Understanding Prism-Thinning`. Use it to anchor the practical PAL finishing concept of prism-thinning / equi-thinning: why progressive lenses tend to become thick at one edge, how yoked vertical prism is used to balance thickness, how prism amount is chosen, and how prism-thinned lenses are verified.

This note should feed later atomic notes on PAL thickness geometry, equi-thinning, yoked prism, PRP verification, vertical prismatic imbalance, and the interaction between fitting height, distance power, add power, and frame shape.

## Source

`Reference/BW Work/01-References_PALdesign/understanding prism-thinning_Meister_SOLA_1998.pdf`

Source title: `Understanding Prism-Thinning`

Author/source: Darryl Meister, ABOM, SOLA Technical Marketing, Lens Talk Vol. 26, No. 35, October 1998.

PDF metadata:

- Title: `Technical Brief Title`
- Author: Darryl Meister
- Pages: 4
- Creation date: 2000-02-14

## What This Source Appears To Be

This is a practitioner-facing technical brief about PAL thickness control during surfacing/finishing. It follows the earlier Meister article summarized in [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]] and focuses on why the progressive surface geometry tends to make a normal PAL blank thicker than expected, especially for plus power and higher add powers.

Key source roles:

- explains why PAL geometry creates upper/lower edge thickness imbalance
- defines prism-thinning / equi-thinning
- describes base-down and base-up prism-thinning
- explains yoked prism as the binocularly neutral application mode
- gives rule-of-thumb and computed prism examples
- describes verification at the prism reference point / `PRP`
- warns about vertical imbalance and ghost reflections

## Extraction Method And Limitations

Text was extracted with `pdfplumber` from the 4-page PDF. All pages produced usable text.

The PDF was rendered to PNG with Poppler `pdftoppm`. Pages 1, 3, and 4 were visually spot-checked because they contain the important source figures: baseline thickness geometry, prism-thinned examples, PRP verification, net vertical imbalance, and ghost-image behavior.

Limitations:

- Figure perimeter-thickness values were summarized from text and visual inspection, not digitized into a structured dataset.
- The source is an educational technical brief, not a full surfacing algorithm specification.
- The article describes conventional generator/prism-ring workflows and selected lab-software behavior as of 1998; modern digital surfacing workflows may implement equivalent compensation differently.

## Key Content

### Why PALs Need Thickness Compensation

The source begins from the same PAL geometry discussed in [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]:

- a progressive surface increases curvature toward the lower lens
- this steeper lower region produces the add power
- because the lower region is steeper than the upper region, a progressive blank tends to have an upper/lower edge thickness difference

For plus-powered lenses or lenses with significant add, a normal progressive blank can become thicker than a conventional flat-top lens of the same power. The source notes the cosmetic irony: a lens chosen partly for cosmetic improvement can require extra thickness unless compensated.

The article also compares this to executive-style multifocals, whose steeper segment curvature creates a similar upper/lower thickness differential.

### Fitting Height And PRP Decentration

The source identifies fitting height as another thickness variable.

In the absence of prism:

- the optical center of a PAL is typically ground at the prism reference point / `PRP`
- the `PRP` is generally near the geometric center of the blank
- the `PRP` is about 2 to 4 mm below the fitting cross

If the lens pair requires an extremely high fitting height, the source says the `PRP` and optical center need to be decentered upward.

Design consequence:

- For high-powered lenses, this vertical decentration can create a noticeable upper/lower edge thickness difference.
- In some cases, the thickness difference from fitting height can partly offset the thickness difference from progressive geometry.

### Baseline Example Without Prism-Thinning

The source gives a baseline example:

```text
distance Rx = +2.00 DS
add = +2.00 D
center thickness = 4.19 mm, reported as 4.2 mm in the figure caption
weight = 9.4 g
upper/lower edge thickness difference = 2 mm
```

Figure 2 shows the perimeter thickness values for this example.

Source interpretation:

- The lens has excess center thickness and upper/lower edge imbalance before prism-thinning.
- This is the comparison case used for later 1.33 prism and 1.76 prism examples.

### Definition Of Prism-Thinning / Equi-Thinning

The source defines prism-thinning, also called equi-thinning, as grinding prism into a progressive blank to reduce the thickness difference between the upper and lower edges.

Typical direction:

- prism-thinning usually means grinding base-down prism into progressive lenses

Effects:

- balances top/bottom edge thickness
- can reduce center thickness for plus-power and/or higher-add PALs
- reduces weight and improves cosmetic appearance

Important language:

- The article treats prism-thinning as a surfacing/finishing compensation, not as a change to the intended add-power progression.

### How Prism-Thinning Is Generated

Conventional generator method:

- tilt the front surface on the chuck using a prism ring
- grind the back surface normally
- the surfaced lens is left with prismatic effect at the center

The source notes that newer three-axis generators can produce the same prismatic effect without prism rings by grinding the back curve with a tilt.

Design interpretation:

- Prism-thinning is physically a tilt/prism operation applied during generation.
- The optical result is a yoked vertical prism component plus reduced unwanted blank thickness.

### Yoked Prism And Binocular Neutrality

The source is explicit that the same quantity of vertical prism should be ground into both lenses to avoid vertical prismatic imbalance.

Terminology:

- this same-amount vertical prism is called yoked prism
- because both lenses receive the same vertical prism, there is no net binocular vertical prism imbalance

Important distinction:

- Yoked prism can be present and still be tolerated.
- Unequal prism between right and left creates net vertical prismatic imbalance and is the primary verification concern.

### User Inquiry - Prism Diopter Definition And Vertical Imbalance

User question:

```text
How is the 0.5 or 1.0 imbalance value defined? Is it a ratio?
```

Source separation:

- Meister defines the practical verification target as vertical prismatic imbalance at the `PRP` and gives an example of `0.50` prism diopters net imbalance.
- Meister does not derive the prism-diopter unit in this article.

Codex working judgment:

The prism-diopter value is not a lens-power ratio. A prism diopter is an angular deviation unit defined by displacement per distance:

```text
1 prism diopter = 1 cm displacement at 1 m
```

Equivalently:

```text
prism diopters = 100 tan(theta)
```

where `theta` is the deviation angle.

For small angles:

```text
1 prism diopter ≈ 0.57 degrees
0.5 prism diopters ≈ 0.29 degrees
```

For vertical imbalance, the value is the absolute difference in vertical prism between the two eyes, measured at the PAL `PRP` unless another verification point is specified:

```text
net vertical imbalance = |vertical prism OD - vertical prism OS|
```

Using signed vertical prism:

```text
base down = positive
base up = negative
```

Examples:

```text
OD = 1.50 prism diopters base down
OS = 1.00 prism diopters base down
net vertical imbalance = |+1.50 - +1.00| = 0.50 prism diopters
```

```text
OD = 0.50 prism diopters base down
OS = 0.50 prism diopters base up
net vertical imbalance = |+0.50 - (-0.50)| = 1.00 prism diopters
```

Physical meaning:

```text
0.5 prism diopters = 0.5 cm relative vertical image displacement at 1 m = 5 mm/m
1.0 prism diopters = 1.0 cm relative vertical image displacement at 1 m = 10 mm/m
```

Clinical/design implication:

- Equal vertical prism in both eyes is yoked prism; it shifts the perceived world without creating vertical retinal mismatch.
- Unequal vertical prism creates relative vertical image displacement between eyes and can stress or break binocular fusion.

### Factors That Determine Prism-Thinning Amount

The source says the ideal prism-thinning amount should be based on:

- distance power in the vertical meridian
- add power
- fitting cross height
- fitting cross decentration
- frame shape

Interpretation:

- Higher plus distance power generally requires more prism-thinning.
- Higher add power generally requires more prism-thinning.
- Fitting height matters because vertical decentration changes the edge-thickness balance.
- Frame shape matters because the final cutout determines where edge thickness is cosmetically and mechanically relevant.

### Rule-Of-Thumb Formula

The source gives a common guide formula:

```text
Prism = 0.6 x Add
```

It also describes this as approximately `2/3` of the add power.

Example:

```text
add = +2.00 D
rule-of-thumb prism = 1.33 prism diopters base down
```

The source says this is often recommended when power through the vertical meridian exceeds about `+1.50 D`.

Limitation:

- The formula does not account for fitting height or distance power.
- The source still says it produces satisfactory results in most cases.

### Rule-Of-Thumb Example

Using the same +2.00 DS / +2.00 add lens:

```text
base-down prism-thinning = 1.33 prism diopters
center thickness = 3.53 mm, reported as 3.5 mm in the figure caption
thickness reduction = 16%
weight reduction = 19%
weight = 7.6 g
```

Design consequence:

- The simple rule-of-thumb already makes the lens meaningfully thinner and lighter.
- It also reduces the top/bottom thickness differential.

### Computed Prism-Thinning Example

The source then gives an exact/computed prism-thinning case for the same +2.00 DS / +2.00 add lens:

```text
computed base-down prism-thinning = 1.76 prism diopters
center thickness = 3.33 mm, reported as 3.3 mm in the figure caption
thickness reduction = 21%
weight reduction = 25%
weight = 7.1 g
```

The source states that the thickness differential is virtually eliminated.

Design consequence:

- Computed prism-thinning can outperform the simple add-based rule because it accounts for more geometry.
- The target is not merely adding a fixed amount of prism; it is optimizing the finished lens geometry for the frame, fitting height, add, and prescription.

### Lab Software

The article says many laboratories use computer programs to determine prism-thinning. It names Digital Vision Inc. and Gerber-Coburn software packages as examples from the source era.

Software options described:

- use a set prism value
- calculate the exact amount of required prism-thinning

When computed, prism is determined from the geometry and prescription factors listed earlier, and the source claims this produces the thinnest possible lens configuration.

### Minus-Power Case And Base-Up Prism

The source says minus-powered lenses can also be prism-thinned.

Important distinction:

- Depending on fitting height, either base-down or base-up prism may be required.

Example:

```text
distance Rx = -5.00 DS
add = +2.00 D
fitting height = relatively high
base-up prism-thinning = 1.62 prism diopters
```

Source consequence:

- The base-up prism keeps the lower edge from looking noticeably thicker than the upper edge.

Design interpretation:

- Prism-thinning direction is not universally base down.
- The required direction follows the finished edge-thickness imbalance for the actual Rx/add/fitting/frame case.

### Verification At The PRP

The source says vertical prism should be verified at the prism reference point / `PRP`.

Procedure:

- place the `PRP` of each lens in the center of the focimeter lens stop
- note the vertical prism at each `PRP`
- compare right and left values

Figure 8 shows the `PRP` centered between the alignment markings / logos, with 17 mm indicated on either side.

Critical replacement-lens warning:

- verifying prism-thinning is especially important when replacing only one lens
- if one lens is prism-thinned and the other is not, unwanted vertical prismatic imbalance can be induced

### Net Vertical Prismatic Imbalance

The source defines the verification target as the net vertical prismatic imbalance.

Source example:

```text
right and left vertical prism differ by 0.50 prism diopters
net imbalance = 0.50 prism diopters
```

Design interpretation:

- The patient is primarily sensitive to right/left imbalance, not simply the absolute yoked prism value.
- Equal vertical prism in both lenses is a different condition from unequal vertical prism between lenses.

### Tolerance Of Vertical Yoked Prism

The article cites Sheedy and Parsons on patient acceptance of vertical yoked prism:

- 2.00 prism diopters of vertical prism did not significantly affect the test subjects
- no significant postural adjustments were made at 2.00 prism diopters
- 4.00 prism diopters of vertical prism was rejected by almost all test subjects

Source conclusion:

```text
probable tolerance limit for most patients = between 2 and 4 prism diopters
```

Use this cautiously:

- It is source-era clinical/practical guidance.
- It is about vertical yoked prism tolerance, not vertical imbalance tolerance.

### Ghost Reflections

The source includes a warning from Winthrop:

- prism-power lenses deviate reflected ghost images more than the refracted image
- certain reflections can become more noticeable
- a bright office-window reflection may shift upward enough to be seen at eye level
- anti-reflective coating can eliminate these reflections

The source says high-powered lens wearers may already be adapted to prismatic effects away from the center. Low-powered lens wearers may notice offset ghost images more if prism is added, and the ghost images may be clearer or more in focus.

Source judgment:

- distracting ghost images from prism-thinning are possible but rare

### Highly Aspherical PALs And Automatic Compensation

The article says some highly aspherical progressive lenses may not need added prism-thinning because their surface geometry already minimizes the thickness differential.

Example:

- American Optical Omni
- surfaced with front-surface shims to prevent rocking on the block
- aspherical distance portion plus shim tilt minimizes thickness differential without extra prism
- source says such lenses are automatically produced with prism-thinning

Design interpretation:

- Prism-thinning can be either an explicit added surfacing operation or effectively built into the surface/blocking geometry.

### Executive-Style Multifocals

The source closes by noting that prism-thinning can also be used for Executive-style multifocals because they share related thickness geometry with PALs.

For this vault, keep this as supporting context unless later source work branches into multifocal manufacturing more broadly.

## Candidate Round 2 Notes

- `Concept - Prism Thinning`
  - Define prism-thinning / equi-thinning as a surfacing compensation that uses prism to reduce top/bottom edge thickness imbalance in PALs.

- `Design Rule - Prism Thinning Amount`
  - Capture the rule-of-thumb `Prism = 0.6 x Add`, its approximate `2/3 add` interpretation, and the factors the rule omits.

- `Concept - Yoked Vertical Prism`
  - Distinguish equal prism in both lenses from net vertical imbalance between lenses.

- `Concept - Prism Diopter And Vertical Image Displacement`
  - Define `1 prism diopter` as `1 cm/m`, connect prism diopters to angular deviation, and distinguish absolute yoked prism from interocular imbalance.

- `Design Rule - PRP Prism Verification`
  - Define why vertical prism is verified at the prism reference point and why replacement lenses are a special risk.

- `Comparison - Rule Of Thumb Versus Computed Prism Thinning`
  - Compare fixed-add formulas with computed lab/software approaches using prescription, fitting height, decentration, and frame shape.

- `Concept - PAL Thickness Geometry`
  - Connect progressive add curvature, fitting height, PRP decentration, and final frame shape to finished lens thickness.

- `Question - Prism Thinning In Ben PAL Implementation`
  - Ask whether Ben's design workflow includes any blank-thickness, edge-thickness, prism-thinning, or finished-frame constraints.

- `Concept - Prism-Induced Ghost Reflections`
  - Capture the reflected-image warning and relation to AR coatings and low-powered lenses.

## Important Terms / Parameters

- prism-thinning
- equi-thinning
- base-down prism
- base-up prism
- yoked prism
- vertical prismatic imbalance
- prism reference point / `PRP`
- fitting cross
- fitting height
- fitting cross decentration
- frame shape
- distance power in vertical meridian
- add power
- prism ring
- three-axis generator
- center thickness
- edge thickness
- ghost image
- reflected image
- anti-reflective coating

## Links To Other Study Notes

- [[Study Note 04 - Fundamentals of Progressive Addition Lens Design]]
  - Provides the preceding PAL geometry and add-power context that explains why a progressive surface creates thickness imbalance.

- [[Study Note 02 - Design of Progressive Spectacle Lenses V1]]
  - Already partially referenced prism thinning; this dedicated note can now serve as the direct source anchor.

- [[Study Note 01 - PAL Design Summary]]
  - Useful later when asking whether Ben's current optimization is purely optical/surface-power based or whether finished thickness and prism constraints are represented anywhere.

## Open Questions

- Does Ben's MATLAB design workflow model center thickness, edge thickness, blank diameter, or final frame shape?
- Is prism-thinning included as an explicit design variable, a downstream lab operation, or ignored in the current implementation?
- If prism-thinning is downstream, how should the optical design account for the yoked prism and any induced ghost-reflection risk?
- Are modern freeform PAL workflows treating equi-thinning as a manufacturing compensation, a prescription calculation, or a coupled design/manufacturing optimization?
- How do the source's 1998 tolerance statements for vertical yoked prism compare with current PAL fitting and freeform surfacing practice?
