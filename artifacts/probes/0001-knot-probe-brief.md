# Probe Brief: Knot

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

- **Candidate title:** Knot
- **Source lane:** A — Tiny tactical roguelite (`artifacts/research/mac-native-digital-ideation/runs/20260704-083206/01-A-tiny-tactical-roguelite.md`)
- **One-sentence hook:** A single, tiny hero descends into a living, shifting knot of enemy bodies on a small arena, where every move you make slides the whole mass along with you.
- **Core player action:** Click/move to an adjacent cell; the entire contiguous enemy mass slides one cell in response.
- **Why this is meaningfully Mac-native/digital:** The swarm's slide requires simultaneous recomputation of every enemy's position, collision, and hazard interaction on each player move — real-time stateful computation that a tabletop format cannot execute at this speed or fidelity.
- **Why it might satisfy the Big Game Hunting north star:** One click produces one legible, visually striking reaction (simple entry). The mastery ceiling is spatial planning — baiting enemies into hazards and predicting multi-move mass shapes (hard mastery, strategic depth) — without requiring stats, items, or reflex speed.

## 2. Probe authority boundary

- This brief does not choose the game.
- This brief does not authorize production implementation.
- This brief does not update source-of-truth.
- This brief only defines the smallest useful test to answer one bounded question about the enemy-mass slide mechanic.

## 3. Falsifiable probe question

**Core question:** Does the enemy-mass slide feel controllable and strategically legible, or random/solvable?

Refined for this candidate:
- Can a first-time player, after a loss, name at least one specific move they would make differently? (Tests legibility, not randomness.)
- After ~10 plays, does the player discover a way to intentionally bait an enemy into a hazard, or does play remain accidental? (Tests controllability.)
- Does the same opening sequence of moves produce a game that feels "won already" (solved), or does mass shape variation keep early decisions meaningful?

## 4. Smallest playable prototype

- 6x6 grid, single screen, no menus except reset.
- No progression, no polish, no procedural generation beyond a single fixed (or lightly randomized, non-blocking) starting layout.
- Sub-week build target.

## 5. Required mechanics only

- Player token occupies one cell; moves one cell per input (click or arrow key) to an orthogonally adjacent open cell.
- Enemy mass: a contiguous group of enemy tokens (start as a line or small cluster) that slides one cell in the direction opposite the player's move, as a single rigid body.
- Collision rule: if any enemy cell would overlap the player after the slide, the player takes damage / loses.
- Hazard rule: if an enemy is pushed into a wall or pit cell by the slide, that enemy is removed.
- Win condition: all enemies eliminated. Loss condition: enemy touches player.
- At least one wall or pit hazard placed on the grid.

## 6. Explicit non-goals

- No final art.
- No progression system.
- No campaign.
- No menus beyond launch/reset if necessary.
- No save system.
- No audio unless essential to the probe.
- No production architecture.
- No source-of-truth update.
- No final rules.
- No "this is the game" language.
- No roguelite progression, items, upgrades, multiple enemy types, animation polish, or procedural generation (beyond a trivial randomized start position, if any).

## 7. Playtest script (5–10 minutes)

**Tell the tester before play:**
- "Move your square onto an adjacent open square. The enemy group reacts to your move. Avoid letting an enemy touch you. Try to clear the board."

**Do not explain:**
- How the enemy mass computes its slide direction.
- That hazards can be used to eliminate enemies (let them discover it).
- Any "optimal" opening move.

**Observe during play:**
- Hesitation before each move (are they reasoning or guessing?).
- Whether they notice the wall/pit and attempt to use it.
- Reaction at first loss — confusion vs. recognition.
- Whether later attempts show a changed strategy from earlier attempts.

**Ask after play:**
- "What happened right before you lost (or won)?"
- "Was there a move you wish you'd made instead? What would you do differently next time?"
- "Did the enemy group's movement feel like it was reacting to you, or random?"
- "Did you find a way to use the wall/pit on purpose?"

## 8. GREEN criteria

- Tester can name a specific cause for their loss or win within one attempt of it happening.
- Tester intentionally baits an enemy into a hazard at least once within 10 plays without being told the hazard exists.
- Tester's later moves visibly differ from their earlier moves in a way that suggests learning (not just random variation).
- Tester describes the mass movement as "reacting to me" rather than "random."

## 9. RED criteria

- After 10 plays, the tester cannot describe why they lost or what they could have done differently (matches the source artifact's own kill criterion).
- The tester finds a single dominant opening sequence that trivially wins every run (solved).
- The tester describes the enemy behavior as arbitrary or unrelated to their own moves.
- Tester disengages or expresses boredom/frustration before completing 10 plays.

## 10. Implementation notes

- **Suggested minimal tech shape:** 2D single-screen app; any lightweight framework capable of a grid render and click/keyboard input (e.g., a small Swift/SpriteKit view, a simple Godot scene, or a canvas-based web page) is sufficient — no networking, no persistence.
- **Core objects/data structures:** a 6x6 array of cell states (empty, wall, pit, enemy, player); an ordered list/set of enemy cell coordinates treated as one rigid body for the slide; a simple direction vector computed from the player's last move.
- **Quickest path to playable:** hardcode one starting layout (player position, one wall or pit, a short line of enemies), implement move input, implement the mass-slide-as-single-rigid-translation rule, implement collision/hazard checks, add a reset key. Skip win/loss screens beyond a text state change.
- **Known traps from the review (0002-mac-native-digital-ideation-pilot-review.md):** the review's top-ranked risk for this candidate is that it "solves" (memorized openings) or reads as random rather than responsive — this is the exact axis the probe question and GREEN/RED criteria are built around. Do not add content (more enemy types, levels) to compensate for a solvability problem; that would mask rather than test the core rule.

## 11. Risk register

| Risk | How the probe detects it |
|---|---|
| Mass slide feels random rather than responsive | Post-play question "did the enemy group feel like it was reacting to you?"; observed hesitation/confusion during play |
| Mechanic is trivially solvable (one dominant opening) | Repeated plays by the same tester using an identical opening; ask if they found a move that "always works" |
| Player cannot articulate cause/effect after a loss | Direct post-loss question, per the source artifact's own kill criterion |
| Hazard interaction is undiscoverable without hints | Observe whether an untold tester finds the wall/pit use case within 10 plays |
| Mechanic reads as satisfying only after explanation, not from play itself | Compare tester's stated understanding before vs. after being told nothing |

## 12. Decision block

- [ ] Build this probe
- [ ] Revise probe brief
- [ ] Park candidate
- [ ] Kill candidate
- [ ] Defer
