# Probe Brief: Sailor and Bupa — Whimsical-Life Pass

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — Human-gated probe input
CREATED BY: Fable (skeptical design/specification reviewer)
REVIEWED BY: not yet reviewed
DATE: 2026-07-06
RELATED TASK: Sailor and Bupa: Go to the Beach — whimsical-life pass (post-playtest-0010 direction)
SOURCE-OF-TRUTH FILES TOUCHED: none

This brief documents a direction for an exploratory prototype only. It is not a replacement for *Trail of Embers*, does not update `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, or `BALANCE_NOTES.md`, and is not a ratified final game.

---

## 1. Metadata

- **Prototype:** Sailor and Bupa: Go to the Beach (`prototypes/sailor-and-bupa-go-to-the-beach/`)
- **Brief type:** Bounded design brief for the next prototype pass — a **whimsical-life pass** (Bupa personality + living beach motion + a small dose of whimsical surprise). Design/specification only; no implementation in this artifact.
- **Date:** 2026-07-06
- **Source evidence:**
  - `artifacts/playtests/0010-sailor-and-bupa-first-controller-playtest.md` (playtest 0010 — the DIRECTION_SHIFT verdict this brief responds to)
  - `prototypes/sailor-and-bupa-go-to-the-beach/README.md` (current probe question, mechanics, out-of-scope list)
  - `prototypes/sailor-and-bupa-go-to-the-beach/index.html` (current build: CONFIG, Bupa state machine, drawing pipeline)
  - `artifacts/reviews/0007-sailor-and-bupa-post-fix-visual-review.md` (visual baseline, "things not to change" list)
  - `artifacts/reviews/0008-sailor-and-bupa-controller-support-audit.md` (controller support state)

## 2. Current playtest diagnosis

Playtest 0010 redirected the design question. The diagnosis this brief inherits, stated plainly:

- **Low pressure is not the problem.** Ian explicitly flagged that the lack of pressure is "not necessarily bad." The calm walk-the-beach loop is a live design space. Nothing in this pass should add pressure to compensate for anything.
- **The actual problem is lack of personality, whimsy, motion, and environmental charm.** "Quite empty" decomposes (per playtest §10) into personality depth (Bupa isn't yet a *cat*), environmental depth (nothing lives on the beach), and presentation depth (static trees, inert water) — not mechanical depth. Bupa's wander/pause skeleton reads as intentional ("kind of feels like a cat with an agenda, but not really"); it lacks flesh, not structure.
- **Shell greed did not land as the central philosophy.** The scarcity/forfeit rule produced no "one more shell" tension, and Ian's read is that greed may simply not be what this game is about. This pass does not touch the shell economy in either direction — the forfeit rule stays in the build, un-invested-in. Do not tune it, sharpen it, or remove it.

A skeptical note on the diagnosis itself: it rests on one playtest by one player. That is exactly why the right response is a *bounded* aliveness pass that tests the whimsy hypothesis cheaply, not a wholesale re-theming.

## 3. Design goal for the next pass

**Make the prototype feel more alive and whimsical, at the same low pressure, with Bupa as the centerpiece.**

Concretely:

- The beach should idle pleasantly — standing still and watching should be rewarded.
- Bupa should feel more like a real cat: affectionate, annoying, curious, distractible, agenda-driven, and gently funny. The target sensation (Ian's framing): staying near Bupa should feel like a combination of affectionate and annoying.
- Nothing added may punish, threaten, time-limit, or fail the player. Every new element is charming, optional, and consequence-free.
- The pass is judged on *feel*, not feature count. Three behaviors that land beat seven that don't. The follow-up playtest asks one question: **"Does Sailor and Bupa feel alive and charming now, or still empty?"**

## 4. Proposed bounded changes

Candidates in three buckets. These are menus, not mandates — §5 picks the minimal pass. Everything here is behavior/animation/draw-layer work; nothing adds a lose condition or a new player-facing system.

### A. Bupa personality behaviors

All of these leave the state machine's *purpose* (TROTTING → INVESTIGATING → CHECK_BACK) intact. None adds rescue, trouble, or fail states — rescue stays deferred.

1. **Per-interest-point investigate performances** *(highest charm-per-effort — recommended)*. Currently every pause runs the same three-posture cycle (sniff → sit → alert) regardless of what Bupa is looking at. Give each interest-point type a distinct middle-stage performance: batting a paw at the tidepool water, scratching or rubbing against the driftwood, nosing under the rock pile. Draw-layer only — the timing cycle, `stateProgress` thresholds, and pause durations are untouched; only what he *does* during the middle 40% changes per `target.type`. This directly converts the existing "readable tells" system into character acting.
2. **Idle-affection payoff** *(recommended)*. If Sailor stands still near Bupa for a couple of seconds, something small and warm happens: a slow blink, a tail curl around the feet, a brief content squint. Read-only proximity + stillness check feeding a draw state; no state-machine transition. This is the cheapest possible test of whether "watch and care" can be earned through observation alone.
3. **Reunion "mrrp"** *(recommended, tiny)*. When Sailor re-enters the reassure radius and Bupa leaves CHECK_BACK, flash a small happy chip ("mrrp!" or a heart-adjacent glyph in the existing plain-chip style) for ~1s. Reuses the meow-chip machinery; turns the existing check-back loop from one-way worry into a two-way exchange. Keep it in the established chip style — no gold borders, no new UI vocabulary.
4. **Universal idle motion** *(recommended as part of any pick)*. Bupa's tail is static except in the stage-3 wag. Give him a slow, quantized tail sway and an occasional ear flick across all stationary states. Two-pixel steps, matching his even-rect grid (review 0007 §8 protects his grid — this animates within it, adding no new tones or proportions).
5. **Distraction detour** *(candidate — not recommended this pass)*. Mid-trot, Bupa occasionally veers to a glint/bug, pauses briefly, resumes. Charming on paper, but it is the one personality candidate that touches pathing (a temporary sub-target inside TROTTING) and interacts with the comfort-radius check. That makes it the riskiest item in the bucket. Defer it; if the cheap items land, it is the natural next probe.
6. **Sitting on a shell** *(candidate — not recommended this pass)*. Bupa sits on a shell Sailor is heading for — very cat, very funny, but done honestly it changes collection rules (is the shell collectible under him?), and done dishonestly (collectible anyway) the joke deflates. Shell-interaction rules are on the untouchable list (§7), so park it.

### B. Living beach motion

Playtest 0010 §9 sanctions exactly two environmental targets — static vegetation and the plain flat water — while keeping review 0007's protections on everything else (pipeline, palette, sand tone, sprite designs, blocky foam edge as a *style*).

1. **Vegetation sway** *(recommended)*. Animate the existing grass tufts and dune plants: blades lean by quantized 2px offsets on a slow sine, phase-offset by row so the dune line ripples rather than metronomes. Animate what's there — same two tones, same blade counts, no redraw. This is "trees need motion" answered at minimum cost.
2. **Layered animated water** *(recommended)*. The water is one flat fill plus the animated foam edge. Add motion through clever pixel art, not density: a second, sparser foam line a few pixels into the water that drifts on its own slower phase; occasional short-lived foam flecks (2–4px white dashes) that appear, drift shoreward a few pixels, and fade; a rare glint pixel on the open water. All quantized to the pixel grid. **Hard constraint:** the waterline boundary (x=150) does not move — moving tide stays out of scope; this is decorative life on a fixed shoreline. And none of the banned texture vocabulary returns: no banded waves, no speckle fields, no tile shading.
3. **Tidepool shimmer** *(optional garnish)*. One blinking highlight pixel or a slow single-tone inner crescent on the tidepool circle. Doubles as the bounded fix review 0007 §5.3 already prescribed if the tidepool reads as "blue dot." Include only if trivially cheap during the water work.

The test for every motion item: **a few pixels that move beat many pixels that don't.** If a motion idea requires new tones, new textures, or higher density, it's the wrong idea. The restrained "Trail of Embers but beach-themed" baseline is the canvas, not the casualty.

### C. Whimsical surprises

One or two kinds only — enough to test the category, not populate the beach. Charming, optional, non-punishing, non-interactive (no collision, no reward, no penalty; they cannot be caught, scored, or missed in any tracked way).

1. **A decorative crab** *(recommended)*. Rarely, near a rock pile or the foam line, a tiny crab pops out, scuttles a short distance in the chunky few-tone sprite style, and vanishes into the sand. Purely ambient: no hitbox, no interaction with Sailor, Bupa, shells, or scoring. **Scope note:** the README's out-of-scope list bans "hazards, crabs, gulls" — that entry reads as banning crabs *as hazards*. Ian's whimsy direction supersedes for the decorative case, but the implementation pass must amend that README line to say so explicitly (e.g. "hazards of any kind; ambient critters are decorative only"), so the out-of-scope list stays honest.
2. **Shell sparkle** *(recommended, tiny)*. Rarely, a random uncollected on-screen shell emits a brief 2–3 pixel glint. No rarity tier, no score difference, no tracking — pure "ooh" (playtest §8 explicitly keeps shell *rarities* out of scope; this is a moment, not a tier).
3. **Bupa stares at something invisible** *(alternate — swap for either of the above)*. During an investigate pause, Bupa occasionally locks eyes on empty air, tracks it briefly, loses interest. Free-floating cat comedy, near-zero cost, and it lives in the personality bucket's draw work. A fine substitute if the crab proves too expensive.
4. Not this pass: gull footprints trails, washed-up objects, multiple critter species, anything Bupa *chases* (that's the distraction detour, deferred).

## 5. Strong recommendation

**One bounded whimsical-life pass, composed of:**

- **A: Bupa personality** — items A1 (per-interest-point investigate performances), A2 (idle-affection payoff), A3 (reunion mrrp), A4 (universal tail/ear idle motion).
- **B: Living beach motion** — items B1 (vegetation sway) and B2 (layered animated water), with B3 (tidepool shimmer) only if free.
- **C: Whimsy** — items C1 (decorative crab) and C2 (shell sparkle).

Why this shape: every selected item is draw-layer or read-only-check work against systems that already exist — the investigate cycle, the meow chip, the proximity radii, the vegetation and foam renderers. Nothing selected modifies a state-machine transition, a pathing decision, a collision rule, or a number in `CONFIG`. That is what keeps this implementable as **one bounded model task** on a self-contained HTML/canvas file, and fully reversible.

Priority order if the implementer must cut for scope: **A1 and A4 first** (Bupa acting like a cat is the central design problem and the fastest visible personality win), then **B1** (the most-named liveliness gap), then **B2**, then **C2**, then **A2/A3**, then **C1** (the crab is the most expensive single item — a new sprite plus spawn logic — and the first thing to drop). Cut from the bottom; do not thin every item evenly.

Explicitly rejected for this pass: distraction detours (A5), shell-sitting (A6), and any surprise requiring interaction — each either touches protected systems or risks turning whimsy into mechanics.

## 6. Things to avoid

- **No fail states** of any kind.
- **No health/hearts/lives.**
- **No tide hazard** — the waterline does not move, water touches nothing.
- **No rescue system yet** — the check-back sit remains the only "cat needs you" beat.
- **No shell economy redesign** — forfeit rule, spawn counts, and collection radius stay exactly as they are.
- **No score overhaul** — HUD counts and end-screen totals unchanged.
- **No menus** — no pause menu, settings, or new overlays.
- **No source-of-truth edits.**
- **No broad refactor** — additive helpers and small localized edits, not restructuring.
- Also, carried from reviews 0007/0008: no return of banned texture vocabulary (banded waves, dense speckle fields, tile shading), no changes to Bupa's palette/proportions/even-rect grid or Sailor's silhouette, no new tones on protected sprites, no controller/input changes.

## 7. Implementation boundaries

**Likely allowed files (exhaustive):**

- `prototypes/sailor-and-bupa-go-to-the-beach/index.html` — the pass itself.
- `prototypes/sailor-and-bupa-go-to-the-beach/README.md` — document the whimsical-life additions and make the §4.C1 out-of-scope clarification. Nothing else.

**Code areas that should be touched:**

- `drawBupa()` — new per-type investigate poses (branching on the current target's `type` within the existing `stateProgress` stages), idle tail/ear motion, slow-blink/affection frames.
- The meow-chip block inside `drawBupa()` — the reunion mrrp reuses this pattern (a parallel happy-chip timer set where CHECK_BACK exits).
- `drawGrassTuft()` / `drawDunePlant()` — time-based quantized sway offsets (these helpers already take position/variant; add a phase input or derive it from position).
- `drawShoreFoam()` and the water fill in `draw()` — second foam line, drifting flecks, glints.
- `drawInterestPoint()` — tidepool shimmer, if included.
- New, self-contained additions: an ambient-critter spawner/renderer for the crab and a sparkle picker for shells — new functions plus a small ambient-state array, modeled on the existing `particles` pattern.
- `update(dt)` — *only* minimal additions: ticking ambient/whimsy timers and the read-only "Sailor still and near Bupa" check. No changes to existing movement, state-transition, collection, or camera lines.

**Systems that must remain untouched:**

- `CONFIG` — no edits to existing values. If new tuning constants are genuinely needed, add them as new named constants (or a separate `WHIMSY` block) rather than altering anything existing; prefer literals local to the new code.
- Scoring, HUD counts, end-screen totals.
- Shell collection rules — collision radius, forfeit-on-scroll, spawn generation in `generateLevel()`.
- Bupa pathing fundamentals — target selection, TROTTING/INVESTIGATING/CHECK_BACK transitions, comfort/reassure radii, pause-duration logic.
- Camera behavior — lerp, offset, clamp.
- Controls and controller support — keyboard mapping, gamepad polling, deadzone, restart handling (audit 0008's implementation stays byte-identical).
- The rendering pipeline — `PIXEL_SCALE`, the shared half-res buffer, nearest-neighbor blit.
- Review 0007 §8's protected visual list, except where playtest 0010 explicitly sanctioned motion (vegetation, water appearance).

## 8. Review criteria for the next pass

How Fable should judge the implementation, in review order:

1. **Scope discipline (gate — check first).** Diff confined to the two allowed files. `CONFIG` values, `update()`'s existing logic, state transitions, collection, camera, and input byte-identical or provably equivalent. No fail states, no interactivity on ambient elements, no banned vocabulary (grep: hearts, health, timer-as-mechanic, tide movement, rarity). If this gate fails, the review stops there.
2. **Bupa personality.** Do the investigate performances read as *different actions* at gameplay scale (batting ≠ scratching ≠ sniffing), not just different rectangles? Does the idle-affection payoff trigger reliably when deliberately sought and read as warm? Does the mrrp land as a moment? Does Bupa ever hold a pose that makes the reviewer smile? The bar is "a cat doing cat things," not animation polish.
3. **Whimsy.** Are the surprises rare enough to surprise (roughly: not more than one ambient event on screen at a time, minutes not seconds between crab appearances) and brief enough not to demand attention? Do they read as charming and ignorable — never as a prompt, target, or missed opportunity?
4. **Living beach motion.** With Sailor standing still for 30 seconds, does the scene visibly idle — grass leaning, foam drifting, occasional fleck — without any single element looping obviously? Does the waterline stay fixed?
5. **Readability.** Shell visibility against sand unharmed; Bupa's tells (three-stage cycle timing, check-back sit, meow chip) still legible; ambient motion never plausibly mistaken for a collectible or an interest point; motion quantized to the pixel grid (no smooth sub-pixel drift breaking the chunky look).
6. **Restraint.** The scene still reads as "Trail of Embers but beach-themed" — plain fills, sparse detail. If a screenshot looks busier than the current build rather than merely more alive in motion, the pass overshot.

## 9. Playtest questions after implementation

For Ian, after playing the updated build (controller, per playtest 0010):

1. **The headline question:** does it feel alive and charming now, or still empty?
2. Does Bupa feel more like a real cat — and specifically, does staying near him feel at all like the affectionate/annoying mix you described?
3. Which single Bupa behavior landed best, and did any read as random or mechanical rather than intentional?
4. Did you ever stop moving just to watch something (Bupa, the water, the grass)? Did standing still feel rewarded?
5. Did the surprises (crab, shell sparkle) delight, go unnoticed, or annoy? Did you ever feel prompted to *do* something about them?
6. Does the beach now move enough, or is motion still the gap? Anywhere it tipped into busy?
7. With the whimsy in, how do shells feel — pleasant to gather, ignorable, or still asking "what are these for"?
8. What's the strongest remaining source of emptiness, if any — and is it something missing from the world, from Bupa, or from what you *do*?

## 10. Source-of-truth status

This is a **prototype direction brief only**. It specifies a bounded exploratory pass on one prototype and ratifies nothing about the game, the shell philosophy, or the low-pressure direction.

Do not update, and this artifact does not update:

- `GAME_TRUTH.md` — untouched
- `DESIGN_PRINCIPLES.md` — untouched
- `MECHANICS.md` — untouched
- `DECISION_LOG.md` — untouched
- `PLAYTEST_LOG.md` — untouched
- `BALANCE_NOTES.md` — untouched

If the whimsical-life pass and its playtest validate the low-pressure companion direction, ratification is a later, separate decision — not part of this pass.
