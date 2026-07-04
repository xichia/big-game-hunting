# Mac-Native Digital Ideation — Lane F: Solo deduction with hidden state

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 6/12, lane F (Solo deduction with hidden state)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 6 of 12
- **Lane:** F — Solo deduction with hidden state
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:34:34

## Candidate

Candidate title:
Spectral Verdict

Batch / lane:
F — Solo deduction with hidden state

One-sentence player-facing hook:
A mysterious death has occurred in a remote mansion, and you must reconstruct the final moments by stitching together ghostly echoes — while a suspicious detective watches your every move.

Core fantasy:
To be a spiritual medium whose power is unreliable, forcing you to deduce the truth from fragmented, invisible evidence rather than simply seeing it.

Core loop:
Over 90 seconds, you scan a static room scene by dragging a glowing cursor over objects; when the cursor passes over a "hotspot," a short spectral animation plays (a glass shatters, a figure enters, a voice whispers), after which you must quickly place a pin on a timeline and tag it with a suspect or object before the detective's suspicion meter fills — clicking the wrong tag or hesitating too long raises suspicion and can end your session early.

First five minutes:
The game opens with a cinematic of the detective handing you a case file; then you're placed in the first room with a simple, highlighted hotspot that triggers a clear event (a vase falls). A tutorial ghost appears and instructs you to drag to the timeline, pick the correct tag from a short list, and place it. You succeed on the first try, feel the tension of the suspicion meter, and immediately want to try a harder room.

Native-digital reason:
Hidden state — the ghost echoes are invisible until the player's cursor passes over them, requiring real-time position tracking and collision detection that only digital execution can provide smoothly; the mechanic of "you must find what you cannot see" is fundamentally screen-based.

Mac-native feasibility:
Low. A solo developer can build this in a game engine like Godot or Unity on Mac. The art is simple pre-rendered 2D room illustrations (painting-style, purchasable or generated via procedural color palettes), and the ghost animations are small sprite loops. No online infrastructure, no 3D modeling, and no large content pipeline.

Input model:
Mouse or trackpad — click-and-drag scanning, point-and-click tagging. No keyboard required beyond menu navigation.

Beginner appeal:
The first room is short, the cursor leaves a visible trail, and the ghost tutorial directly shows the cause-and-effect of scanning. Failure only means a small suspicion penalty, so beginners can experiment without feeling punished.

Mastery engine:
At 10 plays, you learn to scan systematically and recognize subtle audio cues. At 50 plays, you can infer multiple events from a single echo (e.g., a door slam implies both a suspect and a direction) and begin tagging with minimal cursor movement. At 200 plays, you can complete rooms without any visible scan trail, relying purely on memory of hotspot locations and audio patterns, and you can challenge the "perfect medium" mode where one wrong tag ends the session.

Replayability driver:
Procedural placement of hotspots and variation in ghost event sequences within each room, combined with a "detective's mood" system that changes suspicion gain rates. Two players can have different events in the same room on different playthroughs.

Watchability / readability:
Very high. The viewer sees the ghostly animations even if the player doesn't, creating dramatic irony. The suspicion meter is visible, and the timer creates tension that translates well to a stream or spectator.

Scope risk:
Medium. The core mechanic (scan → tag) is simple, but building enough distinct room layouts, ghost events, tag lists, and suspicion AI to avoid repetition requires moderate content investment.

Implementation risk:
Low. The core loop is a single scene with a cursor, collision detection, and a timeline UI. Nothing about the implementation is technically novel or risky.

Art/content burden:
Medium. Each room is a full painting-style illustration. A minimum viable version with 3 rooms and 15 ghost events is feasible, but 10+ rooms and 60+ events would feel thin.

Main failure mode:
The game becomes a memorization puzzle rather than a deduction puzzle — players learn hotspot positions and ignore the narrative or logical reasoning.

Smallest playable prototype:
One room illustration, 5 ghost events, a timeline with 4 tag slots, and a suspicion meter that fills after 10 seconds of inactivity. Demonstrate the scan → tag loop and the penalty for wrong tags.

Kill criterion:
If, in a playtest, players consistently solve rooms by brute-force scanning rather than by reasoning about what the ghost events imply, the deduction core is dead.

Soft-decision note:
This is an exploratory candidate for the solo-deduction-with-hidden-state lane. It is not project truth. Before it could be taken more seriously, it would need a small probe: a single-room prototype with 5 ghost events tested on 5 people to see whether they find the deduction part interesting or the scanning the only source of engagement.
