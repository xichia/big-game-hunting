# Mac-Native Digital Ideation — Lane E: Physics or geometry skill game

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 5/12, lane E (Physics or geometry skill game)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 5 of 12
- **Lane:** E — Physics or geometry skill game
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:34:09

## Candidate

Candidate title:
Pivot Drift

Batch / lane:
5 — Physics or geometry skill game

One-sentence player-facing hook:
Control a fragile, unbalanced top that you can tilt and spin only by leaning your body against a real-world surface — and guide it through a course without toppling.

Core fantasy:
You are a clumsy, stubborn, slightly magical spinning top with a mind of its own, fighting to stay upright and cross a finish line against shifting geometry.

Core loop:
Your Mac’s built-in accelerometer (or your iPhone, held as a controller) reads the angle you lean the device in physical space. The top responds with physics — torque, friction, gyroscopic wobble. You tilt forward to roll, tilt left/right to steer, and slam the device upright to "kick" the top to spin faster. You navigate through an obstacle course of ramps, magnets, narrow ledges, and low ceilings, trying not to fall off or stall. A run lasts 30–90 seconds.

First five minutes:
You load the game. A text-free tutorial shows a top on a flat plane. You naturally tilt your Mac or phone; the top rolls. A glowing path appears: Go from start to finish without falling. You fail the first time (it’s hard to control tilt). The game shows your best distance and says "Try again." You instinctively adjust your tilt angle. By attempt 4–5, you can make it to the first checkpoint. You are already playing.

Native-digital reason:
Real-time 3D physics simulation (torque, gyroscope, friction, collision) combined with real-world motion input via accelerometer/gyroscope. The entire core interaction — tilting the device as a physical controller — is impossible in tabletop. No digital substitute would feel the same.

Mac-native feasibility:
Low scope. Solo dev can implement with SceneKit or Unity (Mac build), access Core Motion for accelerometer data, and use built-in assets. No network, no server, no large authored content.

Input model:
Mac trackpad/accelerometer (lean the MacBook) or iPhone as a motion controller via Bluetooth. No keyboard needed. One-button optional for "kick."

Beginner appeal:
Immediate physical intuition: you tilt, the top moves. Failures are funny and forgiving (toppling is a visual treat). You get a new attempt instantly. No rules to learn.

Mastery engine:
At 10 plays: you can steer around curves. At 50 plays: you can feather-tilt to drift through narrow paths and use angled landings to preserve spin. At 200 plays: you plan multi-segment runs, using terrain geometry to conserve momentum, and can execute precision saves near edges.

Replayability driver:
Procedurally generated courses (parametric ramps, turns, gaps, hazards) that vary per run. Leaderboards for best distance and time. Daily challenge seed for shared competition.

Watchability / readability:
High. The top’s wobble, near-misses, and dramatic topples are instantly readable. A spectator sees cause and effect: tilt → drift → fall. Replays are fun to watch.

Scope risk:
Medium. 3D physics and accelerometer integration are straightforward, but fine-tuning the feel of the top (angular damping, friction, kick strength) is delicate and requires iteration.

Implementation risk:
Low. Core Motion is well-documented. SceneKit/Unity physics handles collisions. No networking, no AI, no content pipeline.

Art/content burden:
Low. Use simple geometric shapes (a cone, a cylinder, a block for the top). Course objects can be low-poly primitives. No characters, no animation rigging, no 2D art pipeline.

Main failure mode:
Controls feel imprecise or unresponsive, making the game frustrating rather than skill-testing. If tilt mapping is too sensitive or too sluggish, players give up before the fun emerges.

Smallest playable prototype:
A single flat plane with a top and a finish line, using accelerometer input to roll and steer. No obstacles, no courses. Test that tilting produces a responsive, controllable, satisfying movement feel.

Kill criterion:
After 10 playtest attempts with a prototype, fewer than half of testers say "This feels good" or "I want to try again." If the physical-input-to-game-response mapping is not intuitive, kill the concept.

Soft-decision note:
This candidate is exploratory. It has not been ratified. To be taken more seriously, the smallest playable prototype above must produce a "feels good" consensus from at least 3 independent testers in person.
