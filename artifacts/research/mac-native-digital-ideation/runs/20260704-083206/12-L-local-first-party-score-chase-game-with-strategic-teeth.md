# Mac-Native Digital Ideation — Lane L: Local-first party/score-chase game with strategic teeth

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 12/12, lane L (Local-first party/score-chase game with strategic teeth)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 12 of 12
- **Lane:** L — Local-first party/score-chase game with strategic teeth
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:36:56

## Candidate

Candidate title: Last Word

Batch / lane: L — Local-first party/score-chase game with strategic teeth

One-sentence player-facing hook: Everyone starts the game, but only one stays in the room — as the crowd shrinks, the pressure to play perfectly, not just first, decides the winner.

Core fantasy: You are a cool-headed racer in a shrinking room, where every round you must finish your routine exactly on the beat, while everyone else’s failure becomes your advantage — the last one standing wins, but only if they never misstep.

Core loop: Each round, all active players see the same randomly generated sequence of key presses (e.g., “W, S, D, A, Space”). All players must type the sequence in sync with a rising tempo. If you miss a key, you’re eliminated. If you finish the sequence without error, you survive. The last player alive wins the round. After each round, the sequence grows longer and faster. The game tracks each player’s speed and accuracy, and awards points based on surviving rounds. The winner is the player with the highest cumulative score after a set number of rounds.

First five minutes: Player launches the app, sees a simple “Join” button. They press it. A countdown appears. The game shows the first sequence: “W, W, A, D.” Player types it. If they succeed, the next round starts. If they fail, they see a brief “You’re out!” screen and can spectate. Within 30 seconds, the player has typed their first sequence, understood the loop, and felt the tension of speed and elimination.

Native-digital reason: Computation is essential for real-time tempo generation, simultaneous input detection from multiple local keyboards, and instant elimination logic. A tabletop version would require a digital timer and a referee, making it clunky. Here, the computer is the judge, the metronome, and the scorekeeper — all in one.

Mac-native feasibility: Low. The game is a single-window, local-multiplayer typing game. No online backend, no large assets, no 3D engine. Can be written in Swift/SwiftUI or even a simple game engine like Godot or Unity (Mac build). Requires handling multiple keyboards — a macOS feature.

Input model: Keyboard (one per player). Each player must have their own USB or Bluetooth keyboard. On a shared Mac, this is a known constraint.

Beginner appeal: High. The core mechanic is typing, which nearly everyone knows. The first sequence is short and slow. The “elimination” mechanic creates immediate stakes.

Mastery engine: At 10 plays, players learn to anticipate the tempo and type ahead. At 50 plays, they develop muscle memory for common patterns and can “bank” mental energy. At 200 plays, they can predict sequence generation patterns, develop micro-adjustments for timing, and physically train their reaction time.

Replayability driver: Procedural generation of sequences ensures no two rounds are exactly the same. Player skill improvement is directly measurable. The elimination dynamic creates emergent drama — who gets eliminated at the most critical moment?

Watchability / readability: High. Spectators see the same screen: the sequence, the countdown, the BPM, and a live indicator of who is still alive. The elimination of a player is instantly visible — a player’s icon disappears. The final “last player standing” moment is clear.

Scope risk: Low. The game is a single-screen typing challenge with procedural generation and scoring. No menus, no progression systems, no story.

Implementation risk: Medium. Handling multiple keyboards on macOS requires careful I/O. Testing with real hardware is essential. The typing engine must be precise with timing.

Art/content burden: Low. No character art, no backgrounds, no music (only a metronome click). The “room” visual is a simple grid of player avatars (colored circles or simple icons).

Main failure mode: The game is too difficult for casual players, or the keyboard-input multiplexing is buggy.

Smallest playable prototype: A single-window macOS app that displays a sequence of letters, a countdown, and accepts key presses from any keyboard. Eliminates players who miss a key. Ends when one player remains. No scoring, no rounds — just the core loop. Works with 2 players.

Kill criterion: If, after 10 playtests with 3–4 people, more than half of first-time players say “this is too fast” or “I can’t see the sequence,” the game fails its beginner appeal test.

Soft-decision note: This is an exploratory candidate, not project truth. Before taking it more seriously, a human should run a 3-player paper prototype where the “sequence” is spoken aloud and a human referee times elimination. This will test whether the core tension of speed + error is fun before building the software multiplexer.
