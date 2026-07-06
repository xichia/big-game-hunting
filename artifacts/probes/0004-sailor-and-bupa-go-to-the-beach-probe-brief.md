# Probe Brief: Sailor and Bupa: Go to the Beach

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — Human-gated probe input
CREATED BY: Sonnet
REVIEWED BY: not yet reviewed
DATE: 2026-07-06
RELATED TASK: Sailor and Bupa: Go to the Beach — direction exploration
SOURCE-OF-TRUTH FILES TOUCHED: none

This brief documents an exploratory prototype only. It is not a replacement for *Trail of Embers*, does not update `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, or `BALANCE_NOTES.md`, and is not a ratified final game.

---

## 1. Probe question

**Core question:** Can a companion cat with his own agenda — one who wanders, pauses, and investigates on his own schedule — generate fun tension through *proximity, timing, and rescue* without ever feeling like a countdown or an escort-mission chore?

Refined sub-questions:
- Does Bupa's stop-and-go rhythm read as "a cat doing cat things" rather than "an obstacle with a timer"?
- Does the player's attention naturally split between shell-collecting and watching Bupa, or does one dominate and make the other feel irrelevant?
- When Bupa gets into "cat trouble," does the rescue moment feel affectionate and fun, or does it feel like a fail-state penalty?
- Does the tester ever describe caring about *where Bupa is* for its own sake, independent of scoring?

## 2. Design pillars

1. **Accompany, don't command.** Sailor influences Bupa; she does not pilot him. Direct control of Bupa is out of scope.
2. **Catlike, not clocklike.** Bupa's movement is driven by curiosity and interest points, not by a fixed upward-scroll deadline.
3. **Cute trouble, not danger.** Anything that interrupts Bupa (stuck under driftwood, startled by a gull, fixated on a crab) should read as charming, never grim.
4. **Rhythm over race.** The core tension is pacing — stop, go, wander, catch up — not speed.
5. **Simple to start, room to master.** A first-time player should immediately understand "stay near Bupa, grab shells, help him when he's stuck." Mastery comes from reading Bupa's behavior patterns and routing efficiently around them.

## 3. Candidate directions

### Direction 1 — Wandering Cat Timing Game

**Core loop:** Bupa picks a nearby point of interest (a rock, a tidepool, a piece of driftwood), walks to it, pauses to investigate for a variable duration, then picks a new point of interest further up the beach. While Bupa is paused, Sailor has a window to range outward and collect shells before Bupa moves again and proximity starts to matter.

**Player decisions:**
- When to dash for a far shell vs. stay close to Bupa.
- Which shells are worth the detour given how long Bupa's current pause might last.
- Whether to "wait out" a pause near Bupa or use it to explore.

**Why it might be fun:** The pause/wander rhythm creates natural push-pull between greed (shells) and closeness (Bupa's comfort), and reading Bupa's behavior to anticipate his next move becomes a learnable skill.

**Why it might fail:** If pauses are too predictable, it becomes a metronome, not a cat. If pauses are too random, it feels arbitrary rather than skill-based. Without a trouble/rescue layer, the loop may feel thin after a few minutes.

**Prototype complexity:** Low. Needs a simple state machine for Bupa (idle/investigate/walk-to-target), a pool of interest points, shell spawn/collect logic, and a proximity check.

**First 60–90s probe:** Bupa cycles through 2–3 wander-pause loops up a short vertical beach strip. 4–6 shells are scattered at varying distances from Bupa's path. Sailor moves freely (arrow keys/WASD or click-to-move); a simple meter or color cue shows "Bupa comfort" based on distance. No trouble events yet — pure timing and proximity.

**GREEN:** Tester starts anticipating Bupa's pauses ("he's going to stop there, I can grab that one"); tester describes the rhythm as pleasant/expected rather than annoying; tester voluntarily stays near Bupa during his walking phases without being told proximity matters.

**YELLOW:** Tester enjoys shell collecting but treats Bupa as a background timer rather than something to watch; comfort mechanic works but isn't emotionally resonant; some pause lengths feel too long/short but the core idea holds.

**RED:** Tester never adjusts behavior around Bupa's state at all (comfort mechanic invisible or irrelevant); the pacing feels like waiting, not tension; tester describes it as boring or repetitive within the probe window.

---

### Direction 2 — Cat Trouble / Rescue Game

**Core loop:** As Bupa wanders, he periodically gets into a "cat trouble" state — stuck under driftwood, fixated staring at a crab hole, startled by a passing gull and frozen, or lured toward a tidepool he shouldn't wade into. Sailor must reach him and perform a small context action (nudge, call, pick up) to release/redirect him. Shells are collected opportunistically along the way.

**Player decisions:**
- Whether to rush to Bupa immediately or finish a nearby shell grab first.
- Which rescue action fits which trouble type (if actions are differentiated).
- Whether to preemptively stay close to prevent trouble, or range far and accept rescue trips as a cost.

**Why it might be fun:** Rescue moments are inherently charming beats (cats being ridiculous) and give the player a clear, readable objective spike inside the otherwise calm wandering rhythm. It directly creates the "affectionate trouble" pillar.

**Why it might fail:** If trouble triggers too often, it becomes a whack-a-mole chore and undermines the "not an escort mission" pillar. If the rescue action is a single button with no nuance, it may feel like a QTE rather than a caretaking moment. Risk of trouble feeling punitive rather than cute if it blocks progress too long.

**Prototype complexity:** Medium. Needs everything from Direction 1 plus a trouble-event system (trigger conditions, per-type visual/animation cue, a resolution action and radius/timer), tuned so trouble is a treat, not a tax.

**First 60–90s probe:** Bupa wanders normally per Direction 1, but 2 scripted trouble events fire during the window (e.g., stuck under driftwood at ~20s, frozen staring at a gull at ~60s). Sailor must approach and press a single "help" action to resolve each. Shells scattered as before.

**GREEN:** Tester smiles/reacts audibly or verbally to a trouble event; tester describes rescue moments as favorite parts of the probe; tester does not express frustration at being "interrupted" from shell collecting.

**YELLOW:** Rescue mechanic is understood and functional but emotionally neutral; tester treats it as a task rather than a delight; timing/frequency needs tuning but concept holds.

**RED:** Tester describes trouble events as annoying interruptions or fail states; tester wants to avoid triggering them rather than enjoying them; the action-resolution feels disconnected from "cat behavior" (reads as generic minigame prompt).

---

### Direction 3 — Tide-and-Shell Route Game

**Core loop:** A waterline periodically advances and retreats across the lower beach. Better/rarer shells spawn closer to or briefly exposed by the tide, creating risk (getting caught by an incoming wave, losing distance from Bupa) versus reward (higher-value shells). Bupa's own wander rhythm continues independently, so the player must route between tide-exposed shells and Bupa's current position/pause state.

**Player decisions:**
- Whether to detour toward the waterline for a valuable shell before it's covered again.
- How to sequence a tide-run against Bupa's pause timing so both are captured.
- Accepting a "wet" minor setback (dropped shell, brief slow-down) vs. playing safe.

**Why it might be fun:** Layers a second rhythm (tide) against Bupa's rhythm, creating richer routing puzzles and a stronger "mastery" ceiling — reading two independent cycles and threading them.

**Why it might fail:** Two independent timing systems (Bupa + tide) may be too much cognitive load for a "simple to start" probe and could obscure whether Bupa's behavior alone is fun. Tide risk could tip into "danger" tone if wave contact feels like punishment rather than a splash. May test tide mechanics more than it tests the actual probe question (Bupa's autonomy).

**Prototype complexity:** Medium-high. Needs Direction 1's Bupa system plus a tide state machine, exposed-shell spawn logic tied to tide phase, and a wave-contact consequence.

**First 60–90s probe:** Bupa wanders per Direction 1. A simple waterline sweeps in/out on a ~15–20s cycle. 2–3 shells spawn only in the tide-exposed zone; the player must time a dash to grab them before the water returns, while still tracking Bupa.

**GREEN:** Tester develops a clear risk/reward story ("I waited for the tide to go out, then grabbed it before it came back"); the two rhythms (tide, Bupa) feel complementary rather than confusing; getting caught by water reads as a minor, funny setback.

**YELLOW:** Tide adds noticeable challenge but tester's attention narrows almost entirely onto tide-dodging, sidelining Bupa; concept is functional but dilutes the core probe question.

**RED:** Tester is overwhelmed tracking two systems at once within the first minute; wave contact feels like a punishment/damage mechanic (tonal mismatch with "cute trouble" pillar); tester cannot articulate what happened during a wave-catch.

---

## 4. Recommendation

**Build Direction 1 (Wandering Cat Timing Game) first, as the bounded initial prototype.**

Rationale:
- It is the purest test of the actual probe question — whether Bupa's autonomous wander/pause rhythm is inherently engaging — with no confounding systems (no rescue mechanic, no tide) to muddy the read.
- It is the lowest-complexity direction, matching "simple to start" and the instruction to keep the first probe minimal.
- Directions 2 and 3 both *depend on* Direction 1's Bupa state machine being solid — trouble events and tide routing are both modifiers layered on top of the same wander/pause core. Validating the base rhythm first de-risks the more complex directions.
- If Direction 1 reads YELLOW or RED (the timing/proximity loop alone isn't compelling), that is critical information before investing in rescue-event or tide-system complexity.

Suggested sequencing if Direction 1 is GREEN: layer in a minimal version of Direction 2's trouble/rescue events next (it most directly serves the "affectionate trouble" pillar), and treat Direction 3's tide system as a later enrichment probe rather than a first-pass requirement.

---

## 5. Core loop (for the recommended first probe)

1. Bupa is idle/investigating at a point of interest.
2. Sailor ranges out (within limits) to collect nearby shells.
3. Bupa finishes investigating and walks to a new point of interest further up the beach.
4. Sailor's distance from Bupa is tracked; if she strays too far while he's moving, a comfort/worry cue appears, nudging her back.
5. Repeat, gradually progressing up the beach, until a simple session-end condition (e.g., reaching the top of the beach strip, or a fixed number of wander cycles).

## 6. Bupa behavior model

- **States:** `investigating` (paused at a point of interest, duration randomized within a tuned range), `walking` (moving toward his next chosen point of interest, speed distinctly unhurried).
- **Point-of-interest selection:** chosen from a small pool of beach features (rock, tidepool, driftwood, shell cluster) biased to be generally further up the beach than his current position, so net progress is upward without every choice being upward.
- **No player control of Bupa's target or timing** in this probe — his agenda is autonomous. Sailor's only lever is proximity (staying close may be observed to slightly influence his next choice or pace, if that reads as a promising later addition — not required for the first probe).
- **Comfort/worry state:** a simple two-state (or meter-based) value driven by Sailor-to-Bupa distance while Bupa is walking; investigating Bupa is unbothered by distance.

## 7. Sailor actions

- Move freely around the beach (arrow keys/WASD or click-to-move — pick whichever is faster to implement).
- Collect a shell by walking into/near it (no dedicated collect button needed for this probe).
- No rescue/help action in this first probe (reserved for a later Direction 2 layer).

## 8. Shell/scoring model

- Shells spawn at fixed or lightly randomized positions across the beach strip, at varying distances from Bupa's likely path.
- Collecting a shell adds to a simple visible counter (matching the shell-count UI already shown in the visual reference).
- No shell types/rarities in this first probe — that differentiation is deferred to a later tide/route-focused probe.
- No penalty for missed shells; the probe measures engagement and behavior, not competitive scoring.

## 9. Trouble/rescue model

- **Out of scope for the first probe.** Bupa does not get stuck, startled, or lured in this pass — only wander/pause/walk.
- Documented here as a planned second-layer probe (Direction 2) once the base rhythm is validated.

## 10. Beach/waterline dynamics

- **Out of scope for the first probe.** No tide, no waterline movement, no wave contact.
- The beach is a static vertical strip; "scrolling upward" (if used at all) should be a slow camera follow on Bupa's net progress, not a forced timer — and can be omitted entirely from the first probe if a single fixed-height screen is sufficient to test the core question.

## 11. Visual / aesthetic notes

- Reference image: `prototypes/sailor-and-bupa-go-to-the-beach/assets/visual-reference.png`.
- Cozy pixel art, top-down/slightly isometric beach framing: sand strip between water (left) and dune/grass (right) in the reference, though the probe may reorient this to a vertical strip (water at bottom, dunes at top) to support "gradually making his way up the beach."
- Sailor: young girl (~5 years old), pigtails, blue outfit as shown in reference.
- Bupa: grey cat with a small hint of white (paws/chest visible in reference), tail and posture should read as unhurried and investigative rather than urgent.
- UI cues from the reference worth carrying into the prototype: portrait chips for Bupa and Sailor (top-left), a shell counter (bottom-left), and a title/name plate (bottom-right) — useful for quick prototype polish but not required for the probe to answer its core question.
- For this first probe, placeholder rectangles/sprites are acceptable; full pixel-art asset production is not required to validate the behavior question.

## 12. Minimal first implementation scope

- Single HTML file, `<canvas>`-based, no external dependencies or build step, runnable by opening the file locally on Mac.
- One static or simply-scrolling beach background (placeholder art acceptable).
- Bupa state machine: investigate → walk → investigate, cycling through a small hardcoded list of points of interest with randomized pause durations within a tuned range.
- Sailor free movement (keyboard or click-to-move).
- Shell spawn (hardcoded or lightly randomized positions) and collect-on-contact with a visible counter.
- Simple proximity/comfort cue (e.g., a color-changing indicator or meter) while Bupa is walking.
- A defined session end (Bupa completes N wander cycles, or reaches the top of the strip).

## 13. Explicit out-of-scope list

- No trouble/rescue events (stuck, startled, lured) — deferred to a later probe layer.
- No tide/waterline mechanic.
- No shell rarities, upgrades, or meta-progression.
- No menus beyond launch/reset if strictly necessary.
- No save system.
- No production-quality art or audio (placeholder acceptable; audio only if trivially cheap to add and not required).
- No `index.html` creation as part of this brief.
- No gameplay implementation as part of this brief — this document is the brief only.
- No changes to `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md`.
- No changes to Trail of Embers files.
- No claim that this is "the game" — this remains an exploratory probe.

## 14. Playtest script (5–10 minutes)

**Tell the tester before play:**
- "You're Sailor. Bupa is your cat — just move around, collect shells, and stay near him."

**Do not explain:**
- That Bupa's pauses are predictable/learnable.
- That straying too far has a consequence (let them discover the comfort cue).
- Any "optimal" pattern for timing shell runs around Bupa's pauses.

**Observe during play:**
- Whether the tester glances at/tracks Bupa's state (paused vs. walking) or ignores him until a cue forces attention.
- Whether shell-collecting decisions visibly change based on Bupa's current state (e.g., waiting for a pause before ranging out).
- Whether the tester reacts (verbally, facially, in movement) to Bupa's walking/investigating animations.
- Whether the comfort cue, when triggered, produces recognizable correction behavior (moving back toward Bupa).

**Ask after play:**
- "What was Bupa doing, in your own words?"
- "Did you ever wait for him to stop before going for a shell, or was it random?"
- "Did being far from him ever feel like a problem? What did you do about it?"
- "What was your favorite moment, if any?"
- "Did this feel like a race, or something calmer? Why?"

## 15. Playtest questions (summary)

- Does Bupa's wander/pause rhythm read as intentional cat behavior rather than a scripted obstacle?
- Does proximity to Bupa create a natural, non-punitive pull on player attention?
- Does the shell-collecting layer complement or compete with watching Bupa?
- Does any tester describe emotional attachment to Bupa specifically (not just "the objective")?
- Does the loop sustain engagement across multiple wander cycles, or does it flatten out after the first one or two?

## 16. Risks

| Risk | How the probe detects it |
|---|---|
| Bupa's pause/wander pattern feels arbitrary rather than catlike | Post-play question: "What was Bupa doing, in your own words?" — vague/confused answers signal failure |
| Proximity mechanic is invisible or ignored | Direct observation of whether tester ever reacts to distance from Bupa without prompting |
| Loop is too thin without trouble/rescue layer, reads as empty after 60–90s | Tester engagement visibly drops or tester explicitly asks "is that it?" during the probe window |
| Without trouble/tide layers, testers may under-rate the direction even if the core rhythm is sound | Ask testers to imagine/describe what else might make it more compelling, to separate "core rhythm is weak" from "core rhythm needs a second layer" |
| Comfort/worry cue reads as a fail-state penalty rather than a gentle nudge (tonal risk against the "no frantic deadline" pillar) | Post-play question on whether distance from Bupa "ever felt like a problem," listening for stress language vs. neutral/caretaking language |

## 17. Decision block

- [ ] Build this probe
- [ ] Revise probe brief
- [ ] Park candidate
- [ ] Kill candidate
- [ ] Defer
