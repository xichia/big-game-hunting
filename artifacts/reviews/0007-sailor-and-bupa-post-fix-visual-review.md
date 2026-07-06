# Review: Sailor and Bupa: Go to the Beach — Post-Fix Visual Review (0007)

ARTIFACT TYPE: Review
AUTHORITY: REVIEW
STATUS: Complete
CREATED BY: Fable (skeptical visual/design reviewer)
DATE: 2026-07-06
REVIEWS: final working-tree visual state of `prototypes/sailor-and-bupa-go-to-the-beach/index.html` and `README.md` (simplification pass + follow-up fixes, vs committed base 79dae25) after review 0006
VISUAL BENCHMARK INSPECTED: `prototypes/trail-of-embers/index.html` (code read)
METHOD: Full code read; full `git diff` audit; banned-vocabulary grep; headless-Chrome renders of the actual file — live opening frame, staged scenes (all three shell shapes × all five colors at sizes 7 and 11, Bupa CHECK_BACK with meow chip, INVESTIGATING stages, walking Sailor), 8× zoom crops of Sailor, Bupa, and shells, plus a deliberate fractional-camera render to test crispness under realistic scroll conditions. No source files were modified.
SOURCE-OF-TRUTH FILES TOUCHED: none

This review evaluates an exploratory prototype's visual state only. It ratifies nothing and changes no source-of-truth or Trail of Embers files.

---

## 1. Verdict

**VISUAL_READY_FOR_PLAYTEST**

The two review-0006 blockers are resolved in substance, Ian's two direct requests (shorter pigtails, unified sand) are satisfied, and the whole prototype now sits squarely on the "Trail of Embers, except beach-themed" target: flat fills, one blocky foam edge, sparse grain, chunky few-tone sprites, one shared pixel buffer. The pass is verifiably visual-only — every diff hunk is in drawing helpers, palettes, or comments; `CONFIG`, `update()`, the state machine, camera logic, collision, scoring, and controls are byte-identical to the committed base.

One prescribed sub-fix was not fully executed — Sailor did not get the lattice snap that review 0006's §4.2 asked for alongside Bupa's — and I found a structural reason full Trail-of-Embers crispness is unreachable here anyway (the scrolling camera translates by a fractional amount; Trail of Embers is crisp partly because it has *no* camera). At gameplay scale neither is visible enough to justify delaying the playtest a third time. Playtest now; the residuals below are watch items with prescribed bounded fixes if Ian flags them.

## 2. Were the prior Fable blockers (review 0006 §4) resolved?

**4.1 Fan/scallop crenellation — RESOLVED.** The straight top edge was replaced with a symmetric three-lobe stepped crenellation built from pure `lineTo` steps (no curves), keeping the hinge-at-bottom orientation, flat fill, and a single hinge shadow wedge. Rendered evidence: at size 11 the fan unambiguously reads as a scallop at gameplay scale — the stepped crown is clearly visible. At the minimum size 7 the steps (0.2×s ≈ 1.4 world px ≈ 0.7 buffer px) partially smear through the half-res buffer, so small fans still lean triangular, but they read as "small version of that scallop next to them" in context, and the rock-pile fan accents (size 4) are background garnish. The shell field as a whole now passes the "what are those?" → "shells" test: clams read as domes, spirals as small coiled teardrops, fans as scallops.

**4.2 Sprite lattice snap — RESOLVED FOR BUPA, NOT DONE FOR SAILOR.**
- **Bupa: done and verified.** Origin snapped (`Math.round(bupa.x / 2) * 2`), every rect offset/size now even, walk cycle quantized to {−2, 0, +2}, tail wag to {0, 2}. At 8× zoom with an even camera offset, Bupa renders with hard pixel edges — ears, legs, eyes are crisp blocks. This was Ian's twice-stated "not pixel-y enough" complaint, and it centered on the cat; the cat is fixed. The check-back sit with the plain meow chip remains the best sprite moment in the game.
- **Sailor: not touched.** Her translate is unsnapped, her rects mix odd and even offsets (−9, −13, heights 5 and 3, etc.), and `walkOffset`/`pigtailSway` remain continuous sine values. At 8× zoom her edges are visibly softer than Bupa's, and her feet blur slightly mid-stride. At gameplay scale she reads acceptably chunky and the difference is hard to see — which is why this doesn't block — but the crisp-cat/soft-girl inconsistency is now *detectable* precisely because Bupa got fixed.
- **New finding — the camera limits crispness for everything:** `draw()` translates by `-cameraY`, a lerped float, so all sprites land on fractional buffer pixels whenever the camera is mid-scroll, and even at rest (the lerp converges to `bupa.y − 360`, an arbitrary float). A deliberate fractional-camera render confirms mild uniform softening of even the snapped Bupa. Trail of Embers avoids this by having no camera at all. Because Bupa's rects are now internally consistent, the softening is uniform (a slight global blur) rather than the old mixed-edge mush — a real improvement — but pixel-perfect stillness is structurally out of reach without also snapping the camera translate.

## 3. Were Ian's requests satisfied?

**Pigtails shortened ~50% — YES, and it improved the sprite.** The bunches went from three stacked rects spanning 24 world px (y −30..−6) to two rects spanning 11 px (y −28..−17) plus a small shadow — a 54% reduction. The head block also slimmed from 22 to 18 px wide, and the 4-world-px head-to-bunch gap that survives the downscale is preserved (verified in code: bunch edge at −13 vs head edge at −9). Rendered at gameplay scale and 8×: she still reads instantly as a small back-facing child with two distinct hair bunches. The shorter bunches sit at head height and read as *pigtail bunches* rather than draped hair — readability was not reduced; if anything the silhouette is cleaner and more kid-like.

**Unified sand — YES, cleaner and more Trail-of-Embers-like.** The 70px wet-sand band (separate fill, tile shading, dapple speckles) is gone; one sand tone `#e8d9ae` with one sparse 3-speckle tile now runs from foam edge to dune band. The beach reads as one calm surface with three honest zones: water, sand, dune. It is pleasantly plain, not flat-unfinished — the blocky foam edge and dune band carry enough structure, exactly the Trail-of-Embers answer. Losing the wet band costs nothing legible: the foam still marks the water boundary, and shells near the shoreline sit on the same readable sand as everywhere else.

**Wet-sand references purged — YES.** Comments now say "the shoreline"; the tidepool's wet-sand ring and ripple ring are gone (plain water circle remains); the banned-vocabulary grep finds no "wet sand" anywhere, "tide" only inside "tidepool" (a static feature) and the README's own out-of-scope line explicitly *excluding* tide movement, and "timer" only as internal `pauseTimer`/`meowTimer`. Nothing in the visuals implies a tide or wetness mechanic.

## 4. Answers to the review questions

| # | Question | Answer |
|---|---|---|
| 1 | Fan/scallop reads as a shell? | **Yes** at typical/large sizes; smallest fans lean triangular but read as shells in context (§2). |
| 2 | Bupa crisp, chunky, pixel-y? | **Yes** — verified crisp at 8×; only the camera's fractional translate softens him slightly in motion (§2). |
| 3 | Sailor still a back-facing child with distinct pigtails? | **Yes** — verified at gameplay scale and 8×; gap preserved. |
| 4 | Did shortening improve or hurt? | **Improved.** Cleaner, more kid-like silhouette; nothing lost. |
| 5 | Unified sand cleaner / more TOE-like? | **Yes** (§3). |
| 6 | Beach too flat or pleasantly plain? | **Pleasantly plain.** Foam edge + dune band + sparse speckles keep it from reading unfinished. |
| 7 | Tidepools still read as interest points without implying a mechanic? | **Yes, with a watch item.** The plain blue circle reads as a small pool of water; the orange • marker and Bupa stopping at it carry the "interest point" role. No wetness/tide implication remains. Watch whether Ian reads it as "tidepool" or "blue dot" — if the latter, one blocky inner-shadow crescent (single tone, no ring) is the bounded fix. |
| 8 | Cohesive at gameplay scale? | **Yes.** One palette family, one shadow rule, one buffer. The dark console DOM chrome (HUD/debug/restart) remains the only style outlier — pre-existing, known, not blocking. |
| 9 | Did visual changes harm gameplay readability? | **No.** All five shell colors still pop against the unified sand; rock/driftwood/tidepool remain distinct at a glance; Bupa-vs-rock value separation (warm dark `#6e6a5f` vs cool light `#808285`) is intact; meow chip is legible. |
| 10 | Any mechanics/controls/scoring/Bupa/shell/camera/scope change? | **No — verified by full diff.** Every hunk is in visual helpers, palettes, or comments. Bupa's snap is draw-only (`bupa.x`/`bupa.y` state untouched). README changes only rewrite the Visual Pass section, accurately; the out-of-scope list is intact. Grep for banned mechanic vocabulary is clean. |

## 5. Remaining visual risks (watch, don't pre-fix)

1. **Sailor's missing lattice snap** — the unfinished half of 0006 §4.2. Visible mainly at zoom; at gameplay scale she reads fine. If Ian says *Sailor* looks fuzzy, the bounded fix is: snap her translate to the 2px grid, even out her rect offsets/sizes, quantize `walkOffset`/`pigtailSway` to 2px steps — **and** snap the camera translate (`ctx.translate(0, -Math.round(cameraY / 2) * 2)` in `draw()`, a draw-only change; camera *logic* stays untouched) or the snap won't fully land. Do all of it or none of it.
2. **Small fans (size ≈7) still lean triangular.** If the shell-naming test fails on small fans specifically, deepen the crenellation (0.2×s → 0.3×s) or raise the fan's minimum size — one knob, not a redesign.
3. **Tidepool = plain circle** — see §4 Q7.
4. **Speckle grid regularity** on long walks — carried over from 0006; note it in playtest, don't preemptively add texture.
5. **Dark console HUD/meow-chip vs warm world** — the remaining style seam, pre-existing. Parchment-toned HUD is the natural next cosmetic pass *only if Ian raises it*.
6. Housekeeping (comment rot only, zero visual impact): the `SHELL_COLORS` comment still cites the old sand tone `#f0e3c5` (now `#e8d9ae`). Fix whenever the file is next touched anyway.

## 6. Mechanical/scope concerns

**None.** The diff is confined to drawing code and comments; no banned vocabulary or mechanic crept in; the README's Visual Pass section accurately describes what changed and explicitly reaffirms "no mechanics changed." The forfeit rule, 10 stops, comfort/reassure radii, camera lerp, and controls are untouched. One neutral observation: `INTEREST_POINT_TYPES` colors are now unused by the draw code — dead data, not a scope issue.

## 7. Should Ian playtest now?

**Yes — playtest now.** The two blockers that justified deferring the last playtest are resolved at gameplay scale, both of Ian's direct requests landed, and the remaining residuals are (a) invisible or marginal at play distance and (b) each has a bounded, prescribed fix if playtest surfaces them. A third pre-playtest fix round would be polishing a prototype past the fidelity its own questions need. Watch signals during playtest (carried from 0006 §9, still current): the shell-naming test, the "does the cat look right now?" test, plain-vs-empty gut check, speckle grid, rock-stop readability, meow-chip tone, and the direct "Trail of Embers at the beach?" question.

## 8. Things NOT to change next

- **The half-res pixel buffer pipeline** (`PIXEL_SCALE`, nearest-neighbor blit).
- **The plain-fill terrain direction** — no re-adding bands, dapples, tile shading, wet-sand zones, or denser speckles.
- **Sand `#e8d9ae` + the five shell colors** — this pairing keeps shells visible.
- **Sailor's new proportions: the shortened two-rect bunches, the 4-world-px head gaps, no ties.** If the lattice snap is later applied to her, it rounds coordinates only — it must not regrow the pigtails or close the gaps.
- **Bupa's palette, poses, even-rect grid, and the check-back sit.** Don't "fix" him further; he's done.
- **The fan's crenellated top** — do not add curves, ridges, or extra tones to it; the only sanctioned knob is step depth/minimum size (§5.2).
- **The blocky shoreline foam** and the plain flat water.
- **Any tuning constant or mechanic:** `CONFIG`, state machine, 10 stops, forfeit rule, controls, camera *logic*, session structure, HUD contents.
- **The README's out-of-scope list and the probe question.**
- Nothing from the banned list comes back: hearts/health, countdowns, labeled comfort meter, shell rarities, tide movement.

## 9. Decision block

- [ ] Playtest now (recommended); log watch-item notes against §5
- [ ] Apply the Sailor+camera snap (§5.1) first, then playtest
- [ ] Send back for broader visual revision
- [ ] Park
