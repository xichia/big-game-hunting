# Mac-Native Digital Ideation — Lane K: Construction, routing, or logistics game

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 11/12, lane K (Construction, routing, or logistics game)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 11 of 12
- **Lane:** K — Construction, routing, or logistics game
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:36:32

## Candidate

Candidate title:
Switchpoint

Batch / lane:
K — Construction, routing, or logistics game

One-sentence player-facing hook:
Build tiny shipping routes through a living city grid, but every switch you throw changes what arrives and what gets stranded.

Core fantasy:
You are a lone rail-yard dispatcher in a hyper-efficient but fragile cargo network, holding the power to keep everything flowing — or silently watch it gridlock.

Core loop:
A 60-second round: packages arrive from three inlets at staggered intervals. You click switches on a 5x5 track grid to route each package toward its color-matched outlet. A package that reaches the wrong outlet is lost; a package that sits too long times out. Between rounds, you spend points earned from successful deliveries to upgrade a switch, add a short buffer track, or unlock a new inlet/outlet pair.

First five minutes:
Tutorial shows three packages with clear color labels and three matching outlets. The grid is empty. Player clicks one switch to route the first package — immediate success. Second wave adds a fourth package with a new color, and two switches must be set in sequence. Third wave introduces a timed package that must reach its outlet within 8 seconds, creating the first visible pressure. No text explanation needed beyond color matching and a blinking timer.

Native-digital reason:
The game requires real-time pathfinding simulation, dynamic collision detection on a shared track grid, and frame-by-frame timing of package movement — impossible to replicate with physical components. The digital layer also enables hidden "bottleneck" states that only become visible as packages stack.

Mac-native feasibility:
Low. Built with Swift/SpriteKit or a lightweight 2D engine like Godot (Mac build target). Grid is small, sprites are simple geometric shapes, and all logic is local single-thread pathfinding. A solo developer can implement the full loop in a week.

Input model:
Mouse-only. Click a track tile to toggle its switch orientation (straight or turn). No drag, no keyboard, no menus during play.

Beginner appeal:
Color-matching is universal. The grid is small and fully visible. First three rounds are purely reactive and forgiving. Failure just restarts the round with no penalty.

Mastery engine:
At 10 plays: learns to anticipate package sequences and set switches preemptively. At 50 plays: starts planning two moves ahead, using buffer track to absorb timing mismatches. At 200 plays: develops branching strategies, reads the emergent rhythm of the package stream, and can recover from cascading delays.

Replayability driver:
Procedurally generated package sequences and track layouts. Each playthrough has different inlet/outlet positions and a different rhythm of arrivals. Player choice in upgrade path creates emergent difficulty curves.

Watchability / readability:
Every package has a clear color trail. The grid is small enough to see all activity at once. A missed package flashes red and disappears — immediately readable. Skilled play looks like calm, anticipatory clicking; novice play looks like frantic last-second switches.

Scope risk:
Low. No procedural content generation beyond sequence seeds. No animation beyond simple movement. No audio or visual polish needed for prototype.

Implementation risk:
Low. Core mechanic is a directed graph with toggled edge weights. Pathfinding is Dijkstra on a 5x5 grid. The timer and scoring are trivial.

Art/content burden:
Low. Requires 3–5 colored sprites, a 5x5 grid texture, and simple UI elements. All can be programmer art.

Main failure mode:
The game feels like a timed puzzle with no strategic depth — solves like a reflex test rather than a logistics planning game.

Smallest playable prototype:
A single 5x5 grid with three inlets, three outlets, mouse-click toggling on each track tile, and a continuous stream of colored packages. No rounds, no upgrades, no scoring — just the routing mechanic. Test if it feels like planning or panic.

Kill criterion:
If the prototype reveals that optimal play is purely reactive (click the visible flashing tile) and pre-planning never matters, the concept is dead.

Soft-decision note:
This is an exploratory DRAFT ONLY candidate for the Mac-native pilot pass. It would need a human-played prototype of the routing mechanic alone (no upgrades, no rounds) to test whether pre-planning or reaction dominates before it could be taken further.
