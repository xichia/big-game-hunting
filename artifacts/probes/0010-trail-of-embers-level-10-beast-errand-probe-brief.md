# Probe Brief: The Beast Errand — Trail of Embers Level 10 First Slice

ARTIFACT TYPE: Probe Brief
AUTHORITY: EVIDENCE FUEL ONLY
STATUS: Draft — probe brief only, not implementation, not ratified truth
DATE: 2026-07-08
SOURCE-OF-TRUTH FILES TOUCHED: none
IMPLEMENTATION INCLUDED: none

This document is a bounded probe brief for a possible Level 10 that combines
Cinder Cache / Cinder Charge, Beast Gate, and One-Way Passages in Trail of
Embers. It does not authorize implementation. It does not ratify any Level 10
design as truth. It narrows Concept A ("The Beast Errand") from the Level 10
combination brainstorm into one implementable first slice that can later be
handed to an implementer. It treats the brainstorm as evidence fuel, not
authority.

---

## 1. Probe Question

Can combining Cinder Cache / Cinder Charge, Beast Gate, and One-Way Passages
into a single level create one tense survival sequence — where the player
commits through a one-way passage, lures the beast to a gate trigger, and
uses the charge as an escape safety net — without becoming puzzle soup?

Null hypothesis: the three mechanics together create a lock-and-key puzzle
where the player stands still waiting for gate/beast behavior, or the
spatial relationship between the one-way, trigger zone, and gate is
unreadable, or the charge becomes either always-unused or always-mandatory.

---

## 2. One-Sentence Concept

The player commits through a one-way passage into the beast's territory,
lures the beast to a gate trigger zone, and uses the Cinder Charge as the
escape safety net.

---

## 3. Design Intent

Each mechanic has a clean, non-overlapping role:

- **Cinder Cache / Cinder Charge** = safety net. The charge is the player's
  "one more beat" during the escape after the gate opens. It is useful but
  not mandatory — a skilled player with good cooldown timing may not need
  it, but it makes a hard moment survivable.
- **One-Way Passage** = commitment. The passage creates a point of no
  return. The player must decide to enter the beast's territory knowing
  they cannot retreat. This is commitment under pressure, not a puzzle lock.
- **Beast Gate** = active luring. The player must deliberately draw the
  beast into a trigger zone to open a route. This is the level's active
  engagement beat — the player cannot just run past.
- **Cinder Charge (escape tempo)** = the charge provides an emergency ember
  during the escape dash after the gate opens and the beast re-targets the
  player's torch.
- **The beast remains a moving threat, not a key.** This is the most
  important principle, endorsed by both consulted models in the brainstorm.
  If the player can ever stand still and wait for the beast to do something,
  the level has become a puzzle. Every mechanic interaction should shorten
  the decision window, not lengthen it.

---

## 4. Proposed Topology

The layout is described clearly enough for later implementation. No code is
written here.

### Start location

The player begins in a small start chamber at the bottom-left of an
1800x1000 field. The beast starts far away in the upper-right area. Torch
illuminates a small radius. Proximity rumble is faint.

### T-junction / first route decision

The player exits the start chamber and encounters a T-junction. A central
vertical wall with a single gap creates an unambiguous left/right decision:

- **Going left** leads toward the Beast Gate (visible in the distance,
  closed). The player arrives at the gate with no charge and a normal
  cooldown — a teachable dead end that encourages trying the other route.
- **Going right** leads toward the Cinder Cache alcove and the one-way
  passage into the beast's territory.

### Cinder Cache alcove

A sealed alcove (roofed and walled on three sides, open only from the
corridor side — the same proven "out-and-back, no shortcut" shape validated
in Level 7) sits off the right route. Fetching it is a real detour but not
a chore. The player arrives at the one-way passage with the charge in hand.

### One-way commitment passage

A single one-way passage sits between the cache route and the lure chamber.
Chevrons and floor arrows point in the allowed direction (rightward /
eastward). The player passes through and cannot return. The beast ignores
the passage entirely (consistent with existing wall-ghosting behavior).

### Lure chamber

Beyond the one-way passage, the player enters a mostly open lure chamber in
the beast's territory. The chamber has room to circle and position, but the
approach from the one-way is corridor-like (creating tension and funneling).
The beast roams in the upper area of this chamber.

### Beast Gate and trigger-zone relationship

At the far end of the lure chamber, between the chamber and the safe zone,
sits the Beast Gate. The trigger zone is co-located with the gate doorway
itself — the bait spot is the threshold. The gate opens only while the
beast is physically inside the trigger zone. The gate closes the instant
the beast leaves. The gate blocks the player only (the beast passes through
freely, consistent with existing behavior).

The co-location is critical: the player drops an ember at/near the gate
threshold, the beast chases the ember into the trigger zone, the gate opens,
and the player — who is already positioned nearby to lure — can see the
gate open in the same lit moment. This avoids the remote-switch problem
where the gate opening is invisible.

### Escape route

Through the gate and into a short escape corridor. The safe zone is close
to the gate — a short, tense dash, not another maze leg. The escape beat
is where the Cinder Charge may be needed: the bait ember goes cold, the
beast re-targets the player's torch, and the player's normal cooldown may
not be ready.

### Safe zone

The stone circle, just beyond the gate. Reaching it wins the level.

---

## 5. Player-Beat Walkthrough

Expected beats from start to win:

1. **Start.** Player begins in the bottom-left start chamber. Beast is far
   away upper-right. Torch illuminates a small area. Rumble is faint.

2. **Notice closed gate / route choice.** Player exits the start chamber
   and encounters the T-junction. Going left, they can see the closed gate
   in the distance (or discover it on approach). Going right leads toward
   the cache and one-way passage.

3. **Optional or encouraged cache pickup.** Player goes right, finds the
   Cinder Cache alcove. The detour costs time and distance but grants the
   stored charge. HUD shows "cinder charge ready" then "cinder charge:
   held."

4. **One-way commitment.** Player continues right and encounters the one-way
   passage. Chevrons point right. The player passes through and cannot
   return. They are now in the beast's territory.

5. **Lure setup.** Player is in the lure chamber. The beast is somewhere in
   the upper area. The player approaches the gate (closed) and drops an
   ember at/near the gate threshold to lure the beast.

6. **Beast enters trigger zone.** The beast chases the ember into the
   trigger zone co-located with the gate. The gate opens. The beast is lit
   and visible in the trigger zone, making the causal relationship clear.

7. **Gate opens — player slips through.** The player dashes through the
   open gate while the beast is still chasing the bait ember. The gate is
   open for as long as the ember is hot and the beast remains in the zone.

8. **Charge used or held during escape.** The bait ember goes cold. The
   beast re-targets the player's torch and gives chase. The player's normal
   cooldown may not be ready. The player spends the Cinder Charge to drop
   an emergency ember, holding the beast off long enough to reach the safe
   zone. (Or, if cooldown timing was favorable, the player escapes with a
   normal drop — the charge goes unused, which is fine.)

9. **Safe zone reached.** Player reaches the stone circle. Level won.

---

## 6. Failure Cases

Readable failure modes the level should produce:

1. **Skips cache and lacks emergency tempo.** Player goes left to the gate
   directly, has no charge, and the normal cooldown is not ready during the
   escape. The beast catches them. Teachable: the cache exists for a reason.

2. **Drops ember too early.** Player drops the bait ember too far from the
   trigger zone. The beast chases the ember but the ember goes cold before
   the beast reaches the zone. The gate never opens. The beast re-targets
   the player.

3. **Commits through one-way without understanding route.** Player rushes
   through the one-way passage without reading the layout. They are in the
   beast's territory without a plan. The beast is close. Panic death.

4. **Beast reaches player before trigger.** Player drops the bait but is
   too close to the beast when it arrives. The beast targets the player
   instead of (or in addition to) the ember. The player is caught before
   the gate opens.

5. **Gate relationship is unclear.** Player does not understand that the
   beast entering the trigger zone opens the gate. They stand around
   waiting for the gate to open on its own, or they try to walk through
   the closed gate repeatedly.

6. **Charge trivializes or is mandatory.** If the charge is always unused,
   the cache detour felt pointless. If the charge is always mandatory, the
   level became a lock-and-key puzzle. The tuning should make the charge
   feel like a safety net, not a key.

7. **Player waits for beast like it is a switch.** The player stands still
   and waits for the beast to wander into the trigger zone on its own,
   rather than actively luring it. The level has become a puzzle.

---

## 7. Tuning Guardrails

Rough values and constraints. These are design guidance, not final numbers.
Implementation evidence should drive final tuning.

- **Field size:** 1800x1000 (same as Levels 6-9). No new scale step. The
  mechanic combination is the challenge, not the map size.
- **Beast speed:** Near existing Level 8/9 range (140-150 px/s). The
  brainstorm suggests 145 px/s as a middle ground. The beast must be fast
  enough to create pressure during the lure sequence but not so fast that
  the player cannot reach the trigger zone before the beast arrives.
- **Ember cooldown:** Likely 3500ms (same as Levels 7-8). The long cooldown
  is what makes the Cinder Charge feel necessary for the escape beat.
- **Ember lifetime:** Likely 4000ms (same as Levels 3-9). The ember must
  stay hot long enough for the beast to reach the trigger zone and for the
  player to slip through the gate.
- **Cache placement:** A real detour but not a chore. The alcove should be
  off the direct path (not a waystation), reachable before the one-way
  commitment. The player should arrive at the one-way with the charge in
  hand if they choose to fetch it.
- **Safe zone proximity:** Close enough after the gate that the escape is
  tense but not another maze leg. A short dash, not a traversal. The payoff
  for a successful bait should be immediate.
- **One-way passage:** One passage only. Clearly marked with chevrons and
  floor arrows. The player should see the passage before committing.
- **Gate / trigger zone:** Co-located. The doorway is the bait spot. No
  remote switch-and-door layout.

---

## 8. Validation Implications

`validate-levels.js` may need to verify the following when Level 10 is
implemented later. No validation changes should be made in this task.

- **Level 10 exists only if implemented later.** This probe brief does not
  create Level 10.
- **Safe zone reachable when gate is treated as open.** BFS from player
  start to safe zone, with the gate obstacle excluded (open state). Confirms
  the level is completable.
- **Gate blocks intended route when closed.** BFS from player start to safe
  zone, with the gate obstacle included (closed state). Confirms the gate
  is actually gating something (not decorative).
- **Cinder Cache reachable before commitment.** BFS from player start to
  the cache. Confirms the cache is not sealed off and is reachable without
  passing through the one-way.
- **Trigger zone reachable / interactable.** BFS from player start (after
  one-way passage) to the trigger zone. Confirms the player can reach the
  lure point.
- **One-way passage does not softlock the player.** After passing through
  the one-way, the player must be able to reach the trigger zone, and after
  the gate opens, the player must be able to reach the safe zone. No
  unwinnable state.
- **Escape path exists after the gate opens.** BFS from the gate (open
  state) to the safe zone. Confirms the escape route is valid.
- **No new validation change should be made in this task.** This probe brief
  is an artifact only.

---

## 9. Playtest Questions

Focused questions for Ian after implementation and self-playtest:

1. Did the player understand the one-way commitment? Did they feel "if I go
   through this, I cannot come back"?
2. Did the gate feel like luring the beast, not flipping a switch? Did the
   player actively draw the beast to the trigger zone, or did they stand
   and wait?
3. Did the charge feel like a safety net or a required key? Was there a
   moment where spending it felt like a save, not a formality?
4. Was the first failure explainable? When the player died, could they say
   what they did wrong?
5. Did the level feel big and tense without becoming confusing? Was it a
   capstone feeling, or just a longer version of Level 8?
6. Did the beast remain the primary threat throughout? Or did the player
   ever stand still and wait for gate/beast behavior?
7. Did the spatial relationship between the one-way, trigger zone, and gate
   read clearly? Or did the player get confused about where to lure?
8. Did the cache detour feel worth it? Or did it feel like a chore?
9. Did the escape beat after the gate feel tense? Or did the player breeze
   through because the cooldown was ready?
10. Did the level feel like a synthesis of three mechanics, or like a
    puzzle?

---

## 10. Kill Signals

Concrete failure criteria. If any of these are observed during playtesting,
the concept should be reconsidered:

- **Player calls it "the puzzle level."** The synthesis has become
  lock-and-key rather than survival.
- **Player stands still waiting for beast/gate behavior.** The beast has
  become a switch, not a threat.
- **Player cannot explain death.** Failure is unreadable. The combination
  has become too complex to learn from.
- **Gate trigger relationship is invisible.** The player does not understand
  that the beast entering the zone opens the gate. The causal chain is
  broken.
- **One-way creates perceived softlock.** The player goes through and feels
  trapped, not committed. The recovery route is not findable.
- **Charge is always unused or always mandatory.** Either the cache detour
  felt pointless, or the level cannot be completed without it.
- **Level takes too many attempts because of confusion rather than skill.**
  The player is not learning; they are guessing. More than ~15 attempts to
  first win suggests the spatial relationship is unreadable.

---

## 11. Non-Goals

This probe brief explicitly excludes:

- **New mechanics.** Level 10 combines existing mechanics only. No new
  systems, no new controls, no new input handling.
- **New UI/tutorial panels** unless separately approved. The level must be
  learnable through play and visual language alone. No text, no instructions.
- **Procedural generation.** The level is hand-authored.
- **Source-of-truth updates.** This artifact does not ratify any design. It
  is evidence fuel. No changes to GAME_TRUTH.md, DESIGN_PRINCIPLES.md,
  MECHANICS.md, DECISION_LOG.md, PLAYTEST_LOG.md, or BALANCE_NOTES.md.
- **Changes to Levels 1-9.** Level 10 is additive only.
- **Sailor/Bupa work.** No changes, no inspection, no stash interaction.
- **Implementation in this task.** This is a probe brief artifact only.

---

## 12. Implementation Handoff Notes

This section describes what a later implementation prompt should probably
ask for. It does not write that prompt in full. This current task must not
touch any prototype code.

### Likely scope of a future implementation

- Add Level 10 data to the `LEVELS` array in `index.html`, including
  obstacles, one-way passages, a Cinder Cache, a Beast Gate, and a trigger
  zone.
- Extend `validate-levels.js` to handle the two-state BFS (gate open/closed)
  and verify the topology described in Section 8.
- Update `prototypes/trail-of-embers/README.md` to document Level 10 and
  the three-mechanic combination.

### Likely touched files (later, not now)

- `prototypes/trail-of-embers/index.html` — Level 10 data (new level entry
  in the `LEVELS` array). No new mechanics, no new collision logic, no new
  rendering — all three mechanics (Cinder Cache, Beast Gate, One-Way
  Passages) are already implemented from Levels 7-9.
- `prototypes/trail-of-embers/README.md` — document the new level and the
  combination.
- `prototypes/trail-of-embers/validate-levels.js` — two-state BFS (gate
  open/closed), one-way directional reachability, cache reachability,
  trigger zone reachability.

### Files forbidden (now and later unless explicitly re-scoped)

- `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`,
  `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` — no source-of-truth files touched.
- Sailor/Bupa files — no changes, no inspection, no stash interaction.
- Levels 1-9 data — unchanged.

### What the implementation prompt should specify

- Exact rectangle coordinates for the gate, trigger zone, one-way passage,
  cache alcove, and obstacles.
- Beast speed, ember cooldown, and ember lifetime values (likely reusing
  Level 7/8 values per the tuning guardrails above).
- The two-state validation checks (gate open/closed BFS).
- Explicit non-goals: no new mechanics, no new controls, no source-of-truth
  changes, no changes to Levels 1-9.

---

END OF PROBE BRIEF
