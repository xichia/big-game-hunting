# Probe Brief: Ember Bloom — Trail of Embers Level 11 Maze Experiment

ARTIFACT TYPE: Probe Brief
AUTHORITY: EVIDENCE FUEL ONLY
STATUS: Draft — probe brief only, not implementation, not ratified truth
DATE: 2026-07-14
SOURCE-OF-TRUTH FILES TOUCHED: none
IMPLEMENTATION INCLUDED: none

This document is a bounded probe brief for a possible Level 11 built around a
provisional mechanic named **Ember Bloom**: a substantially expanded player
light radius traded against a narrower, more maze-like level. It does not
authorize implementation. It does not add Level 11 to
`prototypes/trail-of-embers/index.html`. It does not ratify Ember Bloom, the
proposed multiplier, or any level geometry as truth. It treats Ian's proposed
exchange as ratified *design direction* only — a starting hypothesis to probe,
not a finished design. This artifact is exploratory evidence fuel, consistent
with how probe briefs 0009 and 0010 were used before their respective levels
existed.

---

## 1. Status and Authority

- This is a **probe brief**: exploratory design reasoning grounded in repo
  inspection, not a specification.
- It is **not source of truth**. `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`,
  `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, and `BALANCE_NOTES.md`
  are untouched and unaffected by anything in this document.
- It is **not implementation authorization**. No level was added, no
  rendering code was changed, no validator changes were made.
- It is **subject to Ian's review**. The recommended multiplier, level beats,
  and scope in this brief are starting proposals, not decisions.

---

## 2. Design Direction

Ian's proposed exchange, restated faithfully and without inflating its
certainty:

- The player receives an upgrade — provisionally named **Ember Bloom** — that
  substantially increases how much area the ember (the player's torch)
  illuminates.
- In exchange, the next level becomes narrower, more complicated, and more
  maze-like.
- The core experience becomes navigating a maze in darkness, **eased
  somewhat** by the larger visibility area — not solved by it. Darkness
  remains important; the upgrade offsets the harder geometry, it does not
  erase the harder geometry.
- The intended exchange, in one line: **more information, less space.**

This is a proposed feel, not a validated one. Nothing below should be read as
confirming that this exchange will work — that is exactly what the probe is
for.

---

## 3. Repository Findings

Findings are separated from inference. All facts below are grounded in the
committed prototype as of `dda0866` (the last confirmed Trail of Embers
commit before this task) and were independently re-verified by reading the
current working tree, not assumed from prior artifacts.

### 3.1 Light system — facts

- The player's light radius is a single top-level constant:
  `TORCH_RADIUS = 85` (`prototypes/trail-of-embers/index.html:71`), commented
  "player's constant visibility + beast's default target." It is **not**
  part of `LEVEL_DEFAULTS` and **not** overridable per level today — unlike
  `beastSpeed`, `emberCooldownMs`, and `emberLifetimeMs`, which already are
  per-level tunables (`LEVEL_DEFAULTS`, index.html:85-91, and per-level
  overrides throughout the `LEVELS` array).
- A second, larger light value already exists in the same file: dropped
  embers peak at `EMBER_RADIUS = 155` (index.html:77), used on every level
  since Level 1. **155 / 85 ≈ 1.82x** the torch radius — i.e., the codebase
  has already rendered and shipped a light hole close to the manager's
  proposed 1.75x figure, just on a temporary, movable object rather than the
  player's own constant light.
- The renderer is a single opaque black "fog" canvas with circular holes cut
  via `destination-out` compositing (`drawFog()`, index.html:1502-1535). Each
  light source — player torch, hot embers, and (conditionally) the beast —
  calls `punchHole(x, y, r)`, which draws one radial gradient circle
  (`createRadialGradient`, solid center fading to transparent at the edge,
  index.html:1508-1517). There is **no raycasting, no visibility polygon, no
  wall-awareness of any kind** in this function — `punchHole` takes only
  `x, y, r` and has no obstacle argument.
- Draw order is: `drawWorld()` (walls, sprites, embers) runs first, then
  `drawFog()` composites the opaque-with-holes layer on top
  (`frame()`, index.html:1673-1674). Anything outside a punched hole —
  including the beast — is fully hidden, and anything inside a hole is fully
  visible regardless of walls between it and the light source.
- **Conclusion: light visually passes through walls unconditionally today.**
  This is true on every existing level, not something Level 11 would
  introduce — but a substantially larger radius in a deliberately narrower
  maze will make wall bleed-through both more frequent and more visually
  significant, because more wall-adjacent corridors will fall inside the
  radius at once.
- The beast is not separately lit by default. It only becomes visible when
  it falls inside the player's torch hole, an ember's hole, or — only while
  `level.gate` exists and `isGateOpen()` is true — its own punched hole at
  `TORCH_RADIUS` (index.html:1519-1523). There is no independent "beast glow"
  outside those cases.
- `hasCinderCharge` / Cinder Charge (index.html:1057-1075, 689) affects only
  **when** an ember can be dropped (it lets the player bypass the cooldown
  once); it does not touch `TORCH_RADIUS`, `EMBER_RADIUS`, ember lifetime, or
  any rendering value. There is no existing interaction between Cinder Charge
  and light radius to preserve or break.
- No HUD element, particle system, canvas clipping, or camera/viewport logic
  depends on `TORCH_RADIUS`'s value. The canvas is sized to the full
  `fieldW x fieldH` per level (`loadLevel`, index.html:703-714) and CSS-scaled
  to fit — there is no scrolling camera to reconsider.

### 3.2 Light system — inference

- Because `TORCH_RADIUS` is a single global constant rather than a per-level
  or per-player-state value, a **level-local** Ember Bloom (matching Ian's
  framing of "the player receives an upgrade" for this specific level) is
  architecturally a small but real change: it requires promoting the torch
  radius from a hardcoded constant to a runtime value (e.g. a `player.lightR`
  or similar field, initialized from `TORCH_RADIUS` and reassigned when the
  level defines a bloom trigger), used everywhere `TORCH_RADIUS` currently
  appears (index.html:1519, 1544, and the debug-arc draw). This is a **local
  configuration/state change**, not a broader rendering-system change — the
  same `punchHole` circle-gradient mechanism is reused unmodified with a
  different `r`.
- Because the existing `EMBER_RADIUS` (155) already demonstrates a ~1.82x
  hole rendering cleanly at scale, the rendering risk of a similarly-sized
  player light hole is low — this exact visual size has already shipped.

### 3.3 Current level architecture — facts

- Ten hand-authored levels live as plain object literals in the `LEVELS`
  array (index.html:100-657): "First Light," "The Guarded Circle," "The Long
  Dark," "The Ember Maze," "The Deep Maze," "The Coiled Maze," "The Ember
  Ring," "The Gatekeeper's Keep," "The Crossroads," and "The Beast Errand."
  Level 11 does not exist in this file.
- Each level object supports: `name`, `playerStart`, `beastStart`,
  `safeZone {x,y,r}`, `obstacles[]` (axis-aligned rectangles), optional
  `fieldW`/`fieldH` (falls back to `W`/`H` = 900x560 via `LEVEL_DEFAULTS`),
  optional `beastSpeed`/`emberCooldownMs`/`emberLifetimeMs` overrides,
  optional `cinderCaches[]`, optional `gate` + `triggerZone`, and optional
  `oneWayPassages[]` (each `{x,y,w,h,direction}`). Level 11 as a hand-authored
  entry using this existing structure is straightforward — no new level-data
  fields are required for the geometry itself; only the light-radius upgrade
  needs a new field (see 3.1).
- Walls/corridors are plain solid rectangles in `obstacles[]`; there is no
  separate corridor/POI/landmark data type. "Landmarks" in existing levels are
  achieved by obstacle shape and placement, not by tagged data.
- `validate-levels.js` (274 lines) is a Node harness that evaluates the
  inline `<script>` in a sandboxed VM and runs purely geometric/graph checks
  per level: in-bounds checks, player-start/safe-zone clear of obstacles,
  `beastSpeed < 175` (player speed), one-way-passage bounds/direction/overlap
  checks, gate/trigger-zone in-bounds and BFS reachability (with the gate
  alternately treated as open and closed), directed BFS respecting one-way
  passage direction, and Cinder Cache reachability (including
  reachable-before-commitment for levels with one-way passages). **The
  validator has no concept of light, visibility, or radius at all** — it is
  pure geometry/graph reachability over `PLAYER_RADIUS`-clearance grids.

### 3.4 Current level architecture — inference

- A larger radius does not, by itself, require any validator change, because
  the validator never modeled visibility to begin with. Validator changes
  would only become necessary if Level 11 introduces new gating primitives
  (it should not, per Section 10) or a new level-data field for the light
  upgrade that the validator would need to sanity-check (e.g., bounds-check a
  bloom pickup's position) — a small, additive check in the same style as the
  existing Cinder Cache checks.

### 3.5 Beast movement and maze risk — facts

- The beast AI is documented in-repo as intentionally simple: "Beast AI --
  deliberately the simplest possible rule set: 1. the newest still-hot ember
  is the target, if one exists 2. otherwise the beast heads for the player's
  own torch... 3. a short idle/patrol grace period only applies before
  anything has ever been lit" (index.html:1077-1097, `updateBeast`).
- Movement itself, `moveToward(entity, target, speed, dtSec)`
  (index.html:778-785), is a **pure straight-line step toward the target's
  x/y** with no obstacle, wall, or pathfinding awareness whatsoever — it does
  not receive or consult `level.obstacles` in any form.
- This is confirmed as **deliberate, not a bug**, by an explicit repo comment
  at the top of the `LEVELS` array: "Obstacles block the player but never the
  beast, which still walks straight through walls by design"
  (index.html:97-99). It is also independently corroborated by the existing
  research artifact `trail-of-embers-post-level-10-growth-ideation.md`
  ("Beast AI: 3 rules... No pathfinding, ignores obstacles," line 53), which
  this brief treats as corroborating evidence, not as the sole source — the
  claim was re-verified directly against `index.html` per this task's
  instructions, not merely repeated.
- Win/loss proximity is likewise wall-unaware: `checkWinLose()`
  (index.html:1099-1113) loses the game purely on
  `dist(player, beast) < PLAYER_RADIUS + BEAST_RADIUS` (23px total,
  `PLAYER_RADIUS=10` + `BEAST_RADIUS=13`) with **no obstacle check** —
  identical in kind to the movement function's lack of wall-awareness.
- There is no bounds clamp on beast position anywhere in the update loop
  (only the player is clamped to the field, index.html:1025-1026), though
  this is a minor, likely-inert fact given the beast is drawn toward
  in-bounds targets in every current level.

### 3.6 Beast movement and maze risk — inference

- Because the beast has always ignored walls, the beast passing through
  obstacles is **not new to Level 11** — it is present in every existing
  maze level (4 through 10). What is new is **density**: a compact, narrow,
  maze-like Level 11 packs more wall-adjacent corridors into less space, so
  the beast's wall-ignoring straight-line approach and the 23px wall-unaware
  catch radius both become more likely to be *observed* and *felt* — e.g.,
  the beast visually "flashing" through a nearby wall inside the enlarged
  light hole, or a catch registering while a thin wall visually separates
  player and beast. Existing mazes are spaced widely enough that this rarely
  surfaces; a deliberately narrow maze pushes corridor spacing toward — or
  past — the 23px catch radius, which existing wall thicknesses in the
  codebase (24-26px, e.g. index.html:611, 618-619) are close to. This is a
  concrete, maze-specific fairness risk worth naming explicitly (Section 9),
  not a new defect to fix in code — the smallest mitigation is level-authoring
  spacing discipline, not a new pathfinding or collision system.

### 3.7 Conventions and evidence — facts

- Probe briefs are numbered globally across the whole `artifacts/probes/`
  directory (not per-project); the highest existing number is `0010`
  (`0010-trail-of-embers-level-10-beast-errand-probe-brief.md`), making this
  brief `0011`.
- Probe brief 0010 establishes the house style this brief follows: a header
  block (ARTIFACT TYPE / AUTHORITY / STATUS / DATE / SOURCE-OF-TRUTH FILES
  TOUCHED / IMPLEMENTATION INCLUDED), a probe question with an explicit null
  hypothesis, proposed topology described in prose (no code), a player-beat
  walkthrough, failure cases, tuning guardrails, validation implications,
  playtest questions, kill signals, non-goals, and an implementation handoff
  section that describes but does not write the future implementation.
- The Level 10 playtest (`artifacts/playtests/0012-trail-of-embers-level-10-beast-errand-playtest.md`)
  recorded that Ian considered Level 10 good but warned the game "needs more
  added material or it will get stale quickly," that no deaths felt
  confusing or unfair, and that the Beast Gate "felt like luring the beast to
  operate the switch." No existing playtest evidence addresses a
  narrow/dense maze specifically, and no existing playtest evidence addresses
  a larger-than-`TORCH_RADIUS` *player* light (only the existing, temporary,
  ~1.82x ember light has been played).
- The untracked research artifact `trail-of-embers-post-level-10-growth-ideation.md`
  separately proposed and then **deferred** a related-but-distinct idea,
  "Dark Zones" (a per-region torch-radius modifier), flagging it as the
  weakest candidate in that investigation, "most at risk of being 'just make
  the screen darker.'" Ember Bloom is the inverse operation (a level-wide
  *increase*, not a regional decrease) and was not itself proposed or
  evaluated in that artifact. This brief does not modify, extend, or rely on
  that artifact's conclusions — it is cited here only as context for how a
  related light-radius idea was previously received.

---

## 4. Probe Hypothesis

**Main hypothesis:**

> Expanding the ember's visibility radius while narrowing and complicating
> the level geometry will create an empowering but still tense navigation
> experience, because the player receives more advance information while
> having less room to evade and fewer simple route choices.

**Plausible counter-hypotheses:**

- The larger light trivializes darkness — the maze reveals itself enough
  that "navigating in darkness" stops being the dominant feeling.
- The maze becomes tedious rather than tense — narrow corridors without
  enough beast pressure read as a chore, not a threat.
- Wall-adjacent corridors visually bleed together under the larger radius
  (Section 3.1/3.6), since light is unoccluded — the player sees light but
  not clear structure.
- The beast becomes unfair in narrow geometry — wall-ignoring movement and
  the wall-unaware catch radius (Section 3.5/3.6) surface more often at
  tight spacing, reading as "the beast came through the wall" rather than
  "I was caught."
- Difficulty comes mainly from memorizing turns rather than reading the
  space in the moment — the maze becomes a route-memorization exercise, the
  opposite of the intended "informed local decisions" feel.
- The upgrade feels numerically larger but experientially weak — the radius
  increase is real but doesn't change what the player *does* differently.

---

## 5. Ember Bloom Behaviour

The smallest useful mechanic expression, scoped to one principal variable:

- **Scope: level-local, not persistent.** Per Ian's framing ("the player
  receives an upgrade" for *the next level*) and the mission's preference for
  a level-local probe, Ember Bloom applies only within Level 11 and does not
  carry into other levels or across a restart — consistent with how
  `hasCinderCharge` is already reset per level/restart today
  (index.html:735, "no carryover between levels or across a restart, per
  design brief"). This requires no new persistence/save state.
- **Grant timing: at the start, not collected.** Unlike the Cinder Cache
  (which is picked up mid-level), Ian's framing describes the player
  "receiving" the upgrade as the premise of the level, not earning it through
  a detour. The brief's required structure (Section 6) still includes a short
  familiar-radius opening before the bloom activates, so the contrast is felt
  even though the grant is not optional or hidden.
- **Recommended initial radius multiplier: ~1.75x** applied to
  `TORCH_RADIUS` (85 → ~149px). This matches the manager's hypothesis and is
  additionally supported by repo evidence: 149px is within ~4% of the
  existing `EMBER_RADIUS` (155), a hole size the renderer has already proven
  out on every level since Level 1 (Section 3.1). Per the mission's
  quantitative clarification, 1.75x radius is ~3.06x area (149²/85² ≈ 3.07) —
  noticeable and area-significant without approaching, say, a 2x-radius
  (~4x-area) jump into unprecedented rendering territory. This is a
  starting value for the probe, not a final tuning decision.
- **Transition: instant, not animated.** A brief visual transition (e.g., a
  bloom/flare effect at grant) is tempting but adds a second variable (timing
  of a new animation) to a probe whose stated goal is isolating radius vs.
  geometry. Recommend instant radius change at grant, with the *event* of
  receiving it made readable through the immediate, unmistakable jump in
  visible area rather than through animation. This can be revisited later if
  the reveal reads as unclear (see kill signals, Section 13) — but the first
  probe should not spend budget on a transition effect.
- **No text explanation.** Consistent with the project's established
  no-tutorial-panel constraint (README non-goals; Section 10 below), the
  upgrade should be legible from the light itself, the same way every other
  mechanic in Trail of Embers has been taught through play.
- **Cinder Charge interaction: none, by default.** Section 3.1 confirms no
  existing coupling between the charge and radius. The initial probe should
  preserve that separation — Cinder Charge continues to affect only cooldown
  timing. If Level 11 includes a Cinder Cache at all, that is a separate,
  optional authoring choice (Section 10), not a required interaction with
  Ember Bloom.
- **Changed variable: radius only.** Not duration, not intensity, not
  falloff. The existing `punchHole` gradient (solid center, 0.75 falloff
  start, transparent edge — index.html:1508-1517) is reused unmodified with a
  different `r`. This keeps the probe isolated to the one variable Ian
  proposed.

---

## 6. Level Structure

A compact Level 11 structure with clear beats, described in prose only — no
coordinates, no code. Exact geometry is implementation work, not brief work.

### Familiar opening

A short opening section using the **current, un-bloomed** `TORCH_RADIUS`
(85px) so the player has a baseline before the upgrade. Should be brief —
long enough to register "this is the light I know," not long enough to feel
like a separate level.

### Upgrade reveal

Ember Bloom activates early, at a moment the player can't miss — ideally at
a point where the visible-area jump is immediately legible against a nearby
wall or corridor mouth that was previously invisible. No text; the light
itself carries the beat.

### Calibration space

A short, safe or lower-pressure section (beast far away or not yet active)
that demonstrates concretely what the improved light enables — for example:
seeing an intersection sooner, noticing a landmark through a nearby corridor
mouth, recognizing a dead end before committing to it, or spotting a beast
patrol path with more warning than before. This section exists to let the
player *feel* the upgrade's value before it is tested under pressure.

### Main maze

A narrow, compact, hand-authored maze (reusing the existing `obstacles[]`
rectangle format — Section 3.3) featuring: short corridors, turns, at least
one loop or reconnecting path, one or two meaningful (not punishing) dead
ends, a small number of recognizable landmarks, and limited backtracking.
The larger light radius should matter here specifically because corridor
segments and junctions are close enough together for the bloomed radius to
reveal more than one decision point at a time — the core test of "more
information, less space."

### Beast-pressure phase

The beast is introduced or intensified only after the player has had the
calibration beat to understand the new visibility — consistent with the
project's established pattern of a grace/orientation period before threat
escalates (e.g., `BEAST_IDLE_SECONDS`, index.html:75). The beast should
remain an active, moving threat throughout the maze, not a static hazard
or, per the L10 evidence (Section 3.7), a "switch" the player operates.

### Exit sequence

A readable final commitment or short chase to the safe zone that closes the
level using only the mechanics already introduced — no new rule appears in
the last beat.

---

## 7. Maze-Design Constraints

Level 11 should read as more maze-like than prior levels without becoming a
conventional paper maze. Constraints:

- **Compact, not enormous.** The point is decision density in a small
  footprint, not a bigger map — this is the opposite lever from every prior
  scale-up (Levels 4-6 grew the field; Level 11 should not).
- **Multiple readable local decisions, not one hidden correct route.** Each
  junction should be evaluable from what the (bloomed) light currently shows,
  not solvable only in hindsight.
- **Identifiable landmarks**, achieved through obstacle shape/placement as in
  existing levels (Section 3.3), not through new data types.
- **Limited forced backtracking.** Backtracking should occur from player
  choice or beast pressure, not from level structure alone.
- **No long stretches of featureless identical corridors** — repetition
  without differentiation is exactly the "content treadmill" risk already
  flagged in prior evidence (Section 3.7 / growth-ideation artifact).
- **No solution dependent on memorizing arbitrary turns.** If the only way to
  win is to have died enough times to memorize a sequence, the probe has
  failed regardless of how the light performed.
- **Route complexity should interact with beast pressure**, not exist
  independently of it — a maze the player could solve with the beast removed
  entirely is not testing the intended exchange.
- **The larger light should support informed choices** — its presence should
  visibly change what the player can decide, not just how far they can see
  decoratively.
- **Deaths should remain explainable**, matching the L10 evidence bar
  ("no deaths felt confusing or unfair," Section 3.7).

Intended experience, stated explicitly per the mission's framing:

> Navigating and surviving a dangerous space under incomplete information —
> not solving a static route puzzle after discovering the answer.

---

## 8. Light-Through-Walls Decision

Per Section 3.1, the existing light system reveals whatever falls inside a
light-hole's radius **regardless of walls between the light source and that
area** — this is unconditional and has been true since Level 1, not a new
choice for Level 11.

Assessment of this fact for the intended maze-reading experience:

- **It may help** the intended feel in small doses: seeing a warm hint of an
  adjacent corridor through a thin dividing wall can read as "sensing" the
  maze rather than fully seeing it, which is consistent with "eased somewhat
  by the larger visibility area" rather than "solved by it."
- **It risks confusion** in a genuinely narrow maze: if many wall-adjacent
  corridors fall inside the enlarged radius simultaneously, the player may
  see a wash of illuminated shapes without a clear read on which are
  connected, reachable routes and which are sealed-off neighboring corridors
  — exposing more raw light than route information.
- **It exposes route information** the player hasn't earned by navigating
  there, which could undercut the "more information, less space" framing if
  it reveals too much of the solution at a glance rather than rewarding
  careful movement.

**Recommendation: solve the first probe through level geometry and spacing,
not through a rendering change.** Concretely: author wall thickness and
inter-corridor spacing in Level 11 so that meaningful "bleed" reads as an
intentional sensing cue (e.g., a landmark glimpsed through a single thin
wall) rather than an accidental wash of unrelated corridors lighting up at
once. This avoids a broad rendering-system change (occlusion/raycasting)
for a first probe, keeps the change surface to level data only, and
preserves causal clarity by design rather than by new code.

**If full light occlusion turns out to be necessary**, this brief does not
fold that decision into the initial probe. It should be treated as a
**separate, later prerequisite decision** — made only after playtest
evidence shows that geometry/spacing alone cannot keep the maze readable,
because occlusion is a materially larger change (raycasting or a visibility
polygon against `level.obstacles`, replacing the current radius-only
`punchHole`) than anything else in this brief.

---

## 9. Beast Fairness

Per Section 3.5, the current beast:

- **Does not respect obstacles.** `moveToward` has no wall/collision logic at
  all (index.html:778-785); this is explicitly documented as deliberate
  (index.html:97-99), not a defect.
- **Can "attack" through walls in the sense that matters for this probe.**
  `checkWinLose`'s loss condition is pure distance
  (`dist(player, beast) < 23px`, index.html:1107) with no obstacle check —
  so a wall between player and beast does not, by itself, prevent a loss if
  raw distance closes to 23px.
- **Cannot become trapped**, by construction — since it never collides with
  geometry, there is no obstacle configuration in which it could get stuck.
- **Can approach from directions that look unreadable in a compact maze**,
  because its straight-line path toward the newest ember or the player's
  torch is drawn through walls exactly as it is drawn through open space.

**How this interacts with the proposed maze:** this behavior is not new to
Level 11 — it is present in every maze level today (4 through 10) — but
Section 3.6 explains why compactness makes it more likely to be *observed*
and to *feel* different: tighter corridor spacing increases the chance that
(a) the player visually catches the beast's light-hole silhouette moving
through a nearby wall, and (b) the 23px wall-unaware catch radius triggers
while a thin wall visually separates player and beast, which existing wall
thicknesses (24-26px) are close enough to for this to be plausible rather
than hypothetical.

**Does narrow-corridor geometry remove too much player agency?** Not
inherently — narrow corridors reduce lateral evasion options compared to
open chambers, which is the intended difficulty lever (Section 2), but this
becomes unfair specifically if the beast's wall-ignoring approach removes
the *reading* of danger direction that narrow corridors are supposed to
provide, or if the catch-through-wall scenario above becomes common.

**Does the larger light provide sufficient warning?** Untested — this is
part of what the probe should establish. The larger radius should, in
principle, give more advance notice of the beast entering the light hole
than the current 85px radius does, but because the beast is only ever lit
by falling inside a hole (Section 3.1), a larger hole means more warning
*only* in cases where the beast approaches from a direction the radius
covers earlier than before; it provides no warning at all for the
wall-ignoring "surprise from behind a nearby wall" case, since that case is
about proximity through geometry, not approach angle.

**Conclusion:** current beast behavior is **not incompatible** with the
proposed maze in principle, but the wall-unaware catch radius combined with
tight, sub-30px corridor spacing is a concrete, maze-specific fairness risk
that did not meaningfully surface in any wider existing level. This brief
separates the response into three tiers, as the mission requires:

- **Prerequisite defect correction (none identified as required).** No
  change to `moveToward` or `checkWinLose` is treated as a hard prerequisite
  for this probe. The wall-ignoring movement is a documented design choice,
  not a defect, and a wall-aware catch check would be a nontrivial scope
  expansion this brief does not recommend authorizing sight-unseen.
- **Probe-specific tuning (recommended).** Author Level 11's corridor
  spacing and wall thickness with the 23px catch radius explicitly in mind —
  keep meaningful wall separations comfortably larger than 23px wherever the
  beast could plausibly be on the far side of a wall the player is hugging.
  This is level-authoring discipline, not a code change, and is the smallest
  available mitigation.
- **Optional later beast improvement (explicitly deferred, not this
  probe).** If playtesting Level 11 shows frequent, specific "the beast got
  me through a wall" complaints despite careful spacing, a wall-aware catch
  check (and, separately, wall-aware movement) would be a bounded follow-up
  decision — not something to design or implement now. This is the same kind
  of change space the growth-ideation artifact's Beast Momentum/Hesitation
  candidates occupy (Section 3.7), and this brief does not fold that
  unrelated investigation into Ember Bloom's scope.

---

## 10. Mechanic Isolation

The initial probe keeps focus on exactly three things:

1. **Ember Bloom** — the expanded light radius.
2. **Compact, narrow maze geometry** — the spatial trade.
3. **Existing beast pressure** — the current 3-rule AI, unmodified.

The probe explicitly does **not** require, and should not include:

- Beast Gate
- Cinder Charge as a key (Cinder Charge, if present at all, keeps its
  existing optional-safety-net role only — see Section 5)
- One-Way Passages
- a new enemy
- a new resource
- moving walls
- new switches
- new traps
- any other new mechanic

An existing mechanic (e.g., a single Cinder Cache) may appear only if it is
necessary for continuity with the established level-progression pattern and
does not obscure the light-vs-geometry question this probe exists to answer.
If included, it should be optional and non-load-bearing, exactly as it was
in Level 10 (Section 3.7 — Ian completed Level 10 without collecting it).

---

## 11. Smallest Implementation Scope

This section describes what a later implementation prompt should probably
ask for. It is a bounded implementation *target*, not authorization to build
it now. This task did not touch any prototype code.

### Likely touched files (later, not now)

- **`prototypes/trail-of-embers/index.html`**
  - Promote `TORCH_RADIUS` usage from a single hardcoded constant to a
    runtime-resolvable value (e.g. a player-state field defaulting to
    `TORCH_RADIUS` and reassigned when the current level defines a bloom
    trigger), applied everywhere `TORCH_RADIUS` is currently read
    (index.html:1519, 1544, and the debug overlay).
  - Add a new Level 11 entry to the `LEVELS` array, using only the existing
    level-data shape (`obstacles[]`, `playerStart`, `beastStart`,
    `safeZone`, optional `fieldW`/`fieldH`, optional `beastSpeed`/
    `emberCooldownMs`/`emberLifetimeMs`, optional single `cinderCaches[]`
    entry if included per Section 10) plus one new field describing when/
    where Ember Bloom activates (e.g. a bloom-trigger position or an
    immediate-on-load flag, per Section 5's "granted at the start").
  - No new collision logic, no new rendering primitive — reuses the existing
    `punchHole` gradient mechanism with the new radius value.
- **`prototypes/trail-of-embers/validate-levels.js`**
  - A small, additive check for the new bloom field (e.g., bounds-check a
    trigger position, or confirm the multiplier is a sane positive number),
    in the same style as the existing Cinder Cache checks
    (index.html-equivalent pattern at validate-levels.js:257-269). No change
    to the reachability BFS logic itself is anticipated, since the validator
    has never modeled visibility (Section 3.4) and Level 11 introduces no
    new gating primitive.
- **`prototypes/trail-of-embers/README.md`**
  - Document Level 11 under "Level / challenge structure" in the same style
    as Levels 1-10, and add a "What changed in the Ember Bloom pass" section
    matching the file's existing per-pass changelog convention.

### Minimum new state

- One new runtime value for the player's current light radius (replacing
  direct reads of the `TORCH_RADIUS` constant), reset to the base value on
  level load/restart, matching how `hasCinderCharge` is already reset today.
- No new persistent/cross-level state, no new input handling, no new UI
  element beyond the existing HUD text pattern (if any bloom-status text is
  added at all — Section 5 recommends none).

### Explicit exclusions

- No skill tree, inventory, upgrade menu, or progression system (mission
  constraint).
- No occlusion/raycasting rendering change (Section 8) unless a later,
  separate decision determines it is required.
- No wall-aware beast movement or wall-aware catch-radius change (Section 9)
  unless a later, separate decision determines it is required.
- No new mechanics beyond Ember Bloom itself (Section 10).

---

## 12. Success Criteria

The probe should be considered promising if Ian reports that:

- Ember Bloom feels immediately powerful.
- The increased light meaningfully changes how routes are read, not just how
  much is visible.
- The maze is more demanding without becoming tedious.
- The player can make better-informed local decisions at junctions.
- Darkness still matters — the level does not feel fully lit.
- The beast remains threatening throughout.
- Narrow spaces create pressure rather than helplessness.
- Deaths remain expected and understandable.
- The level feels like a dangerous maze in darkness, not a conventional maze
  puzzle solved once and then repeated.

---

## 13. Kill Signals

- The light increase is barely noticeable.
- The larger light removes meaningful darkness — the level reads as "mostly
  lit."
- The player can see too much of the maze at once, undermining the
  more-information-less-space framing.
- Adjacent corridors become visually muddled from wall bleed-through
  (Section 8).
- Maze navigation devolves into repetitive backtracking.
- Difficulty comes mainly from getting lost, not from beast pressure.
- The beast attacks through walls or otherwise behaves unfairly in ways
  traceable to Section 9's identified risk (wall-unaware catch radius at
  tight spacing).
- Narrow corridors eliminate meaningful evasion entirely, turning the maze
  into a corridor-shaped instant-death funnel.
- The upgrade reveal moment is unclear — the player doesn't register that
  something changed.
- The level requires additional mechanics beyond Ember Bloom, geometry, and
  the existing beast to stay interesting.
- The probe cannot isolate whether the light or the geometry caused a given
  result — e.g., if every failure could equally be explained by either
  variable, the probe has not answered its question.

---

## 14. Playtest Questions

1. Did you understand that you received an upgrade, and when it happened?
2. Did the larger light feel immediately powerful, or did it take time to
   register?
3. Did the larger light change how you navigated — did you make different
   decisions than you would have with the old radius?
4. Was the maze readable? Could you tell what was a route, a dead end, or a
   sealed-off neighboring corridor?
5. Was the maze enjoyable to navigate, or did it feel tedious?
6. Did the beast remain threatening throughout, or did it fade into the
   background?
7. Where did tension peak?
8. Were your deaths fair? Could you explain what went wrong each time?
9. Did the light ever reveal confusing information through a wall — did you
   see something that turned out not to be reachable, or get surprised by
   the beast appearing to come through a wall?
10. Did the level feel like one coherent exchange (more light, less space),
    or like two separate things happening in the same level?
11. What is the single biggest change you'd make?

---

## 15. Open Questions

### Requiring Ian's taste judgment

- Whether the recommended ~1.75x radius (Section 5) is the right starting
  value, or whether the actual felt experience calls for something smaller
  or larger once played.
- Whether an instant reveal (no transition effect) is sufficiently legible,
  or whether the upgrade moment needs more visual weight than Section 5
  recommends for the first probe.
- Whether a single optional Cinder Cache belongs in Level 11 at all, or
  whether the level should be Ember Bloom + maze + beast with no other
  existing mechanic present (Section 10).

### Requiring implementation evidence

- Whether promoting `TORCH_RADIUS` to a runtime/per-level value (Section
  3.2, Section 11) surfaces any coupling this brief's read of the code
  missed.
- Whether the level-geometry approach to wall bleed-through (Section 8) is
  sufficient in practice, or whether it becomes clear only once real
  corridor spacing is tried at the ~149px radius.

### Requiring manual playtesting

- Whether the wall-unaware catch-radius risk named in Section 9 actually
  manifests at the corridor spacing Level 11 ends up using, and how often.
- Whether the maze reads as "dangerous space under incomplete information"
  or drifts toward "route-memorization puzzle" (Section 7) once played, not
  just as authored.

### Requiring technical verification

- A targeted verification of beast-wall interaction specifically at the
  tighter spacing this level proposes (Section 9) — confirming whether the
  existing wall-ignoring behavior, previously benign at wide spacing, changes
  qualitatively at narrow spacing.
- A targeted verification of light-through-wall behavior once real Level 11
  geometry exists (Section 8) — confirming whether bleed-through reads as
  intended "sensing" or as confusion.
- A possible later, narrowly-scoped Codex review of the implemented diff
  once Level 11 exists, focused specifically on the beast-wall and
  light-wall interactions above, rather than a general review. This brief
  does not assign that work — it only flags it as potentially useful once
  there is a diff to review.

---

END OF PROBE BRIEF
