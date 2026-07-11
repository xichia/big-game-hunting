# Sailor and Bupa: Go to the Beach

This is a separate, exploratory prototype / probe. It is not a replacement for *Trail of Embers* and is not a ratified final game.

## Probe Question

**Does Bupa's autonomous wander/pause rhythm, plus a proximity pull expressed through his own behavior, make the player watch and care about the cat while collecting shells?**

## How to Run Locally

You can run this prototype by opening it directly in your browser:
```bash
open prototypes/sailor-and-bupa-go-to-the-beach/index.html
```

## Controls

* **WASD / Arrow Keys / Left Analog Stick / D-pad**: Move Sailor.
* **R Key / Gamepad A Button (Only when complete)**: Restart the prototype.

## Gameplay Mechanics

* **Bupa's Rhythm**: Bupa decides his own path up the beach, trotting from one interest point to another.
* **Readable Tells & Custom Performances**:
  - Bupa cycles through three postures during every pause (first 40% sniffing, next 40% custom investigation performance, final 20% alert and tail-wagging).
  - During the middle 40% investigation stage, Bupa has a custom performance per interest point type:
    - **Beach Ball**: Bupa crouches and bats/paws at the ball (retargeted batting beat).
    - **Umbrella**: Bupa sits in the umbrella's shade and slow-blinks (a "cat found a shade patch" beat).
    - **Driftwood**: Bupa stretches forward and scratches/rubs claws against the log.
    - **Rock Pile**: Bupa sits and bobs his head (nosing/sniffing).
    - **Tidepool** (occasional): Bupa crouches and bats/paws at the water. Tidepools are now an occasional ocean-adjacent feature rather than the default common POI.
    - **Default (Grass/Tuft)**: Bupa crouches low and sniffs/peeks.
  - Interest-point type controls the total pause duration:
    - Rock: short pause (2–4s)
    - Driftwood: medium pause (4.5–6.5s)
    - Beach Ball: medium pause (4–6s)
    - Umbrella: medium-long pause (5–7.5s)
    - Tidepool: long pause (8–11s, occasional only)
* **Proximity, Check-Back, & Affection**:
  - If Sailor moves too far from Bupa while he is trotting, he stops, sits, looks back, and meows until Sailor returns close to him.
  - **Reunion Mrrp**: When Sailor returns to reassure Bupa after a check-back meow, Bupa flashes a happy meow chip saying "mrrp!".
  - **Idle Affection**: If Sailor stands close (<40px) and still near Bupa for more than 2 seconds, Bupa enters an affectionate state—curling his tail down and slow-blinking his eyes closed.
  - **Stationary Idles**: While stationary, Bupa has subtle quantized ear flick and tail sway animations.
* **Scarcity**: The beach scrolls up as Bupa progresses. Any shells left behind are forfeited/missed.

## Visual Pass

A visual-simplification pass was applied on top of the earlier visual-cohesion pass (no mechanics changed), moving the look toward *Trail of Embers*' plainer, chunkier pixel-art sensibility, beach-themed:
* Sand uses restrained pixel-art grain/fleck clusters and deterministic shell-adjacent marks. Water is a plain fill (slightly more saturated/cyan) with a shoreline foam that shares visual DNA with the interior horizontal foam flecks and glints, using irregular spacing.
* Dune vegetation (grass tufts, dune plants) features a time-based, row-phased quantized 2px sway animation, using slightly more saturated green tones.
* Tidepools feature a lighter blue inner crescent shimmer and a blinking white highlight pixel.
* Sailor is a simple back-facing sprite drawn at a smaller scale (0.74) to read as a small child, with compensated raw pigtail spacing to keep the head-to-pigtail gap visible. Outfit and pigtail sway animations are preserved.
* Bupa stays mostly gray with a small hint of white (paws/chest).
* Shells are simplified to one flat fill, one shadow shape, and a single outline stroke. Occasional uncollected shells emit a brief 3px cross glint/sparkle.
* Ambient decorative crabs (red/orange, clawed) rarely emerge from the sand near rocks or the waterline, scuttle horizontally, and burrow back down, leaving a small sand pile.
* All game-world drawing routes through the shared half-resolution pixel buffer, upscaled with nearest-neighbor scaling.

### Palette-and-shading pass (visual redesign, slice 1)

Based on `artifacts/research/sailor-and-bupa-visual-redesign-direction-brief.md` (Direction A, the first cut of Direction C, "Pixel Postcard"). This is a visual-only pass — no mechanics, no Bupa behavior, no object placement, and no new object types changed.

* **Warmer, narrower palette.** Sand, dune, water, wood, stone, grass, Sailor's hair/outfit, and Bupa's fur now draw from one shared `PALETTE` constant instead of independently-chosen hex values, pulling the whole scene toward one warm "sunny afternoon" family. Bupa's fur shifted from a cool blue-gray to a warm neutral gray; the rock's stone tone shifted from cool gray to warm taupe while staying clearly distinct from Bupa's fur so he still reads as separate from the rock pile when stopped beside it.
* **Base/shadow/highlight 3-tone treatment**, added via the existing `shadeColor()` helper (previously only used for shells) so every object derives its shadow and highlight from one base hex rather than hand-picked tones:
  - Sailor: added a crown highlight to her hair and a top highlight to her dress (shadow tones were already present); pigtail shading stays confined to the underside, per the readability rule.
  - Bupa: added one highlight strip to the top of his head/back across every pose (trotting, check-back, all five investigate performances, and the alert stage). The white chest/paw patch and his eye color are untouched.
  - Rock: added a highlight band (previously base+shadow only).
  - Driftwood: added a shadow band (previously base+highlight only).
  - Tidepool: its existing two-blue-plus-highlight treatment now derives from one shared tidepool hue.
  - Beach ball: added a subtle lower-rim shadow tone under the existing stripes.
  - Umbrella: added a highlight near the canopy apex and a highlight sliver on the pole, both clipped to their own shapes so they can't spill outside the silhouette.
  - Dune grass tufts and the dune plant: added a highlight tip/patch (previously base+shadow only); both grass variants now derive from one shared grass hue instead of two independently-chosen greens.
* **Readability re-checked, not changed.** Shell colors, the shoreline foam/contrast treatment, and the sand-speckle/dune-speckle density are all unchanged from before this pass — only re-verified against the new, slightly warmer sand and water tones. Shells stay clearly separated from sand by both hue and lightness; the ocean-to-sand contrast is unchanged in structure and remains high.
* **Small HUD consistency tweak.** The restart-hint chip's border width and corner radius now match the main HUD chip's, so the two player-facing chips share one frame language. The bottom-left debug panel (`Bupa state / dist`) was left as-is since it's a diagnostic overlay, not a player-facing chip.
* **Explicitly not in this slice** (candidates for a later slice, per the brief): the shoreline dominant-foam-edge rework, authored charm details (footprints, a distant gull), Bupa's pupil color, and Bupa's investigate stop-position-beside-POI change.

### Waterline polish (follow-up, same pass)

A small follow-up after review flagged the waterline as too flat:
* **Two-value waterline seam.** Added a static light foam edge plus a darker wet-sand band where water meets beach, both tracing the same jagged shoreline contour as the water fill. This is palette/shading only — no tide motion, no new object types, no animation.
* **Gold shell contrast nudge.** The gold shell color was deepened slightly so it reads more clearly against the sand; no new shell details were added.

## Out-of-Scope List

The following features are explicitly out-of-scope for this prototype:
* Rescue/trouble mechanics beyond the check-back sit (stuck, startled, lured).
* Moving tide or waterline (the water on the left is decorative).
* Wave contact or pushback.
* Hazards, gulls, hazard/mechanic crabs, or health/hearts/death. (Note: ambient critters are decorative and non-interactive only).
* Countdown timers.
* Shell rarities.
* Audio (meows and mrrps are visual-only).
* Multiple levels or menus.
* Save state.
