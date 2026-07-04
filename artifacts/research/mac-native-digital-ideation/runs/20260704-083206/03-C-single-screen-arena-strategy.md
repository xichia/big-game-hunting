# Mac-Native Digital Ideation — Lane C: Single-screen arena strategy

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 3/12, lane C (Single-screen arena strategy)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 3 of 12
- **Lane:** C — Single-screen arena strategy
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:33:15

## Candidate

Candidate title: **Shellclash**

Batch / lane: C — Single-screen arena strategy

One-sentence player-facing hook: Outthink and outmaneuver a single opponent on a tiny, destructible battlefield where your only weapon is your crab's claw and the environment itself.

Core fantasy: You are a clever, stubborn hermit crab in a shell-fight duel, relying on timing, terrain, and trickery rather than brute force.

Core loop: Over 30 seconds, you and an AI opponent are on a small, rectangular sandy arena with a few rocks. You scuttle left/right, tap to swing your claw to push a rock, or hold to burrow for a moment. If you push a rock into the opponent, they lose shell health. If you burrow as they charge, they stumble, leaving them open. The first to lose health from their shell three times loses.

First five minutes: The game starts with a simple tutorial: "You are a crab. Push a rock into the other crab. Avoid getting hit." The player sees a crab icon, a joystick, and an attack button. They immediately push a rock into the AI. The AI responds by sidestepping, and the player has to learn to time their pushes and fake out the opponent. The first match is over in under a minute, and they immediately see the "rematch" button.

Native-digital reason: The game requires precise real-time collision physics for the rocks, shell health, and the AI's reactive behavior. A tabletop version would require a complex, slow, and tedious simulation of rock momentum, crab movement, and AI decision-making, losing the fast-paced, reactive feel.

Mac-native feasibility: **Low.** A solo developer on a Mac can prototype the core physics and AI in a framework like SpriteKit or Godot. Art is simple 2D sprites. No online multiplayer, no backend, no large content pipeline.

Input model: Keyboard/mouse or simple controller (arrow keys or stick to move, one button to attack/burrow). Trackpad is acceptable.

Beginner appeal: The core action is extremely simple (move, push). The feedback (shell cracks, rock collisions) is immediate and clear. Losing is quick, so players are encouraged to try again.

Mastery engine:
- **10 plays:** Player understands basic rock-pushing and dodging.
- **50 plays:** Player learns to "feint" by starting a push then cancelling, and uses burrowing to bait charges.
- **200 plays:** Player predicts the AI's pattern trees, manipulates rock placement for chain reactions, and uses the destructible arena edges as a trap.

Replayability driver: **Procedural variation** in arena shape and rock placement, plus **emergent situations** from physics interactions (ricochets, rock piles). The AI has a small set of "tactics" that players learn to counter, creating a personal meta-game.

Watchability / readability: Very high. Two crabs pushing rocks is immediately readable. Impacts are clear. The health bar is a simple shell with three cracks.

Scope risk: **Low.** A single-screen, two-character, one-terrain game with one projectile type is extremely narrow.

Implementation risk: **Medium.** The physics of rock collision and crab movement needs to feel crisp and responsive, which can be tricky to tune. The AI needs to be clever but not perfect.

Art/content burden: **Low.** A handful of 2D sprites (crab, shell, rock, sand background). No animations required beyond simple movement and hit frames.

Main failure mode: The game feels shallow after 10 minutes because there are only two effective actions. The AI becomes predictable, and the rock physics don't create enough variety.

Smallest playable prototype: A single arena, one AI opponent that pushes rocks toward the player and dodges basic pushes. Player can move and push rocks. Health is displayed as three shell hits. No burrow, no arena destruction.

Kill criterion: If, after 20 matches, a tester cannot identify a single meaningful strategic choice beyond "push rock at enemy," the candidate is dead.

Soft-decision note: This is an exploratory candidate for batch 3, not project truth. Before being taken seriously, a probe must be built to verify that the rock physics and AI produce at least four distinct, recognizable match situations (e.g., close-quarters brawl, rock-pile siege, arena-edge trap, feint-and-bait).
