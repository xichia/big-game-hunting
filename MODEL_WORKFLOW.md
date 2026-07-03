# Model Workflow

Authority level: SOURCE OF TRUTH

Big Game Hunting uses models as artifact producers, reviewers, and synthesis assistants. Models do not ratify project truth.

## Core Rule

```text
Models produce artifacts.
Reviewers evaluate artifacts.
Humans ratify decisions.
Only ratified decisions update the source of truth.
```

## Role-Based Routing

Use roles, not fixed model names.

### Broad Research / Ideation Model

Purpose:
Generate wide possibility spaces, analogues, mechanic families, audience hypotheses, and research leads.

Outputs:
- research artifacts
- candidate concept lists
- analogue maps
- risk lists

Authority:
DRAFT ONLY.

### Synthesis / Architecture Model

Purpose:
Convert broad research into narrow candidate sets and decision-ready packets.

Outputs:
- synthesis packets
- candidate comparisons
- recommended probes

Authority:
DRAFT ONLY unless human-ratified.

### Focused Research / Feasibility Model

Purpose:
Investigate approved candidates for feasibility, audience fit, production risk, and strategic depth.

Outputs:
- feasibility packets
- risk assessments
- evidence summaries

Authority:
DRAFT ONLY.

### Prototype / Probe Model

Purpose:
Create small bounded artifacts that test a specific mechanic or assumption.

Outputs:
- paper prototypes
- turn examples
- miniature rulesets
- simulated playtests

Authority:
PROBE.

### Independent Reviewer

Purpose:
Evaluate artifacts against the brief, design principles, game truth, and known risks.

Outputs:
- independent reviews
- GREEN / YELLOW / RED / QUESTION recommendations

Authority:
REVIEW ONLY.

### Fable Five / Specialist Development Model

Purpose:
Perform late-stage specialist synthesis, creative development, or final review once the brief is bounded.

Recommended Use:
- pre-worker design synthesis
- post-worker review
- specialist development after human gates

Authority:
DRAFT ONLY or REVIEW ONLY unless human-ratified.

### Worker Model Pool

Purpose:
Execute bounded tasks from approved briefs.

Good Tasks:
- simplify a mechanic
- create onboarding variants
- design playtest scenarios
- stress-test a scoring system
- write a one-page rules draft from ratified mechanics

Bad Tasks:
- finish the whole game
- decide the core mechanic
- update source of truth
- approve their own work

## Standard Pipeline

```text
Broad Research Models
-> Game Shape Research

Synthesis / Architecture Model
-> Candidate Design Packet

Human Gate
-> Approved candidates only

Focused Research Models
-> Feasibility and analogue packets

Prototype / Probe Models
-> Small playable artifacts

Independent Review Models
-> Simplicity / depth / risk review

Fable Five or Specialist Review
-> High-level synthesis or final critique

Human Ratification
-> Accepted decisions only

Source-of-Truth Maintainer
-> Updates GAME_TRUTH, DESIGN_PRINCIPLES, MECHANICS, DECISION_LOG
```

## File Rules

- One task, one artifact.
- One artifact, one commit.
- Every task must list allowed files.
- Every task must list forbidden files.
- Reviews must be separate from the artifacts they evaluate.
- Source-of-truth files require human ratification.
