# Trail of Embers — Probe Prototype

ARTIFACT TYPE: Probe (playable prototype)
AUTHORITY: PROBE
STATUS: Draft — Fullscreen/Larger Maze Pass untested, human-gated
SOURCE-OF-TRUTH FILES TOUCHED: none

This is the playable build for the probe defined in
`artifacts/probes/0002-trail-of-embers-probe-brief.md`, extended by a
bounded Challenge Pass 1 after the first playtest
(`artifacts/playtests/0001-trail-of-embers-first-playtest.md`) came back
positive but easy, then by a bounded Scale Pass 1 after Challenge Pass 1
(`artifacts/playtests/0002-trail-of-embers-challenge-pass-1-playtest.md`)
leaned GREEN and named "bigger, maze-like maps" as the next design vector,
and now by a bounded Fullscreen/Larger Maze Pass after Scale Pass 1
(`artifacts/playtests/0003-trail-of-embers-scale-pass-1-playtest.md`) leaned
GREEN and recommended testing a still-larger, tighter, more complicated map
using more of the browser window. It does not choose Trail of Embers as the
final game, does not authorize production implementation, and is not itself
a playtest result.

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

Prototype testing shortcut:
- Press number keys 1–6 to jump directly to a level.

## Level / challenge structure

Six fixed, hand-placed levels (three from Challenge Pass 1, one larger maze
from Scale Pass 1, one larger still from the Fullscreen/Larger Maze Pass,
and one bigger and tighter still from the bounded maze pass). The HUD shows
the current level. Winning a level offers **N** to continue; losing
restarts the same level with **R**. The core loop is identical in all
six — only simple per-level data varies (start positions, safe zone,
obstacle rectangles, playfield size, and per-level beast speed and ember
tuning).

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
4. **The Ember Maze** (Scale Pass 1) — one larger hand-authored maze on a
   1280×760 playfield (~1.9× the area of levels 1–3, which are unchanged at
   900×560). Three horizontal wall bands divide the field into a top
   corridor, a long east–west hall, a row of mid chambers, and a bottom
   corridor; baffles weave the hall. The intended route runs up the left
   side, east along the hall (where the beast starts, mid-map), then up
   through the single gap above column three into the top corridor and east
   to the stone circle. Deliberate design beats:
   - **Planned bait point** — a small pocket hangs below the hall's east
     end, directly under the final climb. Stepping in, dropping an ember,
     and climbing while the beast dives into the pocket is the natural play
     before the finish. (Baiting the beast off the head-on hall encounter
     is the other one.)
   - **Map-memory moment** — the wide, inviting shaft on the far right of
     the bottom corridor looks like a shortcut to the circle but is sealed
     at the top: the maze's one dead end, learnable in a single failed
     attempt. A central spine (gaps above and below the middle chamber)
     gives a bail-out loop, so the correct route doesn't demand perfect
     execution.
   - **Tuning** — reuses level 3's ember numbers (1.5s cooldown / 4.0s
     lifetime, so the same emergent three-hot-ember limit applies); beast
     speed 140 sits between levels 1–2 (130) and level 3 (150), because the
     larger field amplifies the wall-ghosting beast's straight-line
     advantage over the player's walled routes.
5. **The Deep Maze** (Fullscreen/Larger Maze Pass) — one larger still
   hand-authored maze on a 1600×900 playfield (~1.25× the area of level 4).
   Four horizontal bands divide the field into a bottom orientation
   chamber, a weaving middle hall, a landmark hall, and a top approach
   corridor. The intended route: leave the start chamber through its one
   real gap, thread the weave hall's two baffles (pass low, then high),
   take the main band gap up past a large landmark block, skirt the bait
   nook beside the final gap, then thread one last lateral jog to the
   circle. Deliberate design beats:
   - **Orientation chamber** — the start chamber has one real exit gap and
     a small low wall placed clear of both the start and the exit, so the
     player learns wall-sliding before anything is chasing them.
   - **Fair dead end** — a second, equally wide gap in the start band looks
     like an identical shortcut but only leads to a pocket sealed at the
     top: one failed attempt teaches the map, same as level 4's shaft.
   - **Bail-out loop** — a narrow gap in the band above the weave hall
     drops straight down beside the landmark block, letting a chased player
     duck between the weave hall and the landmark hall without finishing
     the far baffle, distinct from the dead end.
   - **Landmark** — one large block sits alone in the landmark hall as a
     recognizable waypoint you loop around either side of; the bail-out gap
     surfaces right beside it.
   - **Planned bait pocket** — a shallow nook open only at the top sits
     beside the final gap into the approach corridor: step in, drop an
     ember, climb back out and past while the beast dives in.
   - **Map-memory moment** — the final approach corridor forces one more
     lateral jog before the circle, rewarding players who remember the
     layout instead of beelining.
   - **Tuning** — reuses level 4's ember numbers (1.5s cooldown / 4.0s
     lifetime); beast speed 145 sits just above level 4's 140, since the
     still-larger field further amplifies the wall-ghosting advantage.
   - **Display** — the canvas now has a CSS `max-width`/`max-height` cap
     (96vw / 88vh) so it shrinks to fit smaller browser windows while
     keeping its field-pixel resolution (and therefore all collision math)
     unchanged; on a large enough monitor it displays near-native size.
     This is a plain aspect-ratio-preserving scale, not a camera or
     responsive-layout system.
6. **The Coiled Maze** (bounded maze pass) — bigger and tighter still, on an
   1800×1000 playfield (1.25× the area of level 5). Six horizontal bands
   (one more than level 5's four) split the field into six strips; the
   route coils in a full S-shape — climb the right side, then the left,
   then the right, then the left, then the right again to the circle — a
   longer, tighter weave than any previous level. Deliberate design beats:
   - **Orientation wall** — a small low block in the start strip, clear of
     the start and the climb, the same early wall-sliding teach as level
     5's start chamber.
   - **Fair dead end** — a second gap beside the real climb out of the
     start strip looks identical but opens onto a small pocket sealed on
     every side except that gap: one failed attempt teaches it, same motif
     as levels 4–5, positioned so it never blocks the main route.
   - **Intentional squeeze** — a deliberately narrow (30px, half the width
     of any other gap on this map) chokepoint partway through the first
     coil — tighter than any passage in a previous level.
   - **Wide bait chamber** — the beast's home strip opens into a wide, open
     room around a single landmark block right before the exit gap: room
     to circle the beast, drop an ember, and slip past.
   - **Bail-out loop** — a narrow secondary gap partway along the third
     coil drops a chased player straight into the next strip, skipping the
     back half of that coil without skipping the whole level.
   - **Landmark** — one recognizable block in the third strip, a waypoint
     to loop around, beside the bail-out gap.
   - **Final jog** — one last lateral step before the circle, rewarding
     players who remember the layout over ones who beeline.
   - **Tuning** — beast speed 150 (matches level 3, just above level 5's
     145) since the extra band and tighter gaps further amplify the
     wall-ghosting straight-line advantage; ember cooldown/lifetime reuse
     levels 4–5's numbers (same emergent three-hot-ember limit).

## What changed in the bounded maze pass

- Level 6, "The Coiled Maze," as described above — new level data only.
- The final win message now says six levels instead of five.

Nothing else changed in this pass: beast AI rules, torch/ember/fog
rendering, the debug overlay, collision, win/lose conditions, controls, the
restart flow, player/beast speed, collision radii, ember cooldown/duration,
and levels 1–5 are untouched.

## What changed in the Fullscreen/Larger Maze Pass

- Level 5, "The Deep Maze," as described above — new level data only.
- The canvas gained a CSS `max-width: 96vw; max-height: 88vh` cap so larger
  levels scale down to fit the browser window instead of overflowing it.
  This is display-only: canvas width/height attributes (and therefore all
  in-game coordinates and collision) are unchanged, and levels 1–4 are
  unaffected in practice since none of them approach that cap on a normal
  screen.
- The final win message now says five levels instead of four.

Nothing else changed in this pass: beast AI rules, torch/ember/fog
rendering, the debug overlay, collision, win/lose conditions, controls, the
restart flow, and levels 1–4 are untouched.

## What changed in Scale Pass 1

- Level 4, "The Ember Maze," as described above — new level data only.
- Per-level playfield size: `LEVELS` entries may specify `fieldW`/`fieldH`,
  defaulting to the original 900×560. The canvas, fog layer, and HUD resize
  on level load. Levels 1–3 are pixel-identical to Challenge Pass 1.
- The final win message now said four levels instead of three.

Nothing else changed in this pass: beast AI rules, torch/ember/fog
rendering, the debug overlay, collision, win/lose conditions, controls, and
the restart flow are untouched.

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

Scale Pass 1 adds one more axis: **does the proven loop survive scale?**
Readability, mood, and the fairness of beast wall-clipping have only been
validated at single-screen 900×560 scale. Level 4 asks whether Trail of
Embers still feels readable, tense, and fair when the play space becomes
larger and more maze-like — with difficulty coming from route learning,
memory, timing, and bait placement, not from unreadability. Bigger, not
broader: no new systems were added.

The Fullscreen/Larger Maze Pass sharpens the same axis into one question:
**can Trail of Embers create controlled disorientation that is learnable,
fair, tense, and retryable on a larger, more maze-like map?** Scale Pass 1's
playtest leaned GREEN and drew the line between two outcomes to watch for
going forward:

> Good lost: "I do not know the map yet, but I can learn it."
> Bad lost: "I do not understand what happened or where I can go."

Level 5 is bigger and tighter than level 4, not broader: no new systems, no
new enemy, no procedural generation — only more deliberate route structure
(an orientation chamber, a weave, a fair dead end, a bail-out loop, a
landmark, a bait pocket, and a final memory-reward approach) plus a display
change (CSS canvas scaling) so the larger field is comfortable in more
browser windows.

## Fullscreen/Larger Maze Pass Playtest

Run the new larger level (5, "The Deep Maze") at least 3 times.

1. Did the larger/fullscreen map feel more exciting than Level 4?
2. Did it create "good lost" or "bad lost"?
3. Could you form a better route after one or two failed attempts?
4. Did landmarks, loops, or spatial motifs help you learn the map?
5. Did any dead end feel fair rather than cheap?
6. Did embers still feel like planned tools rather than panic spam?
7. Did beast ghosting remain fair at this scale?
8. Was beast pressure too low, too high, or about right?
9. Did the full-window or larger canvas feel comfortable?
10. Is this larger-map direction more promising than adding new mechanics?

## Playtest questions for the scale pass (level 4)

- Can a plan be formed after one or two failed attempts, or does the maze
  feel arbitrary? Is the route learnable and fair?
- Does the dead-end shaft read as "my mistake, now I know the map," or as a
  cheap trap?
- Does the pocket below the final climb get discovered and used as a
  deliberate bait room? Does baiting there feel like the puzzle clicking?
- Does beast wall-clipping still read as fair "ghost mode" on the larger
  field, where its straight lines cut across much more of your route?
- Does the bigger space stay tense, or does it turn into stretches of
  boring dark walking between encounters?
- Does the emergent three-ember limit still register at this scale, or does
  the larger field make embers feel scarce/unfair?
- Is the larger canvas comfortable on your screen, or is a scrolling
  camera becoming necessary (currently a deliberate non-goal)?
- Does fast retry still hold up — is pressing R immediately after a loss
  still the instinct, even with a longer route to re-run?

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

- Six fixed single-screen dark levels (not procedural), each a handful of
  hardcoded obstacle rectangles. Levels 1–3 run at 900×560, level 4 at
  1280×760, level 5 at 1600×900, level 6 at 1800×1000 (the canvas resizes
  per level — no scrolling camera; a CSS `max-width`/`max-height` cap
  shrinks the display to fit smaller windows without changing field-pixel
  coordinates).
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

- No procedural generation — all five levels are hardcoded data.
- No true responsive/fullscreen layout, camera, or viewport system —
  level 5's bigger space comes from a bigger canvas plus a CSS scale-to-fit
  cap, so the whole field is still always fully rendered (the fog is what
  hides it), just displayed smaller on tight windows. If maps grow past
  what a CSS scale can keep comfortable, a camera becomes a real (currently
  unauthorized) decision.
- No explicit ember inventory/cap — levels 4–6 keep the three-ember limit
  emergent from cooldown/lifetime tuning, same as level 3.
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
  pathfinding beyond direct movement toward the target point"). Levels 2–6
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
