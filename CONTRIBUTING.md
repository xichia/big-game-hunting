# Contributing

Big Game Hunting uses the Governed Artifact Pipeline.

## Contribution Rules

1. Create one artifact per task.
2. Keep exploratory work labeled as draft, probe, or review.
3. Do not update source-of-truth files without human ratification.
4. Pair every ratified source-of-truth change with a `DECISION_LOG.md` entry.
5. Use independent review for high-impact changes.
6. Keep worker tasks bounded.

## Source-of-Truth Change Checklist

Before changing `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, or `MODEL_WORKFLOW.md`, confirm:

```text
[ ] Human decision authority approved the change.
[ ] The decision is recorded in DECISION_LOG.md.
[ ] The changed files are explicitly allowed.
[ ] The artifact is not merely a draft or review.
[ ] Contradictions with existing source of truth are resolved.
```
