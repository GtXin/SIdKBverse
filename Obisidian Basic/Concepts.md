# Obsidian User Concepts

## Purpose

This document summarizes the core user-facing concepts of Obsidian and provides practical examples of how they can be used in a personal knowledge system.

---

# 1. Vault

## What It Is

A Vault is the top-level container for all notes, attachments, templates, and configurations.

Physically, a Vault is simply a folder on your computer.

## Purpose

A Vault defines the scope of a knowledge system.

## Example

```text
My Knowledge Vault/
├── Learning/
├── Concepts/
├── Systems/
├── People/
├── Questions/
├── Attachments/
└── Templates/
```

## How I Use It

Create one primary vault for all long-term knowledge.

Avoid creating too many vaults unless knowledge domains are completely unrelated.

---

# 2. Note

## What It Is

A Note is a Markdown file.

It is the fundamental knowledge object inside Obsidian.

## Purpose

Store a single meaningful piece of information.

## Examples

```text
Accommodation.md
Emotional Regulation.md
ODA.md
Eyegorithm.md
```

## Example Content

```markdown
# Accommodation

Definition:
The change in optical power of the eye to maintain focus.

Applications:
- Myopia
- Presbyopia
- Dynamic Refraction

Related:
[[Wavefront]]
[[Myopia]]
```

## How I Use It

Create a note when a topic deserves its own address.

---

# 3. Folder

## What It Is

A Folder organizes notes into logical groups.

## Purpose

Provide context.

Folders answer:

> Where did this information come from?

## Example

```text
Learning/
├── Behavioral Psychology/
├── Economics/
└── Finance/
```

## How I Use It

Use folders primarily for:

- Subjects
- Books
- Courses
- Projects

Avoid excessive nesting.

---

# 4. Link

## What It Is

A connection between notes.

## Syntax

```markdown
[[Accommodation]]
```

## Purpose

Represent relationships.

Links answer:

> What is this related to?

## Example

```markdown
Accommodation affects [[Wavefront]] quality.

Accommodation may influence [[Myopia]] progression.
```

## How I Use It

Use links whenever two ideas are meaningfully related.

---

# 5. Backlink

## What It Is

The reverse view of a link.

If:

```markdown
[[Accommodation]]
```

exists in another note,

then Accommodation automatically shows a backlink.

## Purpose

Discover relationships automatically.

## Example

```text
Accommodation
↑
Myopia
↑
Presbyopia
↑
Wavefront
```

## How I Use It

Use backlinks to discover unexpected connections.

---

# 6. Tag

## What It Is

A lightweight label.

## Syntax

```markdown
#psychology
#important
#review
```

## Purpose

Provide flexible categorization.

## Example

```markdown
#psychology
#behavior
#leadership
```

## How I Use It

Use sparingly.

Prefer links over tags whenever possible.

---

# 7. Attachment

## What It Is

A non-Markdown file stored in the vault.

Examples:

- Images
- PDFs
- Videos
- Audio
- Spreadsheets

## Purpose

Store supporting material.

## Example Structure

```text
Attachments/
├── Images/
├── PDFs/
├── Books/
└── Papers/
```

## How I Use It

Store references, figures, and supporting documents.

---

# 8. Image Embedding

## What It Is

Display an image directly inside a note.

## Syntax

```markdown
![[accommodation_diagram.png]]
```

## Purpose

Preserve diagrams and visual explanations.

## Example

```markdown
# Accommodation

![[accommodation_diagram.png]]

Summary:
The eye changes optical power to maintain focus.
```

## How I Use It

Store important textbook figures and diagrams.

---

# 9. PDF Embedding

## What It Is

Display a PDF directly inside a note.

## Syntax

```markdown
![[behavioral_psychology.pdf]]
```

## Purpose

Reference source material.

## Example

```markdown
# Emotional Regulation

Source:

![[behavioral_psychology.pdf]]
```

## How I Use It

Reference papers, manuals, and textbooks.

---

# 10. Search

## What It Is

Search across the entire vault.

## Purpose

Retrieve information quickly.

## Example Searches

```text
Accommodation

Emotional Regulation

tag:#psychology
```

## How I Use It

Use search more often than folder navigation.

---

# 11. Graph View

## What It Is

A visual representation of notes and links.

## Purpose

Reveal relationships.

## Example

```text
Accommodation
      ↓
Wavefront
      ↓
Myopia
      ↓
Visual Behavior
```

## How I Use It

Occasionally explore relationships.

Do not optimize the vault for graph appearance.

---

# 12. Properties (Metadata)

## What It Is

Structured information attached to a note.

## Example

```yaml
---
field: Psychology
chapter: 4
status: Complete
---
```

## Purpose

Provide machine-readable organization.

## How I Use It

Track:

- Subject
- Source
- Status
- Priority

---

# 13. Template

## What It Is

A reusable note structure.

## Example

```markdown
# Definition

# Summary

# Key Ideas

# Why I Care

# Related Notes
```

## Purpose

Ensure consistency.

## How I Use It

Create templates for:

- Concepts
- Book Chapters
- Papers
- Meeting Notes

---

# 14. Daily Note

## What It Is

A note automatically created each day.

## Example

```markdown
# 2026-06-24

## Learned

- Emotional Regulation

## Ideas

- Dynamic Accommodation as a biomarker

## Questions

- Why do users adopt products?
```

## Purpose

Capture ideas quickly.

## How I Use It

Use as an inbox for thoughts and observations.

---

# Recommended Vault Structure

```text
Knowledge Vault/
│
├── Learning/
│   ├── Psychology/
│   ├── Economics/
│   ├── Finance/
│   └── Manufacturing/
│
├── Concepts/
│
├── Systems/
│
├── Applications/
│
├── Organizations/
│
├── People/
│
├── Questions/
│
├── Attachments/
│   ├── Images/
│   ├── PDFs/
│   ├── Books/
│   └── Papers/
│
└── Templates/
```

---

# Core Mental Model

Folders provide:

> Context

Links provide:

> Relationships

Attachments provide:

> Evidence

Notes provide:

> Knowledge

The goal is not to collect information.

The goal is to improve understanding and decision-making.