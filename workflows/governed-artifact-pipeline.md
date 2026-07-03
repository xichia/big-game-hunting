# Governed Artifact Pipeline

## Purpose

The Governed Artifact Pipeline is a broad multi-model workflow for complex projects where outputs must move through bounded artifact creation, independent review, and human ratification before becoming project truth.

It applies to Big Game Hunting as an idea engine, feasibility filter, prototype generator, review process, and source-of-truth protection system.

## Core Principle

Artifact creation, review, and ratification are separate steps.

```text
Models produce artifacts.
Reviewers evaluate artifacts.
Humans ratify decisions.
Only ratified decisions update the source of truth.
```

## Big Game Hunting Adaptation

For this project, the pipeline protects the game's identity:

```text
A game that feels immediately graspable,
but keeps revealing deeper strategic structure.
```

Every artifact should be evaluated against this question:

```text
Does this help us build a game that beginners can enjoy quickly and experts can keep mastering?
```

## Roles

- Orchestrator / Project Manager
- Broad Research / Ideation Model
- Synthesis / Architecture Model
- Focused Research / Feasibility Model
- Prototype / Probe Model
- Independent Reviewer
- Human Decision Authority
- Source-of-Truth Maintainer
- Worker Model Pool
- Fable Five / Specialist Development Model

## Workflow

1. Define project truth and forbidden zones.
2. Generate broad possibilities.
3. Synthesize into a narrow candidate set.
4. Human decision gate.
5. Focused research on approved candidates.
6. Small probe or prototype.
7. Independent review.
8. Decision dashboard.
9. Specialist development.
10. Source-of-truth update only after ratification.

## Big Game Hunting Flow

```text
Ideate
-> Filter
-> Feasibility-check
-> Probe
-> Review
-> Ratify
-> Build
```

## Artifact Rules

- One task, one artifact.
- One artifact, one commit.
- Explicit allowed files.
- Explicit forbidden files.
- Draft, branch, probe, or non-canon labels where needed.
- Acceptance checks before commit.
- Reviews are separate artifacts.
- Human ratification is required before source-of-truth updates.

## Decision Dashboard Pattern

Use these labels:

```text
GREEN
Ready to advance.

YELLOW
Promising, but needs revision or clarification.

RED
Do not advance in current form.

CANON / SOURCE OF TRUTH
Ratified and allowed to update authoritative project files.

DRAFT ONLY
Useful, but not authoritative.

VETO
Blocked by contradiction, risk, quality failure, or human decision.

QUESTION
Requires human judgment before proceeding.
```

## Model Routing Guidance

Use roles, not fixed model names.

Example routing:

```text
Gemini-style model:
Broad research, feasibility, source and analogue gathering.

Opus-style model:
Synthesis, architecture, prototype generation, design judgment.

GLM / Sonnet-style model:
Independent review, critique, risk detection, consistency checks.

Fable-style model:
Late-stage specialist development after human gates.
```

These are examples only. The workflow depends on separation of roles, not fixed vendor names.

## Anti-Patterns

- Model output becomes truth by repetition.
- The same model generates and reviews high-stakes work.
- Broad ideation jumps straight to final implementation.
- Reviews are treated as ratification.
- Specialist models are used before the brief is bounded.
- Worker models are asked to invent source-of-truth decisions.

## Copyable Orchestrator Prompt

```text
You are the orchestrator for Big Game Hunting using the Governed Artifact Pipeline.

Create a bounded artifact request for another model.

Identify:
- project goal
- current source of truth
- allowed files
- forbidden files
- artifact to produce
- artifact authority level
- acceptance checks
- what decision this artifact supports

Do not ask the model to update source-of-truth files unless a human decision has ratified the change.
```
