# Mac-Native Digital Ideation — Lane B: Real-time-with-pause crisis management

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 2/12, lane B (Real-time-with-pause crisis management)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 2 of 12
- **Lane:** B — Real-time-with-pause crisis management
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:32:51

## Candidate

Candidate title:
**Deckwatch**

Batch / lane:
B — Real-time-with-pause crisis management

One-sentence player-facing hook:
A ship’s deck is on fire, cargo is shifting, the hull is breached, and you’re the only person who can freeze time, re-prioritize, and send the right crew to the right spot before everything explodes.

Core fantasy:
You are a crisis commander who sees everything at once — a calm, god’s-eye brain orchestrating frantic workers through chaotic, overlapping disasters.

Core loop:
Over a 90-second real-time round, new incidents (fire, compartment breach, cargo spill, electrical fire) appear as color-coded icons on a 2D ship layout. You pause the clock at any moment, assess all active incidents, drag crew tokens from idle zones to incident zones, and set their priority order. When you unpause, crews move and act in sequence. You watch, assess, pause again, and re-task as conditions change. Each round ends when all incidents are resolved or a threshold of damage is exceeded.

First five minutes:
Player sees a calm ship deck. A “Fire!” icon appears; the clock runs. Player flails, clicks randomly. Then they notice the pause button. They pause, read the incident tooltip (“Assign Fire crew to contain”), drag a crew token from the lounge to the fire icon, unpause, and watch the crew move and extinguish. Relief. Second incident appears while the first crew is busy. Player pauses again, sees they have one free crew, assigns them. They survive the round. They understand the core loop immediately.

Native-digital reason:
Real-time-with-pause is a pure digital interaction — impossible in tabletop. Computation handles crew collision, pathfinding through damaged zones, incident escalation timelines, and procedural incident generation behind the scenes. The player’s pause-to-plan rhythm is a UI-native experience.

Mac-native feasibility:
Low risk. 2D sprite-style graphics on a single screen. No online multiplayer. No backend. Solo-dev feasible with SpriteKit or Godot on Mac. File-based level and incident definitions. No 3D rendering or large authored content.

Input model:
Mouse only. Click to pause, drag crew tokens to incident zones. No keyboard required. Trackpad also works.

Beginner appeal:
The pause button makes it forgiving. Beginners can take all the time they need to read, think, and assign. The tension comes from real-time consequences, not twitch skill. First round is almost always survivable.

Mastery engine:
At 10 plays: learning to prioritize incidents by escalation speed, not panic. At 50 plays: planning crew routes through safe paths, pre-positioning crews before incidents appear, and knowing when to let a low-priority fire burn. At 200 plays: multi-incident chains, crew fatigue management, and predictive crisis reading where you pause for only one second because you already know the pattern.

Replayability driver:
Procedural incident generation — no two rounds have the same incident sequence, position, or escalation timing. Difficulty scales by incident speed, number of simultaneous incidents, and crew count. Challenge modes (single crew, no pause, endless waves) emerge from the same core system.

Watchability / readability:
High. The ship layout, incident icons, crew movement, and damage meter are all visible at a glance. A spectator can see “fire in the engine room, crew is heading there” without explanation. The pause creates dramatic freeze-frames that make good streaming moments.

Scope risk:
Low. The entire game is one screen, one mode, one unit of play (90-second rounds). No progression system, no narrative, no meta-economy planned for the prototype.

Implementation risk:
Low. Core systems: pause clock, crew assignment, incident timers, pathfinding (simple grid-based). All are straightforward to prototype in a week.

Art/content burden:
Low. 2D ship layout tiles, simple crew icons, incident icons. No animation beyond movement and a simple extinguish/contain effect. A single developer can produce all art.

Main failure mode:
Rounds feel repetitive despite procedural incidents — the crisis types are too few, or the player’s options are too narrow, leading to solved strategies after 20 plays.

Smallest playable prototype:
One 90-second round, one ship layout (5 rooms), 3 crew tokens, 3 incident types, pause/unpause, drag-to-assign, damage meter, and a round-end screen. No menu, no progression, no options.

Kill criterion:
If a playtester says “I’m just doing the same thing every pause” after 5 rounds, the crisis variety or system depth is insufficient for the project.

Soft-decision note:
This is an exploratory candidate for the Mac-native digital lane, not a ratified direction. Before advancing, the human should probe whether the pause-to-plan rhythm creates genuine tension or feels like homework — a five-round paper walkthrough or a very simple screen prototype would answer that directly.
