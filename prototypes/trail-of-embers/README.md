# Trail of Embers — Probe Prototype

ARTIFACT TYPE: Probe (playable prototype)
AUTHORITY: PROBE
STATUS: Draft — Challenge Pass 1 untested, human-gated
SOURCE-OF-TRUTH FILES TOUCHED: none

This is the playable build for the probe defined in
`artifacts/probes/0002-trail-of-embers-probe-brief.md`, extended by a
bounded Challenge Pass 1 after the first playtest
(`artifacts/playtests/0001-trail-of-embers-first-playtest.md`) came back
positive but easy. It does not choose Trail of Embers as the final game,
does not authorize production implementation, and is not itself a playtest
result.

## How to run

No build step, no dependencies. Open the file directly in a browser:

```
open prototypes/trail-of-embers/index.html
```

(Or double-click `index.html` in Finder — any modern browser works.)

## Controls

- **Arrow keys / WASD** — move
- **Space** — drop an ember at your current position
- **R** — restart the **current level** at any time (including after win/loss)
- **N** — advance to the next level (only after winning the current one)
- **Shift+R** — full reset back to level 1
- **G** — toggle debug view (shows torch/ember radii and the beast's current AI state + target line)
- **Esc / quit** — not implemented; just close the browser tab (there is no launch menu to exit from)

## Level / challenge structure (Challenge Pass 1)

Three fixed, hand-placed levels. The HUD shows the current level. Winning a
level offers **N** to continue; losing restarts the same level with **R**.
The core loop is identical in all three — only simple per-level data varies
(start positions, safe zone, obstacle rectangles, and in level 3 only, beast
speed and ember tuning).

1. **First Light** — the exact layout and tuning from the successful first
   playtest, unchanged. Slightly easy on purpose: teaches ember-as-bait.
2. **The Guarded Circle** — same tuning as level 1; the difficulty is purely
   spatial. The stone circle sits behind a solid pocket wall with entrances
   at top and bottom, and the beast starts directly in your path in front of
   it. Entering the pocket while pursued gets you cornered (the beast cuts
   through walls), so the level demands at least one deliberate bait drop to
   commit the beast elsewhere before the final approach.
3. **The Long Dark** — a serpentine of four walls with alternating gaps: the
   player's route is long while the beast cuts straight lines through
   everything. The beast is faster (150 px/s vs. 130, still slower than the
   player's 175), embers recharge slower (1.5s vs. 0.9s) and stay hot for
   less time (4.0s vs. 5.2s). Winning takes route memory, timed bait drops,
   and committing to each leg of the snake. A side effect of this tuning:
   at most three embers can be hot at once (drops at 0s/1.5s/3.0s; the
   first cools at 4.0s before a fourth can land at 4.5s). There is no
   explicit cap in the code — the limit is emergent from the
   cooldown/lifetime numbers — but it is a real, player-facing constraint
   in this level.

## What changed in Challenge Pass 1

- The single hardcoded layout became a small data-driven `LEVELS` array in
  the same file (per-level: player start, beast start, safe zone, obstacles,
  optional beast speed / ember cooldown / ember lifetime, falling back to
  the first playtest's baseline values).
- Level progression: reaching the safe zone offers **N** for the next level;
  clearing level 3 shows an "all levels clear" message.
- **R** now restarts the current level (not the whole game); **Shift+R** is
  the full reset to level 1.
- A minimal level indicator (`level 2/3 — The Guarded Circle`) in the HUD.
- Levels 2 and 3 as described above.

Nothing else changed: the beast AI rules, torch/ember/fog rendering, debug
overlay, collision, win/lose conditions, and restart flow are the first
prototype's, untouched.

## What this tests

The same probe question from the brief, now under increasing difficulty:

> Does light-as-tool-and-bait create tense readable stealth decisions, or
> does it become frustrating dark navigation?

The first playtest leaned GREEN but flagged that the game was easy.
Challenge Pass 1 asks whether the GREEN read holds when the challenge
tightens — difficulty comes from clearer, tighter level design, not from
making the beast mysterious or the screen unreadable.

## Playtest questions for the challenge pass

- Does level 2 actually force a deliberate bait drop, or can it be beaten by
  pure movement? If forced, does that feel like a puzzle clicking or like an
  arbitrary gate?
- Does level 3's pressure produce tension or frustration? Are losses there
  still attributed to player error ("I baited too early") rather than to
  unfairness ("it walked through the wall and got me")?
- Does the beast walking through walls stay readable at higher pressure, or
  does it start to feel like cheating in levels 2–3?
- Is the difficulty ramp across the three levels felt as a ramp (each level
  noticeably but fairly harder)?
- Does replay pull survive losing — does the tester immediately press R on
  levels 2 and 3?
- Is the slower ember recharge in level 3 read from the HUD cooldown, or
  does it feel like the game ate an input?

## What's implemented

- Three fixed single-screen dark levels (not procedural), each a handful of
  hardcoded obstacle rectangles.
- Player movement (8-directional, arrow keys/WASD) with simple
  circle-vs-rectangle collision against obstacles.
- Constant torch radius around the player — this is the player's baseline
  visibility, and it also doubles as the beast's default "light event" (see
  AI below).
- Ember drop (Space, cooldown per level — 0.9s in levels 1–2, 1.5s in
  level 3 — so holding the key can't spam every frame) that punches a
  larger, temporarily-hot light hole in the fog and registers a light event.
- Beast AI, in priority order (identical in all levels; only speed varies):
  1. If any dropped ember is still "hot" (5.2s in levels 1–2, 4.0s in
     level 3), the beast walks directly toward the **most recently dropped**
     hot ember.
  2. Otherwise the beast walks directly toward the **player's own torch**
     (i.e. the player is never actually hidden from the beast — only a
     fresher ember distracts it). This is the direct mechanical expression
     of "light as bait."
  3. A ~1.2s idle/patrol grace period applies only before anything has
     ever been lit at the start of each level, so the player isn't ambushed
     at the very first frame.
  - No pathfinding: the beast always moves in a straight line toward its
    current target point and ignores obstacles.
- Fog-of-war "lighting": the whole screen is opaque black except for
  circular holes punched at the player's torch and any active embers
  (plain canvas radial-gradient compositing — no lighting engine). The
  beast itself is only visible when it happens to be standing inside a lit
  hole, which falls out of this for free.
- Safe zone (stone circle, fixed position per level) — reaching it wins the
  level. Beast touching the player loses. Both states pause the loop and
  show a prompt (next level / restart).
- Level progression + HUD level indicator (see above).
- Debug view (`G`): draws the torch/ember radii as dashed outlines, a
  highlighted outline + label around the beast, and a line from the beast
  to its current target point, so a facilitator can visually confirm the
  AI rule in real time.

## What's intentionally missing (per the probe brief's non-goals)

- No procedural generation — all three levels are hardcoded data.
- No adaptive/learning AI, no new enemy types — the three rules above are
  the entire beast behavior in every level.
- No randomness anywhere.
- No proximity audio / growl cue — still omitted; the brief marks audio as
  optional and non-essential to the light/AI mechanic itself.
- No menus beyond the level prompts and restart keys.
- No save system — progress resets when the tab closes.
- No inventory, upgrades, story, or campaign structure — "levels" here are
  only difficulty steps for the challenge pass, not a progression system.
- No final art — programmer-art circles and rectangles only.
- No walls blocking the beast (it ignores obstacles by design, per "no
  pathfinding beyond direct movement toward the target point"). Levels 2–3
  deliberately lean on this: walls slow *you*, never it.

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
