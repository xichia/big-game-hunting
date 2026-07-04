# Mac-Native Digital Ideation — Lane D: Programming-adjacent puzzle / automation

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 4/12, lane D (Programming-adjacent puzzle / automation)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 4 of 12
- **Lane:** D — Programming-adjacent puzzle / automation
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:33:45

## Candidate

Candidate title:
**NodeCipher**

Batch / lane:
4 — Programming-adjacent puzzle / automation

One-sentence player-facing hook:
You are a data-wrangler inside a crashed orbital server: repair corrupt data packets by building tiny, rule-based logic circuits that transform inputs into correct outputs.

Core fantasy:
You are a lone system engineer, the only one who can read the raw data-streams and rewire the server's kernel modules to restore its core functions.

Core loop:
A new "packet" appears on the left — a sequence of colored symbols. You drag simple logic gates (AND, OR, NOT, SHIFT, FILTER) onto a 5x5 grid between the input and output. The gate layout is evaluated instantly. If the output symbols match the target pattern, the packet is repaired. If wrong, the output shows corrupted colors and you tweak the wiring. One packet takes ~45 seconds.

First five minutes:
Player sees a single input port and a single output port with a blinking "REPAIR" button. A simple packet arrives with 3 symbols. They drag a FILTER gate onto the grid; the output updates immediately. They see a wrong color, drag a NOT gate after it, the output corrects, and they press REPAIR. The packet is fixed. The next packet introduces AND and OR. No text tutorial — the player discovers logic by seeing it fail and succeed visually.

Native-digital reason:
**Computation and real-time visual feedback.** The entire experience is based on evaluating a graph of logic gates on every mouse-up event — impossible in a tabletop game. The immediate, colored, animated feedback of the output stream changing as you wire makes the act of solving feel tactile and responsive. Delayed evaluation or manual calculation would destroy the flow.

Mac-native feasibility:
**Low.** A single developer can build this in Swift with SpriteKit or Godot. No server, no online play, no 3D. The logic evaluation is simple. The visual complexity is moderate — 2D nodes, wires, colored symbols, particle feedback on success. Art can be procedural: circles, lines, and colored text.

Input model:
Keyboard/mouse. Player clicks to select a gate from a palette, clicks to place it on the grid, drags from gate output to gate input to make a connection. Right-click to delete.

Beginner appeal:
**High.** The first packet is trivially solved with one gate. The visual failure is clear: wrong colors. The "aha" moment of adding a NOT and seeing colors flip is immediate. Low text, high visual cause-and-effect.

Mastery engine:
- **10 plays:** Can solve single-layer FILTER/NOT packets.  
- **50 plays:** Optimizing multi-gate circuits (AND + OR with shared inputs) to reduce latency (a score metric).  
- **200 plays:** Building compact, non-obvious circuits that reuse intermediate signals, using nested logic patterns, and predicting which gate topology will minimize gate count for a given packet pattern.

Replayability driver:
**Procedural variation and optimization scoring.** Every packet is procedurally generated with a hidden internal rule (e.g. "keep all symbols that are NOT (red AND circle)"). The player must reverse-engineer this rule through trial and error. Each packet has a "minimum gate count" par, and the player is scored on efficiency. Beating your own par or a global leaderboard (optional, local only) is the core replay loop.

Watchability / readability:
**Medium.** A skilled player wiring quickly shows a clear sequence of trial, error, and insight. The colored symbols make the state obvious. However, the logic is internal — a non-player may not immediately see _why_ the solution works. The satisfaction is visible in the "REPAIRED" burst and score pop-up.

Scope risk:
**Medium.** The core is small, but the procedural generator for solvable packets and the gate evaluation engine must be carefully designed to always produce a valid solution. Edge cases (impossible packets, red-herring gates) need handling.

Implementation risk:
**Low.** The core mechanic is a directed acyclic graph evaluator — a solved problem. The UI is drag-and-drop + immediate feedback. No physics, no AI, no multiplayer.

Art/content burden:
**Low.** All visual elements are geometric shapes (circles, squares for symbols), colored with a palette of ~8 colors. Gates are stylized rectangles with text labels. No animations beyond simple tweening on packet repair. A solo developer can produce all art in a week.

Main failure mode:
The procedural packets become repetitive or trivially solvable (e.g., every packet is just "NOT red"). The puzzle space collapses to a few rule templates. Player loses interest once all rule types are learned.

Smallest playable prototype:
A single-screen app with one fixed packet (input: red-circle, red-square, blue-circle; target output: blue-circle, blue-circle, red-circle). Player can place one FILTER and one NOT gate on a 2x3 grid. The output updates on every gate placement. The player clicks "REPAIR" to check correctness.

Kill criterion:
After 10 procedurally generated packets, a test player cannot find a new distinct rule pattern, OR the player reports that solving feels like guessing rather than reasoning.

Soft-decision note:
This is an exploratory candidate for the "programming-adjacent puzzle" lane, not project truth. Before this could be taken further, the procedural packet generator must be designed and validated on paper — specifically, to confirm that it can produce at least 50 distinct, non-trivial, non-repeating rule sets that map to gate requirements of 2–6 gates. A small Python script to enumerate the rule space would be the next probe.
