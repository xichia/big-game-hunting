# Probe Brief: One-Way Passages — Trail of Embers Level 9 Slice

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — probe brief only, not implementation, not ratified truth
DATE: 2026-07-07
SOURCE-OF-TRUTH FILES TOUCHED: none
IMPLEMENTATION INCLUDED: none

This document is a bounded probe brief for a possible One-Way Passages
mechanic in Trail of Embers. It does not authorize implementation. It does
not ratify One-Way Passages as design truth. It defines the smallest testable
level slice to answer one falsifiable question.

---

## 1. Purpose

The level progression ideation (`artifacts/research/trail-of-embers-level-progression-feature-ideation.md`) recommends One-Way Passages as the next probe because:

- It is the lowest-complexity spatial mechanic on the candidate list.
- It creates commitment moments that deepen the ember decision without adding controls, inventory, health, or tutorials.
- It combines naturally with existing maze routing and beast pursuit.
- It addresses the content-treadmill risk by adding systemic variety (combinatorial depth) rather than just bigger maps.

After Level 8 (The Gatekeeper's Keep, which introduces the beast-activated gate), the next probe should test whether a purely spatial commitment mechanic can create new tension and route-planning depth without diluting the core ember-bait loop. One-Way Passages are that probe.

---

## 2. Design Hypothesis

**Falsifiable hypothesis:** A one-way passage can create meaningful commitment decisions under beast pressure while preserving the core ember-bait loop and remaining understandable through level layout and visual language alone — no text, no tutorial.

**Null hypothesis:** One-way passages feel arbitrary or confusing. Players avoid them (they feel too risky) or get trapped by them (they did not understand the constraint). They add frustration without deepening route planning.

---

## 3. Mechanic Definition

A **One-Way Passage** is a narrow gap in a wall that the player can pass through in only one direction. It is a standard obstacle rectangle with a directional constraint added.

### Recommended probe implementation:

- **Player:** Can pass through only when moving in the allowed direction. Movement against the allowed direction collides as if the wall were solid.
- **Beast:** Ignores one-way passages entirely — walks straight through them in either direction, same as all other obstacles. The beast treats them as non-obstacles. This preserves the beast's existing wall-ghosting behavior and prevents the mechanic from becoming a safe-zone the player can hide behind.
- **Embers / Light:** Pass through one-way passages freely — embers are not affected by directional collision. This ensures ember-bait placement is not constrained by passage direction.
- **Collision / Visibility:** The passage visually shows the direction arrow/chevrons on the wall surface. The gap itself is visible in the player's torch radius normally.

### Why the beast ignores it:

If the beast obeyed one-way passages, it would create a chase-reversal dynamic where the player could safely bait the beast through a passage and then retreat — fundamentally changing the beast's rule set. Keeping the beast's wall-ghosting unchanged preserves the existing balance where walls slow only the player. The one-way passage becomes a player-only commitment mechanic: you cannot go back, but the beast is never blocked by it.

---

## 4. Visual Language

Proposed pixel-art visual language for one-way passages — readable without text:

- **Chevrons on the wall face:** Small arrow-shaped brick patterns (">>>") on the wall surface flanking the gap, pointing in the allowed direction. Painted in a slightly lighter mortar color (#4a4a3a vs. the standard wall #3a3a2e) so they read as intentional, not decorative.
- **Tapered doorway:** The gap is slightly wider on the entry side than the exit side (e.g., 40px → 26px over the wall thickness). The taper visually suggests "this way is wider / easier to enter."
- **Floor arrows:** One or two faint directional arrow tiles on the floor at the entry side of the gap, only visible within torch/ember light. Same arrow shape as the chevrons but on the ground.
- **One-sided teeth:** Short protruding brick nubs on the exit side of the wall face (like one-way barbs), visible only when the player is on the exit side looking back — a subtle "you cannot go back this way" signal after passing.

### What to avoid:

- **UI arrows or text labels:** Do not render "ONE WAY" text or HUD indicators. The visual language should be purely diegetic (brick patterns, floor tiles, wall shape).
- **Color-coded directional fields:** Do not use red/green color coding — it reads as UI language and breaks the pixel-art feel.
- **Glowing/emissive passage markers:** The passage should read as architecture, not as a magic portal. Emissive markers could be confused with ember effects.

---

## 5. Level 9 — First-Slice Proposal

### Level size

1800 × 1000 (same as levels 6-8). No new canvas scale step — the mechanic, not the map size, is the probe.

### Number of one-way passages

Two passages total:

1. **Safe introduction passage** — near the start area, clearly visible. The player can see both sides of it from the start chamber. The safe zone is still reachable without using it. This is a "teaching" passage: the player can experiment with it, see the chevrons, feel the one-way constraint, and learn that the beast ignores it — all with zero pressure.
2. **Shortcut passage** — mid-level, creating a real commitment. Going through it cuts the route length by ~30% but commits the player to a different corridor that loops back toward the safe zone. The beast can chase through it (ignores the constraint) so the player must bait before committing.

### Ember interaction with route choice

- The safe introduction passage has an ember-bait pocket on the far side: the player can drop an ember, step through, and watch the beast chase through after them — immediately teaching both the one-way constraint and the beast's indifference to it.
- The shortcut passage has an ember-bait pocket on the far side: the player can drop an ember before committing to pull the beast through, or save the ember for after crossing. The commitment is purely spatial.

### Safe zone reachability

The safe zone is reachable via a longer, non-one-way route on every path. No passage is required. The one-way passages are optional risk/reward shortcuts. This prevents the level from becoming a puzzle lock.

### What the level does NOT do

This first slice does not combine One-Way Passages with the beast gate or with Cinder Cache placement. Level 9 introduces exactly one new mechanic in isolation. Combinations (One-Way Passages + Cinder Charge, One-Way Passages + gate) are deferred to later probes.

---

## 6. Player Decisions Created

The mechanic should create these decision moments:

| # | Decision | Context |
|---|----------|---------|
| 1 | **Commit now vs. stay reversible** | Should I take this shortcut, knowing I cannot come back? |
| 2 | **Shortcut vs. safer long route** | Does the time save justify the commitment? |
| 3 | **Bait before crossing vs. after crossing** | Do I drop an ember on the near side to pull the beast away, or on the far side to pull it through — knowing both sides work because the beast ignores the passage? |
| 4 | **Let the beast cross vs. deny it** | The beast crosses freely regardless. The decision is about managing *where* the beast is when you commit — do you want it on the near side or the far side? |

---

## 7. Interaction with Existing Systems

### Core ember-bait loop

One-way passages do not change how embers work — they change the *route context* in which embers are placed. An ember dropped before a one-way passage commits the beast to the near side; an ember dropped after pulls it to the far side. The directionality adds a spatial dimension to bait timing (when do you drop relative to the commitment point?) without changing the bait mechanic itself.

### Beast pursuit / wall behavior

Unchanged. The beast walks through one-way passages as if they were empty air, same as all obstacles. This keeps the beast's rule set (three rules, no pathfinding) intact and prevents the passage from becoming a player-safe-zone.

### Cinder Charge

The charge interacts naturally with one-way passages in principle: a player holding a charge could spend it on the far side of a one-way passage to drop an emergency ember if the beast is closer than expected. This creates a "bait after crossing" decision without changing the charge mechanic. This combination is NOT included in the Level 9 first slice — it is deferred to a later probe.

### Beast gate / Level 8 concept

Not combined in this slice. The gate and one-way passages are separate systems. Future probes may combine them.

### Audio / proximity cue

The proximity rumble continues to provide non-directional beast-distance awareness, which is especially useful when deciding whether to commit to a one-way passage. No changes needed.

### Controller feel

No new controls. The constraint is purely spatial/collision — the player moves with the same input and simply cannot pass in one direction.

### Validation script

Must be extended (see Section 10).

---

## 8. Non-Goals

This probe explicitly rejects:

- **New controls** — no additional buttons, no hold-to-pass, no toggle.
- **Inventory** — no key items, no lock-and-key, no item management.
- **Keys** — no one-way passages require a collectible to unlock.
- **Health / lives** — one-hit death is unchanged.
- **Scoring** — no points, no time, no rating.
- **Procedural generation** — hand-authored level only.
- **Complex enemy variants** — the beast's three rules are unchanged.
- **Permanent upgrades** — no meta-progression.
- **Tutorial panels** — the mechanic must be learnable through visual language and play alone.
- **Source-of-truth ratification** — this probe does not approve the mechanic.
- **Combining with beast gate** — Level 9 introduces exactly one new mechanic.

---

## 9. Implementation Sketch (No Code)

This is a high-level sketch of how One-Way Passages would likely be added to the prototype. No code is written in this task.

### Likely data structure shape

Level data grows an optional `oneWayPassages` array. Each entry:

```js
{ x, y, w, h, direction }
```

Where `direction` is `"north"`, `"south"`, `"east"`, or `"west"` — the direction the player is allowed to move through the wall. (Alternatively, `from` and `to` edges if more precision is needed, but a single direction vector suffices for the first slice.)

The existing gate/triggerZone pattern in the level data is the closest precedent for adding a new optional array alongside obstacles.

### Likely collision logic shape

In the `updatePlayer` function (which currently checks circle-vs-rectangle collision against `level.obstacles`):

1. After the standard obstacle collision check, iterate over `level.oneWayPassages`.
2. For each passage, compute the player's movement vector for this frame.
3. Determine whether the movement direction is "against" the passage direction:
   - Passage direction `"north"` → player must be moving upward (dy < 0) to pass through.
   - If the player is moving in the opposite direction (e.g., downward through a north-only passage), treat the passage as a solid obstacle for this frame.
4. Use the same `circleRectCollide` function for the collision check — the only difference is which walls participate in collision for a given movement vector.

### Likely rendering approach

1. Draw the passage wall as a normal obstacle rectangle (same brick style).
2. Draw chevron arrows on the wall surface using the `PX` pixel-drawing function, positioned near the gap. The chevrons point in the allowed direction.
3. Draw one or two floor arrow tiles on the entry side of the gap.
4. Draw the tapered doorway by adjusting the wall rectangle dimensions to narrow toward the exit side — or, more simply, add small triangular "ramp" pixels on the exit side to visually suggest the taper without changing collision geometry.

### Likely validation additions

The `validate-levels.js` BFS reachability check needs to become directional:

1. When running BFS from the player start to the safe zone, one-way passages are treated as one-way edges in the navigation graph.
2. From the entry side, the player can step into the passage grid cell. From the exit side, the passage is blocked (equivalent to a solid obstacle).
3. The beast's pathfinding is not validated — the beast ignores all obstacles by design.
4. Bounds checks: each passage must be fully in bounds.
5. Clearance check: each passage must not overlap other obstacles (same check as the gate-obstacle overlap).
6. A secondary "reachable with passages as solid" check to verify the safe zone is still reachable via the non-one-way route (passages treated as fully blocked).

---

## 10. Validation Expectations

### Automated validation (`validate-levels.js`)

- Each `oneWayPassages` entry is in bounds.
- Each entry does not overlap any `obstacles` entry.
- Safe zone is reachable from player start with one-way passages treated as directional edges (BFS with directional constraints).
- Safe zone is also reachable from player start with one-way passages treated as fully solid walls (proving the level does not *require* using them).
- Beast speed check (same as existing).

### Manual browser checks

- Player can pass through each passage in the allowed direction.
- Player cannot pass through in the reverse direction (stops as if hitting a wall).
- Beast walks through in either direction (no collision).
- Embers pass through in either direction (no collision).
- Chevrons and floor arrows are readable without pressing G.
- Debug overlay (G) should show passage direction as a label/arrow.

### Prove Levels 1-8 are unchanged

1. Load each level 1-8 and verify the level data has no `oneWayPassages` field.
2. Run `validate-levels.js` on the unmodified file — all existing checks pass as before.
3. No runtime path changed: the `updatePlayer` collision loop only checks `oneWayPassages` when the field exists, which is falsy for all existing levels.

### Prove the new element is removable

1. Delete the `oneWayPassages` array from level 9's data.
2. Remove the collision check in `updatePlayer`.
3. Remove the rendering code for chevrons/arrows.
4. All existing levels rebuild and validate without changes.

---

## 11. Playtest Questions

After the probe is implemented and Ian self-playtests Level 9, answer:

1. **Did the passage read as one-way?** — Did the chevrons, taper, and floor arrows communicate the constraint without text? Did you notice the one-way nature before or after attempting reverse passage?
2. **Did it create a meaningful commitment moment?** — Was there a moment where you paused and thought "if I go through this, I cannot come back"? Did that feel tense or annoying?
3. **Did it feel fair?** — When the beast chased you through a one-way passage, did that feel like the beast's normal behavior (ghosting through walls) or did it feel like cheating?
4. **Did it preserve ember-bait decision-making?** — Did you find yourself thinking about *where* to drop embers relative to one-way passages (before vs. after)? Or did ember behavior feel unchanged?
5. **Did it make navigation better or more confusing?** — Did the one-way passages make the level feel richer (good lost: "I need to remember which passages are one-way") or arbitrary (bad lost: "I went through and now I'm stuck")?
6. **Did it feel like depth or like a gimmick?** — Did the mechanic feel like it added a meaningful layer to route planning, or like a one-off trick that would get old in the next level?
7. **Was the safe introduction passage actually safe?** — Did the first passage teach the mechanic without stress, or did the beast ruin the teaching moment?
8. **Did the shortcut feel worth the commitment?** — Was the time saved by the shortcut passage proportional to the risk of not being able to return?
9. **Did the beast being able to cross freely ever feel surprising?** — Given that the beast ignores all walls, did its indifference to one-way passages feel consistent or unexpected?

---

## 12. Green, Yellow, and Red Signals

### GREEN (reasons to continue)

- Player notices the one-way constraint within one attempt (tries to go back, fails, understands).
- Player commits to a one-way passage and names a tense moment tied to the decision.
- Player uses embers differently before/after one-way passages (bait before committing, or bait after crossing).
- Player describes a route-planning strategy that accounts for one-way passages.
- Player reports that one-way passages feel like "depth, not gimmick."

### YELLOW (tuning / clarity concerns)

- Player notices the constraint but after 2+ attempts (visual language may need tuning).
- Player uses one-way passages but does not use embers differently around them (the mechanic is working but not integrating with the core loop).
- Player finds one-way passages mildly confusing but not frustrating.
- Player reports that chevrons are hard to see in low light (tuning the visual language brightness).

### RED (reasons to remove or abandon)

- Player does not notice the one-way constraint and feels trapped ("I came in but cannot get out — bug?").
- Player avoids all one-way passages because they feel too risky (the mechanic is never engaged).
- Player reports that one-way passages make navigation arbitrary rather than learnable.
- Player reports that one-way passages feel unfair because the beast ignores them (the inconsistency breaks the player's mental model).
- Player reports the mechanic as a gimmick that would not survive a second level.

---

## 13. Recommended Next Step

### Implementation slice: YES

The probe is well-bounded, low-complexity, and purely spatial. The falsifiable question is clear. The risk is low (the mechanic is optional in the level and removable from the codebase). Proceed to implementation.

### Recommended executor lane if implemented

**OpenCode** (this lane). The implementation is a single-file change (index.html) plus a validation extension (validate-levels.js). No external dependencies, no server, no build step.

### Files likely touched

- `prototypes/trail-of-embers/index.html` — level 9 data (new), `updatePlayer` collision logic (add one-way wall check), render logic (draw chevrons/arrows), level data shape comments.
- `prototypes/trail-of-embers/validate-levels.js` — directional BFS reachability, bounds/clearance checks.
- `prototypes/trail-of-embers/README.md` — document the new mechanic and level.

### Files forbidden

- `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` — no source-of-truth files touched.
- `artifacts/probes/0009-trail-of-embers-one-way-passages-probe-brief.md` — this file, which is the probe brief and should remain as the pre-implementation artifact.
- Sailor/Bupa files — no changes, no inspection, no stash interaction.

---

END OF PROBE BRIEF
