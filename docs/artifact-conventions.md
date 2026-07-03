# Artifact Conventions

AUTHORITY: PROJECT PROCESS GUIDANCE  
STATUS: Draft until ratified

## Purpose

This document standardizes how Big Game Hunting artifacts are named, labeled, reviewed, and promoted.

## Naming

Use numbered, slugged Markdown files:

```text
NNNN-short-descriptive-slug.md
```

Examples:

```text
0001-first-game-shape-research.md
0002-hidden-information-core-loop.md
0003-beginner-onboarding-review.md
```

## Required Header

Every artifact should begin with:

```text
# Artifact Title

ARTIFACT TYPE:
AUTHORITY:
STATUS:
CREATED BY:
REVIEWED BY:
DATE:
RELATED TASK:
SOURCE-OF-TRUTH FILES TOUCHED:
```

## Authority Labels

Use one of:

```text
DRAFT ONLY
EXPLORATORY
PROBE
REVIEW
DECISION DASHBOARD
RATIFIED
SOURCE OF TRUTH
```

## Commit Rule

One task should produce one primary artifact.

One artifact should be committed separately where practical.

## Source-of-Truth Rule

Artifacts do not update project truth by themselves.

Only human-ratified decisions may update files such as:

```text
GAME_TRUTH.md
DESIGN_PRINCIPLES.md
MECHANICS.md
DECISION_LOG.md
PLAYTEST_LOG.md
BALANCE_NOTES.md
```
