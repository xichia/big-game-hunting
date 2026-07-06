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

* **WASD / Arrow Keys**: Move Sailor.
* **R Key**: Restart the prototype.

## Gameplay Mechanics

* **Bupa's Rhythm**: Bupa decides his own path up the beach, trotting from one interest point to another.
* **Readable Tells**:
  - Bupa cycles through three postures during every pause:
    - Sniffing during the first 40%
    - Sitting/Staring during the next 40%
    - Standing Alert/Tail Wagging during the final 20%
  - Interest-point type controls the total pause duration:
    - Rock / Shell Cluster: short pause, about 2–4s, so the cycle is quick
    - Driftwood / Grass Tuft: medium pause, about 4–7s, so the cycle is moderate
    - Tidepool: long pause, about 8–11s, so the cycle is slow
* **Proximity/Check-Back**: If Sailor moves too far from Bupa while he is trotting, he stops, sits, looks back, and meows until Sailor returns close to him.
* **Scarcity**: The beach scrolls up as Bupa progresses. Any shells left behind are forfeited/missed.

## Visual Pass

A visual-cohesion pass was applied on top of the first playable (no mechanics changed):
* Sailor is now clearly back-facing (no face/eyes drawn) with large, prominent warm-brown pigtails.
* Shells render as recognizable fan/scallop, spiral, and clam-arc silhouettes instead of plain dots, purely as cosmetic variety (still one shell type, no rarity).
* Sand and water now use pixel-pattern texture (speckles, dithering, tile-tone variation, banded waves, a blocky foam edge) instead of flat fills.
* Dune vegetation (grass tufts, a larger dune plant) is more layered and detailed.
* All game-world drawing routes through a shared half-resolution pixel buffer, upscaled with nearest-neighbor scaling, so characters, terrain, and objects share one consistent pixel scale.

## Out-of-Scope List

The following features are explicitly out-of-scope for this prototype:
* Rescue/trouble mechanics beyond the check-back sit (stuck, startled, lured).
* Moving tide or waterline (the water on the left is decorative).
* Wave contact or pushback.
* Hazards, crabs, gulls, or health/hearts/death.
* Countdown timers.
* Shell rarities.
* Controller support.
* Audio (meows are visual-only).
* Multiple levels or menus.
* Save state.
