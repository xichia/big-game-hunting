# Mac-Native Digital Ideation — Lane I: Simulation toy with win pressure

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 9/12, lane I (Simulation toy with win pressure)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 9 of 12
- **Lane:** I — Simulation toy with win pressure
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:35:42

## Candidate

Candidate title:
Pressure Bloom

Batch / lane:
I — Simulation toy with win pressure

One-sentence player-facing hook:
You control a tiny, fragile ecosystem in a jar that must outlast a rival jar on the other side of the screen.

Core fantasy:
You are a micro-gardener in a silent duel, where your only weapon is resourceful life support under escalating decay.

Core loop:
Each turn lasts 10 seconds. You drag resources (water, light, nutrients) into your jar, watching a feedback simulation of plants, microbes, and oxygen. Simultaneously, the rival AI (or opponent’s jar) does the same. When a jar’s oxygen hits zero, it collapses. You adjust inputs on the fly to stave off cascading die-offs.

First five minutes:
Player sees two identical jars with a “START” button. Pressing it, they immediately see a plant wilt and a bacterial bloom spike. They drag a water droplet icon into their jar. The bloom stabilizes. The rival jar’s oxygen drops. Player gets the core dynamic in one glance.

Native-digital reason:
Real-time simulation of interdependent variables (oxygen, waste, population, light) is impossible on a tabletop. The digital layer lets the simulation run continuously, even when the player isn’t dragging resources — creating tension and urgency.

Mac-native feasibility:
Low complexity. Single-window Swift/SpriteKit app. No networking (local AI opponent or hot-seat with separate timers). No 3D. No server. Runs on any Mac from 2016 onward.

Input model:
Mouse or trackpad drag-and-drop onto a 2D jar view. No keyboard required.

Beginner appeal:
Obvious cause and effect: drag water → bloom calms → oxygen rises. No text reading needed. The rival jar’s visible oxygen bar creates immediate stakes.

Mastery engine:
At 10 plays: learning which resources counter which crises. At 50 plays: anticipating cascade chains (e.g., too much light causes algae spike, then waste overload). At 200 plays: predicting the AI opponent’s resource pattern and timing counter-actions before your jar suffers.

Replayability driver:
Procedural seed for each jar’s starting ecology and the AI opponent’s behavioral schedule. Every match has different crisis timing and variables.

Watchability / readability:
Yes. Both jars visible side-by-side. Oxygen bars, plant health indicators, and crisis icons are clear. A spectator can see who is struggling and who is recovering instantly.

Scope risk:
Low. Core simulation is a few coupled differential equations. No levels, no story, no art pipeline beyond simple shape drawing.

Implementation risk:
Medium. Tuning the simulation to feel responsive without being too fragile or too easy requires careful iteration, but is not technically hard.

Art/content burden:
Low. Abstract shapes and icons. No animations beyond color shifts and size changes. One screen, two jars.

Main failure mode:
The simulation feels arbitrary — player can’t sense why a crisis happened, so they stop caring.

Smallest playable prototype:
Two labeled resource bars (water, light) that affect a visible oxygen meter. A single “tick” per second. If oxygen hits zero, the jar collapses. That’s it. Test if the player feels agency.

Kill criterion:
If, after 3 minutes of the prototype, the player cannot explain what they did to affect the oxygen meter, abandon.

Soft-decision note:
This is an exploratory candidate only, not project truth. Before it could be taken more seriously, a simple prototype must confirm that the simulation feels legible and the win pressure (rival jar) creates engagement rather than confusion.
