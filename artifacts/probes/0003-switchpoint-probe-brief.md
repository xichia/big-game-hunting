# Probe Brief: Switchpoint

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — Human-gated probe input
CREATED BY: Sonnet
REVIEWED BY: not yet reviewed
DATE: 2026-07-04
RELATED TASK: Mac-native digital candidate probe planning
SOURCE-OF-TRUTH FILES TOUCHED: none

---

## 1. Candidate summary

- **Candidate title:** Switchpoint
- **Source lane:** K — Construction, routing, or logistics game (`artifacts/research/mac-native-digital-ideation/runs/20260704-083206/11-K-construction-routing-or-logistics-game.md`)
- **One-sentence hook:** Build tiny shipping routes through a living city grid, but every switch you throw changes what arrives and what gets stranded.
- **Core player action:** Click track-tile switches to route incoming color-matched packages toward their matching outlets before they time out.
- **Why this is meaningfully Mac-native/digital:** Requires real-time pathfinding simulation, dynamic collision detection on a shared track grid, and frame-by-frame timing of package movement — a live simulation impossible to replicate with physical components.
- **Why it might satisfy the Big Game Hunting north star:** Color-matching and a small, fully visible grid make the objective instantly graspable (simple entry, broad appeal); the review (`artifacts/reviews/0002-mac-native-digital-ideation-pilot-review.md`) rates it the safest build of the top tier with a real strategic ceiling *if* pre-planning beats reaction — which is precisely this probe's open question.

## 2. Probe authority boundary

- This brief does not choose the game.
- This brief does not authorize production implementation.
- This brief does not update source-of-truth.
- This brief only defines the smallest useful test to answer one bounded question about planning vs. reaction in switch routing.

## 3. Falsifiable probe question

**Core question:** Does switch routing reward anticipation/planning, or collapse into reactive clicking?

Refined for this candidate:
- Does the tester begin pre-setting switches ahead of an incoming package's arrival, or only react to a package once it is already at a junction?
- When package density increases, does the tester's success rate depend on early setup decisions, or purely on click speed/reaction time?
- Can the tester articulate a plan ("I set this switch early because I knew the next package would need it") rather than describing pure reflex?

## 4. Smallest playable prototype

- 5x5 (or similarly tiny) grid, single screen, no menus except reset.
- No rounds, no upgrades, no scoring beyond a simple pass/fail signal — just the routing mechanic.
- Sub-week build target.

## 5. Required mechanics only

- A 5x5 track grid with a small number of fixed inlets (package entry points) and color-matched outlets.
- Switch tiles the player can click to toggle orientation (e.g., straight vs. turn), determining package path at each junction.
- A continuous stream of colored packages entering from inlets at staggered intervals.
- Packages move along the track each tick/frame toward the next tile determined by current switch states.
- Failure condition: a package reaches the wrong outlet, or a package times out / collides while stalled.

## 6. Explicit non-goals

- No final art.
- No progression system.
- No campaign.
- No menus beyond launch/reset if necessary.
- No save system.
- No audio unless essential to the probe.
- No production architecture.
- No source-of-truth update.
- No final rules.
- No "this is the game" language.
- No upgrades, procedural layouts, campaign, meta-progression, complex pathfinding, or polish.

## 7. Playtest script (5–10 minutes)

**Tell the tester before play:**
- "Packages come in from these inlets and need to reach the outlet of the matching color. Click a track tile to change which way it routes packages. Try to get as many packages to the right place as you can."

**Do not explain:**
- That setting a switch early (before a package arrives) is possible or advantageous.
- Any specific sequencing or "look-ahead" strategy.
- What causes a package to fail (let them discover timeouts/misroutes).

**Observe during play:**
- Whether switch clicks happen before a package reaches the junction (anticipatory) or only once a package is visibly at/near the junction (reactive).
- Whether the tester's clicking becomes visibly frantic as package density increases, or stays calm and anticipatory.
- Whether the tester revisits/pre-sets a switch back to a known-good state after routing a package, in preparation for the next one.

**Ask after play:**
- "How did you decide when to click a switch — before a package arrived, or once you saw it needed to turn?"
- "Was there a point where you felt behind, just reacting to whatever was in front of you?"
- "Did you ever set something up in advance because you expected what was coming next?"
- "What would you do differently if you played again?"

## 8. GREEN criteria

- Tester visibly pre-sets at least one switch before the relevant package arrives, without being told this was possible.
- Tester can describe a plan or anticipation ("I knew the next one would need this") in the post-play interview.
- Success rate does not collapse to chance as package density increases — tester maintains a meaningful improvement curve across attempts.
- Tester's own description of skilled play emphasizes foresight/calm over speed/panic (echoing the source artifact's "calm, anticipatory clicking" vs. "frantic last-second switches" distinction).

## 9. RED criteria

- Optimal play is purely reactive — the tester (or observer) can achieve equal or better results by only clicking the visibly flashing/imminent tile, with no benefit from pre-planning (matches the source artifact's own kill criterion).
- Tester reports the game "feels like a reflex test," not a planning puzzle.
- Increasing package density causes failure to scale directly with click speed rather than decision quality.
- Tester never attempts to set a switch ahead of an approaching package across the full session.

## 10. Implementation notes

- **Suggested minimal tech shape:** a single-screen 2D grid app (e.g., mouse-only interaction in a lightweight engine or a simple canvas-based prototype); core logic is a small directed graph with toggled edge states — no engine-level pathfinding library required.
- **Core objects/data structures:** a 5x5 array of track-tile states (straight/turn/switch orientation); a list of inlet definitions (position, package color, spawn interval); a list of outlet definitions (position, accepted color); an active-package list (position, color, age/time-since-spawn); per-tick movement resolves each package's next tile from the current switch orientation at its position.
- **Quickest path to playable:** hardcode a 5x5 layout with three inlets and three matching outlets, implement click-to-toggle on switch tiles, implement per-tick package movement along the resolved path, implement a wrong-outlet/timeout failure check, add a simple visible fail flash and reset key. Skip scoring, upgrades, and rounds entirely for this probe.
- **Known traps from the review (0002-mac-native-digital-ideation-pilot-review.md):** the review explicitly frames this candidate's entire viability as resting on whether "optimal play is purely reactive (click the visible flashing tile)" — its own stated kill criterion. The probe must not add scoring pressure, upgrades, or rounds that could mask this question; the review also cross-references this as "Mini-Metro-adjacent," so avoid importing that genre's meta-progression before the core planning-vs-reaction question is settled.

## 11. Risk register

| Risk | How the probe detects it |
|---|---|
| Optimal play is purely reactive, no planning benefit (the candidate's own kill criterion) | Direct observation of pre-setting behavior; post-play question on when switches were set |
| Game feels like a timed reflex test rather than logistics planning (source artifact's stated main failure mode) | Post-play self-report; comparing tester's description of their own play style to "calm" vs. "frantic" |
| Grid too small/simple to reveal any real planning depth | Vary package density/interval slightly across attempts and observe whether strategy adapts |
| Failure condition (timeout/misroute) is unclear, making outcomes feel arbitrary rather than caused by a decision | Ask tester to explain why a specific package failed |

## 12. Decision block

- [ ] Build this probe
- [ ] Revise probe brief
- [ ] Park candidate
- [ ] Kill candidate
- [ ] Defer
