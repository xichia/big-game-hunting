# Trail of Embers Beast-Gate Mechanic Investigation

Recorded from Sonnet investigation output pasted by Ian. This is a research artifact, not a ratified source-of-truth decision.

## 1. Recommendation

Build Candidate C: a one-charge beast-gate probe that adds exactly one new piece of state (a gate obstacle whose collision applies to the player only, gated by whether the beast's position currently falls inside a defined trigger rectangle) and makes the existing single Cinder Charge feel necessary through level geometry and cooldown tuning, not through a new stored-charge inventory system.

Concretely: the trigger zone is the doorway. The player drops a bait ember just past the gate to pull the beast into the doorway rectangle (gate opens for as long as the beast is standing in it — this falls out of existing ember-lifetime dwell time for free), slips past while it's open, and then needs one more ember shortly after — normal if the cooldown allows it, the held Cinder Charge if it doesn't — to keep from being caught by a beast that immediately re-targets the player's torch the instant the bait ember goes cold. Level 7's existing 3500ms cooldown is already long enough to make that second ember genuinely uncertain without the charge in reserve.

## 2. Rationale

Three things converge on this being the right next step, not just an acceptable one:

*   **This is the first genuinely new system, not new level data.** Every pass since Challenge Pass 1 (README's own framing) has been "no new systems, only per-level data" — except Cinder Charge, which was one new mechanic, twice revised, and still hasn't cleared a blind playtest. A dynamic gate is a second new system stacked on the first, unvalidated one. The smallest version that still answers the design question is the only defensible next step given that history.
*   **The beast's AI already gives this mechanic away for free.** The beast has no pathfinding, ignores walls, and simply walks in a straight line toward the newest hot ember (or the player's torch if none exists). "Bait the beast into a zone" doesn't need any new AI — it needs one geometric question asked once per frame: is the beast's (x,y) inside a rectangle? That's a one-line addition to a codebase that has otherwise touched zero AI logic across seven levels. Low implementation risk is real evidence the probe is bounded correctly.
*   **The evidence-sequence review's standing risk ([0002-trail-of-embers-evidence-sequence-review.md](file:///Users/ianchia/big-game-hunting/artifacts/reviews/0002-trail-of-embers-evidence-sequence-review.md) or equivalent) is still open.** Zero blind-tester data exists for anything in this prototype, and the Cinder Charge's own playtest artifact (0007) explicitly flags unresolved accidental-spend and discoverability risk. Adding a second held-resource system (Candidate B) on top of an unresolved first one compounds a known risk rather than retiring it. C keeps the resource surface exactly as it is today and asks a narrower question: does spatial/timing pressure make the existing charge feel required, without touching its accounting at all.

## 3. Candidate Comparison

### Candidate A — Minimal one-charge beast gate
*   **Pros:** Simplest possible version; directly matches Ian's sketch of "one ember to bait, one to escape."
*   **Risk:** As literally described (charge and normal ember doing two different jobs — one bait, one escape), it's really just C with the "why the charge is needed" left implicit. Without deliberate tuning it can accidentally be skippable (if there's slack time, the normal cooldown alone covers both beats and the charge goes unused, repeating the exact "not really necessary" verdict Ian gave Revisions 1 and 2 of the cache).
*   **Evidence value:** Medium — tests the gate mechanic cleanly but risks re-learning the same "not necessary" lesson if tuning is loose.

### Candidate B — Two-cache / two-charge beast gate
*   **Pros:** Directly matches Ian's phrase "may need two charges."
*   **Risk:** Requires converting `hasCinderCharge` (a boolean) into a count, a new HUD format ("held ×2"), a second cache placement + reachability check, and — most importantly — a second accidental-spend risk on top of the first one, which hasn't been blind-tested at all yet. It also multiplies the number of simultaneous new things a tester has to learn: a new door mechanic and a new inventory-counting mechanic and the still-unproven single-charge mechanic, all at once. If the level fails, there's no way to tell which piece failed.
*   **Evidence value:** Low relative to its risk — it answers a compound question ("does beast-gating + stacked charges work") when the real open question is much narrower ("does beast-gating make a single charge feel needed").

### Candidate C — No inventory expansion, stronger spatial setup (recommended)
*   **Pros:** Zero change to `hasCinderCharge`'s existing boolean semantics. The "necessity" comes from the same lever every past level has already used successfully — travel distance, cooldown length, and beast speed — which is a proven, well-understood tuning surface in this codebase. Isolates exactly one new variable (the gate) against a fixed, already-validated resource system.
*   **Risk:** If under-tuned, still risks feeling skippable; requires deliberate cooldown/distance math up front (see §5).
*   **Evidence value:** High — cleanly isolates "does a beast-gate deepen the grammar" from "does the charge feel necessary," which are the two questions actually in doubt.

### Candidate D — Delayed introduction (gate first, charge later)
*   **Pros:** Lowest-risk sequencing; would validate the door concept in complete isolation.
*   **Risk:** Given the beast-gate needs almost no new state (see §4), splitting it into two probes buys little safety for real cost — it burns a whole level slot and a full review/playtest cycle to test a mechanic that is nearly free to combine safely. This is the "too cautious" outcome the question explicitly asks to weigh, and I think it is, here specifically. It would make sense only if the gate mechanic itself were expensive or state-heavy, which it isn't.
*   **Evidence value:** Would produce clean but narrow evidence at needlessly high process cost.

## 4. Mechanic Design Recommendation

*   **Trigger condition:** A rectangular trigger zone, tested once per frame: beast.x/y inside the zone bounds → `gateOpen = true`. No hysteresis, no timer, no new beast logic — reuses the existing `circleRectCollide`-style containment check already used for player/obstacle collision.
*   **Gate open/close behavior:** Open strictly while the beast is physically inside the zone; closes the instant it leaves. No latch. This is not a compromise — it's the cheapest option and the one that reuses an already-tuned knob: how long the beast dwells on a bait ember is already governed by `emberLifetimeMs`, a per-level value every past level has hand-tuned. "Gate stays open as long as the beast is chasing the bait" is just that existing lifetime made visible through a door, not a new timing system to invent and validate separately.
*   **Player collision only:** The beast already ignores all obstacles by design ("no walls blocking the beast"). So the gate need not affect beast movement at all — it only needs to be conditionally included in/excluded from the player's obstacle collision list. This is the single biggest scope-reducer in this whole design: the gate is not a new physics object, it's an existing obstacle rectangle with a conditional membership test.
*   **Visual language:** Reuse the established pattern of giving each new game-concept a distinct silhouette/color that can't be confused with brick walls, the stone-circle safe zone, or the cache diamond (this precedent already exists for the cache vs. ember vs. safe-zone). Suggest: the gate reads as a different masonry — e.g., a metal-toned barred portcullis texture instead of brick — drawn closed (solid) or open (visibly retracted/gap) each frame from `gateOpen`. Do not reuse a ground-circle motif for the trigger zone; that's what the safe zone already looks like. A thin, low-contrast floor rune/sigil rectangle (distinct hue, e.g. cool blue-white vs. the game's warm palette) reads as "mechanism," not "goal."
*   **Feedback under fog-of-war:** This is the sharpest risk in the whole design. The world is only drawn where lit (`drawFog` paints black over everything outside torch/ember radius, including — per the README — walls and even the safe zone). If the gate is physically remote from where the player is standing when it opens, the player will not visually see it change state at all, and has no way to confirm the bait worked short of walking over to check. Mitigate by co-locating the trigger zone with the gate itself (the doorway is the bait spot), so the moment the beast arrives to chase the dropped ember, the player — who just dropped that ember and is standing right there to lure it — is already positioned to see the gate open in the same lit moment. This turns "did my bait work?" into something read directly, not inferred. A remote switch-and-door layout (bait over here, door over there) would need a HUD text cue analogous to `#cache-status` (e.g., "the way opens") to compensate — an avoidable complication if the geometry is co-located instead.
*   **Audio/debug:** No audio changes (explicitly out of scope). Extend the existing debug view (G) to draw the trigger-zone bounds as a dashed outline and the gate's open/closed state as debug text, mirroring how ember/cache radii are already drawn — this is a copy of an existing pattern, not new debug infrastructure.
*   **Interaction with embers/Cinder Charge:** No changes to `tryDropEmber`, cooldown, or charge semantics at all. The gate consumes the beast's existing "chase newest hot ember" behavior as its only input signal.

## 5. Level Design Recommendation

*   **Size:** Keep to the established ~1800×1000 scale (levels 6–7) — Ian's own direction on the cache pass was "same approximate size is fine, but it needs to be a genuinely new spatial problem," which applies again here. This is a new mechanic level, not a new scale level.
*   **Route structure:** A single gate blocking the one path toward the safe zone, with a lure point directly at/just past the gate threshold, and the beast's den positioned far enough that reaching the gate at all requires deliberate routing (echoing level 7's "two lanes" idea, but simpler — one lane is enough to isolate this new variable).
*   **Cinder Cache placement:** One cache, off the direct route (same "real detour, not a waystation" shape validated in level 7), positioned so fetching it costs a meaningful side-trip before the gate — the player should arrive at the gate already holding the charge, not have the option to backtrack for it mid-crisis.
*   **Beast trigger-zone placement:** At the gate threshold itself (see §4) — not remote.
*   **Gate placement:** The one chokepoint between the mid-level area and the safe zone.
*   **Safe-zone relationship:** Directly beyond the gate, close enough that "slip past while it's open" is a short, high-tension dash rather than another full traversal — the payoff for a successful bait should be immediate, not another maze leg.
*   **Intended player sequence:** (1) fetch cache, (2) approach gate, (3) drop a bait ember at/through the threshold to pull the beast in and open the gate, (4) dash past while it's open, (5) the beast's bait ember goes cold almost immediately after (or the player's own torch is now the closer signal), so the beast re-targets the player and gives chase in the newly-opened space; (6) the player needs one more ember within a few seconds to hold it off long enough to reach the safe zone — normal cooldown if it's ready, the held charge if it isn't.
*   **Likely failure modes:**
    *   Player reaches the gate with the normal cooldown already ready and doesn't need the charge at all for the bait step (fine — that step doesn't need to be hard), but if the escape step also lands on a ready cooldown, the whole charge goes unused and the level repeats the "not necessary" verdict.
    *   Beast is fast enough / zone close enough to the den that the bait beat requires zero real detour — feels like a formality, not a decision.
    *   Player baits successfully but the gate closes before they physically reach it (travel time from ember-drop point to gate mouth must be tuned shorter than remaining ember-hot dwell time, with margin, or the mechanic reads as unfair rather than tight).

## 6. Technical / Validation Risks

*   **Level data:** New per-level fields needed: a gate (an obstacle-shaped rect, rendered specially) and a `triggerZone` (bounds only, not itself a collider). This is the first level-data schema addition since Cinder Cache.
*   **Collision/door handling:** The player-collision obstacle list must become conditional — today `level.obstacles` is a flat static array checked every frame; the gate obstacle needs to be excluded from that list when `gateOpen` is true. This is a small but real change to `updatePlayer`'s collision loop, not just level data.
*   **Draw calls:** `drawBricks` currently assumes uniform masonry for every obstacle; the gate needs its own draw function (distinct texture/state) called instead of `drawBricks` for that one rect.
*   **Reset state:** `gateOpen` (derived each frame from beast position) needs no explicit reset since it's computed live — this is actually a point in favor of the "no latch" design: there is no new persistent state to wipe on R/Shift+R at all, unlike the Cinder Charge which needed explicit reset-state handling.
*   **Input state:** None — no new controls, per the constraint.
*   **Validator (validate-levels.js):** This needs the most real work. The current BFS assumes a single static obstacle set; a level with a gate has two valid worlds (gate open / gate closed). Recommend: (1) BFS with the gate obstacle included (closed state) — confirms the safe zone is not trivially reachable and that the trigger-zone/lure point is reachable; (2) BFS with the gate obstacle excluded (open state) — confirms the safe zone is reachable once past it. Both checks matter: the first proves the gate is actually gating something (not decorative), the second proves the level isn't softlocked.
*   **README:** Needs a new "What's implemented" entry describing the gate/trigger-zone mechanic at the same level of precision as the Cinder Cache section, plus explicit non-goal language (no multi-gate levels, no gate-state persistence across levels) matching the project's established documentation discipline.

## 7. Blind-Test Risks

*   Testers may not realize the gate opened because of the beast rather than something they themselves triggered by proximity — the causal link (beast enters zone → door reacts) needs to be visually unambiguous the first time it happens, ideally with the beast visible (lit) at the moment of the state change.
*   Testers may try to path around the gate looking for another way through before considering luring the beast at all, especially if the level doesn't make the "no other way" fact obvious early.
*   Testers may assume the trigger zone is a "trap" or hazard (echoing typical game-grammar for glowing floor sigils) rather than a mechanism to exploit — early visual language should read as neutral machinery, not danger.
*   Testers who never fetch the cache and reach the gate with a fully rested cooldown may never encounter the "necessary" moment at all this run, and conclude the charge is decorative — same failure mode flagged in the cache's own playtest history, now transplanted onto a new level.
*   If gate-open/closed states aren't legible at a glance (particularly under CSS canvas downscaling on the larger maze sizes), testers may not notice the door opened until they walk face-first into a wall that turns out to still be closed, or wonder why a previously-solid wall is suddenly a gap.

## 8. Implementation Spec Outline (for later, if approved)

If Ian approves this direction, the eventual implementation prompt should specify (not yet written in full):

*   Exact gate + trigger-zone rectangle coordinates and how they're derived from the level's beast-den/cache/safe-zone placement (so it's clear this is one new level, level 8, not a retrofit of level 7).
*   The precise collision-exclusion mechanism in `updatePlayer` (which obstacle(s) are conditionally skipped, and how `gateOpen` is computed once per frame from `level.gate`/`level.triggerZone` + beast.x/y).
*   The gate's distinct draw function and palette (explicitly not brick, not the stone-circle motif, not the cache diamond).
*   The exact `validate-levels.js` extension: two-state BFS (gate-closed reachability of trigger zone; gate-open reachability of safe zone), following the existing cache-reachability check's style.
*   Explicit non-goals for this pass: no multi-gate levels, no persistent/carryover gate state, no change to beast AI, no change to Cinder Charge accounting, no audio changes, no new controls.
*   A one-paragraph statement of what question this level is testing, in the same register as every prior README "what this tests" section, so the eventual playtest artifact has a clear falsifiable target.

## 9. Commit Recommendation

Implementation commit plus a separate playtest artifact commit — matching the pattern already established for every prior pass (Cinder Cache pass + its own playtest artifact 0007; Audio pass + 0008). A new system deserves its own isolated commit and its own review cycle rather than being folded into a broader batch, and the playtest evidence should land as its own artifact once Ian has actually run it, not bundled into the implementation commit.

## 10. Explicit Non-Recommendations

*   **Do not implement Candidate B (stacked/counted charges) yet** — it compounds an already-unresolved accidental-spend risk before that risk has been blind-tested even once.
*   **Do not ratify Trail of Embers, the Cinder Charge mechanic, or this new gate mechanic as source-of-truth.** This remains a probe.
*   **Do not add a latch-timer, gate-state persistence, multiple gates, or any inventory/score UI** beyond the existing `#cache-status` span pattern.
*   **Do not touch beast AI, audio tuning, controller input handling, or levels 1–7 in any way.**
*   **Do not treat this as a green light to build a "puzzle level" subgenre inside Trail of Embers** — this should stay one bounded level testing one bounded question, not the start of a lock-and-key content vector.
*   **Do not skip the two-state validator extension in the name of speed** — an ungated safe zone or a permanently-softlocked level is exactly the kind of failure the existing BFS check exists to catch, and a dynamic obstacle set is the first time that check's static assumption has been challenged.
