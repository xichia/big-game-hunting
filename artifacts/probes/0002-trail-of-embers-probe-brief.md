# Probe Brief: Trail of Embers

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — Human-gated probe input
CREATED BY: Sonnet
REVIEWED BY: not yet reviewed
DATE: 2026-07-04
RELATED TASK: Mac-native digital candidate probe planning
SOURCE-OF-TRUTH FILES TOUCHED: none

---

## 1. Candidate summary

- **Candidate title:** Trail of Embers
- **Source lane:** J — Tactical stealth / pursuit (`artifacts/research/mac-native-digital-ideation/runs/20260704-083206/10-J-tactical-stealth-pursuit.md`)
- **One-sentence hook:** A flickering campfire in the dark forest is your only hope of survival, but every ember you drop to light your escape also marks your trail for the relentless beast that hunts you.
- **Core player action:** Move through darkness lit only by a small torch radius; drop embers to briefly reveal terrain or misdirect the beast, at the cost of feeding its tracking.
- **Why this is meaningfully Mac-native/digital:** Real-time dynamic field-of-view lighting, an AI that reacts to emitted light and sound events, and layered proximity audio are all live, computed, stateful systems that cannot exist in a tabletop format.
- **Why it might satisfy the Big Game Hunting north star:** The review (`artifacts/reviews/0002-mac-native-digital-ideation-pilot-review.md`) calls this "the most emotionally compelling and most original concept" in the run — light as both tool and bait is a distinctive, memorable hook (wide appeal, strong emotional payoff), with a mastery ceiling built on decoy misdirection and route memory (strategic depth), though the review flags a real risk that mastery tilts toward execution/nerve rather than pure strategy.

## 2. Probe authority boundary

- This brief does not choose the game.
- This brief does not authorize production implementation.
- This brief does not update source-of-truth.
- This brief only defines the smallest useful test to answer one bounded question about the light-as-tool-and-bait tension.

## 3. Falsifiable probe question

**Core question:** Does light-as-tool-and-bait create tense readable stealth decisions, or frustrating dark navigation?

Refined for this candidate:
- When the tester drops an ember, do they treat it as a deliberate tradeoff (reveal terrain vs. reveal position) or as a reflex button-mash with no perceived consequence?
- Does the beast's response to embers read as a legible, learnable pattern within a short session, or as arbitrary/unfair?
- Does the tester report tension ("I felt hunted") or tedium/frustration ("I couldn't see where to go")?

## 4. Smallest playable prototype

- One fixed dark forest screen (or simple side-view corridor) — not procedural.
- No progression, no polish, no menus except reset.
- Sub-week build target.

## 5. Required mechanics only

- Player character with a small fixed-radius torchlight that reveals terrain only within that radius.
- A drop-ember action (single button) that briefly illuminates a wider area at the dropped location and creates a "light event" at that position.
- A single beast with the simplest possible AI: it moves toward the most recent light event (dropped ember or, optionally, the player's torch if within a detection range); no pathfinding beyond direct movement toward the target point.
- One reachable safe zone (e.g., a stone circle) that ends the level/round when reached.
- A failure condition: beast reaches/touches the player.

## 6. Explicit non-goals

- No final art.
- No progression system.
- No campaign.
- No menus beyond launch/reset if necessary.
- No save system.
- No audio unless essential to the probe (a beast growl/proximity cue may be essential to the tension test — keep it minimal, e.g., volume tied to distance).
- No production architecture.
- No source-of-truth update.
- No final rules.
- No "this is the game" language.
- No procedural forest generation, adaptive/learning AI, complex lighting engine, full sound design, campaign, upgrades, or art polish.

## 7. Playtest script (5–10 minutes)

**Tell the tester before play:**
- "You have a torch that lights a small area around you. Reach the stone circle. You have one other action available — try things out."

**Do not explain:**
- What dropping an ember does mechanically (light radius, beast attraction).
- That the beast is attracted to embers specifically.
- Any optimal ember-timing strategy.

**Observe during play:**
- Whether the tester discovers the ember-drop action unprompted or needs a nudge.
- Body language / verbal reaction to the first beast growl or sighting.
- Whether ember drops become deliberate (placed to misdirect) or panicked (spammed).
- Whether the tester slows down/freezes (frustration) vs. leans in (tension).

**Ask after play:**
- "What did you think dropping an ember did? Did that change over the course of the run?"
- "Was there a moment you felt real tension? What caused it?"
- "Was there a moment you felt annoyed or lost rather than tense? What caused it?"
- "Did you ever drop an ember on purpose to distract the beast? What made you try that?"

## 8. GREEN criteria

- Tester discovers the ember mechanic through play (not instruction) and can describe what it does in their own words.
- Tester reports a specific moment of tension tied to a light/beast interaction, not generic "it was dark and scary."
- Tester attempts at least one deliberate misdirection (dropping an ember away from their intended path) within the session.
- Tester's language after play distinguishes "tense" from "confusing" — i.e., they were reading the situation, not lost in it.

## 9. RED criteria

- Tester reports feeling no tension from the beast at all (matches the source artifact's own kill criterion).
- Tester finds the dark navigation boring or disorienting within 2 minutes (matches the source artifact's own kill criterion).
- Ember-dropping becomes a reflex spam action with no perceived tradeoff.
- Tester cannot tell whether the beast is reacting to their actions or moving independently of them.

## 10. Implementation notes

- **Suggested minimal tech shape:** a single-scene 2D project (e.g., a lightweight engine such as Godot, or a simple canvas-based prototype) with a masked/limited-visibility render layer and one moving AI entity — no lighting engine required beyond a simple radius reveal.
- **Core objects/data structures:** a fixed map/tilemap for one screen; a player position + facing; a torch radius value; a list of active "light events" (position + timestamp + intensity, decaying over time); one beast entity with a target-position field set to the most recent light event; a single safe-zone trigger area.
- **Quickest path to playable:** build the fixed dark map first (even a blank room with a few obstacle shapes), add player movement with a circular visibility mask, add the ember-drop action that spawns a temporary larger visibility circle plus a light-event record, add the beast that always walks toward the newest light-event position, add a safe-zone win trigger and a beast-touch loss trigger.
- **Known traps from the review (0002-mac-native-digital-ideation-pilot-review.md):** this is flagged as the highest-risk build of the top three — "three non-trivial systems stacked" (lighting, beast AI, procgen). This probe deliberately defers procedural generation and any adaptive/learning AI to isolate and test only the light-as-bait tension on one fixed screen, per the review's explicit recommendation. Do not let scope creep back in the stacked systems before this bounded question is answered.

## 11. Risk register

| Risk | How the probe detects it |
|---|---|
| Beast AI feels trivial to evade (no tension) or unfair (impossible to outsmart) | Direct post-play question on tension; observed reactions during play |
| Dark navigation is tedious rather than tense | 2-minute boredom/disorientation check, per source kill criterion |
| Ember mechanic is discovered too easily or not at all without a hint | Observe whether tester finds the action unprompted within the session |
| Mastery tilts to execution/nerve rather than strategic decoy planning (flagged in review 0002) | Post-play question distinguishing "I planned that" vs. "I panicked and it worked" |
| Beast's simplest-possible AI reads as random rather than light-seeking | Ask tester whether the beast seemed to react to their embers specifically |

## 12. Decision block

- [ ] Build this probe
- [ ] Revise probe brief
- [ ] Park candidate
- [ ] Kill candidate
- [ ] Defer
