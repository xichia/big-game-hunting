# Mac-Native Digital Ideation — Lane G: Procedural opponent / readable AI rival

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 7/12, lane G (Procedural opponent / readable AI rival)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 7 of 12
- **Lane:** G — Procedural opponent / readable AI rival
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:34:59

## Candidate

Candidate title:
Vantage

Batch / lane:
G — Procedural opponent / readable AI rival

One-sentence player-facing hook:
Outthink a cunning AI sniper in a tense duel of position, prediction, and nerve.

Core fantasy:
You are a spotter for a ghost sniper, but the AI is hunting you just as hard—a battle of wits where every snap decision and peek costs you.

Core loop:
You and the AI occupy a 2D isometric city block, each controlling a single sniper. Over 30–90 seconds, you move between cover (click to shift to a new window, rooftop, or alley). When you have a bead on the AI's last known position, you take a shot. The AI does the same. A shot resolves instantly: if you guessed right and the AI was there, you get a kill. If you guessed wrong, your muzzle flash reveals your position, and the AI gets a free shot on your last-known square. Then both snipers randomize new positions, and the loop repeats. The AI builds a model of your tendencies—how long you hold still, which cover types you favor, how often you fake a peek—and uses it to predict your next move.

First five minutes:
You launch the game. A short, wordless intro shows a scope reticule and a single instruction: "Find them before they find you." You control a crosshair with mouse movement. Click a dark window to move your sniper there. A brief animation shows your character settling in. The AI fires from somewhere—you see a bullet crack past your position. Now you move again, trying to get eyes on where that shot came from. You take a risky shot at the muzzle flash. Miss. The AI returns fire. You learn by doing: move, observe, predict, shoot.

Native-digital reason:
The AI opponent requires real-time probability modeling, a dynamic behavioral profile that updates every round, and procedural level generation. A tabletop version would require a human referee running hidden calculations, which destroys the core fantasy of facing a "smart" system.

Mac-native feasibility:
Low scope. Single-window 2D game. Solo developer can handle procedural level generation (simple tile-based city blocks) and AI behavior (a small state machine with a learning layer). No online, no backend, no assets pipeline beyond basic sprites and particle effects for bullet cracks and scope glints.

Input model:
Mouse only. Click to move, click to shoot. No keyboard required. Trackpad works fine.

Beginner appeal:
The only action is move and shoot. Failure is immediately readable: you got shot because you stayed still too long or fired from a predictable pattern. The AI's behavior is communicated visually—it favors the same cover types you do, and you can learn to read its patterns.

Mastery engine:
At 10 plays: you stop dying to the AI's simplest pattern (always moving to the tallest building). At 50 plays: you learn to bait shots by fake-peeking from a weak position, then punishing the AI when it commits. At 200 plays: you can hold a mental model of the AI's current aggression level and cover preference, adjusting your own behavior round by round to stay unpredictable.

Replayability driver:
Procedural level generation creates different sightline puzzles each game. The AI's behavioral model shifts over a match—it can learn your patterns and counter them, forcing you to adapt, not just memorize.

Watchability / readability:
Every shot is a visible event: bullet trail, impact particle, silhouette of the shooter. A kill is immediate and unambiguous. Spectators see the crosshair snap, the muzzle flash, the ragdoll drop. Easy to follow.

Scope risk:
Medium. The core is simple, but the AI behavioral model requires careful tuning to feel smart without being unfair.

Implementation risk:
Medium. AI learning layer is the hardest part—must be readable, not opaque. A simple rule-based profile (aggression, patience, cover preference) with a small memory of player patterns is feasible but must be tested.

Art/content burden:
Low. A handful of tile sprites for buildings, a scope overlay, bullet and flash particles. No characters, no animations beyond simple movement and death.

Main failure mode:
The AI feels random or reads as cheating, breaking the fantasy of a readable rival.

Smallest playable prototype:
One procedural block, two squares, click-to-move, click-to-shoot, AI that picks a random position and fires after a short delay. No learning yet—just raw positioning and reaction time. Test if the core tension is fun.

Kill criterion:
If the prototype shows that the duel is too fast to read, or that players never feel they are outsmarting the AI.

Soft-decision note:
Exploratory candidate only—not project truth. Before this could be taken seriously, a probe should test whether the AI's behavior can be made consistently readable to beginners, or whether the tension collapses into random trading of kills.
