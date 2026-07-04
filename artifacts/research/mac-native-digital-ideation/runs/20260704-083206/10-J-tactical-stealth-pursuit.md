# Mac-Native Digital Ideation — Lane J: Tactical stealth / pursuit

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 10/12, lane J (Tactical stealth / pursuit)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 10 of 12
- **Lane:** J — Tactical stealth / pursuit
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:36:09

## Candidate

Candidate title:
Trail of Embers

Batch / lane:
J — Tactical stealth / pursuit

One-sentence player-facing hook:
A flickering campfire in the dark forest is your only hope of survival, but every ember you drop to light your escape also marks your trail for the relentless beast that hunts you.

Core fantasy:
You are a lone survivor in a haunted wilderness, using a dwindling torch to navigate darkness and outwit a super-sense predator that tracks you by light, heat, and sound.

Core loop:
(30-90 seconds) You move through a 2D side-view forest at night. The screen is mostly black; you see only a small radius around your torch. Every few seconds, you must drop an ember (press Space) to briefly illuminate a distant patch of terrain or to misdirect the beast. The beast's growl grows louder as it homes in on your dropped embers. You must balance advancing through the dark toward the next safe-zone checkpoint against the need to light your path, which feeds the beast's tracking AI. When you reach a checkpoint (a stone circle), you can rest and rekindle your torch, but the beast resets its pursuit from a new angle.

First five minutes:
A title screen with a single prompt: "Press any key to light your torch." You appear in a dark forest. A faint orange glow surrounds your character. You see tree silhouettes and a rocky path ahead. You move with arrow keys. The game gives no tutorial text; instead, the first time you stand still for 3 seconds, your torch flickers and an ember falls, briefly lighting a wider area. You discover the mechanic by doing. You take a few steps into the dark, hear a low growl, and instinctively drop an ember to see what is ahead. The beast's first distant howl tells you it has found your trail. You reach the first stone circle checkpoint within about 45 seconds.

Native-digital reason:
Procedural dark-visibility (real-time dynamic field-of-view that reveals only what is within torchlight), AI pathfinding that reacts to player-emitted light and sound events, and real-time sound-driven tension (spatial audio for the beast's growl and approaching footsteps) — all impossible in a tabletop format.

Mac-native feasibility:
Low. Solo developer feasible. 2D pixel-art side-view with simple particle effects (ember glow, torch flicker). No 3D modeling, no networking, no server infrastructure. Could be built with a lightweight engine like LÖVE, Godot, or PICO-8.

Input model:
Keyboard only (arrow keys or WASD for movement, Space to drop ember). Optional: a two-button controller mapping (d-pad + A button).

Beginner appeal:
Immediate: you see darkness, you have a light source, you move toward the only lit thing (yourself). The first growl creates instant tension and a clear threat. Dropping an ember is the only action and is easily discovered.

Mastery engine:
At 10 plays: learns optimal ember-drop timing (not too frequent, not too sparse) and basic checkpoint routing. At 50 plays: learns to fake-out the beast by dropping embers in branches or false paths while sneaking in a different direction. At 200 plays: can play without almost any torch light, using memory of procedural forest layouts and the beast's AI patterns to navigate almost entirely in the dark, dropping embers only as last-resort decoys.

Replayability driver:
Procedural forest generation (tree placement, path topology, checkpoint locations) and beast AI that adapts its tracking aggressiveness based on how well you have evaded it so far. No two games have the same safe-zone sequence or beast behavior curve.

Watchability / readability:
High. The torch glow and ember trails are visually clear on screen. The beast's proximity is conveyed by growl volume and a subtle red vignette at screen edges. Viewers can see the player's path of dropped embers and the beast following it. Tension is obvious: is the player moving fast enough?

Scope risk:
Medium. Requires a solid procedural generation system for forest levels, a good dynamic lighting engine, and a compelling beast AI that is challenging but not unfair. The core loop is small, but the AI and lighting are non-trivial.

Implementation risk:
Medium. The beast AI must be carefully tuned: too smart and it is frustrating, too dumb and there is no tension. The lighting engine must be efficient enough for real-time on a Mac. Procedural generation must produce interesting, non-repetitive forests.

Art/content burden:
Low. Minimal assets: a few tree sprites, a character sprite, a torch overlay, ember particle, stone circle checkpoint sprite, beast sprite (seen only in brief glimpses). Sound effects: footsteps, ember fall, torch crackle, beast growls (layered for proximity). No UI, no menus, no text.

Main failure mode:
The beast AI is not satisfying — either trivial to evade (no tension) or impossible to outsmart (frustrating). The dark navigation becomes tedious rather than tense. The procedural forest feels samey.

Smallest playable prototype:
A single fixed forest screen (not procedural yet) with a player, a torch that can drop embers, and a simple AI beast that moves toward the most recently dropped ember. Player wins by reaching a fixed stone circle. Test: does the player feel tension and discover the ember-drop mechanic without instructions?

Kill criterion:
If in the prototype, the player does not feel any tension from the beast, or if they find the dark navigation boring within 2 minutes.

Soft-decision note:
This is an exploratory candidate in the tactical stealth/pursuit lane, not a ratified project direction. Before it could be taken more seriously, a simple prototype (one screen, one beast, one objective) should be built and playtested to see if the core tension of light-as-both-tool-and-bait is compelling or merely frustrating.
