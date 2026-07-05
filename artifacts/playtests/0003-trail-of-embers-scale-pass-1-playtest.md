# Trail of Embers — Scale Pass 1 Playtest (0003)

ARTIFACT TYPE: Playtest evidence
AUTHORITY: DRAFT — playtest evidence only, not source-of-truth
STATUS: Draft, human-gated. Does not select Trail of Embers as the final
game, does not authorize production implementation, and does not authorize
source-of-truth edits.

DATE: 2026-07-05
PROTOTYPE TESTED: `prototypes/trail-of-embers/` (commit `805e790`, "Add
Trail of Embers scale pass 1" — adds Level 4, "The Ember Maze", with
per-level `fieldW`/`fieldH` support and an updated final win message,
"ALL FOUR LEVELS CLEAR")
RUN COMMAND:

```
open prototypes/trail-of-embers/index.html
```

VALIDATION COMMAND:

```
node prototypes/trail-of-embers/validate-levels.js prototypes/trail-of-embers/index.html
```

Validation result (Ian):

```
script evaluated OK; 4 levels; base field 900x560
level 1: First Light (900x560)
  ok   player start in bounds
  ok   beast start in bounds
  ok   safe zone in bounds
  ok   player start clear of obstacles
  ok   safe zone clear of obstacles
  ok   beast (130) slower than player (175)
  ok   safe zone reachable from player start (BFS, player-radius clearance)
level 2: The Guarded Circle (900x560)
  ok   player start in bounds
  ok   beast start in bounds
  ok   safe zone in bounds
  ok   player start clear of obstacles
  ok   safe zone clear of obstacles
  ok   beast (130) slower than player (175)
  ok   safe zone reachable from player start (BFS, player-radius clearance)
level 3: The Long Dark (900x560)
  ok   player start in bounds
  ok   beast start in bounds
  ok   safe zone in bounds
  ok   player start clear of obstacles
  ok   safe zone clear of obstacles
  ok   beast (150) slower than player (175)
  ok   safe zone reachable from player start (BFS, player-radius clearance)
level 4: The Ember Maze (1280x760)
  ok   player start in bounds
  ok   beast start in bounds
  ok   safe zone in bounds
  ok   player start clear of obstacles
  ok   safe zone clear of obstacles
  ok   beast (140) slower than player (175)
  ok   safe zone reachable from player start (BFS, player-radius clearance)

all checks passed
```

TESTER: Ian (self-playtest, Level 4 focus, three runs)

## Core playtest question

Does Trail of Embers still feel readable, tense, and fair when the map
becomes larger and more maze-like?

## Ian's playtest notes

### Run 1

1. Did the larger map feel exciting, or too spread out?
   - It was definitely better.
   - It could probably benefit from being even bigger.
   - Maximizing total screen real estate may become an ultimate goal.

2. Could Ian understand the rough route after one failed attempt?
   - Yes.
   - It was still pretty simple.
   - Complexity and difficulty can be adjusted upward.

3. Did the maze ask Ian to memorize and plan, or did he feel lost?
   - It did ask for memorization and planning.
   - It was still pretty simple.
   - Ian did not feel badly lost.
   - A controlled feeling of being lost could be a positive target
     emotion for this game.

4. Did Ian want to retry after losing or finishing?
   - Yes, because of the novelty.
   - To keep Ian engaged long-term, the game would need to become more
     complicated, interesting, and difficult.

### Runs 2–3

5. Did the bait pocket near the final climb work as intended?
   - Yes.
   - It was a good mechanic.
   - Ian was impressed that the design predicted player behavior well.

6. Did the right-hand dead end feel like a fair lesson or a cheap trap?
   - It felt like a fair lesson.
   - The player is still learning the game.
   - The player should understand that dead ends are within the realm of
     possibility.

7. Did the beast's ghost movement still feel fair at this larger scale?
   - Yes.
   - The game still is not frustratingly difficult, so ghost movement
     feels fair.

8. Was beast pressure too low, too high, or about right?
   - Low to about right.
   - It is not very difficult.
   - That is probably good for starting levels that teach the player the
     dynamics.

9. Did the bigger canvas feel comfortable in the browser window?
   - Yes, it was fine.
   - Ian thinks the game would benefit from using the entire browser
     window or entire monitor screen.

10. Is bigger-map Trail of Embers more promising than the three small
    challenge levels?
    - Yes.
    - Ian thinks the game can go bigger.
    - The map can become tighter and more complicated.

## Interpretation

Scale Pass 1 is GREEN. Bigger-map Trail of Embers is more promising than
the three small challenge levels: the larger map felt better and not too
spread out, the route remained understandable, and the maze supported
memorization and planning rather than confusion. Ian's read is that the
game can likely go bigger, tighter, and more complicated. Future
difficulty should continue to come from route learning, map memory, bait
placement, timing, and controlled disorientation — not new systems.

## Positive signals

- Scaling up improved the game.
- Larger maps did not create bad confusion.
- Bait pocket worked as designed and read as the design predicting
  player behavior well.
- The dead end was experienced as a fair lesson, not a cheap trap.
- Beast ghosting remained acceptable at the larger scale.
- The bigger canvas was comfortable in the browser window.
- Ian wants to keep developing the larger-map direction.

## Risks / caveats

- Level 4 is still too simple to sustain long-term interest.
- Beast pressure may be slightly low.
- Bigger maps could become wandering/confusing if landmarks and route
  readability do not scale along with map size.
- Full-window or full-monitor design may require layout/camera/canvas
  decisions later that have not been tested yet.
- The current 1280x760 canvas may require enough browser height; smaller
  windows may scroll.
- "Good lost" vs. "bad lost" needs to be distinguished going forward:
  - Good lost: "I do not know the map yet, but I can learn it."
  - Bad lost: "I do not understand what happened or where I can go."
- This evidence should not be used to justify adding broad new systems.
- Single self-playtest by Ian only; no outside/blind tester data yet.

## Recommended next step

A bounded "Fullscreen Maze Pass" or "Larger Maze Pass": test a
larger/full-window, tighter, more complicated hand-authored map using the
same mechanics. Do not add enemies, upgrades, inventory, story, sound,
procedural generation, or production architecture yet. Not yet
authorized; requires explicit prompting after review of this artifact.
