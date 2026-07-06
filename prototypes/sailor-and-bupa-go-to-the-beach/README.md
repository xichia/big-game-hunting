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
    - **Tidepool**: Bupa crouches and bats/paws at the water.
    - **Driftwood**: Bupa stretches forward and scratches/rubs claws against the log.
    - **Rock Pile**: Bupa sits and bobs his head (nosing/sniffing).
    - **Default (Grass/Tuft)**: Bupa crouches low and sniffs/peeks.
  - Interest-point type controls the total pause duration:
    - Rock: short pause (2–4s)
    - Driftwood: medium pause (4.5–6.5s)
    - Tidepool: long pause (8–11s)
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
