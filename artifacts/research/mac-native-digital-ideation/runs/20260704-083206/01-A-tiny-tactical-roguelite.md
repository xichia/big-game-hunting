# Mac-Native Digital Ideation — Lane A: Tiny tactical roguelite

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 1/12, lane A (Tiny tactical roguelite)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 1 of 12
- **Lane:** A — Tiny tactical roguelite
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:32:24

## Candidate

Candidate title: **Knot**

Batch / lane: A — Tiny tactical roguelite

One-sentence player-facing hook: A single, tiny hero descends into a living, shifting knot of enemy bodies on a small arena, where every move you make slides the whole mass along with you.

Core fantasy: You are a nimble, desperate mouse in a snake pit — outnumbered, surrounded, but able to twist the enemy formation against itself with every step.

Core loop: You move your hero one cell in any direction on a 6x6 grid. The enemy swarm (a contiguous group of enemies) slides one cell in the direction you just moved from, pulled like a viscous fluid. If an enemy touches you, you take damage; if you push an enemy into a hazard (pit, wall, another enemy cluster), it dies. You survive until you clear the arena or die.

First five minutes: Player clicks a cell adjacent to their hero; the hero moves there; the whole enemy blob slides one cell in the opposite direction; the player immediately sees the mass shift and an enemy tumble into a wall and vanish. No text, no tutorial — one click, one visible reaction.

Native-digital reason: The enemy swarm's slide requires real-time physics-like collision and pathfinding across a grid, computing new positions for every enemy simultaneously after every move. This is too fast and too stateful for a tabletop game. The kinetic, fluid feel of the mass is digital-native.

Mac-native feasibility: Low. A simple 2D grid, a single hero sprite, one enemy type with a simple AI. No animations beyond sliding. Runs on any Mac.

Input model: Mouse or trackpad click on adjacent cell. One click, one action. Optionally, keyboard arrow keys.

Beginner appeal: One click does something visible and satisfying. First death is immediate and teaches the rule: "enemies that touch you hurt you." No stats, no cards, no inventory.

Mastery engine: At 10 plays, you learn to bait enemies into hazards. At 50 plays, you start predicting the swarm's future shape and planning 3–4 moves ahead. At 200 plays, you can manipulate the knot into self-eliminating chains (enemies push enemies into pits).

Replayability driver: Procedurally generated starting enemy shapes and hazard layouts ensure no two arenas are the same. Player skill growth is the primary replay engine.

Watchability / readability: The single, slow slide of the entire enemy mass is visually striking and readable. A friend can see the "knot" tighten or unravel. Failures are often dramatic — the hero gets crushed in a closing ring.

Scope risk: Low. Core mechanic is a single grid-slide rule. No levels, no bosses.

Implementation risk: Low. Needs a grid, a pathfinding check for the swarm's slide, collision detection, and a turn counter. A weekend prototype is feasible.

Art/content burden: Low. One hero sprite (simple shape), one enemy sprite, one arena background. All can be programmer art.

Main failure mode: The game becomes solvable — players memorize the only viable opening moves — or the swarm's behavior feels random rather than responsive.

Smallest playable prototype: A 6x6 grid, player-controlled square, 8 enemy squares arranged in a line, one wall hazard. Click a cell to move. Swarm slides opposite direction. Win when all enemies are eliminated. Lose when hero touches an enemy.

Kill criterion: After 10 plays on the prototype, the player cannot describe why they lost or what they could have done differently.

Soft-decision note: This is an exploratory candidate, not project truth. Before it could be taken more seriously, a human would need to playtest the smallest playable prototype (described above) and confirm that the swarm's slide feels controllable, not random — and that the player can identify at least one cause-and-effect mistake after a loss.
