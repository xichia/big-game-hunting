# Trail of Embers — Level 10 Combination Brainstorm

ARTIFACT TYPE: Brainstorm / Research
AUTHORITY: EVIDENCE FUEL ONLY
STATUS: Draft — brainstorm only, not implementation, not ratified truth
DATE: 2026-07-08
SOURCE-OF-TRUTH FILES TOUCHED: none
IMPLEMENTATION INCLUDED: none

This document is a bounded brainstorm for a possible Level 10 that combines
Cinder Cache, Beast Gate, and One-Way Passages in Trail of Embers. It does
not authorize implementation. It does not ratify any Level 10 design as
truth. It explores concept shapes, risks, and a recommended first slice so
Ian can decide what to probe next.

---

## Model Consultation Record

- **GLM 5.2 consulted:** Yes (architect agent, read-only design critique).
- **DeepSeek V4 Pro consulted:** Yes (reviewer-deepseek-pro agent, read-only design critique).

### GLM 5.2 Summary

GLM 5.2 recommended three concept shapes: (A) a linear Gauntlet of gated chambers with one-way commitments, (B) a Hub-and-Spoke lure loop where the player delivers the beast to one trigger at a time and escapes via one-way passages, and (C) a Sacrifice Maze requiring sequential baiting across multiple zones. GLM preferred **Hub-and-Spoke** as the safest first implementation because each spoke isolates one encounter, the hub acts as a natural recharge beat, and the beast is bounded to one zone at a time. Its core anti-puzzle-soup principle: "The beast must always be a moving threat, never a key." Kill signals: frequent full restarts, beast pacing idle outside triggers, playtesters calling it "the puzzle level."

### DeepSeek V4 Pro Summary

DeepSeek V4 Pro recommended three concept shapes: (A) a linear Gauntlet with sequential gates and one-way lure routes, (B) a Labyrinthine Ring with one-way inward commitments and a final gate exam, and (C) a Two-Lane Chase where the gate and one-way interact adversarially. DeepSeek preferred **the Gauntlet (linear-synthesis)** as safest because it is sequential, debuggable, and matches the "one new thing per level" ramp. Its core anti-puzzle-soup principle: "The beast must still feel like the primary threat; every mechanic must serve a moment where the player thinks 'the beast is closing in and I need to act.'" Kill signals: player can't explain what killed them, gate never engages the one-way system, >15 attempts to first win.

### Disagreement

GLM preferred Hub-and-Spoke (modular, isolated encounters). DeepSeek preferred the Gauntlet (linear, sequential, debuggable). These are compatible rather than contradictory — both favor structured, sequential flow over open-ended topology, and both agree the beast must remain a moving threat.

### How Feedback Influenced This Artifact

Both models converged on: (1) the beast must never become a static key, (2) softlock risk is the primary structural danger, (3) the cache must remain useful-but-not-mandatory. DeepSeek's Gauntlet recommendation influenced the desire for sequential readability and debuggability. GLM's Hub-and-Spoke recommendation influenced the desire for modular, bounded interactions. The manager-selected recommended first slice is Concept A: "The Beast Errand" — not pure Gauntlet and not Hub-and-Spoke — which draws on both influences while keeping the topology simple and the synthesis felt. The "beast as threat, not key" principle from both models is elevated to the top combination principle. This remains brainstorm / research evidence only, not implementation approval and not ratified truth.

### Which Recommendation the Manager Chose and Why

The manager chose **Concept A: "The Beast Errand"** as the recommended first slice. Rationale: it has higher tension than the pure Gauntlet (the one-way commitment creates a real point of no return, and the three mechanics interact in a single spatial problem rather than a sequence of isolated beats), simpler topology than Hub-and-Spoke (one gate, one trigger, one one-way), and clear mechanic beats — cache = safety net, one-way = commitment, gate = active luring, charge = escape. This is still brainstorm / research evidence only. It is not implementation approval and not ratified truth.

---

## 1. Design Problem

Level 10 is the first large synthesis level in Trail of Embers. It combines three mechanics that each affect route planning:

- **Cinder Cache / Cinder Charge** (introduced in Level 7): a stored emergency ember.
- **Beast Gate** (introduced in Level 8): a door that opens only while the beast occupies a trigger zone.
- **One-Way Passages** (introduced in Level 9): directional commitments the player cannot reverse.

The challenge:

- It is the first level that asks the player to use all three mechanics together.
- Each mechanic individually affects route planning; combined, they risk creating a lock-and-key puzzle rather than a survival experience.
- The risk is becoming too puzzle-like, too busy, or too hard to read.
- The goal is to make the player use the mechanics in a sequence that feels like survival — the beast is always closing in, every decision is made under pressure — not like solving a combination lock.

The core Trail of Embers loop must survive intact: light as bait, darkness pressure, readable spatial decisions, and one new layered challenge rather than puzzle soup.

---

## 2. Mechanic Roles

Each mechanic should have a clean, non-overlapping role in Level 10.

### Cinder Cache / Cinder Charge

- **Role:** Emergency tempo tool or planned reserve. The charge is the player's "one more beat" — a way to survive a moment where the normal cooldown is not ready and the beast is closing in.
- **Should contribute:** A felt safety net, a reason to weigh a detour, a resource that makes the escape beat after a gate sequence survivable.
- **Should NOT do:** Become a mandatory key that the level cannot be completed without. Become a decorative pickup that goes unused. Require the player to manage an inventory.

### Beast Gate

- **Role:** Forces intentional beast positioning. The player must actively lure the beast to a specific location to open a route. This is the level's "active engagement" beat — the player cannot just run past; they must manipulate the beast.
- **Should contribute:** A moment of deliberate, tense luring. A causal relationship the player can see (beast enters zone → gate opens). A reason to think about where the beast is, not just where the player is.
- **Should NOT do:** Become a switch the player flips and waits. Require precise AI exploitation. Be so remote from the player's position that the gate opening is invisible.

### One-Way Passage

- **Role:** Creates route commitment, time-waste, and irreversible routing. The passage says "if you go this way, you cannot come back." In Level 9, this was framed as a wrong-turn lesson. In Level 10, it should create commitment under pressure — the player must decide whether to commit to a route before they know if the bait will work.
- **Should contribute:** A moment of spatial commitment. Route memory. A consequence for wrong turns that is time-based, not lethal.
- **Should NOT do:** Trap the player permanently. Create softlocks. Be so confusing that the player does not understand the constraint.

---

## 3. Combination Principles

These principles govern how the three mechanics should interact in Level 10.

1. **One primary objective at a time.** The player should never need to think about all three mechanics simultaneously. Each beat of the level should foreground one mechanic while the others provide context.

2. **The player should always know why they failed.** When the player dies, they should be able to say "I baited too early," "I went through the wrong passage," or "I spent my charge too soon." If failure feels arbitrary or unreadable, the combination is broken.

3. **One-Way Passages should shape route memory, not trap the player permanently.** Following Level 9's lesson: one-way passages create time-waste and commitment, not permanent locks. The player should always have a recovery route, even if it costs time.

4. **Beast Gate should require luring, not precise AI exploitation.** The player drops an ember, the beast chases it into the trigger zone, the gate opens. The causal chain must be simple, visible, and reliable. No timing windows so tight that the player needs frame-perfect execution.

5. **Cinder Charge should rescue or enable timing, not become a mandatory key.** Unless the level clearly teaches that the charge is needed (which a synthesis level should not need to do), the charge should feel like a safety net that makes a hard moment survivable — not a key without which the door cannot be opened.

6. **The level should have fallback recovery routes where possible.** If the player makes a wrong turn or wastes a charge, there should be a way to recover — even if it costs time. Softlocks are unacceptable.

7. **The beast must remain a moving threat, never a switch.** This is the most important principle, endorsed by both consulted models. If the player can ever stand still and wait for the beast to do something, the level has become a puzzle. Every mechanic interaction should shorten the decision window, not lengthen it. The feeling should be "I'm risking my neck to lure this thing" — not "I'm placing a key in a slot."

---

## 4. Candidate Level 10 Concepts

### Concept A: "The Beast Errand"

- **Premise:** The player must lure the beast to open a gate, but the route to do so passes through a one-way commitment. The Cinder Charge provides a backup ember after committing.
- **Map structure:** A long approach corridor leads to a T-junction. Going left leads to the gate (closed). Going right leads through a one-way passage into the beast's territory, where the player must drop an ember to lure the beast back through a trigger zone adjacent to the gate. The one-way means the player cannot retreat — they must commit to the lure and then escape through the now-open gate.
- **Cinder Cache:** Placed in a side alcove near the T-junction, reachable before committing. Fetching it costs a detour but provides the charge for the escape beat.
- **Beast Gate:** At the junction between the approach and the safe zone. Opens only when the beast is lured into the trigger zone on the beast's side of the one-way passage.
- **One-Way Passage:** Between the T-junction and the beast's territory. The player passes through to reach the lure point but cannot return. After the gate opens, the escape route is a different path (through the gate, not back through the one-way).
- **Why it might work:** The one-way creates a clear commitment moment. The gate requires active luring. The charge provides a safety net for the escape. Each mechanic has a clear beat.
- **Biggest risk:** The player may not understand that they need to lure the beast *back through* the trigger zone after passing through the one-way. The spatial relationship between the one-way exit, the trigger zone, and the gate may be hard to read.
- **Kill signal:** Playtesters stand on the far side of the one-way and do not know how to open the gate because they cannot see the trigger zone from there.

### Concept B: "The Wrong Turn Before the Gate"

- **Premise:** A one-way passage can send the player into a time-wasting loop before the gate. The player learns to avoid the bad route, then uses the Cinder Charge to manage the real gate sequence.
- **Map structure:** The player approaches the gate from below. Two routes lead upward: the correct route (left) goes directly to the gate's trigger zone. The wrong route (right) goes through a one-way passage that loops the player around the beast's den and back to the left side — wasting time but teaching the map. The gate is at the top, with the trigger zone just below it. The Cinder Cache is in a side alcove off the correct route.
- **Cinder Cache:** Off the correct route, reachable without committing to the wrong turn. Fetching it adds a small detour but provides the charge for the escape beat after passing through the gate.
- **Beast Gate:** At the top of the map. The trigger zone is co-located with the gate. The player must drop an ember at the gate to lure the beast into the zone, then slip through.
- **One-Way Passage:** On the wrong route. Sends the player on a loop that wastes time but is not lethal. Teaches the player to take the correct route on subsequent attempts.
- **Why it might work:** The one-way passage is a learnable lesson (following Level 9's successful pattern). The gate sequence is the main challenge. The charge makes the escape survivable. The level teaches through failure, not through puzzle-solving.
- **Biggest risk:** The wrong turn may feel like a punishment rather than a lesson if the beast is too close or the loop is too long. The gate sequence may feel disconnected from the one-way lesson.
- **Kill signal:** Playtesters avoid the wrong turn after one attempt and never engage with the one-way mechanic again — it becomes irrelevant to the level.

### Concept C: "The Long Way with a Saved Ember"

- **Premise:** A long safe route exists. A short route requires one-way commitment and beast-gate timing. The Cinder Charge makes the short route survivable but not automatic.
- **Map structure:** The player starts at the bottom. The safe zone is at the top. Two routes lead upward: the long route (left) winds around the beast's territory with no gates or one-ways. The short route (right) goes through a one-way passage, then requires the player to lure the beast through a gate's trigger zone to reach the safe zone. The Cinder Cache is at the start of the short route.
- **Cinder Cache:** At the start of the short route. The player must fetch it before committing to the short route — it is the resource that makes the short route possible.
- **Beast Gate:** On the short route, between the one-way passage and the safe zone. The player must lure the beast to the trigger zone to open the gate and reach the safe zone.
- **One-Way Passage:** On the short route, between the cache and the gate. The player passes through and cannot return — they must commit to the gate sequence.
- **Why it might work:** The player has a clear choice: long and safe, or short and risky. The short route requires all three mechanics. The charge is the resource that tips the balance. The level rewards players who learn the map and take the short route on subsequent attempts.
- **Biggest risk:** The long route may feel like the "real" route and the short route may feel like an optional challenge rather than the intended synthesis. The cache may feel mandatory for the short route, violating the "useful but not required" principle.
- **Kill signal:** Playtesters always take the long route and never engage with the gate or one-way — the synthesis never happens.

### Concept D: "The Gauntlet"

- **Premise:** A linear sequence of three beats: approach, lure, escape. The one-way passage commits the player to the lure zone. The gate requires the beast to be lured. The charge saves the escape.
- **Map structure:** A long horizontal corridor. The player starts at the left. The safe zone is at the right. In the middle: a one-way passage (left-to-right) leads into a lure chamber. The beast starts in the lure chamber. The player must drop an ember to lure the beast into a trigger zone co-located with a gate at the far end of the chamber. The gate opens, and the player escapes to the safe zone. The Cinder Cache is in a side alcove before the one-way passage.
- **Cinder Cache:** Before the one-way passage. The player can fetch it without committing. It provides the charge for the escape beat.
- **Beast Gate:** At the far end of the lure chamber. Opens only when the beast is in the trigger zone.
- **One-Way Passage:** Between the approach corridor and the lure chamber. The player enters and cannot return — they must complete the lure sequence.
- **Why it might work:** The linear structure is the most debuggable. Each beat isolates one mechanic. The player encounters mechanics in a deliberate order. Softlock risk is minimized because the topology is simple.
- **Biggest risk:** The level may feel too linear and not "big" enough. The synthesis may feel like a sequence of isolated challenges rather than an integrated experience.
- **Kill signal:** Playtesters describe the level as "just level 8 with a one-way passage added" — the synthesis is not felt.

### Concept E: "The Hub-and-Spoke"

- **Premise:** A central hub radiates into spokes, each containing one Beast Gate. One-way passages return the player to the hub after each spoke. The player "delivers" the beast to one trigger at a time.
- **Map structure:** A central open area (the hub). Three spokes radiate outward, each ending in a Beast Gate. The player must lure the beast into each spoke's trigger zone to open the gate, then escape back to the hub via a one-way passage. The safe zone is beyond the third gate. The Cinder Cache is in the hub.
- **Cinder Cache:** In the hub. The player can return to the hub between spokes to pick it up (if not already collected).
- **Beast Gate:** One at the end of each spoke. Each requires the beast to be lured into the trigger zone.
- **One-Way Passage:** One per spoke, allowing the player to escape back to the hub after opening the gate.
- **Why it might work:** Each spoke is an isolated, independently testable encounter. The hub is a natural checkpoint and tension-release beat. The beast is bounded to one zone at a time, minimizing AI unpredictability.
- **Biggest risk:** Three gates may be too many — the level may feel repetitive. The hub-and-spoke structure may feel more like three small levels than one big synthesis.
- **Kill signal:** Playtesters describe the level as "three level 8s in a row" — the synthesis is not felt.

---

## 5. Required Concepts

The following three concept shapes were explicitly required by Ian's direction.

### A. "The Beast Errand" (Concept A above)

The player must lure the beast to open a gate, but the route to do so passes through a one-way commitment. The Cinder Charge provides a backup ember after committing.

### B. "The Wrong Turn Before the Gate" (Concept B above)

A one-way passage can send the player into a time-wasting loop before the gate. The player learns to avoid the bad route, then uses the Cinder Charge to manage the real gate sequence.

### C. "The Long Way with a Saved Ember" (Concept C above)

A long safe route exists. A short route requires one-way commitment and beast-gate timing. The Cinder Charge makes the short route survivable but not automatic.

---

## 6. Concept Comparison

| Concept | Readability | Tension | Implementation Risk | Validation Complexity | Preserves Core Loop | Puzzle Soup Risk | Recommended |
|---------|-------------|---------|---------------------|----------------------|---------------------|------------------|-------------|
| A. The Beast Errand | Medium — spatial relationship between one-way, trigger, and gate must be clear | High — commitment + lure + escape | Medium — spatial layout is tricky | Medium — must validate lure route, gate, and one-way | Yes — beast is always a threat | Medium — could feel like a puzzle if the lure is too static | **Recommended as first slice** |
| B. The Wrong Turn Before the Gate | High — follows Level 9's proven pattern | Medium — the wrong turn is low-stakes | Low — reuses Level 9's structure | Low — one-way is a lesson, not a lock | Yes — beast is always a threat | Low — the one-way is a lesson, not a puzzle element | Recommended as alternative |
| C. The Long Way with a Saved Ember | High — two clear routes | Medium — the short route is risky but optional | Low — two parallel routes are simple | Medium — must validate both routes | Yes — beast is always a threat | Low — the player chooses the challenge | Not recommended — synthesis may not happen |
| D. The Gauntlet | High — linear and sequential | Medium — may feel too linear | Low — simple topology | Low — linear validation | Yes — beast is always a threat | Low — each beat is isolated | Not recommended — may not feel "big" |
| E. The Hub-and-Spoke | Medium — hub is clear, spokes may be confusing | High — multiple lure sequences | High — three gates is complex | High — must validate three gate/trigger/one-way sets | Yes — beast is always a threat | Medium — could feel repetitive | Not recommended as first slice |

---

## 7. Recommended First Slice

**Concept A: "The Beast Errand"** is recommended as the best first implementation candidate.

Rationale:

- It is big — the level combines all three mechanics in a meaningful way.
- It is still hand-authored — one level, one map, no procedural generation.
- It is readable — the spatial relationship between the one-way, the trigger zone, and the gate can be made clear with careful layout.
- It is one level only — Level 10, not a retrofit of earlier levels.
- It is reversible if bad — if the concept fails, the level can be removed without affecting Levels 1–9.
- It is not source-of-truth ratification — this is a probe, not a commitment.

The Beast Errand was chosen over the Gauntlet (Concept D) because it has higher tension (the one-way commitment creates a real point of no return) and better synthesis (the three mechanics interact in a single spatial problem, not a sequence of isolated beats). It was chosen over Hub-and-Spoke (Concept E) because it is simpler to implement and validate (one gate, one trigger, one one-way) while still feeling big.

---

## 8. Recommended Level 10 Flow

A player-beat walkthrough for "The Beast Errand":

1. **Start.** The player begins in a small start chamber at the bottom-left of the map. The beast is far away in the upper-right. The torch illuminates a small area. The proximity rumble is faint.

2. **First route decision.** The player exits the start chamber and encounters a T-junction. Going left leads toward the gate (visible in the distance, closed). Going right leads toward the Cinder Cache (in a side alcove) and the one-way passage. The player must decide: fetch the cache first, or go directly to the gate?

3. **First ember decision.** If the player goes left toward the gate, they arrive at the closed gate with no charge and a normal cooldown. They must drop an ember to lure the beast, but the beast is far away and the cooldown is long. This is a teachable moment: the player learns they need the cache.

4. **Cache pickup.** The player goes right, fetches the Cinder Cache from the alcove. The HUD shows "cinder charge ready" → "cinder charge: held." The player now has a safety net.

5. **One-way commitment.** The player continues right and encounters the one-way passage. The chevrons point right. The player passes through and cannot return. They are now in the beast's territory.

6. **Beast lure.** The player is in a lure chamber. The beast is somewhere in the upper area. The player drops an ember near the trigger zone (co-located with the gate). The beast chases the ember into the trigger zone. The gate opens. The player can see the gate open because the trigger zone is co-located with the gate, and the beast is lit when it enters the zone.

7. **Gate opening.** The player slips through the gate while it is open. The beast is still in the trigger zone chasing the ember. The gate is open for as long as the ember is hot.

8. **Final escape.** The ember goes cold. The beast re-targets the player's torch. The player is now on the safe side of the gate, but the beast is chasing. The player's normal cooldown may not be ready. The player spends the Cinder Charge to drop an emergency ember, holding the beast off long enough to reach the safe zone.

9. **Safe zone.** The player reaches the stone circle. The level is won. The HUD shows "level 10 complete."

---

## 9. Tuning Guidance

Rough guidance for Level 10 tuning:

- **Field size:** 1800×1000 (same as Levels 6–9). No new scale step. The mechanic combination is the challenge, not the map size.
- **Beast speed:** 145 px/s (between Level 8's 150 and Level 9's 140). The level requires the beast to be fast enough to create pressure during the lure sequence, but not so fast that the player cannot reach the trigger zone before the beast arrives.
- **Ember cooldown:** 3500ms (same as Level 7 and 8). The long cooldown is what makes the Cinder Charge feel necessary for the escape beat.
- **Ember lifetime:** 4000ms (same as Levels 3–9). The ember must stay hot long enough for the beast to reach the trigger zone and for the player to slip through the gate.
- **Cinder Cache placement:** In a side alcove off the route to the one-way passage. The alcove should be a real detour (not on the direct path), but not so far that fetching it is a chore. The player should arrive at the one-way passage with the charge in hand.
- **One-way passages:** One passage, between the cache route and the lure chamber. The passage should be clearly marked with chevrons and floor arrows. The player should see the passage before committing.
- **Gate placement:** At the far end of the lure chamber, between the chamber and the safe zone. The trigger zone should be co-located with the gate (the doorway is the bait spot).
- **Empty space vs. corridor structure:** The lure chamber should be mostly open (room to circle the beast and drop the ember), but the approach to the chamber should be corridor-like (to create tension and funnel the player). The safe zone should be close to the gate (a short dash, not another maze leg).

---

## 10. Validation Implications

`validate-levels.js` may need to verify:

- **Safe zone reachable with gate open.** BFS from player start to safe zone, with the gate obstacle excluded (open state). Confirms the level is completable.
- **Gate closed blocks intended route.** BFS from player start to safe zone, with the gate obstacle included (closed state). Confirms the gate is actually gating something (not decorative).
- **Trigger zone reachable.** BFS from player start to the trigger zone, with the gate closed. Confirms the player can reach the lure point.
- **Cinder Cache reachable.** BFS from player start to the cache. Confirms the cache is not sealed off.
- **One-way routes valid.** BFS with one-way passages treated as directional edges. Confirms the player can reach the lure chamber through the one-way, and can reach the safe zone through the gate after the lure.
- **No softlocks.** Verify that the player cannot get stuck in an unwinnable state. Specifically: after passing through the one-way, the player must be able to reach the trigger zone, and after the gate opens, the player must be able to reach the safe zone.
- **Optional recovery route if possible.** If the player makes a wrong turn or wastes a charge, is there a way to recover? This is harder to validate automatically, but the level design should include a fallback (e.g., a second route to the safe zone that does not require the gate, but is much longer).

---

## 11. Playtest Questions

After implementation, Ian should answer:

1. Did the level feel like a synthesis of the three mechanics, or like a puzzle?
2. Did the Cinder Charge feel useful but not arbitrary? Was there a moment where spending it felt like a save, not a formality?
3. Did the gate still read as beast-caused? Did the player understand that the beast entering the trigger zone opened the gate?
4. Did the one-way passage create a felt commitment moment? Did the player think "if I go through this, I cannot come back"?
5. Was the level big in a good way? Did it feel like a capstone, or just a longer version of Level 8?
6. Did failure feel understandable? When the player died, could they say what they did wrong?
7. Did the beast remain a moving threat throughout? Or did the player ever stand still and wait for the beast to do something?
8. Did the spatial relationship between the one-way, the trigger zone, and the gate read clearly? Or did the player get confused about where to lure the beast?
9. Did the cache detour feel worth it? Or did it feel like a chore?
10. Did the escape beat after the gate feel tense? Or did the player breeze through because the cooldown was ready?

---

## 12. Non-Goals

This brainstorm explicitly rejects:

- **New mechanics.** Level 10 combines existing mechanics only. No new systems.
- **New controls.** The player uses the same inputs (move, drop ember, restart).
- **Tutorial panels.** The level must be learnable through play. No text, no instructions.
- **Multiple gates** unless strongly justified. One gate is enough to test the synthesis.
- **Multiple caches** unless strongly justified. One cache is enough to provide the charge.
- **Source-of-truth changes.** This artifact does not ratify any design. It is evidence fuel.
- **Procedural generation.** The level is hand-authored.
- **Broad art pass.** The level uses existing visual language.
- **Changing Levels 1–9.** Level 10 is additive only.

---

## 13. Final Recommendation

- **Recommended concept:** Concept A, "The Beast Errand."
- **Recommended executor lane for later implementation:** OpenCode (this lane). The implementation is a single-file change (index.html) plus validation extensions (validate-levels.js). No external dependencies, no server, no build step.
- **Exact files likely touched if implemented:**
  - `prototypes/trail-of-embers/index.html` — Level 10 data (new), level data shape comments.
  - `prototypes/trail-of-embers/validate-levels.js` — two-state BFS (gate open/closed), one-way directional reachability, cache reachability, trigger zone reachability.
  - `prototypes/trail-of-embers/README.md` — document the new level and the combination.
- **Exact files forbidden:**
  - `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` — no source-of-truth files touched.
  - `artifacts/probes/0009-trail-of-embers-one-way-passages-probe-brief.md` — the Level 9 probe brief, unchanged.
  - `artifacts/playtests/0009-trail-of-embers-level-9-crossroads-playtest.md` — the Level 9 playtest, unchanged.
  - Sailor/Bupa files — no changes, no inspection, no stash interaction.
- **Whether to implement next or do another review first:** This artifact is a brainstorm, not an implementation plan. Ian should review the concept shapes and the recommended first slice before deciding whether to proceed to a probe brief (like the Level 9 probe brief) or directly to implementation. Given that the Cinder Cache and Beast Gate have not been blind-tested, and the One-Way Passages were reframed as a wrong-turn lesson rather than a commitment mechanic, a probe brief may be warranted before implementation.

---

END OF ARTIFACT
