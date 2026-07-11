# Sailor and Bupa: Go to the Beach — Visual Redesign Direction Brief

## 1. Artifact Metadata

- **Artifact type:** Visual Direction / Research Brief
- **Authority:** Evidence fuel only. This is not a ratified decision and does not bind future work.
- **Status:** Draft, not implementation, not ratified truth.
- **Source-of-truth files touched:** none (`GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` were not read for authority and were not edited).
- **Implementation included:** none. No code was changed to produce this brief.
- **Prototype touched:** `prototypes/sailor-and-bupa-go-to-the-beach/` — read only (`README.md`, `index.html`, `assets/visual-redesign-reference.png`).
- **Trail of Embers touched:** no.

---

## 2. Current Visual Diagnosis

The prototype has already been through several visual passes (visual-cohesion, visual-simplification, a "whimsical-life" liveliness pass, and a final polish pass — see `artifacts/reviews/0005` through `0012`). Those passes were reviewed as successful *on their own terms*: they made the scene move, gave Bupa readable per-object performances, and kept the "plain fill, chunky pixel-art, few tones" restraint that Trail of Embers established. But "successful against its own brief" and "visually resolved" are different bars, and Ian's continued dissatisfaction suggests the second bar hasn't been cleared. Likely reasons, grounded in what the current code and prior reviews actually show:

- **The restraint borrowed from Trail of Embers may be the wrong restraint for this game.** Trail of Embers is a tense, lantern-lit, near-black game where flat fills and minimal detail read as *moody*. Sailor and Bupa is a cozy daylight beach game. The same low-detail, few-tone vocabulary that creates atmosphere in the dark reads as *bare* or *placeholder* in bright, open, sunny space — there's nowhere for the eye to rest and nothing to imply craft. Flatness reads as intentional in shadow; in full sun it reads as unfinished.
- **The beach likely still feels visually generic.** Sand is a single base fill (`#f0d29c`) plus deterministic speckle clusters; water is a couple of flat blues with a scattered-glint layer. This is *correct and non-noisy*, but it's also indistinguishable from any other top-down beach unless something anchors it — a hand-drawn edge quality, a signature color relationship, or a distinctive shoreline shape. Nothing currently claims "this is Sailor and Bupa's beach" the way, say, a specific sand-to-water gradient or a consistent foam silhouette would.
- **Objects likely don't share a unified scale/style language yet.** The umbrella, driftwood, rock pile, and tidepool were each built as separate small routines over several passes (per `README.md`'s "Visual Pass" section and the per-interest-point performance work). Built incrementally, across passes, by different specific asks, they're plausibly consistent in *palette* but not necessarily in *silhouette weight, outline treatment, or footprint-to-shadow ratio* — the things that make a set of objects feel "drawn by the same hand in one sitting."
- **Sailor and Bupa may need a stronger silhouette/icon treatment.** The taste review (`0010`) already flagged that Bupa's investigate performances get partially obscured because he stands on top of the interest point rather than beside it, muting his own performances. Separately, both characters are described as small, back-facing sprites at `0.74` scale — correct for "small child on a big beach," but smallness raises the bar for silhouette clarity. If the shapes aren't doing enough work, scale alone won't deliver charm.
- **Bupa's personality is currently expressed almost entirely through animation/behavior, not through static design.** His resting silhouette is described as "mostly gray with a hint of white," which is a safe, correct color story but not yet a *distinctive* one. The taste review independently flagged his lime-green pupil (`#7ac143`) as the one saturated, un-catlike note on an otherwise desaturated animal — a sign the face may not yet be doing enough character work when he's standing still, before any behavior has kicked in.
- **Texture has been deliberately kept sparse to avoid noise (the right instinct) but this may have left the scene under-charactered rather than merely clean.** Every prior review confirms "not busier" as the test that was passed. Nobody has yet tested for "does this look *authored*" — a different, harder bar that low density alone doesn't clear.

None of this means the prior passes were wrong to prioritize restraint over noise — busy pixel art would be a worse failure than plain pixel art. It means restraint has been optimized for one axis (not-noisy) without a second axis (intentional/authored) being pushed at the same time. The reference image is instructive because it hits both at once.

---

## 3. Reference-Image Analysis

Read as inspiration for a *translated* style, not a target to reproduce.

- **Palette.** Warm, saturated, and narrow: one sand hue (`#f0d9a8`-ish) running from pale dry sand to a slightly deeper wet-sand band at the shoreline; two or three water blues (deep teal, mid cyan, pale foam-cyan); one dune green family (yellow-green to deeper green) that's warm rather than cool. Every color sits in a "sunny afternoon" register — nothing goes muddy or desaturated. This differs from the current build mainly in *warmth consistency*: the reference never lets sand, water, or vegetation drift toward a colder or grayer note, so the whole frame reads as one lit scene rather than separately-colored zones.
- **Contrast / value structure.** The image is built on one dominant value move: a hard, high-contrast boundary between sand (light, warm) and water (dark, saturated), reinforced by a bright white foam edge that's the single highest-contrast element on screen. Everything else — grass, rocks, driftwood — sits at closer-together mid values so it doesn't compete with that boundary. There is a clear value hierarchy: shoreline edge > characters > POI objects > background texture. The current build doesn't have an equivalent single dominant contrast move; its highest-contrast elements (white foam flecks, white shell fills) are scattered rather than organized into one hierarchy.
- **Line/edge style.** No hard black outlines anywhere. Edges are held by value and hue contrast, with soft 1-pixel darker-shade borders on sprites (Sailor's hair, Bupa's body) rather than a uniform outline stroke. Rocks and driftwood get a harder, more graphic outline because they're inert props; the shoreline foam edge is drawn as a jagged, hand-placed outline shape, not a procedural wavy line — it has *intentional* irregularity, not randomized noise.
- **Proportions.** Sailor is chibi-proportioned (large head-to-body ratio, short limbs) which reads instantly as "child" even from directly behind and even without a face visible. Bupa is proportioned as a real small housecat — normal leg length, low visual center of gravity, tail as a distinct readable shape — which is what makes him read as "a cat with an agenda" rather than a mascot blob. The proportion contrast between an exaggerated-cute human and a naturalistically-proportioned animal is doing real character work: it's *why* Bupa reads as having his own agency instead of being Sailor's accessory.
- **Simplification.** Each object is reduced to very few shapes but not few colors: the tidepool is one shape with a lighter interior crescent and one highlight pixel; the driftwood is two logs with three tones (base, shadow, highlight) and no more; the rock in the water is one silhouette with a highlight and a shadow. The simplification strategy is "collapse detail, keep the light-source-consistent shading pass" — every object still gets a highlight/shadow pair even though it has almost no internal detail. That's the single technique doing the most work: three flat tones (base/shadow/highlight) per object reads as *rendered*, while one flat tone per object (the current build's dominant strategy) reads as *silhouette-only*.
- **Detail density.** Density is uneven on purpose. The water is nearly empty (just the rock and a seagull); the sand is sparsely dotted with a handful of shells and footprints; the dune edge on the right is the single busiest area, packed with grass, driftwood, a fence, and a plant — because it's the "framing" edge of the composition, not the play lane. This is a deliberate density gradient: quiet where the eye needs to track gameplay, dense where the eye is allowed to rest and admire.
- **Environmental charm.** Small non-functional details carry a lot of the warmth: footprints trailing behind Sailor, a distant seagull, a broken wood fence disappearing off-frame, tufts of dune grass at slightly different heights. None of these are mechanics; all of them say "this is a specific, lived-in place" rather than "this is a beach-shaped rectangle."
- **Warmth/coziness.** Comes from the sand-to-green color relationship (warm sand directly against warm-leaning green, no cool buffer color between them) plus the total absence of any hazard-coded color (no red, no black, no harsh contrast except the foam edge). Every color present is a color you'd want to be sitting in.
- **Graphic-design hierarchy.** The HUD chips (character portraits + name + hearts top-left, shell counter bottom-left, quest banner bottom-right) use a single consistent frame language: cream parchment fill, brown rounded-rect border, small icon-plus-text layout. All three chips share the exact same visual family, so the eye never has to re-learn a new UI grammar reading around the frame. This is the single most portable lesson for a canvas game: *one chip shape, one border treatment, one icon-left/text-right rule, reused everywhere,* rather than each HUD element inventing its own frame.
- **Composition.** Strong diagonal: sand band is a soft diagonal wedge between water (left) and dune (right), which gives the eye a clear "lane" that both mirrors and reinforces the vertical scroll gameplay. Characters sit inside the lane; POIs are placed to either side, pulling the eye without leaving the lane. This maps directly onto the existing scrolling-beach structure and doesn't require a layout change — it's a validation that the existing lane composition is *already right*, and what's missing is finishing quality within it, not restructuring the space.
- **Translation into simple HTML/canvas drawing.** The reference is true pixel art with per-pixel shading; a literal recreation is out of scope and out of budget for a canvas prototype. What's cheaply portable without an asset pipeline: (1) add one shadow tone + one highlight tone per object on top of the existing flat-fill base, turning each object into a 3-tone shape instead of a 1–2-tone shape; (2) tighten the palette so sand/water/green are drawn from one consistent warm family instead of independently-chosen hex values; (3) replace uniform speckle/noise texture with a *few, deliberately placed* charm details (footprints, a distant gull silhouette, one fence post) that read as authored rather than procedural; (4) unify the three HUD chips onto one frame component if they aren't already sharing one. None of this requires sprite sheets, an art pipeline, or leaving hand-coded canvas drawing.
- **What should NOT be copied.** Not the isometric-leaning perspective/pixel density (true 1x pixel art at that resolution is a different, much higher-effort medium than the current half-res nearest-neighbor buffer). Not full per-pixel dithering or per-pixel shading — the current buffer resolution can't support it without looking muddy, and it isn't necessary to get the "authored" feeling. Not a literal color-for-color palette copy — the goal is *principles* (warm, narrow, high-contrast-at-the-shoreline) translated into Sailor and Bupa's own identity, not a reskin. Not the specific character designs, fence, or seagull as literal assets to trace.

---

## 4. Three Visual Directions

### Direction A — "Sunlit Flats" (shading-pass refinement)

- **One-sentence pitch:** Keep every current shape and the flat-fill DNA, but add a disciplined shadow/highlight pass and a warmed, narrowed palette so the same scene reads as finished instead of placeholder.
- **Palette:** Tighten existing hues toward one warm family — pull sand, dune green, and water blues a few percent warmer/closer together; add exactly one shadow-shade and one highlight-shade per existing base color (so each object still uses ~3 tones total, not a gradient).
- **Character treatment:** Sailor and Bupa keep current proportions and scale; add a single consistent shadow tone under overlapping shapes (hair over collar, ear over head) rather than outlines.
- **Environment treatment:** Sand and water keep their current flat-fill + scatter-layer structure; scatter layers get re-tuned to be sparser but higher-contrast (fewer, more visible marks instead of many faint ones).
- **Object/POI treatment:** Every POI (umbrella, driftwood, rock, tidepool) gets the same base/shadow/highlight 3-tone treatment, applied as a small shared helper so all objects look drawn by the same hand.
- **UI/HUD treatment:** Unify existing chips onto one shared frame-drawing helper (same border radius, same parchment fill, same icon-left/text-right rule) if not already unified.
- **Implementation difficulty:** Low. No new draw architecture; extends the existing flat-fill routines with 1–2 additional `fillStyle` calls per object.
- **Risk:** Low. Easiest direction to regress into "still looks the same" if the shading pass is too subtle to notice — the main execution risk is under-committing, not overreaching.
- **Why it fits:** Directly answers the diagnosis in §2 (flat reads as unfinished in daylight) with the cheapest possible fix, and is the safest first slice to test whether "more resolved" is really what's missing before investing in a bigger stylistic swing.

### Direction B — "Storybook Beach" (bolder, more stylized)

- **One-sentence pitch:** Push toward a hand-illustrated children's-book-beach look — soft rounded shapes, visible "brushy" texture on sand and water, and a slightly desaturated, paper-warm palette that reads as illustrated rather than pixel-art-genre.
- **Palette:** Shift away from saturated "game" colors toward a slightly muted, warm-paper palette (think watercolor beach illustration): softer sand tan, muted sea-glass teal, dusty warm green.
- **Character treatment:** Sailor and Bupa gain rounder, softer silhouette edges (fewer hard rectangle corners in the sprite-drawing code) and a subtle textured/grain fill instead of pure flat color, to read as "illustrated" rather than "pixel-art."
- **Environment treatment:** Sand and water get a light procedural grain/paper-texture overlay (very restrained, applied as a screen-space noise texture, not per-object) to unify the whole frame under one "illustrated page" treatment.
- **Object/POI treatment:** POIs get simplified, rounder shapes with visible "brush stroke" shading rather than hard-edged pixel shapes.
- **UI/HUD treatment:** Chips move toward a torn-paper / scrapbook card look (soft drop shadow, slightly irregular border) rather than parchment-with-hard-border.
- **Implementation difficulty:** Medium-high. Requires new shape-drawing approach (rounder paths, possibly `ctx.filter` or a noise texture pass) rather than extending existing flat-fill routines; touches nearly every draw function.
- **Risk:** Medium-high. Biggest risk is scope creep into a full re-skin, and a real risk that a grain/texture overlay tips over the "not over-textured" constraint if not tightly restrained. Also a bigger gap from the currently-shipped look, meaning higher chance Ian bounces off it entirely and the work is wasted.
- **Why it fits:** Most directly chases "children's-book beach charm" and the warmth/coziness lesson from the reference (§3), but it's a genuine style pivot, not a refinement — best treated as a direction to *test in isolation* (e.g., one object or Sailor's sprite alone) before committing the whole scene to it.

### Direction C — "Pixel Postcard" (reference-adjacent, cozy children's-book charm)

- **One-sentence pitch:** Stay in pixel art, but adopt the reference's specific techniques — 3-tone shading per object, a warm narrow palette, a dominant shoreline contrast edge, and a handful of authored (not procedural) charm details — without changing the current buffer resolution or draw architecture.
- **Palette:** Adopt the reference's warm-narrow-palette principle directly: one warm sand family, 2–3 water blues built from one hue instead of independently chosen, one warm-leaning green. Fewer independently-invented hex values overall.
- **Character treatment:** Keep current proportions (already chibi Sailor / naturalistic Bupa — this is already right per §3) but add the base/shadow/highlight 3-tone treatment to both sprites, and consider offsetting Bupa's investigate-performance stop position beside (not on top of) each POI, as the taste review already flagged as the lever for sharper performances.
- **Environment treatment:** Rework the shoreline into one dominant, deliberately-shaped high-contrast foam edge (matching the reference's single strongest value move) rather than the current sparser scattered-glint approach; keep sand and dune quiet by comparison.
- **Object/POI treatment:** Every POI gets a 3-tone shading pass; add 2–3 authored, non-procedural charm details (a couple of footprint marks behind Sailor, a distant static gull silhouette over the water) in place of expanding the procedural speckle system.
- **UI/HUD treatment:** Adopt the reference's one-chip-family rule explicitly: single shared frame helper, consistent icon-left/text-right layout, reused for every HUD element.
- **Implementation difficulty:** Medium. More deliberate than Direction A (touches palette constants, shoreline drawing, and adds a couple of new static-detail draws) but stays inside the existing pixel-art/flat-fill/half-res-buffer architecture — no new rendering technique required.
- **Risk:** Low-medium. Palette retuning risks temporarily breaking readability contrast (e.g., if sand and dune green get too close in warmth) until checked against the shell/character readability rules in §6; otherwise contained.
- **Why it fits:** This is the direction that most literally answers the brief — "extract principles from the reference, translate them, don't copy them" — and targets the two most concrete diagnosis items from §2 (missing unified shading pass, missing single dominant contrast move) with techniques proven in the reference image itself.

---

## 5. Recommended Direction

**Recommended: Direction C — "Pixel Postcard," attempted as Direction A's shading pass first, then extended.**

Reasoning: Direction A and Direction C are not actually opposed — A is a subset of C's technique (the 3-tone shading pass) without the palette and shoreline-contrast changes. The lowest-risk sequencing is to treat Direction A as the *first slice* of Direction C rather than a separate direction: implement the shading-pass + palette-tightening pieces first (cheap, reversible, directly answers the "restraint reads as unfinished" diagnosis), and only add the shoreline-contrast rework and authored charm details in a second slice once Ian confirms the shading pass alone moves the needle.

Direction B is worth keeping on the shelf, not pursuing first. It's the direction most likely to *feel* like a real answer to "I need a clearer, more intentional visual identity," because it's the biggest visible change — but that's also why it's the riskiest to build blind. If Directions A/C don't satisfy Ian after a real slice, B becomes the next thing to test, ideally as a single isolated sprite mockup (just Sailor, or just one POI) before committing the whole scene, rather than a full rewrite.

---

## 6. Visual Rules for the Recommended Direction

- **Sailor scale and pigtail readability:** Keep `SAILOR_DRAW_SCALE` (currently `0.74`) and the existing pigtail-spacing compensation — both are already correct per the reference's "chibi proportions read as child from behind" lesson. Any shading pass must not obscure the pigtail silhouette; hair shadow tone stays confined to the underside/overlap areas, never a full-shape darken.
- **Bupa scale, color blocking, tail/ear readability:** Keep Bupa's naturalistic (non-chibi) proportions — this contrast with Sailor is load-bearing character work per §3, not a gap to close. Add one shadow tone (underbelly/legs) and one highlight tone (back/head) to his gray body; keep the white patch as the one pure-white note. Revisit the lime-green pupil (`#7ac143`) as part of this pass — the taste review flagged it as the one un-catlike saturated color; a muted amber, gold, or gray-green is worth testing against readability at gameplay scale before locking anything in.
- **Beach object scale:** All POIs (umbrella, driftwood, rock pile, tidepool) should sit within one consistent scale/footprint-to-shadow ratio — audit them side by side before shading, since they were built across several separate passes.
- **Shell readability:** Preserve the existing rule that shell colors stay clear of the dry-sand tone (already confirmed working per `0010`). Any palette tightening must re-check this contrast explicitly — narrowing the palette is the one change most likely to accidentally collapse shell-vs-sand contrast.
- **Water/sand/foam treatment:** Establish one dominant high-contrast foam edge as the scene's single strongest value move (per §3's "value hierarchy" lesson); everything else (interior water flecks, sand speckles) stays quieter than that edge. Do not add banding, tile shading, or a speckle-density increase — those remain explicitly out per prior reviews (`0009`, `0010`).
- **Vegetation/dune treatment:** Keep the existing row-phased quantized sway animation. Apply the 3-tone shading pass to dune grass and plants; keep green warm-leaning (yellow-green, not cool/blue-green) to match the reference's warmth lesson.
- **Umbrella/ball/driftwood/rock/tidepool treatment:** Each gets exactly 3 tones (base, one shadow, one highlight) — no more. Do not add per-object outline strokes; hold edges with value/hue contrast as the reference does, consistent with the existing no-outline sprite treatment.
- **Shadow rules:** Ground shadows (already present via `drawGroundShadow`) stay soft, single-tone, and object-anchored. Object *self*-shading (new) is separate from ground shadow and should not be confused with it — self-shading implies a light source (assume consistent top-left or overhead light across every object) while ground shadow implies contact.
- **Outline or no-outline rules:** No hard outline strokes on characters or POIs, matching both the reference and the current build. Reserve any stroke-like treatment for the shoreline foam edge only, where it's structural (the boundary between two large fills) rather than decorative.
- **Animation restraint:** No new animation is in scope for this slice. Existing sway, idle, and performance animations are preserved untouched — this is a static-shading and palette pass, not a motion pass.
- **UI text/chip treatment:** If the three HUD chips (party/hearts, shell counter, quest banner) don't already share one frame-drawing helper, unify them onto one: same fill, same border, same corner radius, same icon-left/text-right layout — matching the reference's single-chip-family lesson.

---

## 7. Proposed First Implementation Slice

**Slice: Palette-and-shading pass (Direction A, as the first cut of Direction C).**

Scope, bounded:
1. Tighten the existing palette constants (sand, water, dune green) toward one warm family — adjust hex values, not structure.
2. Add a shared "3-tone" helper (base/shadow/highlight) and apply it to: Sailor's sprite, Bupa's sprite, and each POI type (umbrella, driftwood, rock, tidepool).
3. Re-check shell-vs-sand contrast and shoreline-vs-sand contrast after the palette shift; adjust only if readability regresses.
4. If time allows within this slice: audit the three HUD chips for shared framing and unify if they've drifted.

Explicitly NOT in this slice: the shoreline-contrast rework (§4 Direction C's bigger foam-edge change), the authored charm details (footprints, gull), Bupa's pupil-color change, and Bupa's stop-position-beside-POI fix — all are candidate *second* slices, not part of this one. No new mechanics, no new object types, no new POI behaviors.

---

## 8. Guardrails

- No source-of-truth edits (`GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md`).
- No Trail of Embers edits.
- No new hazards.
- No fail state.
- No rescue system.
- No moving tide mechanic.
- No menus/settings/rebinding.
- No broad asset pipeline (sprite sheets, external image assets, build tooling) unless a future direction (e.g., Direction B) is explicitly ratified and clearly justifies it — this brief does not justify one.
- Preserve controller/keyboard behavior exactly.
- Preserve the low-pressure, cozy feel — no addition should read as urgent, timed, or punishing.
- Preserve Bupa's agenda/personality and all existing behavior/animation logic — this is a visual-only pass.

---

## 9. Playtest Questions

After a visual slice ships, ask Ian:

1. Does it look more intentional — like it was designed on purpose, not left unfinished?
2. Does it make you smile faster than the current build, or take longer to land?
3. Are Sailor and Bupa instantly readable at a glance, without hunting for them on the sand?
4. Does Bupa look more catlike / more personality-rich standing still, before he does anything?
5. Do beach objects (umbrella, driftwood, rock, tidepool) read immediately as what they are, and do they feel like they belong to the same set?
6. Is the beach more alive without becoming noisy or busy?
7. Does the style feel like *Sailor and Bupa's own* — transformed from the reference — rather than a copy of the reference or a copy of Trail of Embers?
8. Is there one specific thing that still feels wrong, and can you point to exactly where on screen it is?

---

## 10. Implementation Handoff Notes

Files a later implementation pass would likely touch (not touched by this brief):

- `prototypes/sailor-and-bupa-go-to-the-beach/index.html` — palette constants, sprite-drawing functions (`drawSailor`, Bupa's draw routines), POI draw routines, HUD chip drawing.
- `prototypes/sailor-and-bupa-go-to-the-beach/README.md` — the "Visual Pass" section would need updating to describe the new pass, consistent with how prior passes (visual-cohesion, visual-simplification, whimsical-life) were documented there.
- `prototypes/sailor-and-bupa-go-to-the-beach/assets/visual-redesign-reference.png` — reference only; no changes expected, may be worth keeping alongside a short note (in the README or a future artifact) recording that it was used as inspiration, not source.

No implementation was performed as part of this task.

---

## Final Report

- **Model/tool used:** Claude (Sonnet 5), interactive session. Direct file reads and image inspection only — no code execution beyond `ls`/`find`/`grep` for orientation.
- **Fable Advisor used:** No — the task treated Fable's own prior review (`artifacts/reviews/0010-sailor-and-bupa-whimsical-life-taste-review.md`) as evidence input rather than invoking Fable live.
- **Files inspected:** `prototypes/sailor-and-bupa-go-to-the-beach/README.md`, `prototypes/sailor-and-bupa-go-to-the-beach/index.html` (grep-scanned for palette/scale constants and draw structure, not fully read line-by-line), `artifacts/reviews/0012-sailor-and-bupa-final-visual-polish-audit.md`, `artifacts/reviews/0010-sailor-and-bupa-whimsical-life-taste-review.md`, `artifacts/README.md` (for artifact-directory conventions).
- **Reference image inspected:** Yes — `prototypes/sailor-and-bupa-go-to-the-beach/assets/visual-redesign-reference.png` was viewed directly.
- **Artifact created/edited:** Created `artifacts/research/sailor-and-bupa-visual-redesign-direction-brief.md` (this file).
- **Source-of-truth files changed:** No.
- **Prototype code changed:** No.
- **Recommended next step:** Build the Slice in §7 (palette-and-shading pass) as a small, isolated implementation task, then re-run the §9 playtest questions against it before deciding whether to extend into the rest of Direction C or pivot toward Direction B.
