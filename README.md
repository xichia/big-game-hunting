# Big Game Hunting

Big Game Hunting is a governed game-design project focused on discovering and building a game that is simple to adopt, widely appealing, and difficult to master.

The project uses a multi-model workflow called the **Governed Artifact Pipeline**:

```text
Models produce artifacts.
Reviewers evaluate artifacts.
Humans ratify decisions.
Only ratified decisions update the source of truth.
```

## Project North Star

Create a game with:

- simple entry
- wide appeal
- strong replayability
- strategic depth
- high mastery ceiling
- low onboarding friction
- enough emotional payoff that players want to teach, replay, and discuss it

## Core Strategy

This repository is not just a place to store rules. It is a controlled design environment.

Ideas may be generated broadly, but they do not become project truth until they move through artifact creation, independent review, and human ratification.

```text
Ideate -> Filter -> Feasibility-check -> Probe -> Review -> Ratify -> Build
```

## Source-of-Truth Files

The following files define the current official state of the project:

- `GAME_TRUTH.md` — current official game identity and ratified direction
- `DESIGN_PRINCIPLES.md` — non-negotiable design principles
- `MECHANICS.md` — ratified mechanics only
- `DECISION_LOG.md` — human-ratified decisions
- `MODEL_WORKFLOW.md` — how model roles are routed and constrained
- `PLAYTEST_LOG.md` — playtest and simulated playtest findings
- `BALANCE_NOTES.md` — strategy, balance, and failure-mode tracking

Anything outside those files is exploratory unless explicitly ratified.

## Repository Structure

```text
big-game-hunting/
├── GAME_TRUTH.md
├── DESIGN_PRINCIPLES.md
├── DECISION_LOG.md
├── MECHANICS.md
├── MODEL_WORKFLOW.md
├── PLAYTEST_LOG.md
├── BALANCE_NOTES.md
├── workflows/
│   └── governed-artifact-pipeline.md
├── docs/
│   ├── design-gates.md
│   ├── artifact-authority.md
│   └── glossary.md
├── templates/
│   ├── research-artifact.md
│   ├── synthesis-packet.md
│   ├── probe-brief.md
│   ├── independent-review.md
│   ├── decision-dashboard.md
│   └── worker-task.md
├── artifacts/
│   ├── research/
│   ├── synthesis/
│   ├── probes/
│   ├── reviews/
│   └── dashboards/
├── playtests/
├── prototypes/
├── rules/
├── src/
└── assets/
```

## Authority Levels

Use these labels on artifacts:

```text
DRAFT ONLY
EXPLORATORY
PROBE
REVIEW
PROPOSED SOURCE OF TRUTH UPDATE
RATIFIED
VETOED
QUESTION
```

## Immediate Next Steps

1. Create a broad game-shape research artifact.
2. Synthesize candidate directions.
3. Select 1–3 candidate directions for focused research.
4. Build tiny probes before committing to a full game.
5. Use independent review before ratification.
6. Update source-of-truth files only after human approval.
