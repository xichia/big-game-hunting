# Trail of Embers — Probe Prototype

ARTIFACT TYPE: Probe (playable prototype)
AUTHORITY: PROBE
STATUS: Draft — Level 8 Beast-Gate pass (added beast-activated gate, trigger zone, and Level 8), Level 9 One-Way Passages probe, and Level 10 Beast Errand probe (combining Cinder Cache, Beast Gate, and One-Way Passages) untested, human-gated
SOURCE-OF-TRUTH FILES TOUCHED: none

This is the playable build for the probe defined in
`artifacts/probes/0002-trail-of-embers-probe-brief.md`, extended by a
bounded Challenge Pass 1 after the first playtest
(`artifacts/playtests/0001-trail-of-embers-first-playtest.md`) came back
positive but easy, then by a bounded Scale Pass 1 after Challenge Pass 1
(`artifacts/playtests/0002-trail-of-embers-challenge-pass-1-playtest.md`)
leaned GREEN and named "bigger, maze-like maps" as the next design vector,
then by a bounded Fullscreen/Larger Maze Pass after Scale Pass 1
(`artifacts/playtests/0003-trail-of-embers-scale-pass-1-playtest.md`) leaned
GREEN and recommended testing a still-larger, tighter, more complicated map
using more of the browser window, and now by a bounded Cinder Cache pass
that adds the probe's first positive collectible (see below) alongside a
seventh level. It does not choose Trail of Embers as the final game, does
not authorize production implementation, and is not itself a playtest
result.

## How to run

No build step, no dependencies. Open the file directly in a browser:

```
open prototypes/trail-of-embers/index.html
```

(Or double-click `index.html` in Finder — any modern browser works.)

## Controls

- **Arrow keys / WASD** — move
- **Space** — drop an ember at your current position (Space input is now edge-triggered/tap-based globally; holding Space no longer auto-repeats ember drops, and players must tap Space for each ember to support the Cinder Charge safely)
- **R** — restart the **current level** at any time (including after win/loss)
- **N** — advance to the next level (only after winning the current one)
- **Shift+R** — full reset back to level 1
- **M** — toggle mute (toggles the audio engine mute state)
- **G** — toggle debug view (shows torch/ember radii and the beast's current AI state + target line)
- **Esc / quit** — not implemented; just close the browser tab (there is no launch menu to exit from)

Gamepad / Controller Support (Standard mapping):
- **Left Stick / D-Pad** — move
- **A / Cross Button (Button 0)** — drop an ember / spend Cinder Charge (edge-triggered; must release and press again to drop multiple)
- **Start / Menu Button (Button 9)** — restart current level

Prototype testing shortcut:
- Press number keys 1–9 to jump directly to a level. Press 0 for Level 10.

## Level / challenge structure

Ten fixed, hand-placed levels (three from Challenge Pass 1, one larger
maze from Scale Pass 1, one larger still from the Fullscreen/Larger Maze
Pass, one bigger and tighter still from the bounded maze pass, one from
the Cinder Cache pass, one from the beast-gate probe pass, one from the
one-way passages probe pass, and one synthesis probe combining all three
mechanics). The HUD shows the current level. Winning a level offers **N**
to continue; losing restarts the same level with **R**. The core loop is
identical in all ten — only simple per-level data varies (start
positions, safe zone, obstacle rectangles, playfield size, per-level beast
speed and ember tuning, Cinder Cache placement, gate/trigger zone
configuration on levels 8 and 10, and one-way passage placement on levels
9 and 10).

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
7. **The Ember Ring** (Cinder Cache pass, level redesigned after Ian's
   playtest — see "Revision 2" below) — same 1800×1000 scale as level 6
   (same approximate size, per Ian's direction), but a genuinely different
   spatial problem, not another banded coil: one open **arena** ringed by
   just two boundary walls (arena-to-start, arena-to-corridor), each with a
   single gap, split by one **central island** into two lanes. Deliberate
   design beats:
   - **Two lanes, two different risks** — the west lane (direct) has the
     beast starting right in it (700,550): fast, short, and risky because
     you meet the beast cold, with no time to prepare a bait. The east lane
     (the long way round) starts far from the beast and buys real time —
     safer at first — but both lanes funnel back through the same single
     exit gap on the west side, so an east-lane player still has to cross
     back over the open strip above the island, directly between the
     beast's den and the exit. That crossing is the level's one
     unavoidable exposed moment, regardless of which lane you took.
   - **Cinder Cache, off the direct route entirely** — a sealed alcove
     (roofed and walled on three sides, open only from the lane side, the
     same proven "out-and-back, no shortcut" shape as level 5's bait nook)
     sits on the far east wall, ~550px off the island and nowhere near the
     west lane. Skipping it costs nothing extra. Fetching it costs real
     distance and time, and risks being cornered in a dead end if the
     beast is already in pursuit.
   - **Where the payoff lands** — the cache grants a held Cinder Charge
     (see "Revision 3" below) rather than an immediate effect, and the
     level's one unavoidable exposed crossing back toward the beast's side
     of the map is the moment that charge is *for*: get caught there
     mid-cooldown and spending it is a felt, plausible save — without ever
     being mandatory, since the level is fully finishable without it.
   - **Final weave** — a small tight S-turn (two baffles) between the exit
     gap and the circle, the same "weave before the goal" motif as earlier
     levels, at a much smaller scale.
   - **Tuning** — keeps level 6's beast speed (150) and the first Cinder
     Cache draft's longer ember cooldown (3500ms vs. 1500ms everywhere
     else), since a longer cooldown is what makes both a normal drop and a
     spent charge feel consequential; ember lifetime (4000ms) is unchanged.
8. **The Gatekeeper's Keep** (beast-gate probe pass) — same 1800x1000 scale family as levels 6–7. It introduces the first beast-activated gate. Deliberate design beats:
   - **Main Chokepoint Gate** — The gate sits at a central doorway (`y=250`), completely blocking passage to the safe zone when closed. It does not block the beast, who can move through it freely.
   - **Co-located Trigger Zone** — A subtle rectangular rune floor sigil (`y=180` to `320`) marks the doorway. The gate remains open only while the beast is inside this zone.
   - **Tense Luring Sequence** — The player must detour to collect a Cinder Cache, arrive at the closed gate, drop a bait ember to draw the beast into the trigger zone, slip through as the gate opens, and then use their stored Cinder Charge to survive the final escape beat to the safe zone.
   - **Lit Causal Indicator** — To ensure the relationship between the beast's position and the gate state is clear, the beast is dynamically lit/visible when it enters the trigger zone and opens the gate.
   - **Tuning** — Reuses level 7's 3500ms cooldown and 4000ms ember lifetime to make the Cinder Charge near-essential for the escape beat.
9. **The Crossroads** (one-way passages probe) — same 1800×1000 scale as levels 6–8. It uses two directional corridor gates to teach a learnable wrong-turn lesson rather than offering a shortcut. Deliberate design beats:
    - **A clear T-junction** — a central vertical wall at `x=700` with a single gap at `y=440–560` splits the bottom-center start area from the upper routes, creating an unambiguous left/right decision point.
    - **Left is correct** — going left from the crossroads leads up the west side of the map, past a pair of horizontal baffles, and into the safe zone in the upper-left corner.
    - **Right is a tempting loop** — going right passes through a rightward-only gate at `x=1100` into the upper-right area. From there the player must climb, cross east to west along the top, and come back down through a leftward-only gate at `x=400` — returning to the west side of the central wall, near the same crossroads, having wasted time but learned the lesson.
    - **Low-stakes lesson** — the beast starts far away in the upper-right (`1600,150`) and moves at 140 px/sec, so the loop is punishing by time loss, not lethal.
    - **Beast ignores passages** — the beast still moves in straight lines through all obstacles and gates, so the wrong turn trades time for exposure in its territory.
    - **Diegetic readability** — each gate is marked with a worn floor tint and blocky chevron arrows pointing the allowed direction, visible inside the player's torch radius with no text labels or portal effects.
    - **No new resources** — no Cinder Cache, no gate, no tutorial panels; the probe is purely about whether directional passages can make a wrong turn legible and recoverable.
     - **Tuning** — beast speed is lowered to 140 (from level 6's 150) to keep the loop forgiving, with the standard 1500ms cooldown / 4000ms lifetime so the only new variable is the one-way geometry.
10. **The Beast Errand** (Level 10 synthesis probe) — same 1800×1000 scale as levels 6–9. First level combining Cinder Cache, Beast Gate, and One-Way Passages. Deliberate design beats:
     - **Start bottom-left, beast far upper-right** — player begins in a small start chamber; beast starts distant, proximity rumble faint.
     - **T-junction route choice** — a central vertical wall creates an unambiguous left/right decision. Left leads toward the closed gate (teachable dead end: player arrives with no charge, learns they need the other route). Right leads toward the cache and one-way commitment.
     - **Cinder Cache alcove** — sealed three-sided nook off the right corridor, same "out-and-back" shape as Level 7. A meaningful detour but not a chore; player arrives at the one-way with charge in hand.
     - **One-way commitment passage** — rightward-only passage through an interior wall into the beast's territory. Point of no return; cannot go back.
     - **Lure chamber** — mostly open area in beast territory with room to circle and position. Beast roams here.
     - **Beast Gate with co-located trigger** — gate between lure chamber and safe zone; trigger zone overlaps the gate doorway. Beast enters trigger → gate opens. Causal relationship is visible: player drops ember at threshold, beast chases into the lit zone, gate opens in the same moment.
     - **Short escape** — safe zone is a short tense dash past the open gate. Cinder Charge is the safety net if cooldown isn't ready, but not mandatory.
     - **Tuning** — beast speed 145 (between Level 8's 150 and Level 9's 140), ember cooldown 3500ms (same as Levels 7–8), ember lifetime 4000ms (same as Levels 3–9).

## What changed in the One-Way Passages Probe Pass

- **Level 9, "The Crossroads"** — a new 1800×1000 level with two one-way passages arranged as a learnable wrong-turn loop at a T-junction, as described above.
- **One-way passage collision** — `player.prevX`/`player.prevY` track movement direction. In `updatePlayer`, any passage the player is moving against is temporarily added to the obstacle list for that frame's axis-independent collision resolution.
- **Direction encoding** — passages use `"up"`, `"down"`, `"left"`, `"right"` to indicate the allowed movement direction.
- **Beast behavior unchanged** — the beast ignores one-way passages exactly like it ignores all other obstacles.
- **Diegetic rendering** — `drawOneWayPassages()` paints a subtle floor marking and blocky chevron arrows inside each passage; called from `drawWorld()` after obstacles.
- **Validation updates** — `validate-levels.js` checks passage bounds, direction validity, minimum size, obstacle overlap, reachability with one-way rules, and reachability when passages are treated as solid walls.
- **Nothing else changed** — embers, cooldowns, Cinder Charge, beast AI, gate behavior, controller behavior, audio behavior, and levels 1–8 remain entirely unchanged.

## What changed in the Beast-Gate Probe Pass

- **Beast-Activated Gate & Trigger Zone** — Adds a new gating mechanic where the gate is only open when the beast is positioned within the co-located trigger zone.
- **Portcullis Visuals & Sigil marking** — Gate has custom portcullis barred visuals (horizontal bars, retracted when open), and the trigger zone is rendered as a subtle rectangular floor rune/sigil.
- **G Debug Overlay Extension** — Pressing `G` now overlays the trigger zone boundaries, gate boundaries, and explicit gate status (OPEN/CLOSED).
- **Two-State Level Validation** — The level validator (`validate-levels.js`) now checks gated levels to ensure the safe zone is unreachable while closed, but reachable when open, and verifies trigger zone reachability and bounds.
- **Lit Beast Indicator** — Fog rendering punches a light hole around the beast when it triggers the gate to make the causality clear.
- **Nothing else changed** — Embers, cooldowns, Cinder Charge, beast AI, controller behavior, audio behavior, and levels 1–7 remain entirely unchanged.

## What changed in the Audio/Proximity Cue Pass

- **Proximity Rumble** — A non-directional, Web Audio API synthesized rumble (~110 Hz carrier modulated by a dynamic rate LFO) that scales in volume and pulse rate as the beast gets closer to the player.
- **Ember Click** — A subtle, sub-100ms click triggered on every successful ember drop.
- **Win/Loss Stingers** — A brief rising triangle sweep on win, and a brief falling sawtooth ramp on loss.
- **Mute Control & HUD Status** — Added a mute toggle key (`M`) and corresponding HUD text (`sound: on` / `sound: muted`).
- **Nothing else changed** — Beast AI, collision, level layout, movement speed, cooldown timing, Cinder Charge mechanics, and levels 1–7 remain entirely untouched.

## What changed in the Cinder Cache pass

- Level 7, "The Ember Ring," as described above — new level data only.
- One new mechanic: the **Cinder Cache**, a collectible that only exists on
   levels whose data lists one (currently levels 7, 8, and 10). See "What's
  implemented" below.
- The final win message now says seven levels instead of six (and is no
  longer hardcoded to a specific number).
- `validate-levels.js` gained bounds/obstacle-clearance/reachability checks
  for any level's `cinderCaches` entries (see "revision" notes below).

Nothing else changed in this pass: beast AI rules, torch/ember/fog
rendering, the debug overlay, collision, win/lose conditions, controls, the
restart flow, player/beast speed, collision radii, ember cooldown/duration
on levels 1–6, and levels 1–6's level data are untouched.

### Revision 1 (post-audit)

A first draft of this pass was reviewed and sent back (FAIL/REVISE) because
the detour wasn't actually a detour, the reward often did nothing, cache
reachability wasn't validated, and pickup had no feedback. This revision
(still on the original "Cinder Hoard" map, a banded coil like level 6):

- **Reshaped the nook so the skip route is real.** Widened the gap under
  the nook to a full-width, always-clear 40px lane, and moved the beast's
  start into the nook itself so fetching the cache meant stepping into its
  den, not just passing near it.
- **Gave level 7 its own ember cooldown** (3500ms, up from 1500ms) so the
  cache's refresh is a felt event.
- **Added pickup feedback**: a brief expanding glow-pop at the pickup point
  (`cacheBursts`, self-clearing after 500ms) and a short HUD message
  ("cinder cache collected — ember ready!", `#cache-status`, ~900ms).
- **Extended `validate-levels.js`** to BFS-check each Cinder Cache's
  reachability from the player start.

### Revision 2 (post-Ian-playtest — new map)

Ian then playtested Revision 1 and sent it back on design grounds, not
mechanical ones: the mechanic worked, but "The Cinder Hoard" was still
level 6's banded-coil map with a nook added, so the cache route was never a
real decision — straightforward to fetch, unnecessary, and it "felt like a
distracting gimmick" rather than something specifically useful for the
level. His call: keep the mechanic, same approximate size is fine, but it
needs to be a genuinely new map built around the collectible.

This revision replaces the level 7 map entirely with "The Ember Ring" (an
open arena split by one central island into a direct lane past the beast
and a longer, safer lane around it — see the level-7 description above) and
relocates the Cinder Cache into a sealed alcove off the long lane, timed so
its payoff (a refreshed ember) lands on the one exposed crossing every
route must eventually make. Nothing about the mechanic itself changed from
Revision 1: touching the cache still just refreshes the ember cooldown,
with the same feedback, the same `cinderCaches`/`CACHE_RADIUS` plumbing, and
the same `validate-levels.js` checks (bounds, obstacle clearance,
reachability) — only level 7's map/beast-start/cache-position data changed.

No new files, no new levels, no scope beyond level 7's data; levels 1–6 and
the core loop are untouched.

### Revision 3 (post-Ian-playtest — stored charge, mechanic change)

Ian playtested Revision 2's new map and called it "way better" — the arena
and lane choice landed — but said the cache was "still not really
necessary." His diagnosis: Revision 1/2's cache spent itself the instant
you touched it (an immediate cooldown refresh), which is only ever useful
if you happen to touch it at exactly the right moment relative to your own
cooldown — otherwise it's a no-op. His fix: don't spend it immediately.
Keep it as a held, stored one-use resource you can spend later, whenever
you actually need it. That way the level doesn't have to force a single
"correct" pickup moment — it only has to teach that the resource exists and
that it's yours to use if a moment calls for it.

This revision keeps Revision 2's map (The Ember Ring) and cache placement
entirely unchanged — same alcove, same position, same `cinderCaches` entry
— and changes only what touching the cache *does*:

- **Cinder Cache** (the collectible on the ground): unchanged — a
  collectible placed in level data, removed on touch. It now grants one
  stored **Cinder Charge** instead of an immediate cooldown refresh. The
  player can hold at most one at a time (moot on level 7, which places only
  one cache, but the code caps it defensively).
- **Cinder Charge** (the new held resource): while the normal ember
  cooldown is ready, pressing **Space** drops a normal ember exactly as
  before and the held charge is untouched — fetching the cache and then
  dropping embers normally never wastes it. While the normal cooldown is
  *not* ready, pressing **Space** with a charge held consumes it and drops
  an ember immediately; spending it does not affect or reset the normal cooldown clock,
  allowing the original normal cooldown to continue running in the background. No new control —
  still just **Space**, reusing the
  existing ember-drop input.
- **Feedback**: pickup shows "cinder charge ready" (`#cache-status`,
  ~900ms, same slot/timing as the old pickup message); while a charge is
  held and no other cache message is active, the same span shows a
  lightweight persistent "cinder charge: held" status; spending it shows
  "cinder charge spent" (~900ms). All three share the one `#cache-status`
  HUD span — no new UI element. An ember dropped by spending a charge also
  gets one tiny, cheap visual tell (its sprite's hot core swaps to the
  cache's near-white color instead of pale yellow) so an attentive player
  can tell which kind of drop just happened, without a new silhouette.
- **Reset scope**: the held charge (and the pickup/spend message timers)
  reset with the rest of level state on **R**/**Shift+R**, same as the
  cache itself — no carryover between levels or across a restart, per the
  brief.

Levels 1–6, the map/tuning/beast-start/cache-position data for level 7, and
`validate-levels.js` are all unchanged from Revision 2 — this revision only
touches the mechanic's runtime behavior (`tryDropEmber`, the pickup
handler, and the HUD status text) in `index.html`.

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

The Cinder Cache pass adds the probe's first new axis since the original
brief: **does a positive collectible add decision-richness to the core
loop, or does it dilute the light-as-bait tension?** Levels 1–6 tested the
loop under increasing spatial and scale pressure with no new mechanics;
level 7 asks whether a single, optional, legible pickup — now a stored,
spend-whenever-you-need-it charge rather than an immediate effect — can
make route planning richer (a detour worth weighing, and a resource worth
banking) without turning into a chore, a required key, or a way to
trivially out-run the beast.

The One-Way Passages probe adds one more narrow experiment:

> Does adding directional one-way passages create readable, tense route decisions, or does it introduce confusing geometry that players fight against?

It tests whether players can read the arrow markings, understand that the shorter cut is optional, and feel the tradeoff between the safe long loop and the dangerous shortcut through the beast's side of the map.

The Audio/Proximity Cue Pass adds one narrow probe/experiment to this build:

> Does a subtle, non-directional proximity audio cue increase tension and readability without making the beast feel predictable or reducing the fear of darkness?

## Cinder Cache Pass Playtest

Run level 7, "The Ember Ring," at least 3 times — at least once taking the
west (direct) lane, once taking the east lane and fetching the cache and
later spending the charge, and once finishing the level without ever
fetching the cache at all.

1. Did level 7 feel like a genuinely new map — an arena and a lane choice —
   rather than level 6's coil with a pickup added?
2. Did the west lane read as risky specifically because it drops you near
   the beast immediately, versus the east lane buying you real distance?
3. Did fetching the cache feel like a deliberate detour that cost you time
   and position (and risked a corner in the alcove if the beast was
   already close), rather than a pickup sitting on the path you were
   already taking?
4. Did skipping the cache and taking the east lane straight to the exit
   feel just as viable as fetching it — no implicit penalty for skipping,
   and no sense that the level required it?
5. Did holding the charge feel legible — did the "cinder charge: held" HUD
   status make it clear you were carrying something without checking a
   menu — and did a moment later in the level (most likely the exposed
   crossing back toward the beast's den) make you actually want to spend
   it, rather than it going unused the whole run?
6. Did the pickup register clearly — the glow-pop and "cinder charge
   ready" message — even on a run where your own ember cooldown had
   already lapsed?
7. Did spending the charge mid-cooldown read clearly as a deliberate save
   (the "cinder charge spent" message, the tinted ember) rather than a
   confusing extra ember appearing?
8. Did the charge ever feel like it trivialized the level (freely spamming
   embers) rather than adding one held-in-reserve option?
9. Was the cache, the held-charge status, or a charge-spent ember ever
   confused with a dropped ember or the safe zone at a glance?
10. Did beast ghosting still read as fair on this map?
11. Compared to Revision 2 (immediate refresh on pickup), did holding the
    charge for later make the cache feel more worth fetching, or did it
    still feel unnecessary?

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

- Ten fixed single-screen dark levels (not procedural), each a handful of
   hardcoded obstacle rectangles. Levels 1–3 run at 900×560, level 4 at
   1280×760, level 5 at 1600×900, levels 6–10 at 1800×1000 (the canvas
   resizes per level — no scrolling camera; a CSS `max-width`/`max-height`
   cap shrinks the display to fit smaller windows without changing
   field-pixel coordinates).
- **Cinder Cache / Cinder Charge** (levels 7, 8, and 10): a small pulsing pickup
  placed via an optional per-level `cinderCaches` array in the level data —
  levels without the field simply have none. Touching one removes it and
  grants one stored **Cinder Charge** (at most one held at a time); no
  inventory menu, no score, no key/lock. The charge does nothing on its
  own — it's spent later: pressing **Space** while the normal ember
  cooldown is ready always does a normal drop and leaves the charge
  untouched; pressing **Space** while the cooldown is *not* ready, with a
  charge held, consumes the charge and drops an ember immediately,
  without affecting or resetting the normal cooldown clock. No new control — reuses **Space**. Visually the
  cache pickup is a small warm diamond sprite with a pulsing near-white
  core, drawn in the same blocky `PX`-lattice style as everything else —
  deliberately a different silhouette and animation from the tall, static
  dropped-ember flame, and much smaller than the safe zone's stone ring, so
  the three never read as the same thing; an ember dropped by spending a
  charge gets one tiny visual tell (its hot core swaps to that same
  near-white color). Feedback is entirely text/glow, no new UI: a brief
  expanding glow-pop at the pickup point (`cacheBursts`, self-clearing
  after 500ms), and the one `#cache-status` HUD span cycles between
  "cinder charge ready" (~900ms on pickup), a persistent "cinder charge:
  held" while one is banked, and "cinder charge spent" (~900ms on spend).
  The charge, its pickup/spend message timers, and the cache itself all
  reset with the rest of level state on **R**/**Shift+R** — no carryover
  between levels.
- **Beast-Activated Gate** (levels 8 and 10): a horizontal gate that blocks player movement when closed but does not block the beast. It is open only while the beast is inside the trigger zone. Snapped to the rendering grid, it draws as a custom barred portcullis when closed, and retracts to the sides when open.
- **Trigger Zone** (levels 8 and 10): a rectangular floor rune/sigil co-located with the gate doorway that opens the gate when the beast occupies it, accompanied by a dynamic light punch to keep the beast visible.
- **One-Way Passages** (levels 9 and 10): directional corridor gates placed via an optional per-level `oneWayPassages` array. Each passage has an allowed cardinal direction; the player can move with that direction through the passage but is blocked when moving against it. The beast ignores them entirely. They are drawn as a subtle floor marking with blocky chevron arrows; no text labels, no glowing portal effects.
- Player movement (8-directional, arrow keys/WASD) with simple
  circle-vs-rectangle collision against obstacles.
- Constant torch radius around the player — this is the player's baseline
  visibility, and it also doubles as the beast's default "light event" (see
  AI below).
- Ember drop (Space, cooldown per level — 0.9s in levels 1–2, 1.5s in
  level 3 — Space is now edge-triggered/tap-based globally so holding it no longer auto-repeats, requiring players to tap Space for each ember to support the Cinder Charge safely) that punches a
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

- No procedural generation — all ten levels are hardcoded data.
- No true responsive/fullscreen layout, camera, or viewport system —
  level 5's bigger space comes from a bigger canvas plus a CSS scale-to-fit
  cap, so the whole field is still always fully rendered (the fog is what
  hides it), just displayed smaller on tight windows. If maps grow past
  what a CSS scale can keep comfortable, a camera becomes a real (currently
  unauthorized) decision.
- No explicit ember inventory/cap — levels 4–7 keep the three-ember limit
  emergent from cooldown/lifetime tuning, same as level 3.
- No Cinder Cache/Charge inventory menu, score, or counter beyond the one
  collectible present on level 7 and the single held charge it grants (at
  most one at a time, no carryover between levels or across a restart) —
  it disappears on pickup and its only effect is a later one-time
  cooldown-clock reset when spent.
- No adaptive/learning AI, no new enemy types — the three rules above are
  the entire beast behavior in every level.
- No randomness anywhere.
- No production audio or growl sound files — the Web Audio API synthesized proximity rumble, ember tick, and win/loss stingers in this pass are a probe/experiment, not a ratified audio direction.
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
