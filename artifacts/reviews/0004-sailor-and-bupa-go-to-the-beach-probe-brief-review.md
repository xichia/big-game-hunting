# Review: Sailor and Bupa: Go to the Beach — Probe Brief (0004)

ARTIFACT TYPE: Review
AUTHORITY: REVIEW
STATUS: Complete
CREATED BY: Fable (skeptical design reviewer)
DATE: 2026-07-06
REVIEWS: `artifacts/probes/0004-sailor-and-bupa-go-to-the-beach-probe-brief.md`
VISUAL REFERENCE INSPECTED: `prototypes/sailor-and-bupa-go-to-the-beach/assets/visual-reference.png`
SOURCE-OF-TRUTH FILES TOUCHED: none

This review evaluates an exploratory probe brief only. It does not ratify anything, does not modify the brief, and makes no changes to Trail of Embers or source-of-truth files.

---

## 1. Verdict

**IMPLEMENT_WITH_SMALL_REVISIONS**

The brief's structure, scoping discipline, and sequencing logic are genuinely good — the out-of-scope list is airtight, the recommendation to build Direction 1 first is correctly argued, and Directions 2 and 3 are properly framed as layers, not competitors. However, Direction 1 **as currently specified is likely to produce a false negative**: two load-bearing mechanical details are missing, and without them the "decision loop" is not actually a decision loop. The revisions below are small, stay entirely within Direction 1's scope, add no new systems, and can be carried as implementation deltas in this review — the brief itself does not need a redraft cycle.

## 2. Strongest reasons for the verdict

### 2.1 The timing decisions the brief promises are not decidable as specified

The brief's central player decision is: *"Which shells are worth the detour given how long Bupa's current pause might last"* (§3, Direction 1). But §6 specifies pause duration only as *"randomized within a tuned range"* with **no readable tell**. If the player has no signal about whether a pause will be short or long, this is not a timing read — it is a coin flip. The GREEN signal ("tester starts anticipating Bupa's pauses") is unreachable by design: the only thing a tester could learn is the average, which produces exactly the "metronome" failure mode the brief itself warns about in the same section.

This is the single most important gap. Real cats *do* telegraph: a quick sniff-and-move-on looks different from settling in to stare at a crab hole. The fix is cheap and thematically perfect (see §4.1).

### 2.2 The proximity mechanic has zero consequence, so the tension side of the loop is empty

§5 step 4: if Sailor strays too far, *"a comfort/worry cue appears, nudging her back."* That is the entire consequence model. A cue with no downstream effect is cosmetic; a rational tester will ignore it, grab every shell at leisure, and the probe will read RED ("tester never adjusts behavior around Bupa's state") — but that RED would indict the spec, not the premise. Greed-vs-closeness tension requires closeness to *cost something* when neglected. The brief needs one soft, diegetic consequence (see §4.2), or the probe cannot distinguish "the rhythm isn't fun" from "there was nothing pulling against the shells."

### 2.3 Shell greed has no scarcity as specified

§8: no shell types, no penalty for missing, no timer — all correct calls for tone. But combined with §10's suggestion that scrolling "can be omitted entirely" and a single fixed screen used, there is **no scarcity of any kind**: every shell is collectible at leisure during any pause, forever. Greed without scarcity is just pickup collection. The brief already contains the fix and merely fails to commit to it: Bupa's net upward progress with a soft camera follow, where shells left behind the camera are forfeited. That is scarcity produced by the cat's own agenda — no clock, no countdown, fully consistent with the "catlike, not clocklike" pillar. This should be mandatory, not optional (see §4.3).

### 2.4 The probe question as written cannot be answered by the recommended prototype

§1 asks whether the cat generates tension through *"proximity, timing, and rescue"* — but rescue is explicitly out of scope for the first probe (§9). Whatever the playtest shows, the stated core question remains formally unanswered, which invites post-hoc goalpost disputes. The first probe's question must be narrowed to what the first probe actually tests (see §4.4). This matters for the review-focus requirement that the question be evaluable after **one** playtest — narrowed, it is; as written, it is not.

### 2.5 What the brief gets right (why this is not REVISE_BEFORE_IMPLEMENTATION)

- The sequencing rationale (§4 of the brief) is sound: Directions 2 and 3 both depend on the Direction 1 state machine, and validating the base rhythm first is the correct de-risk order.
- The scope is unambiguously implementable as a single-file HTML/canvas prototype: a two-state machine, a point-of-interest list, a proximity check, and contact-based pickups. This is hours of work for an implementer, not days.
- The GREEN/YELLOW/RED signals and the playtest script (don't explain the comfort cue; ask "what was Bupa doing, in your own words?") are well designed and directly observable.
- The risk table (§16) already names the loop-thinness and meter-tonality risks honestly. The brief's self-diagnosis is accurate; it just doesn't apply the fixes.
- All revisions below are parameter- and feedback-level changes inside Direction 1. Nothing requires a new system, so a full redraft loop would be process overhead without design benefit.

## 3. Biggest risks

1. **False negative on the premise.** As specified, the most likely playtest outcome is YELLOW-drifting-RED ("shells were fine, the cat was scenery") caused by the missing tell and missing consequence — and that result would wrongly damage a premise that was never actually tested.
2. **The abstract comfort meter reads as babysitting.** A draining bar labeled "Bupa comfort" is escort-mission UI. It frames the cat as a maintenance obligation, which is precisely the feeling the probe exists to avoid. The relationship must live in Bupa's *body*, not in a widget (§4.2).
3. **Loop thinness is real but acceptable — if the session length matches it.** The brief is internally inconsistent: §3 specs a 60–90s probe with 2–3 wander cycles, §15 asks whether engagement sustains "across multiple wander cycles," and §14 specs a 5–10 minute playtest. Two or three cycles cannot answer the sustain question. The thin loop is a legitimate probe subject, but only if the session is long enough to observe flattening (§4.5).
4. **Tonal contamination from the visual reference.** The reference image shows three hearts next to Sailor's portrait — health-bar iconography that implies damage and fail states. If the implementer copies the reference UI faithfully, it imports a fail-state metaphor the brief explicitly excludes. Flagged in §6 below.
5. **Ambiguity invites implementer invention.** The brief leaves open: control scheme ("keyboard or click-to-move — pick whichever is faster"), beach orientation (horizontal per reference vs. vertical per premise), and scroll-vs-static. Every open choice is an opportunity for an implementing model to add unrequested scope. All three are closed in §5 below.

## 4. Recommended revisions (small, within Direction 1 scope)

### 4.1 Give pause duration a readable tell
Bind pause-length class to interest-point type, and telegraph it: **rock/shell-cluster = short pause (~2–4s), driftwood = medium (~4–7s), tidepool = long (~7–12s)**, with small jitter inside each band. Optionally, Bupa's posture escalates during long pauses (standing sniff → sitting stare), so time-remaining is roughly readable. Now "can I make it to that far shell and back?" is a genuine skill read, and the GREEN anticipation signal is achievable. This is a parameter table plus one posture swap — negligible cost.

### 4.2 Replace the abstract meter with a diegetic check-back, and give worry one soft consequence
When Sailor exceeds the comfort radius while Bupa is walking, **Bupa stops, sits, looks back at her, and meows; he does not proceed to his next interest point until she closes the distance.** This is authentic cat-walk behavior (cats do the check-back), it is charming rather than punitive, and it creates the only consequence the loop needs: straying stalls the shared journey. No health, no fail state, no bar. A minimal visual cue (a small "?" or musical-note bubble over Bupa) is acceptable; a labeled meter is not. If the implementer wants a debug meter for tuning, it must be toggled off during the playtest.

### 4.3 Commit to upward progress with forfeited shells
Make the beach a vertical strip roughly 3–4 screens tall with a soft camera follow on Bupa's net progress. Shells scrolled off the bottom are gone. Do not add any despawn timer — the only scarcity pressure is Bupa's own agenda. This converts shell choices from "eventually" to "now or never," which is the entire greed mechanism, at the cost of one camera-offset variable.

### 4.4 Narrow the first-probe question
For this probe only, the question is: **"Does Bupa's autonomous wander/pause rhythm, plus a proximity pull expressed through his own behavior, make the player watch and care about the cat while collecting shells?"** Rescue stays in Direction 2's question. Record the narrowed question in the playtest notes so the probe is evaluable as-run.

### 4.5 Fix the session-length inconsistency
Target a **~3-minute session of roughly 8–10 wander cycles** (or top-of-strip arrival, whichever first), with instant restart. This is long enough to observe whether the rhythm flattens (§15's sustain question) and short enough to stay a probe. Drop the 60–90s framing for the playtest itself; it can remain the description of one "loop unit."

### 4.6 Close the open implementation choices
- **Controls: keyboard only** (arrow keys + WASD). Click-to-move adds pathing and ambiguity for zero probe value.
- **Orientation:** keep the reference's composition — water strip on the left as static decoration, sand strip center, dune/grass on the right — with progress running **upward** along the strip. This satisfies both the reference and the "up the beach" premise without reorienting anything.

## 5. Implementation guidance for Gemini Flash

- Single HTML file, `<canvas>`, zero dependencies, no build step, runs by double-clicking on a Mac. Do not create `index.html` until Ian authorizes the build; the deliverable filename should follow the prototype folder's conventions when authorized.
- Bupa is a two-state machine: `investigating` (paused at an interest point, duration per the §4.1 table) and `walking` (straight-line movement to the next point at a distinctly unhurried speed — noticeably slower than Sailor). Add the `waiting` check-back behavior from §4.2 as a sub-state of `walking`. No pathfinding; straight lines are fine, and interest points should simply be placed so straight lines don't cross obstacles.
- Interest-point pool: rock, driftwood, tidepool, shell-cluster, placed on a hardcoded list up the strip; next-point selection biased upward but not strictly upward (occasionally sideways/slightly down is what makes it read as a cat).
- Sailor: free keyboard movement, moderately faster than Bupa, collect shells on contact, visible counter (bottom-left, per reference).
- Placeholder art is fine: colored rectangles or circles with a one-frame posture change for Bupa's sit. Do not spend effort on pixel art, animation frames beyond sit/stand, or audio.
- Comfort radius: start generous (roughly half a screen height) and expose it plus the pause-duration table as constants at the top of the file so Ian can tune without reading the code.
- Session end: 8–10 cycles or top of strip; show a simple end card with shell count and an instant-restart key.

## 6. Things Gemini Flash must not add

- **No rescue/trouble events** (stuck, startled, lured) — that is Direction 2, a separate later probe.
- **No tide, waterline movement, or wave contact** — Direction 3. The water is a painting.
- **No hearts, health, damage, or fail states of any kind** — explicitly including the three hearts visible in the visual reference's UI. That iconography does not survive into the prototype.
- **No countdown timers, clocks, or urgency UI.** The only time pressure in this game is a cat's attention span.
- **No labeled comfort meter/bar** in the playtest build (debug-only, off by default, if at all).
- No shell rarities, values, types, or combo scoring — one shell type, one counter.
- No click-to-move, touch controls, or gamepad support.
- No menus, settings, save system, pause screen, or title screen beyond a restart key.
- No score penalties for straying or for missed shells.
- No influence of Sailor's position on Bupa's target selection — his agenda is fully autonomous in this probe.
- No edits to `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md`, any Trail of Embers files, or the Sonnet probe brief.

## 7. Playtest signals Ian should watch for

**Behavioral (watch, don't ask):**
- Does the tester start ranging for shells *during pauses* and returning *before Bupa finishes* — i.e., is pause length actually being read? This is the core signal the §4.1 tell exists to enable.
- When Bupa does the check-back sit, what is the emotional register of the correction — "sorry, buddy" (affection/guilt, GREEN) versus "ugh, the cat again" (chore, RED)? This single moment is the babysitting-vs-companionship verdict in miniature.
- Does the tester ever leave a reachable shell behind *by choice* to stay with Bupa? That is the greed-closeness tension working. Conversely: does the tester ever visibly mourn a shell lost to the scroll ("aw, I missed the purple one")? That is scarcity working.
- Does the tester's gaze/cursor track Bupa even when nothing requires it?

**Verbal (post-play, per the brief's script):**
- In "what was Bupa doing, in your own words?" — listen for cat-language ("he was sniffing the tidepool," "he got distracted by the driftwood") versus system-language ("the NPC stops at waypoints"). Cat-language is the strongest available proxy for the premise landing.
- In the race-or-calm question — "calm but I still had to pay attention" is the target answer. "Calm and I didn't have to pay attention" means the loop is thin (expected risk; note *when* in the session attention lapsed). "Stressful" means comfort tuning or check-back frequency is off.

**Disambiguation for the thin-loop risk:**
- If engagement flattens, note the cycle number where it happened. Flattening at cycle 3 of 9 says the rhythm itself is weak; flattening at cycle 7–8 says the rhythm holds and simply needs the Direction 2 layer — a materially different conclusion. Use the brief's own §16 question ("what else might make it more compelling?") to separate the two.

## 8. Decision block

- [ ] Accept verdict: IMPLEMENT_WITH_SMALL_REVISIONS (build with §4 deltas applied)
- [ ] Override: implement brief as written
- [ ] Send back to Sonnet for brief redraft
- [ ] Park
