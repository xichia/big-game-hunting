# Trail of Embers — Level Progression Feature Ideation

ARTIFACT TYPE: Research / ideation — evidence fuel, not ratified design
STATUS: Draft — ideation only, no implementation, no ratification
DATE: 2026-07-07
SOURCE-OF-TRUTH FILES TOUCHED: none
IMPLEMENTATION INCLUDED: none

This artifact is a grounded feature-progression ideation run. It proposes
what kinds of new elements Trail of Embers *could* introduce as levels
increase, and in what order, to help Ian decide what to probe next. It is
not a roadmap, not an implementation plan, and not ratified design truth.
Nothing here is committed to. Everything here is a testable hypothesis
that can be accepted, modified, or rejected based on evidence.

---

## 1. Current Progression Summary

### How Levels 1–8 Progress

| Level | Name | Field Size | Key Design Beat |
|-------|------|------------|-----------------|
| 1 | First Light | 900×560 | Teaches ember-as-bait. Easy on purpose. |
| 2 | The Guarded Circle | 900×560 | Pocket wall. Must bait beast away before approach. Pure spatial difficulty, same tuning as L1. |
| 3 | The Long Dark | 900×560 | Serpentine walls. Faster beast (150), slower embers (1.5s/4.0s). Emergent 3-hot-ember cap. Route memory + timed bait. |
| 4 | The Ember Maze | 1280×760 | First larger maze. Banded structure, bait pocket, fair dead end, bail-out loop. |
| 5 | The Deep Maze | 1600×900 | Bigger/tighter. Orientation chamber, weave, landmark, bait nook, final jog. |
| 6 | The Coiled Maze | 1800×1000 | Six bands, full S-coil. Intentional squeeze (30px), wide bait chamber, bail-out loop. |
| 7 | The Ember Ring | 1800×1000 | Arena with central island. Two lanes (direct vs long way). Cinder Cache in sealed alcove grants stored Cinder Charge. |
| 8 | The Gatekeeper's Keep | 1800×1000 | Beast-activated gate + trigger zone. Gate open only while beast is in zone. Must lure, slip through, escape. |

### Progression Dimensions Already Explored

- **Maze size:** 900×560 → 1280×760 → 1600×900 → 1800×1000 (4 scale steps)
- **Path complexity:** Simple → pocket walls → serpentine → banded coils → arena with lanes → gated chokepoint
- **Ember cooldown pressure:** 0.9s → 1.5s → 3.5s (longer cooldown = more consequential drops)
- **Cinder Charge:** Stored one-use resource, spend mid-cooldown for immediate ember. No new control.
- **Gate/trigger logic:** Beast-activated gate. Open only while beast occupies trigger zone.
- **Audio/proximity tension:** Non-directional rumble scales with beast distance (110Hz carrier).
- **Controller feel:** Standard gamepad mapping, edge-triggered inputs.
- **Pixel-art readability:** Blocky sprites, brick masonry, stone circle. Tested at scale via CSS canvas shrink.

### What Has NOT Been Blind-Tested

- Cinder Charge (implemented, self-playtested, not blind-tested)
- Beast gate (implemented, not yet playtested at all)
- Audio proximity cue (implemented, self-playtested, not blind-tested)
- Any level beyond Level 3 with an external tester

---

## 2. Progression Design Principles for Trail of Embers

These principles govern which new elements are worth probing and which
should be rejected. They are derived from the evidence sequence, the
design principles (source of truth), and the specific risks identified in
playtest artifacts.

1. **Preserve the core light-as-bait loop.** Every new element must
   combine with embers, beast, and maze. If an element doesn't make the
   ember decision more interesting, it doesn't belong here.

2. **One new learnable idea at a time.** Each level that introduces a
   new mechanic should introduce *only* that mechanic. Combinations come
   in later levels, after the idea has been learned in isolation.

3. **No tutorial burden.** The player should discover what a new element
   does by interacting with it, not by reading text. If it can't be
   learned through play, it's too complex for this prototype.

4. **Player should understand failure.** When the player dies, they
   should be able to say "I should have done X instead." If failure
   feels arbitrary or unreadable, the element is broken.

5. **New elements should combine with old ones.** A new mechanic that
   only works in isolation is a gimmick. A new mechanic that creates
   new interactions with embers, the beast, Cinder Charge, or gates is
   depth.

6. **Avoid the content treadmill.** Bigger hand-authored mazes are a
   proven vector but they don't scale indefinitely. New elements should
   create *systemic* variety (combinatorial depth), not just *content*
   variety (more maps).

7. **Prefer spatial/behavioral consequences over UI systems.** A new
   element that changes how the player moves, baits, or routes is
   better than one that adds menus, inventories, or counters. The
   prototype's strength is immediate physical intuition.

8. **Keep it Ian-programmable, Mac-local, prototype-friendly.** No
   element should require a build system, external assets, server
   infrastructure, or a team. If it can't be implemented in a single
   HTML file in an afternoon, it's too big for this phase.

9. **Protect "good lost" from "bad lost."** The distinction between
   "I don't know the map yet but I can learn it" and "I have no idea
   what happened" is the prototype's most fragile achievement. Every
   new element must preserve the player's ability to form a plan after
   one or two failures.

10. **Every new element must be killable.** If a probe doesn't work,
    it should be removable without breaking the rest of the prototype.
    No element should become load-bearing for levels 1–8.

---

## 3. Feature Candidate List

### Terrain / Maze Elements

**3.1 Crumbling Walls**
- *Description:* Walls that collapse after the beast passes through them, opening new routes.
- *Decision it creates:* Do I route through a crumbling wall knowing it will open for the beast behind me?
- *Combination:* Beast ghosting + maze routing. The beast's wall-ignoring becomes a map-altering event.
- *Why it deepens mastery:* Players must predict where the beast will emerge, not just where it's going.
- *Implementation complexity:* medium (new obstacle state, collapse animation, BFS re-validation)
- *Blind-test dependency:* medium (tester must understand causality)
- *Risk of bloat:* low (one-time event per wall, no persistent state)

**3.2 One-Way Passages**
- *Description:* Narrow gaps the player can pass through in one direction only.
- *Decision it creates:* Do I take this shortcut knowing I can't come back the same way?
- *Combination:* Maze routing + beast pursuit. Creates commitment moments.
- *Why it deepens mastery:* Forces route planning under pressure. A one-way escape route can save you, but only if you committed to the right path.
- *Implementation complexity:* low (directional collision check)
- *Blind-test dependency:* low (visual language can be clear)
- *Risk of bloat:* low (purely spatial, no new state)

**3.3 Dark Zones**
- *Description:* Areas where the player's torch radius is reduced.
- *Decision it creates:* Do I take the short route through darkness or the long route through light?
- *Combination:* Torch visibility + ember placement. Embers become even more valuable in dark zones.
- *Why it deepens mastery:* Creates tension gradients within a single level. Players must manage visibility as a resource.
- *Implementation complexity:* low (per-region torch radius modifier)
- *Blind-test dependency:* low (visual difference is immediate)
- *Risk of bloat:* low (purely environmental, no new mechanics)

### Light / Ember Variants

**3.4 Bright Embers**
- *Description:* Embers that illuminate a larger radius but burn for a shorter time.
- *Decision it creates:* Do I drop a bright ember for maximum visibility now, or a normal ember for longer bait duration?
- *Combination:* Ember cooldown + beast attraction. Different ember types could attract the beast differently.
- *Why it deepens mastery:* Adds a quality dimension to the ember decision, not just timing and placement.
- *Implementation complexity:* medium (new ember type, per-level config, visual distinction)
- *Blind-test dependency:* medium (tester must understand the tradeoff)
- *Risk of bloat:* medium (risks becoming an ember inventory if not carefully bounded)

**3.5 Decoy Embers**
- *Description:* Embers that attract the beast but don't illuminate.
- *Decision it creates:* Do I drop a decoy to pull the beast away from a path, even though I can't see where I'm going?
- *Combination:* Beast AI + fog-of-war. Separates "light the path" from "distract the beast."
- *Why it deepens mastery:* Pure bait, pure risk. The player must trust the mechanic and navigate blind.
- *Implementation complexity:* low (new ember flag, no light radius)
- *Blind-test dependency:* medium (tester must understand the difference)
- *Risk of bloat:* low (single new ember property)

**3.6 Fading Embers**
- *Description:* Embers whose light radius shrinks over time instead of staying constant until they go cold.
- *Decision it creates:* Do I drop an ember now while it's bright, or wait until I'm in a tighter spot?
- *Combination:* Ember lifetime + visibility. Creates urgency within the ember's lifetime.
- *Why it deepens mastery:* Adds a temporal dimension to ember placement. Players must time drops more precisely.
- *Implementation complexity:* low (radius = f(age))
- *Blind-test dependency:* low (visual change is obvious)
- *Risk of bloat:* low (purely visual/temporal, no new state)

### Beast Behavior Variants

**3.7 Hesitant Beast**
- *Description:* The beast pauses briefly before changing targets, creating a window where the player can commit to a route.
- *Decision it creates:* Do I drop an ember now to lock in the beast's next target, or wait to see if it commits to my torch?
- *Combination:* Beast AI + ember timing. Creates a micro-game of target commitment.
- *Why it deepens mastery:* Players can "read" the beast's hesitation and exploit it. Adds a skill layer to bait timing.
- *Implementation complexity:* low (add delay to target switch)
- *Blind-test dependency:* medium (tester must notice the hesitation)
- *Risk of bloat:* low (purely behavioral, no new state)

**3.8 Patrol Beast**
- *Description:* The beast follows a fixed patrol route until it detects light, then switches to chase.
- *Decision it creates:* Do I time my route to avoid the patrol, or do I use embers to redirect it?
- *Combination:* Beast AI + route planning. Adds a timing/pattern-reading layer.
- *Why it deepens mastery:* Players learn the patrol pattern and plan around it. Creates "good lost" moments where the player can observe before acting.
- *Implementation complexity:* medium (patrol path data, detection logic)
- *Blind-test dependency:* medium (tester must learn the pattern)
- *Risk of bloat:* medium (risks becoming a puzzle-game if patrol patterns are too complex)

**3.9 Split-Attention Beast**
- *Description:* The beast is attracted to the *closest* hot ember, not the newest. Multiple hot embers create competing targets.
- *Decision it creates:* Do I drop embers in a line to pull the beast away, or cluster them to create confusion?
- *Combination:* Ember placement + beast AI. Changes the fundamental bait strategy.
- *Why it deepens mastery:* Players must think spatially about ember placement, not just temporally. Creates emergent bait patterns.
- *Implementation complexity:* low (change target selection from newest to closest)
- *Blind-test dependency:* high (tester must understand the new rule)
- *Risk of bloat:* low (purely behavioral change, no new state)

### Gates / Locks / Triggers

**3.10 Timed Gates**
- *Description:* Gates that open and close on a fixed cycle, independent of the beast.
- *Decision it creates:* Do I wait for the gate to open, or do I use embers to bait the beast while I time my approach?
- *Combination:* Gate logic + ember timing. Adds a temporal dimension to gating.
- *Why it deepens mastery:* Players must synchronize movement with gate cycles while managing beast pressure.
- *Implementation complexity:* low (timer-based gate state)
- *Blind-test dependency:* low (visual cycle is obvious)
- *Risk of bloat:* low (purely temporal, no new state)

**3.11 Ember-Activated Gates**
- *Description:* Gates that open only while a hot ember is within a trigger zone.
- *Decision it creates:* Do I drop an ember to open the gate, then race through before it goes cold?
- *Combination:* Ember lifetime + gate logic. Creates a "window of opportunity" mechanic.
- *Why it deepens mastery:* Players must time ember drops to gate distance. Adds precision to bait placement.
- *Implementation complexity:* low (ember proximity check for gate state)
- *Blind-test dependency:* low (causal link is visible)
- *Risk of bloat:* low (reuses existing ember/gate systems)

**3.12 Multi-Stage Gates**
- *Description:* A sequence of gates that must be opened in order by luring the beast through multiple trigger zones.
- *Decision it creates:* How do I route the beast through multiple zones while keeping embers hot?
- *Combination:* Beast baiting + gate sequencing. Creates a multi-step puzzle.
- *Why it deepens mastery:* Players must plan a bait sequence, not just a single drop. Adds strategic depth to gating.
- *Implementation complexity:* medium (multiple gates/triggers, ordering logic)
- *Blind-test dependency:* high (tester must understand the sequence)
- *Risk of bloat:* medium (risks becoming a puzzle-game if too many stages)

### Visibility / Information Elements

**3.13 Beast Trail**
- *Description:* The beast leaves a faint, fading trail of light as it moves, revealing its recent path.
- *Decision it creates:* Do I follow the trail to predict where the beast is going, or do I avoid it to stay hidden?
- *Combination:* Beast AI + fog-of-war. Gives the player information about beast movement.
- *Why it deepens mastery:* Players can read the beast's path and plan routes. Adds an information-gathering layer.
- *Implementation complexity:* low (trail of fading light points)
- *Blind-test dependency:* low (visual trail is obvious)
- *Risk of bloat:* low (purely visual, no new state)

**3.14 Safe Zone Beacon**
- *Description:* The safe zone emits a faint, long-range glow visible through fog from a distance.
- *Decision it creates:* Do I navigate toward the beacon, or do I take a safer route that loses sight of it?
- *Combination:* Fog-of-war + route planning. Gives the player a distant goal to aim for.
- *Why it deepens mastery:* Reduces "bad lost" by giving the player a visual anchor. Adds a navigation layer.
- *Implementation complexity:* low (long-range radial gradient on safe zone)
- *Blind-test dependency:* low (visual beacon is obvious)
- *Risk of bloat:* low (purely visual, no new state)

**3.15 Ember Echo**
- *Description:* When an ember goes cold, it leaves a brief flash at its location, revealing the area one last time.
- *Decision it creates:* Do I drop embers in a pattern to create a sequence of echoes that reveal the map?
- *Combination:* Ember lifetime + visibility. Creates a "map reveal" mechanic through ember placement.
- *Why it deepens mastery:* Players can use ember echoes to scout ahead. Adds strategic value to ember placement beyond bait.
- *Implementation complexity:* low (flash effect on ember lifetime end)
- *Blind-test dependency:* low (visual flash is obvious)
- *Risk of bloat:* low (purely visual, no new state)

### Resource / Charge Variants

**3.16 Double Cache**
- *Description:* A Cinder Cache that grants two stored charges instead of one.
- *Decision it creates:* Do I fetch the double cache (further off-route) for two charges, or a single cache (closer) for one?
- *Combination:* Cinder Charge + route planning. Adds a resource-quality dimension.
- *Why it deepens mastery:* Players must weigh the cost of the detour against the value of extra charges.
- *Implementation complexity:* low (cache grants N charges instead of 1)
- *Blind-test dependency:* low (HUD shows charge count)
- *Risk of bloat:* medium (risks becoming an inventory system if not carefully bounded)

**3.17 Decaying Charge**
- *Description:* A Cinder Charge that decays over time, so it must be spent within a window of pickup.
- *Decision it creates:* Do I spend the charge now while it's strong, or save it for a later moment?
- *Combination:* Cinder Charge + timing. Adds urgency to the held resource.
- *Why it deepens mastery:* Players must time their charge use, not just hoard it. Adds a temporal dimension to resource management.
- *Implementation complexity:* low (charge has a lifetime, visual decay indicator)
- *Blind-test dependency:* medium (tester must understand the decay)
- *Risk of bloat:* low (purely temporal, no new state)

**3.18 Conditional Charge**
- *Description:* A Cinder Charge that can only be spent in specific zones (e.g., dark zones, near the beast).
- *Decision it creates:* Do I fetch the charge now and carry it to the right zone, or do I skip it?
- *Combination:* Cinder Charge + spatial constraints. Adds a location-based dimension to resource use.
- *Why it deepens mastery:* Players must plan where to use the charge, not just when. Adds strategic depth to resource management.
- *Implementation complexity:* medium (zone-based spend check)
- *Blind-test dependency:* medium (tester must understand the constraint)
- *Risk of bloat:* medium (risks becoming a lock-and-key system)

### Level-Structure Elements

**3.19 Multi-Safe-Zone Levels**
- *Description:* Levels with multiple safe zones; reaching any one wins the level.
- *Decision it creates:* Which safe zone do I aim for, based on beast position and my ember state?
- *Combination:* Safe zone + route planning. Adds a goal-selection layer.
- *Why it deepens mastery:* Players must choose their goal dynamically based on the situation. Adds strategic flexibility.
- *Implementation complexity:* low (multiple safe zones in level data, check any)
- *Blind-test dependency:* low (multiple stone circles are visible)
- *Risk of bloat:* low (purely structural, no new state)

**3.20 Beast Den Levels**
- *Description:* Levels where the beast starts in a "den" and must be lured out before the player can safely enter the main area.
- *Decision it creates:* How do I lure the beast out of the den without getting cornered?
- *Combination:* Beast AI + ember baiting. Creates a "reverse gating" mechanic.
- *Why it deepens mastery:* Players must control the beast's movement, not just react to it. Adds proactive strategy.
- *Implementation complexity:* low (beast starts in a walled area with one exit)
- *Blind-test dependency:* low (den structure is visible)
- *Risk of bloat:* low (purely structural, no new state)

**3.21 Escape Levels**
- *Description:* Levels where the safe zone moves slowly away from the player, forcing pursuit.
- *Decision it creates:* Do I take the direct route and risk the beast, or do I flank and lose time?
- *Combination:* Safe zone + beast pursuit. Adds a chase dynamic.
- *Why it deepens mastery:* Players must balance speed with caution. Adds urgency to route planning.
- *Implementation complexity:* medium (safe zone position = f(time))
- *Blind-test dependency:* medium (tester must understand the moving goal)
- *Risk of bloat:* medium (risks becoming an arcade chase if not carefully tuned)

---

## 4. Recommended Progression Ladder

This is a *testable hypothesis* for how new elements could be introduced
after Level 8. It is not a commitment. Each step assumes the previous
step has been probed and found viable.

| Level | Element Introduced | Rationale |
|-------|-------------------|-----------|
| 9 | **One-Way Passages** (3.2) | Low complexity, purely spatial. Combines with existing maze routing. No new state. Tests whether commitment mechanics deepen the ember decision. |
| 10 | One-Way Passages + **Cinder Charge** | Combines the new spatial element with the existing held resource. Tests whether the charge feels more necessary when routes are one-way. |
| 11 | **Dark Zones** (3.3) | Low complexity, purely environmental. Combines with torch visibility. Tests whether tension gradients create "good lost" moments. |
| 12 | Dark Zones + **Beast Gate** | Combines environmental tension with gating. Tests whether reduced visibility makes the gate's causal link harder to read. |
| 13 | **Safe Zone Beacon** (3.14) | Low complexity, purely visual. Reduces "bad lost" in larger/darker levels. Tests whether a distant anchor improves navigation without reducing tension. |
| 14 | Safe Zone Beacon + **One-Way Passages** | Combines navigation aid with commitment mechanics. Tests whether the beacon makes one-way routes feel fairer. |
| 15 | **Hesitant Beast** (3.7) | Low complexity, purely behavioral. Adds a skill layer to bait timing. Tests whether hesitation creates exploitable windows. |
| 16 | Hesitant Beast + **Cinder Charge** | Combines behavioral reading with resource management. Tests whether the charge feels more valuable when the beast's hesitation creates timing windows. |
| 17 | **Multi-Safe-Zone** (3.19) | Low complexity, purely structural. Adds goal-selection. Tests whether dynamic goal choice deepens strategy. |
| 18 | Multi-Safe-Zone + **Dark Zones** + **Beast Gate** | Combines multiple elements. Tests whether systemic variety creates combinatorial depth without content treadmill. |

---

## 5. Top 3 Next Feature Probes

### Probe 1: One-Way Passages (3.2)

**Why it is promising:**
- Purely spatial, no new state, low implementation complexity.
- Creates commitment moments that deepen the ember decision.
- Combines naturally with existing maze routing and beast pursuit.
- Addresses the content treadmill risk by adding systemic variety, not just bigger maps.

**Why it is safe before blind playtest:**
- Does not change the core loop (embers, beast, safe zone).
- Does not add UI, inventory, or new controls.
- Visual language can be clear (e.g., arrow-shaped gaps, one-way brick pattern).
- Removable without affecting levels 1–8.

**Smallest possible implementation slice:**
- Add a `oneWayWalls` array to level data: `{ x, y, w, h, direction }`.
- In `updatePlayer`, check collision against one-way walls only if the player is moving against the allowed direction.
- Draw one-way walls with a distinct visual (e.g., arrow-shaped bricks, different mortar color).
- Extend `validate-levels.js` to check one-way wall reachability (BFS with directional edges).

**Files likely touched:**
- `prototypes/trail-of-embers/index.html` (collision logic, draw logic, level data)
- `prototypes/trail-of-embers/validate-levels.js` (reachability check)
- `prototypes/trail-of-embers/README.md` (document the new element)

**Validation needed:**
- BFS reachability with directional edges (can the player reach the safe zone given the one-way constraints?).
- Bounds checks, obstacle clearance.
- Verify the beast can still path through one-way walls (it ignores all obstacles).

**Playtest signal for success:**
- Player notices the one-way passage and understands the constraint within one attempt.
- Player commits to a route through a one-way passage and feels the tension of no return.
- Player uses embers to bait the beast before committing to a one-way route.
- Losses through one-way passages feel attributable to poor route choice, not unfairness.

**Playtest signal to kill it:**
- Player doesn't notice the one-way constraint and feels trapped.
- Player avoids one-way passages entirely because they feel too risky.
- One-way passages make the maze feel arbitrary rather than learnable.

---

### Probe 2: Dark Zones (3.3)

**Why it is promising:**
- Purely environmental, low implementation complexity.
- Creates tension gradients within a single level.
- Combines naturally with torch visibility and ember placement.
- Addresses the "good lost" vs "bad lost" distinction by creating controlled darkness.

**Why it is safe before blind playtest:**
- Does not change the core loop.
- Does not add UI, inventory, or new controls.
- Visual difference is immediate (torch radius shrinks when entering a dark zone).
- Removable without affecting levels 1–8.

**Smallest possible implementation slice:**
- Add a `darkZones` array to level data: `{ x, y, w, h, torchMultiplier }`.
- In `drawFog`, check if the player is inside a dark zone and reduce torch radius accordingly.
- Draw dark zones with a subtle visual cue (e.g., darker floor texture, faint boundary).
- Extend `validate-levels.js` to check dark zone bounds and reachability.

**Files likely touched:**
- `prototypes/trail-of-embers/index.html` (fog rendering, level data)
- `prototypes/trail-of-embers/validate-levels.js` (bounds check)
- `prototypes/trail-of-embers/README.md` (document the new element)

**Validation needed:**
- Dark zone bounds checks.
- Verify the player can still reach the safe zone with reduced torch radius.
- Verify embers still illuminate normally inside dark zones (or do they also shrink?).

**Playtest signal for success:**
- Player notices the torch shrinking and understands they're in a dark zone.
- Player uses embers more cautiously in dark zones (because they're more valuable).
- Player feels increased tension in dark zones but can still form a plan.
- Dark zones create "good lost" moments (reduced visibility but learnable).

**Playtest signal to kill it:**
- Player doesn't notice the torch shrinking and feels confused about why they can't see.
- Dark zones make the maze feel unfairly dark rather than tense.
- Player avoids dark zones entirely because they're too punishing.

---

### Probe 3: Safe Zone Beacon (3.14)

**Why it is promising:**
- Purely visual, lowest implementation complexity of all candidates.
- Reduces "bad lost" by giving the player a distant visual anchor.
- Combines naturally with fog-of-war and route planning.
- Addresses the fragility of "good lost" identified in the evidence sequence review.

**Why it is safe before blind playtest:**
- Does not change the core loop or any mechanics.
- Does not add UI, inventory, or new controls.
- Purely additive (adds information, doesn't remove anything).
- Removable without affecting levels 1–8.

**Smallest possible implementation slice:**
- In `drawFog`, add a long-range radial gradient around the safe zone (e.g., 400px radius, very low alpha).
- The beacon should be visible through fog but not illuminate obstacles or the beast.
- No level data changes needed (purely visual).

**Files likely touched:**
- `prototypes/trail-of-embers/index.html` (fog rendering)
- `prototypes/trail-of-embers/README.md` (document the visual change)

**Validation needed:**
- None (purely visual, no mechanics change).
- Playtest to verify the beacon is visible but not too bright.

**Playtest signal for success:**
- Player can see the safe zone beacon from a distance and uses it to navigate.
- Player feels less "bad lost" in larger mazes because they have a visual anchor.
- Beacon does not reduce tension (player can see the goal but still must navigate the maze).
- Beacon is subtle enough that it doesn't feel like a "hand-holding" mechanic.

**Playtest signal to kill it:**
- Player relies on the beacon too much and stops learning the map.
- Beacon is too bright and reduces tension.
- Beacon is too subtle and goes unnoticed.

---

## 6. Things to Reject or Defer

The following ideas are explicitly rejected or deferred for the current
prototype phase. They would likely hurt the prototype by adding
complexity without proportional payoff, or by violating the design
principles.

**Health / Lives:**
- Rejected. Adds a resource-management layer that doesn't combine with the core light-as-bait loop. Failure should be immediate and attributable, not diluted by a health bar.

**Inventory Systems:**
- Rejected. The prototype's strength is immediate physical intuition. Menus, inventories, and item management violate the "no tutorial burden" and "prefer spatial/behavioral consequences over UI systems" principles.

**Complex Enemy Taxonomies:**
- Rejected. Multiple enemy types with different behaviors would require the player to learn a bestiary. The beast's simplicity (three rules, no pathfinding) is a feature, not a limitation.

**Procedural Generation:**
- Deferred. Hand-authored levels are a proven vector and align with the "Ian-programmable, Mac-local" constraint. Procedural generation would require a different design approach and validation infrastructure. Revisit only if the content treadmill becomes unmanageable.

**Scoring / Economy:**
- Rejected. Adds a meta-game layer that doesn't combine with the core loop. The prototype's replayability should come from mastery, not from optimizing a score.

**Lore-Heavy Mechanics:**
- Rejected. The prototype's strength is immediate physical intuition. Lore, story, and narrative mechanics violate the "no tutorial burden" principle and add complexity without payoff.

**Many New Controls:**
- Rejected. The current control scheme (move + drop ember + restart) is minimal and learnable. Adding new controls (e.g., sprint, shield, special ability) would violate the "easy to start" principle.

**Permanent Upgrades:**
- Rejected. Adds a meta-progression layer that doesn't combine with the core loop. The prototype's progression should come from player skill, not from unlocking abilities.

**Visual Overhaul:**
- Deferred. The pixel-art presentation is a proven vector and aligns with the "Ian-programmable" constraint. A visual overhaul (e.g., new art style, animations, effects) would require external assets and a different design approach. Revisit only if the current visuals become a limiting factor.

**Large Level Packs:**
- Deferred. The current 8-level structure is a proven vector. Adding 20+ hand-authored levels would increase the content treadmill risk. Revisit only after blind playtest validates the core loop and the progression ladder.

---

## 7. Recommendation

### The Next Move: Artifact / Probe Brief

The next move should be to write a **probe brief** for **One-Way Passages**
(3.2), not to implement it directly.

**Why not implementation?**
- The Cinder Charge and Beast Gate are implemented but not blind-tested.
- The evidence sequence review explicitly recommended blind playtest before further mechanical expansion.
- Blind playtest was planned (protocol + capture sheet exist) but is being skipped for now.
- Adding a third untested mechanic (One-Way Passages) on top of two untested mechanics compounds risk.
- A probe brief forces the design to be explicit and falsifiable before implementation.

**Why not playtest?**
- Blind playtest is being skipped for now (per the task description).
- Self-playtest of the current 8 levels could be valuable, but the task is specifically about progression ideation, not playtest execution.

**Why not cleanup/tooling?**
- The prototype is in a clean state (only the known playtest-mode change in index.html).
- The validation script is functional and extensible.
- No urgent tooling gaps have been identified.

**Recommended probe brief scope:**
- One new level (Level 9) that introduces One-Way Passages in isolation.
- No other mechanics changes.
- Explicit falsifiable question: "Do one-way passages create commitment moments that deepen the ember decision, or do they make the maze feel arbitrary?"
- Validation extension: BFS with directional edges.
- Playtest script: 3 runs, focus on whether the player notices the constraint, commits to routes, and attributes failure correctly.

**Recommended executor lane for the next step:**
- **OpenCode** (this lane). The probe brief is a bounded artifact that fits the current workflow. Implementation (if approved) would also fit this lane.

---

## 8. Explicit Non-Ratifications

- **No mechanic in this artifact is ratified.** All candidates are ideation, not design truth.
- **The progression ladder is a hypothesis, not a commitment.** It can be modified or rejected based on evidence.
- **The top 3 probes are recommendations, not approvals.** Each requires its own probe brief and playtest cycle.
- **Trail of Embers is not final-game ratified.** This artifact does not change its status as LEADING_CANDIDATE.
- **No source-of-truth files were touched.** This artifact is evidence fuel, not governance.

---

END OF ARTIFACT
