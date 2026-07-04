# Trail of Embers — Challenge Pass 1 Playtest (0002)

ARTIFACT TYPE: Playtest evidence
AUTHORITY: DRAFT — playtest evidence only, not source-of-truth
STATUS: Draft, human-gated. Does not select Trail of Embers as the final
game, does not authorize production implementation, and does not authorize
source-of-truth edits.

DATE: 2026-07-04
PROTOTYPE TESTED: `prototypes/trail-of-embers/` (commit `ddcd94f`, "Add
Trail of Embers challenge pass 1" — three fixed levels: First Light, The
Guarded Circle, The Long Dark)
RUN COMMAND:

```
open prototypes/trail-of-embers/index.html
```

TESTER: Ian (self-playtest, all three levels)

## Ian's playtest notes

### Challenge Pass 1 questions

1. Does Level 2 actually require an intentional bait drop?
   - Yes.
   - Level 2 makes the player confident after Level 1, then catches a
     predictable move. This humbles the player in a good way.
   - The player realizes they need to drop an ember as bait immediately,
     then route around the beast.
   - After that realization, the level flows smoothly.

2. Is Level 3 hard-but-fair rather than confusing?
   - Yes.
   - Limiting active embers to three at one time was effective for
     difficulty.
   - This added a fun additional element.

3. Does wall-clipping beast behavior remain readable or feel unfair?
   - It remains readable and acceptable.
   - The player still seems to have an advantage.
   - Giving the beast "ghost mode" feels like fair leveling rather than
     unfairness.

### Per-level playtest questions

1. Did Ian understand the route and threat quickly?
   - Yes. The game is about learning the map quickly and planning a route.

2. Did embers feel like planned bait rather than panic spam?
   - Yes. Embers are fun and important, almost like the player's
     weapon/tool.

3. Did the beast clipping through walls feel acceptable, weird-but-readable,
   or unfair?
   - Acceptable. Beast ghost mode felt like fair leveling.

4. Did losing feel deserved?
   - Yes. Everything remains predictable.
   - If the player loses because they assumed the rules were the same as
     the last level, that is good progressive difficulty because the level
     teaches them.

5. Did Ian want to retry?
   - Yes. Ian is excited to progress the game further.

### After Level 3

6. Did increased difficulty preserve the original good mood?
   - Yes. The three-ember restriction added a fun additional element.

7. Was the challenge from timing/memory/control, or from confusion?
   - The challenge came from quickly memorizing the map and executing a
     run with good timing and control.

8. Which single number/layout would Ian change first?
   - The next obvious step is to make the game bigger.
   - Ian imagines a full-screen monitor-scale map that is more complicated,
     maze-like, achievable, and winnable.
   - This could become a very good game if scaled carefully.

## Summary interpretation

Challenge Pass 1 leans GREEN. The added difficulty preserved readability
and mood: harder levels were still read as fair, losses stayed attributable
to player error, and the tone survived the pressure increase. The next
design vector should be larger fixed maps / maze-like spaces, not new
systems. Beast ghosting (wall-clipping) is currently acceptable and may be
part of the game's identity.

Note on the "three active embers" constraint: Ian experienced Level 3 as
limiting active embers to three at a time. Verified against the code
(`index.html`): there is no explicit cap — `tryDropEmber` checks only the
cooldown — but Level 3's tuning (1.5s ember cooldown, 4.0s ember lifetime)
makes at most three embers hot simultaneously (drops at 0s/1.5s/3.0s; the
first cools at 4.0s before a fourth can land at 4.5s). The constraint Ian
felt is therefore real and implemented, emergently rather than as a
hardcoded limit. This is now documented in the prototype README. If a
future pass wants the three-ember cap as an explicit rule (independent of
tuning), it should be implemented deliberately.

## Positive signals

- Level 2's designed lesson landed exactly as intended: confidence from
  Level 1, a humbling catch, then the intentional-bait realization —
  after which the level flowed.
- Level 3 read as hard-but-fair; the (emergent) three-ember limit added a
  fun element rather than frustration.
- Beast wall-clipping stayed readable under higher pressure and was
  framed by the tester as fair leveling ("ghost mode"), not cheating.
- Embers read as the player's weapon/tool — planned bait, not panic spam.
- Losses felt deserved; rule changes between levels were experienced as
  good progressive difficulty that teaches.
- Strong replay pull and enthusiasm to progress the game further.
- The challenge came from map memorization, timing, and control — not
  from confusion.

## Risks / caveats

- Single self-playtest by Ian only; no outside/blind tester data yet.
- The three-ember constraint is emergent from tuning, not an explicit
  rule — future tuning changes could silently remove a mechanic the
  tester valued (see note above).
- "Bigger, maze-like maps" is a scale change: readability, mood, and the
  fairness of beast wall-clipping have only been validated at
  single-screen scale and may not transfer directly.
- GREEN reads so far come from a tester with full knowledge of the design
  intent.

## Recommended next step

A bounded bigger-map pass: one larger (toward full-screen monitor-scale)
fixed, hand-placed, maze-like level that is achievable and winnable, to
retest readability, mood, and beast-ghosting fairness at scale — not new
systems. Not yet authorized; requires explicit prompting after review of
this artifact.
