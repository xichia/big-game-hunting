# Trail of Embers — Probe Prototype

ARTIFACT TYPE: Probe (playable prototype)
AUTHORITY: PROBE
STATUS: Draft — untested, human-gated
SOURCE-OF-TRUTH FILES TOUCHED: none

This is the smallest playable build for the probe defined in
`artifacts/probes/0002-trail-of-embers-probe-brief.md`. It does not choose
Trail of Embers as the final game, does not authorize production
implementation, and is not itself a playtest result.

## How to run

No build step, no dependencies. Open the file directly in a browser:

```
open prototypes/trail-of-embers/index.html
```

(Or double-click `index.html` in Finder — any modern browser works.)

## Controls

- **Arrow keys / WASD** — move
- **Space** — drop an ember at your current position
- **R** — restart the level at any time (including after win/loss)
- **G** — toggle debug view (shows torch/ember radii and the beast's current AI state + target line)
- **Esc / quit** — not implemented; just close the browser tab (there is no launch menu to exit from)

## What this tests

The single probe question from the brief:

> Does light-as-tool-and-bait create tense readable stealth decisions, or does it become frustrating dark navigation?

Specifically, during a 5–10 minute playtest, whether a tester:
- discovers the ember-drop action unprompted,
- treats ember drops as a deliberate tradeoff (revealing terrain vs. revealing position to the beast) rather than a reflex,
- can tell the beast is reacting to light rather than moving arbitrarily,
- reports tension ("I felt hunted") rather than tedium/disorientation.

## What's implemented

- One fixed single-screen dark room (not procedural) with a handful of
  hardcoded obstacle rectangles.
- Player movement (8-directional, arrow keys/WASD) with simple
  circle-vs-rectangle collision against obstacles.
- Constant torch radius around the player — this is the player's baseline
  visibility, and it also doubles as the beast's default "light event" (see
  AI below).
- Ember drop (Space, ~0.9s cooldown so holding the key can't spam every
  frame) that punches a larger, temporarily-hot light hole in the fog and
  registers a light event.
- Beast AI, in priority order:
  1. If any dropped ember is still "hot" (< ~5.2s old), the beast walks
     directly toward the **most recently dropped** hot ember.
  2. Otherwise the beast walks directly toward the **player's own torch**
     (i.e. the player is never actually hidden from the beast — only a
     fresher ember distracts it). This is the direct mechanical expression
     of "light as bait."
  3. A ~1.2s idle/patrol grace period applies only before anything has
     ever been lit, so the player isn't ambushed at the very first frame.
  - No pathfinding: the beast always moves in a straight line toward its
    current target point and ignores obstacles.
- Fog-of-war "lighting": the whole screen is opaque black except for
  circular holes punched at the player's torch and any active embers
  (plain canvas radial-gradient compositing — no lighting engine). The
  beast itself is only visible when it happens to be standing inside a lit
  hole, which falls out of this for free.
- Safe zone (stone circle, fixed position) — reaching it wins. Beast
  touching the player loses. Both states pause the loop and show a
  restart prompt.
- Debug view (`G`): draws the torch/ember radii as dashed outlines, a
  highlighted outline + label around the beast, and a line from the beast
  to its current target point, so a facilitator can visually confirm the
  AI rule in real time.

## What's intentionally missing (per the probe brief's non-goals)

- No procedural forest generation — the room and obstacle layout are hardcoded.
- No adaptive/learning AI — the three rules above are the entire beast behavior.
- No proximity audio / growl cue — omitted for this first pass; the brief
  marks audio as optional and non-essential to the light/AI mechanic itself.
- No menus beyond restart.
- No save system, no progression, no upgrades, no campaign.
- No final art — programmer-art circles and rectangles only.
- No walls blocking the beast (it ignores obstacles by design, per "no
  pathfinding beyond direct movement toward the target point").

## GREEN / RED criteria (summarized from the probe brief)

**GREEN** if the tester:
- discovers the ember mechanic through play, not instruction, and can describe it afterward,
- names a specific tense moment tied to a light/beast interaction,
- deliberately drops at least one ember away from their own path to misdirect the beast,
- distinguishes "tense" from "confusing" in their own words afterward.

**RED** if the tester:
- reports no tension from the beast at all,
- finds the dark navigation boring/disorienting within ~2 minutes,
- only ever spams the ember key with no perceived tradeoff,
- can't tell whether the beast is reacting to them or moving independently.

See the full playtest script and risk register in
`artifacts/probes/0002-trail-of-embers-probe-brief.md`.
