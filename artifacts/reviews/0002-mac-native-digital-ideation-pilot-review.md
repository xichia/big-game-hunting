# Review: Mac-Native Digital Ideation Pilot (0002)

ARTIFACT TYPE: Review Artifact
AUTHORITY: DRAFT ONLY — HUMAN GATE INPUT
STATUS: Draft
DATE: 2026-07-04
REVIEWER: Independent AI Reviewer
RUN REVIEWED: `artifacts/research/mac-native-digital-ideation/runs/20260704-083206/` (12 lanes, A–L)
SOURCE-OF-TRUTH FILES TOUCHED: none

---

## 0. Scope and stance

This review evaluates the 12 Mac-native digital game candidates produced by the pilot run. It does **not** choose a final game, ratify a Mac-native-digital pivot, or edit any source-of-truth file. `GAME_TRUTH.md` still lists "the game is digital-only" as a forbidden assumption; this pilot is evidence for or against a possible pivot, nothing more.

Review stance is deliberately skeptical. Per the brief and the North Star, a candidate earns advancement only if it is **simple to start, broadly appealing, hard to master, strategically deep, replayable, and low-friction** — *not* because it is easy to code. Low implementation cost is treated as a tie-breaker, never as merit. Where a candidate's mastery reduces to reflex/typing speed (innate talent) rather than learnable strategy, it is penalized, consistent with the prior corpus review (0001), which flagged exactly that failure in "Beat the Boot."

Dashboard labels used: **GREEN** (ready to advance), **YELLOW** (promising, needs revision/probe), **RED** (do not advance in current form).

---

## 1. Run completeness check

All 12 lanes completed. Per `INDEX.md` and direct inspection of the run directory:

- 12 of 12 candidate files present (`01-A` … `12-L`), plus `INDEX.md`.
- Every lane reports **Status: OK**, **Finish Reason: stop** — no truncation, no error rows.
- All 12 files conform to the compact schema (all required headings present, in order).
- No malformed, empty, or duplicate outputs. File sizes (4.4–6.6 KB) are consistent with complete generations.

**One structural caveat, not a failure:** the entire run is single-model (deepseek-v4-flash) and single-pass. This is the same single-provenance limitation review 0001 flagged for the prior bulk pass. One lane = one concept means there is no within-lane competition and no cross-model diversity. Completeness is clean; **representativeness is not established.**

---

## 2. Governance check

Strong. The pilot respected its guardrails.

- **Remained exploratory:** every candidate carries `AUTHORITY: DRAFT ONLY — EXPLORATORY`, a `Soft-decision note` restating "not project truth," a `Kill criterion`, and a named next probe. `INDEX.md` explicitly states it "does not ratify a Mac-native-digital pivot."
- **Avoided source-of-truth language:** no "ratified," no "official," no claim that `GAME_TRUTH.md` has changed. `SOURCE-OF-TRUTH FILES TOUCHED: (none)` is present on all 12 and the index.
- **Avoided overclaiming "build this":** no candidate declares itself the winner or says it should be built. Hedged language is consistent throughout.
- **Role discipline:** outputs stayed in the Broad Research / Ideation lane (DRAFT ONLY). This review is a separate artifact from the material it evaluates, per `MODEL_WORKFLOW.md`.

**Governance verdict: GREEN.** The only thing to watch is human discipline downstream — these are 12 hedged sketches, and none should be treated as more than a hypothesis regardless of how polished the prose reads.

---

## 3. Medium-fit check (does it *need* to be a Mac-native digital game?)

**Genuinely native-digital (computation / real-time / hidden state / simulation the medium is required for):**
- **A Knot** — simultaneous recomputation of a whole enemy mass every move. Real.
- **B Deckwatch** — real-time-with-pause is a pure digital interaction. Real.
- **D NodeCipher** — live evaluation of a logic-gate graph on every edit. Real.
- **G Vantage** — a rival that models your tendencies in real time. Real.
- **I Pressure Bloom** — continuous coupled simulation running while you act. Real.
- **J Trail of Embers** — dynamic field-of-view lighting + AI reacting to emitted light/sound. Real.
- **K Switchpoint** — real-time pathfinding/timing on a shared grid. Real.
- **E Pivot Drift** — real-time physics + motion input. Real *in principle*, but see the hardware flaw in §5.

**Weak / borderline medium-fit (a mechanism or party game wearing a UI):**
- **H Cull the Hand** — the stated native reason is "digital bookkeeping … reshuffling, tracking retains, animating reveals." That is a convenience argument, not a *requires-a-computer* argument. This is the abstract simultaneous-select card game the system prompt explicitly warned against. **Weakest medium-fit of the twelve.**
- **L Last Word** — the computer is "judge, metronome, scorekeeper." True, but that describes a digitized party game, not a concept conceived as software. Its native-ness is administrative.
- **C Shellclash** — physics is real, but the concept is a generic 2D action duel; digital is necessary but not *distinctive*.
- **F Spectral Verdict** — "find what you cannot see" is legitimately screen-based, so it clears the bar, but only just.

**Takeaway:** medium-fit is strongest for A, J, K, B, G, D, I; weakest for H and L.

---

## 4. Feasibility check (solo developer on Mac)

| Lane | Solo-dev feasibility | Art/content burden | Technical risk | Prototype cost | Notes |
|------|----------------------|--------------------|----------------|----------------|-------|
| A Knot | High | Low | Low | ~Weekend | Grid + slide rule + collision. Cheapest to falsify. |
| B Deckwatch | High | Low | Low | ~1 week | Pause clock + assignment + simple pathfinding. |
| C Shellclash | Medium | Low | Medium | ~1 week | Physics feel is the hard, fiddly part. |
| D NodeCipher | High | Low | Low–Med | ~1 week + generator design | DAG eval is solved; the *procedural puzzle generator* is the real work. |
| E Pivot Drift | **Low/blocked** | Low | Medium | Unclear | **Macs have no accelerometer.** Requires an iPhone as a paired controller → added hardware + pairing friction. The candidate's "Mac's built-in accelerometer" is factually wrong. |
| F Spectral Verdict | Medium | **Medium (content treadmill)** | Low | ~1 week for one room | Every room is authored art + authored events; scales poorly. |
| G Vantage | Medium | Low | **Medium (learning AI)** | ~1–2 weeks | Readable-yet-adaptive AI is the entire risk. |
| H Cull the Hand | High | Low | Low | ~Few days | Cheap, but see medium-fit and mastery flaws. |
| I Pressure Bloom | Medium | Low | Medium | ~1 week | Coupled ODE tuning for *legibility* is the hard part. |
| J Trail of Embers | Medium | Low | **Medium (lighting+AI+procgen)** | ~1–2 weeks | Three non-trivial systems stacked. Highest-risk of the strong set. |
| K Switchpoint | High | Low | Low | ~1 week | Dijkstra on 5×5. Very safe to build. |
| L Last Word | **Medium/blocked** | Low | **Medium (multi-keyboard I/O)** | Uncertain | Requires one physical keyboard per player on one Mac → real hardware friction. |

**Feasibility flags that matter to the gate:** E and L both carry **hardware-dependency friction** that directly contradicts the North Star's "low adoption friction." A, B, D, H, K are the safest builds; do not let that safety inflate their design merit.

---

## 5. Player-facing appeal check

**Immediately playable + emotional stakes + memorable moments:**
- **J Trail of Embers** — strongest hook in the set. Darkness, a growl, a light that is both your tool and your betrayer. Visceral, universal, memorable. The light-as-bait tension is the one genuinely *novel* idea in the run.
- **B Deckwatch** — legible crisis-commander fantasy; the pause "freeze-frame" is a real dramatic beat; proven genre appeal.
- **A Knot** — the single slow slide of the whole enemy mass is a striking, readable image; "mouse in a snake pit" lands fast.
- **G Vantage** — sniper-duel-of-wits has clear stakes and unambiguous kill moments.
- **K Switchpoint** — Mini-Metro-adjacent calm-competence appeal; broad and approachable.

**Too niche / dry / derivative / abstract:**
- **D NodeCipher** — genuinely good, but a **Zachlike aimed at a programmer niche**. Watchability is self-rated Medium; the appeal ceiling is narrow versus "broadly appealing."
- **I Pressure Bloom** — simulation-toy audience is niche, and opacity risk (below) undercuts stakes.
- **H Cull the Hand** — abstract shadow-duel card game; emotionally cool but dry, and derivative of many simultaneous-select games.
- **C Shellclash** — charming but slight; two effective actions cap the appeal.
- **E Pivot Drift** — motion-control novelty audience is niche and fatigue-prone.
- **L Last Word** — typing-race party game; fun in a room, but appeal is situational (needs a crowd + hardware).

---

## 6. Mastery / readability check

The decisive filter. The project wants **learnable strategic mastery**, not innate reflex, and not depth that collapses to *solved* or *random*.

**Strategic / planning mastery (good fit):**
- **A Knot** — multi-move spatial planning, baiting chains. Real ceiling *if* it doesn't solve. The core question is solvability.
- **K Switchpoint** — pre-planning switch sequences and buffering. Real ceiling *if* planning beats reaction (its own kill criterion admits this is the open question).
- **B Deckwatch** — prioritization and pre-positioning. Depth is real but shallow-ish; risks a dominant "optimal triage" once learned.
- **D NodeCipher** — circuit optimization/minimization is a deep, genuinely learnable skill. Best "hard mastery" profile — but for a niche.
- **G Vantage** — reading and countering an adaptive AI is deep *if* the AI is readable; otherwise it trades randomly.

**Mixed strategy + execution:**
- **J Trail of Embers** — decoy misdirection and route memory are strategic; but moment-to-moment survival leans on execution/nerve. Ceiling is real but partly twitch.
- **F Spectral Verdict** — *self-admits* the core risk: it degrades from deduction into hotspot **memorization**. That is a solved-game failure mode, not mastery.
- **I Pressure Bloom** — *self-admits* legibility risk: if the player can't sense *why* a crisis happened, agency collapses (opaque, not masterable).
- **C Shellclash** — feint/bait exists, but only two actions; high risk of a solved dominant line.
- **H Cull the Hand** — mastery is "reliably predict opponent picks," i.e. reading the opponent — the **exact hand-wavy mastery claim** the pilot was created to move away from. Against an AI it becomes solvable; against a human it's a metagame with a thin base.

**Reflex / innate-talent mastery (poor fit for this project):**
- **L Last Word** — mastery is typing speed and reaction time. This rewards innate/trained twitch, not strategy — the precise flaw 0001 penalized. **RED on mastery grounds regardless of feasibility.**
- **E Pivot Drift** — mastery is fine motor control of a wobbly physics toy. Execution-dominant.

---

## 7. Ranked list (all 12)

Ranked by fit to the North Star (accessible + broadly appealing + hard *strategic* mastery + replayable + low friction), with codeability treated only as a tie-breaker.

**1. A — Knot** · **GREEN**
- One-line: Single elegant rule (your move slides the whole enemy mass) with the cleanest simple-entry / deep-planning profile in the run.
- Strongest promise: genuine "one click, hard to master" spatial strategy that is unmistakably native-digital.
- Biggest risk: solves (memorized openings) or feels random rather than responsive.
- Disposition: **advance to probe brief.**

**2. J — Trail of Embers** · **GREEN / YELLOW**
- One-line: The most emotionally compelling and most *original* concept — light is both tool and trail.
- Strongest promise: memorable moment-to-moment tension; distinctive hook no other lane offers.
- Biggest risk: three stacked hard systems (lighting + beast AI + procgen); mastery may tilt to execution over strategy.
- Disposition: **advance to probe brief** (probe the light-as-bait tension only, on one fixed screen — defer procgen/lighting engine).

**3. K — Switchpoint** · **GREEN / YELLOW**
- One-line: Broadly appealing routing game, very safe to build, deep *if* planning beats reflex.
- Strongest promise: proven accessible-with-depth genre; lowest technical risk of the top tier.
- Biggest risk: optimal play is purely reactive (its own kill criterion); derivative of Mini Metro / rail puzzlers.
- Disposition: **advance to probe brief** (the planning-vs-reaction probe is the whole question and is cheap).

**4. B — Deckwatch** · **YELLOW**
- One-line: Legible, forgiving real-time-with-pause crisis game; solid but conventional.
- Strongest promise: accessibility via pause + real dramatic beats; broad genre appeal.
- Biggest risk: settles into a dominant triage routine; "planning as homework" rather than tension.
- Disposition: **expand / rerun lane** (worth a second, more distinctive concept in this lane).

**5. G — Vantage** · **YELLOW**
- One-line: Sniper-duel-of-wits with a readable adaptive AI — high ceiling, high risk.
- Strongest promise: the "readable AI rival" is a strong native-digital fantasy with clear stakes.
- Biggest risk: AI reads as random or as cheating; duel too fast to read → random trading.
- Disposition: **expand / rerun lane** (the readable-AI premise deserves a second attempt; current form is a tuning gamble).

**6. D — NodeCipher** · **YELLOW**
- One-line: Deepest, most learnable mastery — but a Zachlike for a narrow audience.
- Strongest promise: real optimization skill; cheapest to *validate depth* (enumerate the rule space in a script).
- Biggest risk: narrow appeal; puzzle space collapses to a few rule templates.
- Disposition: **park** (excellent wildcard; revisit if broad-appeal candidates fail).

**7. F — Spectral Verdict** · **YELLOW / RED**
- One-line: Atmospheric deduction that admits it may be memorization, not deduction.
- Strongest promise: strong hook and dramatic irony for spectators.
- Biggest risk: degrades to hotspot memorization; content treadmill (authored rooms).
- Disposition: **park.**

**8. C — Shellclash** · **RED**
- One-line: Charming crab duel, but only two actions and a likely solved dominant line.
- Strongest promise: instant readability; fast rematch loop.
- Biggest risk: shallow after ~10 minutes; twitch-dominant.
- Disposition: **park / discard.**

**9. I — Pressure Bloom** · **RED**
- One-line: Ecosystem-jar duel whose whole viability rests on a simulation staying legible.
- Strongest promise: novel side-by-side tension.
- Biggest risk: opacity — if the sim feels arbitrary, agency and appeal both die (self-admitted).
- Disposition: **park.**

**10. H — Cull the Hand** · **RED**
- One-line: Abstract shared-hand card game — the tabletop-with-UI the pilot was told to avoid, with reading-the-opponent mastery.
- Strongest promise: cheap to build; clean simultaneous-reveal drama.
- Biggest risk: weak medium-fit; mastery is the hand-wavy "predict opponent" the project is moving away from.
- Disposition: **discard.**

**11. E — Pivot Drift** · **RED**
- One-line: Tilt-a-spinning-top physics game built on a Mac capability that does not exist.
- Strongest promise: immediate physical intuition; funny failures.
- Biggest risk: **factual feasibility flaw (no Mac accelerometer)** + hardware/pairing friction + execution-dominant mastery.
- Disposition: **discard.**

**12. L — Last Word** · **RED**
- One-line: Multiplayer typing-elimination party game — reflex mastery plus multi-keyboard hardware friction.
- Strongest promise: universal input (typing); clear elimination drama.
- Biggest risk: mastery is innate typing speed (not strategy); requires one keyboard per player → violates low-friction goal.
- Disposition: **discard.**

---

## 8. Recommended shortlist

- **Top 3 (advance to probe briefs):** A (Knot), J (Trail of Embers), K (Switchpoint).
- **Top 5:** the above plus B (Deckwatch) and G (Vantage) — as expand/rerun lanes, not probes yet.
- **Alternate / wildcard:** D (NodeCipher) — narrow but the deepest, cheapest-to-validate mastery; a natural fit given the developer is the programmer. Hold in reserve.

**Rationale for the top 3:** they are the three concepts that combine (a) real native-digital justification, (b) broad or proven appeal, and (c) a strategic — not reflex — mastery ceiling, while each having a **single cheap probe that can falsify its one fatal question**:
- A: *does the swarm slide feel controllable, and is it non-trivially unsolvable?*
- J: *is light-as-both-tool-and-bait compelling or merely frustrating?*
- K: *does pre-planning dominate reaction, or is it a reflex test?*

Each of these can be answered on a fixed single screen without building the full system — exactly the "smallest meaningful unit" discipline the design principles require.

---

## 9. Recommended next action

**Create probe briefs for the top 3 (A, J, K).**

Reasoning: the strongest candidates each hinge on one binary question that a bounded, sub-week probe can answer, and the design principles demand testing the smallest unit before buildout. Re-running the whole pilot now would be premature — the run is complete and the top of the distribution is clear enough to probe.

**Parallel, non-blocking recommendation (do not gate the probes on it):** because this pilot is single-model (deepseek-v4-flash) and one-concept-per-lane, it has the same provenance limitation review 0001 raised. A **second-model ideation pass over the same 12 lanes** would test whether these winners are genuinely the best available or merely the best of one model's narrow output. This is worth doing, but it should run *alongside* the top-3 probes, not before them.

Explicitly **not** recommended right now: scaling to a larger corpus (premature — depth, not volume, is the bottleneck), or a full prompt rewrite (the prompt performed well; only lane-level reruns for B/G are warranted).

---

## 10. Human decision block

This block records a human decision. Nothing above is ratified until a human checks a box here and, where it changes project direction, adds a matching `DECISION_LOG.md` entry.

- [ ] Approve probe-brief creation for: ________________________  *(reviewer recommends: A Knot, J Trail of Embers, K Switchpoint)*
- [ ] Run targeted Pilot 2 for lanes: ________________________  *(reviewer suggests: B Deckwatch, G Vantage — and optionally a second-model pass over all 12)*
- [ ] Scale larger corpus
- [ ] Revise prompt
- [ ] Defer

---

## Reviewer's closing caution

Three of the four cheapest-to-build candidates (H, and to a degree A and K) are cheap *because* they are simple — but only A and K also carry a real strategic ceiling; H does not. Do not let build-cost stand in for design merit. The single most distinctive idea in the entire run (J's light-as-tool-and-bait) is also one of the harder builds; if the project optimizes purely for codeability it will systematically discard its most original material. The top 3 above are chosen to hold that line: two safe-and-deep (A, K) plus one distinctive-and-worth-the-risk (J).
