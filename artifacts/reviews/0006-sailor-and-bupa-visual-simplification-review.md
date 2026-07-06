# Review: Sailor and Bupa: Go to the Beach — Visual Simplification Pass (0006)

ARTIFACT TYPE: Review
AUTHORITY: REVIEW
STATUS: Complete
CREATED BY: Fable (skeptical visual/design reviewer)
DATE: 2026-07-06
REVIEWS: visual-simplification pass in `prototypes/sailor-and-bupa-go-to-the-beach/index.html` and `README.md` (working tree vs commit 79dae25)
VISUAL BENCHMARK INSPECTED: `prototypes/trail-of-embers/index.html` (code read + headless render)
METHOD: Full code read; full `git diff` audit of the pass; headless-Chrome renders of the actual file — live opening frame, staged in-context scenes (Bupa investigating at a rock, Bupa in CHECK_BACK with meow chip, all five shell colors × all three shell shapes at realistic sizes) using the prototype's own state and draw functions, plus 8× zoom crops of Sailor, Bupa, and the shell rows. No source files were modified.
SOURCE-OF-TRUTH FILES TOUCHED: none

This review evaluates an exploratory prototype's visual pass only. It ratifies nothing and changes no source-of-truth or Trail of Embers files.

---

## 1. Verdict

**SMALL_VISUAL_FIX_BEFORE_AUDIT**

The answer to the review question is clear: **this became cleaner, plainer, and genuinely more Trail-of-Embers-like — it did not become underdesigned.** The beach now reads instantly as a beach out of flat fills, a sparse grain hint, and one blocky foam edge, which is exactly the restraint Trail of Embers models. Sailor finally reads as a small back-facing child with two distinct pigtail bunches. The pass is verifiably visual-only — every diff hunk sits in the drawing helpers, palettes, or comments; no line of `update()`, the state machine, `CONFIG`, controls, or scoring changed.

Two small things keep this from VISUAL_READY:

1. **The fan/scallop shell was simplified past the shell.** The curved fan top from the previous fix round became a straight edge, so a third of all shells (plus the rock-pile accents) now render as plain point-down triangles — they read as pennants/arrowheads, not scallops. This is the exact "shells should look like shells" note Ian has already given once; playtesting with it unfixed risks repeating that playtest.
2. **Bupa still isn't crisp — and this is Ian's twice-stated complaint.** The palette, chunk proportions, and poses are right, but at 8× zoom every sprite edge is a 2–3 tone anti-aliased blend, because sprites are drawn at fractional world coordinates with odd-numbered rect offsets through the half-res buffer (1 buffer px = 2 world px, so any odd coordinate lands on a half pixel and smears). Trail of Embers is crisp precisely because it snaps sprite origins to whole pixels on a fixed PX=3 lattice. At gameplay scale the cat reads *slightly mushy* rather than pixel-sharp — the residue of "still not pixel-y enough."

Both fixes are bounded, mechanical, and visual-only. Everything else should be left alone.

## 2. Does it match the Trail-of-Embers-but-beach-themed target?

**Yes — this is the closest the prototype has been to the target.** Benchmarked against Trail of Embers' actual rendering code (flat fills, 3–5 flat colors per figure, one shared blocky lattice, deliberately low-contrast calm texture, zero gradients in the world art):

| Trail of Embers trait | Beach pass now |
|---|---|
| Flat single-tone ground | ✔ Flat sand/wet-sand/water/dune fills |
| Calm, low-contrast texture only where it earns its place | ✔ 3-speckle and 2-speckle tiles at 64/56px pitch — a hint of grain, not a texture |
| Blocky, stepped edges instead of smooth curves | ✔ Shoreline foam is stepped 16px blocks; the old sine waves/bands/sparkles are gone |
| Few-tone sprites (player 5 colors, beast 3) | ✔ Sailor 6, Bupa 4 (+green eye) — in range |
| Hard integer-snapped pixel blocks | ✘ Sprites land on fractional buffer pixels and anti-alias (see §4.2) |
| All-rectangle drawing | Partial — shells/tidepool still use arcs/curves, but the half-res buffer steps them acceptably |

The one structural divergence that matters perceptually is the missing pixel snap; the curves are fine in practice (the tidepool and clam arcs come out pleasantly stair-stepped through the buffer).

## 3. Assessment against the review questions

| # | Question | Read |
|---|---|---|
| 1 | More TOE-like restraint? | **Yes, clearly** (see §2). |
| 2 | Sand/water pleasantly plain vs flat/unfinished? | **Pleasantly plain.** The darker sand base (`#e8d9ae`), foam edge, and dune band keep it from reading unfinished. The flat water strip is quiet but that is the correct TOE answer for decorative water. |
| 3 | Foam/dune/grain enough to imply beach without noise? | **Yes.** Opening frame reads "beach" in under a second. Speckle lattice regularity is faintly visible on a still frame but quiet; not noise. |
| 4 | Sailor = simple small back-facing child with prominent pigtails? | **Yes — verified at gameplay scale and 8× zoom.** The 4-world-px head-to-bunch gap survives the downscale; head and two bunches are distinct shapes. Nape skin sliver + dress still sell "back-facing kid." |
| 5 | Did removing gold hair ties improve the sprite? | **Yes.** At this resolution the ties were sub-legible clutter; the silhouette alone carries "pigtails" better. Nothing was lost. |
| 6 | Bupa chunky/pixel-y, mostly gray + little white? | **Palette and chunk: yes. Crispness: not quite.** Mostly gray, dark-gray legs/tail/ears, small white paws/chest, green eyes — correct. But edges are anti-aliased soft (§4.2), which is the surviving cause of "not pixel-y enough." |
| 7 | Shells still read as shells? | **Two of three.** Clam-arc: yes (dome + one growth ring reads clean). Spiral: passable (pointed teardrop reads as a small pickup; coil is faint but harmless). Fan/scallop: **no** — the straight top edge turned it into a plain triangle/pennant (§4.1). All five colors now pop against the darker sand — the earlier sand-toned-shell problem stays fixed. |
| 8 | Vegetation still useful or too sparse? | **Still useful.** Two-tone tufts + occasional dune plant decorate the dune band without competing. The fixed-x column repetition (750/772/792 every 120px) persists from before — visibly regular but low-stakes; not worth a fix round. |
| 9 | Cohesive at gameplay scale? | **Yes.** One palette family, one shadow rule, one buffer. The dark console DOM chrome (HUD/debug/restart) remains the only style outlier — pre-existing, out of this pass's scope, not blocking. |
| 10 | Did simplification damage gameplay readability? | **No — it improved it.** Shells contrast better than before; rock/driftwood/tidepool remain distinct at a glance; Bupa vs rock is now value-separated (warm dark `#6e6a5f` vs cool light `#808285`), so his posture tell survives rock stops. Minor: the cat standing on the rock's footprint clumps a little, but he stays findable. Meow chip is legible. |
| 11 | Any mechanics/controls/scoring/Bupa/scope change? | **No — verified by diff this time.** Every hunk of the 336-line diff is in the visual-helper/draw section: speckle tables, removed texture functions (`tileHash`, `drawTileShading`, `drawOceanBands`), shell/vegetation/interest-point/sprite drawing, and comments. `CONFIG`, `update()`, the state machine, collision, camera, scoring, HUD structure, and controls are untouched. The banned-vocabulary grep finds only internal `pauseTimer`/`meowTimer` and the README's own out-of-scope list. README changes accurately describe the pass. |

## 4. Exact small fixes (do these two things and nothing else)

### 4.1 Give the fan/scallop a blocky scalloped top edge
Keep the orientation (hinge/point at the bottom — that part is correct) and the flat fill + hinge wedge. Replace the single straight top edge with a stepped, blocky scallop edge — two or three crenellation steps in the path (pure `lineTo` steps, no curves), in the same spirit as the stepped shoreline foam. That one edge is the difference between "scallop" and "pennant." Do not reintroduce ridge-line fans, extra tones, or curves. This also fixes the two shell accents at the rock piles for free.

### 4.2 Snap sprites to the buffer lattice so blocks render crisp
Root cause: 1 buffer pixel = 2 world pixels, so any odd coordinate or fractional position lands on a half buffer pixel and anti-aliases into soft blends; nearest-neighbor upscaling then magnifies the mush. Fix, in `drawSailor`, `drawBupa`, and ideally `drawShellShape`:
- Snap the translate origin to the 2-world-px grid: `ctx.translate(Math.round(x / 2) * 2, Math.round(y / 2) * 2)`.
- Round the sprites' local `fillRect` offsets/sizes to even numbers (they are currently a mix of odd and even; each odd value is a smeared edge).
- Quantize the animation offsets to 2px steps: `walkOffset`, `pigtailSway`, `walkCycle`, and the tail-wag offset should snap to 0/±2/±4 rather than sliding continuously.

This is a mechanical, visual-only edit — no position, speed, hit radius, or state logic changes; only where the paint lands. It is the single highest-leverage remaining move for "pixel-y enough," and it is exactly what Trail of Embers does (`Math.round` origin snap onto the PX lattice).

**Optional, only if already touching the file (not blocking):** soften the live-HUD "Shells Missed" red `#c95c5c` to a neutral gray (carried over as optional from review 0005; still the only punitive-feeling signal in the game).

## 5. Strongest improvements (what made this pass work)

- **The texture deletion was the right call, executed with judgment.** Ocean bands, sparkles, wet-sand dapples, tile-checker shading — all gone; the retained trio (foam edge, sparse speckles, dune band) is enough to say "beach" and quiet enough to say "Trail of Embers."
- **Sailor's silhouette-first simplification.** Bigger plain bunches held clear of a smaller head beat the old detailed version at every scale tested. Removing the ties removed noise, not information.
- **Shell visibility stayed fixed while shells got plainer.** The darker sand base plus the culled color set keeps all five shell colors popping — the greed objects stay readable at a glance.
- **Bupa-vs-rock value separation survived the simplification.** The rock kept its warm dark tone, so the review-0005 fusion fix wasn't regressed.
- **Process hygiene is fixed:** the pass is a clean working-tree diff against a committed base (79dae25), so "no mechanics changed" was *verifiable* this time — and it verifies.

## 6. Remaining visual risks

1. **Fan-shell misread (§4.1)** — highest risk of a repeated playtest note.
2. **Sprite softness (§4.2)** — Ian has flagged pixel-y-ness twice; if he zooms in or plays on a large display, the soft edges are visible. In motion, continuous sub-pixel animation offsets also cause faint edge shimmer on Sailor's legs/pigtails and Bupa's legs.
3. **Speckle lattice regularity** — on large flat stretches the repeating 3-dot tile is faintly perceptible as a grid. Watch for it in playtest; do not preemptively add variation (more texture is the failure mode we just escaped).
4. **Dark console HUD/meow chip vs warm world** — the remaining style seam, pre-existing. If Ian remarks on it unprompted, a parchment-toned HUD is the natural next cosmetic pass; world art should not be touched for it.
5. **"Too plain" tail risk** — I judge the surfaces pleasantly plain, but if Ian's gut says empty, the correct dial is *one* more speckle per tile or a second foam row — single-step additions, never a return to banded/dappled texture.

## 7. Things Sonnet must NOT change if asked to revise

- **The half-res pixel buffer pipeline** (`PIXEL_SCALE`, nearest-neighbor blit). Still the foundation of the cohesion.
- **The plain-fill terrain direction.** Do not re-add ocean bands, sparkles, dapples, or tile shading in any form; do not densify the speckle tables.
- **The new sand base `#e8d9ae` and the current five shell colors** — this pairing is what keeps shells visible.
- **Sailor's proportions, the 4-world-px pigtail gaps, and the no-ties decision.** Fix 4.2 rounds coordinates; it must not shrink the bunch-to-head gaps below 4 world px.
- **Bupa's palette, poses, and the check-back sit** — still the best sprite in the game; 4.2 only sharpens edges.
- **The blocky shoreline foam** as-is.
- **Any tuning constant or mechanic:** `CONFIG` values, state machine, 10 stops, forfeit rule, controls, session structure, HUD contents.
- **The README's out-of-scope list and the probe question.**
- Nothing from the banned list comes back: hearts/health, countdowns, labeled comfort meter, shell rarities, tide movement.

## 8. Ready for mechanical/scope audit?

**Yes — the audit can start now; it does not depend on rendering.** The audit's subject (state machine, tuning constants, scope adherence, scarcity/forfeit correctness) is unchanged by the two pending fixes, and this pass's diff demonstrates the visual/mechanical separation is being respected. Recommended sequencing:

1. Run the mechanical/scope audit against the current working tree (or better, after committing this pass so the audit has a stable ref).
2. Apply fixes 4.1 and 4.2 in parallel or after.
3. **Ian's playtest waits for the two fixes** — playtesting before them risks burning the session on two already-known notes (triangle shells, soft cat).

## 9. Ian playtest signals to watch for (after fixes)

- **Shell naming test:** point at the beach, ask "what are those?" — "shells" without hesitation is the pass; "little flags/triangles/candy?" means 4.1 needs another step (or the spiral needs its turn).
- **Pixel-y test:** does Ian spontaneously say the cat looks right now? If "still fuzzy," check whether 4.2 quantized the *animation offsets*, not just the origins — motion shimmer reads as fuzz even when still frames are crisp.
- **Too-plain test:** listen for "empty/unfinished" vs "clean/calm." Only the single-step additions from §6.5 are on the table if it's the former.
- **Speckle grid:** while walking long stretches, does the sand pattern read as a repeating grid? Note it; don't fix preemptively.
- **Rock stops:** can Ian still instantly say what Bupa is doing when he investigates a rock? The value separation should hold; if his eye loses the cat, the cat may need to stop 10–15px short of the point (behavioral nudge — needs its own sign-off, not part of a visual pass).
- **Meow chip tone:** during the check-back — the game's key emotional beat — does the dark chip read as Bupa speaking or as debug UI? If it grates, the parchment-chip variant is the follow-up, together with the HUD seam (§6.4).
- **Whole-scene gut check:** "Trail of Embers at the beach?" asked directly. That was the brief; Ian's one-line answer to it is worth more than this whole review.

## 10. Decision block

- [ ] Apply fixes 4.1 + 4.2, commit, then playtest; run mechanical/scope audit in parallel
- [ ] Override: playtest as-is
- [ ] Send back for broader visual revision
- [ ] Park
