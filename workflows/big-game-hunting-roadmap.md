Here is the development roadmap, based on the repository reading already completed. This is a planning artifact only — **Authority level: DRAFT ONLY** — and nothing in it updates project truth unless the human decision authority ratifies it with a matching `DECISION_LOG.md` entry.

---

# Big Game Hunting — Development Roadmap

Prepared by: Fable-style model (roadmap/planning role) · Date: 2026-07-03
Status: DRAFT ONLY · Not ratified · Proposes, does not decide

---

## 1. Repository State Summary

**Overall state:** a complete, internally consistent governance scaffold containing essentially zero game design content — deliberately. The project sits at the very start of `Ideate`.

**Source-of-truth files (all present):**
- `GAME_TRUTH.md` — north star ratified (simple entry, wide appeal, hard mastery, strategic depth, strong replayability, low adoption friction); pitch, core loop, player fantasy, and win/loss conditions all explicitly **TBD**
- `DESIGN_PRINCIPLES.md` — 10 ratified principles plus five standard evaluation questions
- `MECHANICS.md` — "None yet"; template only
- `DECISION_LOG.md` — exactly one ratified decision (2026-07-03: adopt the Governed Artifact Pipeline)
- `MODEL_WORKFLOW.md` — role-based routing, authority levels, file rules
- `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` — empty logs with templates; the balance file includes a strong failure-mode checklist (dominant strategy, runaway leader, solved openings, etc.)

**Governance rules in force:** models produce, reviewers evaluate, humans ratify; one task / one artifact / one commit; every task lists allowed and forbidden files; reviews are separate artifacts from what they evaluate; every source-of-truth (SoT) change pairs with a decision log entry (`CONTRIBUTING.md` checklist).

**Design principles:** easy to start, hard to master; no complexity without payoff; meaningful beginner choices; expert skill expression; context-dependent strategy; teachable, watchable, deepening on replay; smallest-meaningful-unit prototyping. Design tension named explicitly: "not a simple game — an accessible game with hidden depth."

**Known unknowns (recorded):** the simplest compelling version; the source of the mastery ceiling; the primary emotional hook; teachability/replayability drivers; the smallest probe that tests the promise; and (from the decision log) which candidate directions to generate first. **Forbidden assumptions** block digital-only, tabletop-only, competitive-only, cooperative-only, and any fixed theme, components, or economy.

**Development readiness:** governance-ready, design-empty. All six templates exist. `artifacts/research/0001` is a placeholder brief (it poses the question and eight candidate shapes; contains no research). `artifacts/dashboards/0001` confirms pipeline adoption and flags Fable Five's boundary as YELLOW. `synthesis/`, `probes/`, `reviews/` are empty. `docs/first-run.md` sketches the first operating pass. `playtests/`, `prototypes/`, `rules/`, `src/`, `assets/` are README-only.

**Missing or gapped:**
- **The directory is not a git repository**, despite `.gitignore`/`.gitattributes` and the "one artifact, one commit" rule depending on commits. This is the hardest blocker on the stated process.
- No feasibility-packet, core-loop, mastery-ceiling, or playtest-scenario templates (feasibility currently borrows the research template).
- No artifact ID/naming convention doc (a `NNNN-slug.md` pattern is implied by the two seed artifacts).
- No orchestrator backlog/task log, so creator≠reviewer separation is not yet auditable.
- Minor drift: `README.md`'s structure diagram omits `docs/first-run.md`.

## 2. Project Interpretation

**Supported directly by the repository:** the project is not "a hunting game" — it is a *hunt for a game*: a governed search across an intentionally open design space for any game shape that delivers the ratified north star. The pipeline exists specifically so persuasive or repeated model output cannot become truth prematurely.

**My interpretation (clearly not repo truth), per criterion:**
- **Simple entry:** "simple" should mean low *rules* burden, not low *decision* richness. Target: objective explainable in ~2 minutes with an obvious first move (consistent with, but more specific than, the Simplicity Gate).
- **Hard mastery:** depth should come from interaction — reads, timing, counters, context-dependent valuation — not content volume; the non-goals already ban content substituting for loop quality. I add: the mastery ceiling should be **legible** — beginners should be able to *see* that experts are doing something better, which is what motivates the climb.
- **Broad appeal / social appeal:** the Social Appeal Gate ("fun to teach, fun to watch, memorable moments") implies the game must generate *tellable stories*. I'd treat watchability as a first-class selection criterion, not a bonus.
- **Replayability:** multiple viable strategies must survive discovery of the obvious strategy; the balance failure-mode list should be applied from the first probe, not deferred.
- **Strategic depth:** best play should depend on reading the current game state and opponents, so there is no memorizable script.
- **Low onboarding friction:** friction includes teach time, setup time, first-game misery, and "can a player who just learned it teach it?"
- **Theme:** "Big Game Hunting" is not ratified theme (forbidden assumptions block fixing theme). Interpretation: treat the title as a codename until Phase 10 ratifies theme and name.

## 3. Development Roadmap

Every phase ends at a review or human gate; no phase self-ratifies.

### Phase 0: Repository and Governance Setup
- **Purpose:** make governance mechanically enforceable before content generation begins.
- **Inputs:** current repo; this roadmap as a proposal.
- **Outputs:** git repo initialized with a baseline commit; artifact-convention note; corrected README diagram; decision on new templates and directories (Section 9); ratified (or modified) roadmap.
- **Model roles:** Orchestrator prepares proposals; Source-of-Truth Maintainer executes only after ratification.
- **Human decision required:** ratify roadmap and repo improvements; authorize `git init`.
- **Acceptance criteria:** baseline commit exists; "one artifact, one commit" is now satisfiable; `DECISION_LOG.md` records the ratification.
- **SoT files updatable after ratification:** `DECISION_LOG.md`; `README.md` (structure fix); `MODEL_WORKFLOW.md` only if routing changes are ratified.
- **Risks to avoid:** gold-plating governance instead of starting research; this roadmap becoming truth without a decision entry.

### Phase 1: Broad Game Ideation
- **Purpose:** generate the wide possibility space of game shapes — executing the brief already drafted in `artifacts/research/0001`.
- **Inputs:** research brief 0001, `templates/research-artifact.md`, north star, forbidden assumptions.
- **Outputs:** 2–3 independent DRAFT ONLY research artifacts (ideally from different models), each covering the eight named shapes **plus at least 2–4 shapes outside that list**, evaluated on all seven required criteria; one analogue-research artifact mapping existing games that achieve the accessibility/depth tension.
- **Model roles:** Broad Research / Ideation Model (multiple uncorrelated instances).
- **Human decision required:** none to run; light steer permitted.
- **Acceptance criteria:** DRAFT ONLY labels; no SoT edits; all seven criteria filled per candidate; failure modes specific, not generic.
- **SoT files updatable:** none.
- **Risks to avoid:** treating the eight suggested shapes as a closed list; theme lock-in to literal hunting; artifacts drifting into full game designs.

### Phase 2: Candidate Design Synthesis
- **Purpose:** compress broad research into a decision-ready set of 3–5 candidates.
- **Inputs:** Phase 1 artifacts, `templates/synthesis-packet.md`, design principles.
- **Outputs:** one synthesis packet in `artifacts/synthesis/` (comparison table, smallest useful probe per candidate, GREEN/YELLOW/RED/QUESTION framing) plus one independent review of the packet in `artifacts/reviews/`.
- **Model roles:** Synthesis / Architecture Model produces; Independent Reviewer (different model) reviews.
- **Human decision required:** none — this phase *prepares* the decision.
- **Acceptance criteria:** ≤5 candidates, each traceable to Phase 1 findings; probes costed at days, not weeks; reviewer confirms no forbidden assumptions smuggled in.
- **SoT files updatable:** none.
- **Risks to avoid:** synthesis inventing mechanics not grounded in research; the synthesizer reviewing its own packet.

### Phase 3: Human Selection Gate
- **Purpose:** the human selects 1–3 candidates for focused work — the first substantive ratification since pipeline adoption.
- **Inputs:** synthesis packet + its review, assembled into `artifacts/dashboards/0002`.
- **Outputs:** annotated dashboard; `DECISION_LOG.md` entry naming selected candidates; optionally a ratified working pitch into `GAME_TRUTH.md` (not required).
- **Model roles:** Orchestrator assembles the dashboard; no model decides.
- **Human decision required:** **yes** — select, veto, resolve QUESTIONs.
- **Acceptance criteria:** decision entry with reasons; unselected candidates marked Deferred/Rejected, not deleted.
- **SoT files updatable after ratification:** `DECISION_LOG.md`; `GAME_TRUTH.md` only if direction text is ratified.
- **Risks to avoid:** treating a dashboard GREEN as auto-approval; selecting more than 3 candidates and diluting Phases 4–5.

### Phase 4: Focused Feasibility Research
- **Purpose:** stress selected candidates against reality — audience fit, production cost, depth plausibility, analogue failures.
- **Inputs:** ratified candidate list; Phase 1 analogue artifact.
- **Outputs:** one feasibility packet per candidate (DRAFT ONLY): closest analogues and why they succeeded/failed; degenerate-strategy hypotheses drawn from the `BALANCE_NOTES.md` failure list; probe cost; **one sharpened probe question** with pre-registered GREEN/RED criteria.
- **Model roles:** Focused Research / Feasibility Model.
- **Human decision required:** none; human may kill a candidate early if feasibility collapses.
- **Acceptance criteria:** claims have reasoning or evidence; each packet ends in exactly one probe question ("We believe X; GREEN if…; RED if…").
- **SoT files updatable:** none (early candidate deaths go through the human into `DECISION_LOG.md`).
- **Risks to avoid:** feasibility research turning into design; engaging specialist models before the probe brief is bounded.

### Phase 5: Micro-Probes and Paper Prototypes
- **Purpose:** cheaply test each surviving candidate's single riskiest assumption — usually "does the core loop generate interesting decisions?"
- **Inputs:** feasibility packets, `templates/probe-brief.md`.
- **Outputs:** per candidate: a probe brief in `artifacts/probes/` with hypothesis and success criteria filled **before** testing; a one-page ruleset/turn-sequence prototype in `prototypes/`; at least one simulated playtest transcript and (strongly recommended) one *human* paper playtest, recorded in `playtests/` with summaries proposed for `PLAYTEST_LOG.md`.
- **Model roles:** Prototype / Probe Model builds; Worker Model Pool runs bounded simulations (e.g., novice-heuristic playthrough, greedy/exploit playthrough).
- **Human decision required:** none to run; human playtest participation is highly valuable here.
- **Acceptance criteria:** one bounded question per probe; success criteria pre-registered; rules fit one page; both a beginner-heuristic and an exploit simulation attempted.
- **SoT files updatable:** `PLAYTEST_LOG.md` entries after review (it is SoT *for recorded results*; recommendations remain advisory).
- **Risks to avoid:** probes scoping up into full games; declaring a loop "fun" from one simulated transcript; the probe author grading its own success criteria.

### Phase 6: Independent Review
- **Purpose:** adversarial evaluation of each probe against all five design gates by a model that produced none of it.
- **Inputs:** probe briefs, prototypes, playtest records, `templates/independent-review.md`, `docs/design-gates.md`.
- **Outputs:** one review per probe in `artifacts/reviews/`: five gates scored, degenerate-strategy check, SoT-conflict check, required fixes.
- **Model roles:** Independent Reviewer (different model/instance from the probe's creator); optionally a Fable-style specialist critique for the leading candidate.
- **Human decision required:** none.
- **Acceptance criteria:** review is a separate artifact; every RED/VETO has a concrete failure scenario; at least one review actively tries to break the game.
- **SoT files updatable:** none.
- **Risks to avoid:** reviewer-as-cheerleader; treating a GREEN review as ratification.

### Phase 7: Decision Dashboard and Ratification
- **Purpose:** convert probe + review evidence into the project's first *design* truth: a ratified core loop and direction.
- **Inputs:** all Phase 5–6 artifacts.
- **Outputs:** `artifacts/dashboards/0003` with explicit Proposed Source-of-Truth Updates (exact files, exact text); human ratification; on approval, `GAME_TRUTH.md` gains pitch, core loop, player fantasy, win/loss direction; `MECHANICS.md` gains first ratified mechanics; `BALANCE_NOTES.md` watchlist seeded from review findings; matching `DECISION_LOG.md` entry.
- **Model roles:** Orchestrator assembles; Source-of-Truth Maintainer applies ratified text only.
- **Human decision required:** **yes — the central gate of the roadmap.** Accept / modify / defer / veto each proposed update.
- **Acceptance criteria:** `CONTRIBUTING.md` checklist fully satisfied; every SoT change has a matching decision entry; no speculative material enters SoT text.
- **SoT files updatable after ratification:** `GAME_TRUTH.md`, `MECHANICS.md`, `DECISION_LOG.md`, `BALANCE_NOTES.md`, `PLAYTEST_LOG.md`.
- **Risks to avoid:** ratifying more than the probes proved (ratify the loop, not the imagined full game); vague SoT text open to later reinterpretation.

### Phase 8: Minimum Playable Prototype
- **Purpose:** build the smallest complete, teachable, start-to-finish playable version of the ratified loop.
- **Inputs:** ratified `GAME_TRUTH.md` + `MECHANICS.md`.
- **Outputs:** complete rules draft in `rules/` (RATIFIED RULES DRAFT only if generated purely from ratified mechanics); a playable kit (print-and-play, script, or minimal digital sim in `src/`, per ratified direction); a beginner onboarding artifact (2-minute teach script); bounded worker-task briefs for each build piece; independent review of the assembled prototype.
- **Model roles:** Fable-style specialist for design synthesis (the brief is now bounded — its intended entry point per `MODEL_WORKFLOW.md`); Worker Model Pool for execution; Independent Reviewer at the end.
- **Human decision required:** approve MPP scope before build; ratify any new mechanics the build reveals as necessary.
- **Acceptance criteria:** a stranger can be taught and finish a game using only the kit; no mechanic lacks a ratified or explicitly-flagged-provisional source; every build task listed allowed/forbidden files.
- **SoT files updatable after ratification:** `MECHANICS.md`, `DECISION_LOG.md`.
- **Risks to avoid:** scope creep; digital polish before rules stability; workers inventing mechanics to fill gaps instead of raising QUESTIONs.

### Phase 9: Playtesting and Balance Iteration
- **Purpose:** validate the accessibility/depth promise with real repeated play and hunt degenerate strategies.
- **Inputs:** MPP, `PLAYTEST_LOG.md` template, `BALANCE_NOTES.md` failure-mode list.
- **Outputs:** a structured campaign — first-time-player sessions (Simplicity evidence), repeat-player sessions (Mastery/Replayability evidence), adversarial "break it" sessions (human and model); balance-notes entries; per-iteration change proposals ratified through mini dashboard cycles.
- **Model roles:** Worker Pool for simulated exploits and variant generation; Independent Reviewer for each proposed change; humans as primary playtesters.
- **Human decision required:** ratify each rules change; decide when the loop is proven.
- **Acceptance criteria:** ≥3 distinct viable strategies observed; new players finish a game and want another; no unanswered dominant strategy; teach time within target; changes logged before applied.
- **SoT files updatable after ratification:** `MECHANICS.md`, `BALANCE_NOTES.md`, `PLAYTEST_LOG.md`, `DECISION_LOG.md`, `GAME_TRUTH.md` (if identity sharpens).
- **Risks to avoid:** patching symptoms with added rules ("no complexity without payoff"); balancing for experts until beginners drown; untracked rules drift between sessions.

### Phase 10: Production Direction
- **Purpose:** decide what the proven game becomes — tabletop, digital, hybrid — and set the production roadmap.
- **Inputs:** proven loop, playtest evidence, production-path feasibility data.
- **Outputs:** production-options research artifact; production decision dashboard; ratified production direction in `GAME_TRUTH.md`; theme/name ratification (resolving whether "Big Game Hunting" is the game or the codename); a successor roadmap for buildout.
- **Model roles:** Focused Research for market/production analogues; Synthesis for the options packet; Fable-style specialist for the production design brief.
- **Human decision required:** **yes** — platform, theme, audience, investment level.
- **Acceptance criteria:** production direction traceable to playtest evidence; forbidden assumptions formally retired via decision entries, never silently violated.
- **SoT files updatable after ratification:** all, via `DECISION_LOG.md`.
- **Risks to avoid:** production ambition redefining the game; committing to a platform the loop wasn't tested on.

## 4. First 10 Concrete Tasks

**Task 1**
- **Task name:** Ratify roadmap and initialize version control
- **Purpose:** make governance enforceable (commits) and give the project an approved plan.
- **Assigned role:** Human Decision Authority + Source-of-Truth Maintainer (execution only).
- **Allowed files:** `DECISION_LOG.md` (post-ratification); git initialization; `workflows/big-game-hunting-roadmap.md` (if ratified).
- **Forbidden files:** `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`.
- **Expected artifact:** decision log entry + baseline commit.
- **Authority level:** RATIFIED (human); bounded execution (model).
- **Acceptance checks:** decision entry exists; `git log` shows baseline; roadmap file matches ratified text exactly.
- **Human decision needed:** Yes — this *is* the decision.

**Task 2**
- **Task name:** Broad game-shape research pass A
- **Purpose:** execute research brief 0001 with real content.
- **Assigned role:** Broad Research / Ideation Model.
- **Allowed files:** new file `artifacts/research/0002-game-shapes-pass-a.md`.
- **Forbidden files:** all SoT files, `templates/`, other artifacts.
- **Expected artifact:** research artifact per template; the 8 listed shapes plus ≥2 novel shapes, all seven criteria each.
- **Authority level:** DRAFT ONLY.
- **Acceptance checks:** template complete; failure modes specific; no theme lock-in; no SoT edits.
- **Human decision needed:** No.

**Task 3**
- **Task name:** Broad game-shape research pass B (independent)
- **Purpose:** an uncorrelated second ideation pass from a different model, without sight of pass A.
- **Assigned role:** Broad Research / Ideation Model (different model/instance).
- **Allowed files:** new file `artifacts/research/0003-game-shapes-pass-b.md`.
- **Forbidden files:** SoT files, `artifacts/research/0002-*` (must not read or reference), templates.
- **Expected artifact:** as Task 2.
- **Authority level:** DRAFT ONLY.
- **Acceptance checks:** as Task 2, plus no reference to pass A.
- **Human decision needed:** No.

**Task 4**
- **Task name:** Accessibility/depth analogue research
- **Purpose:** map existing games that achieve easy-entry/hard-mastery and extract transferable principles and known failures.
- **Assigned role:** Focused Research / Feasibility Model.
- **Allowed files:** new file `artifacts/research/0004-analogue-map.md`.
- **Forbidden files:** SoT files, templates.
- **Expected artifact:** ≥10 games/genres, each with entry mechanism, mastery source, replayability driver, and known degenerate failure.
- **Authority level:** DRAFT ONLY.
- **Acceptance checks:** every analogue yields a transferable principle, not just a description; failures cross-referenced to the `BALANCE_NOTES.md` checklist.
- **Human decision needed:** No.

**Task 5**
- **Task name:** Synthesis packet: candidate directions
- **Purpose:** compress Tasks 2–4 into 3–5 decision-ready candidates.
- **Assigned role:** Synthesis / Architecture Model.
- **Allowed files:** new file `artifacts/synthesis/0001-candidate-directions.md`.
- **Forbidden files:** SoT files; research artifacts read-only; templates.
- **Expected artifact:** synthesis packet per template; comparison table complete; one smallest-useful-probe per candidate.
- **Authority level:** DRAFT ONLY.
- **Acceptance checks:** ≤5 candidates, each traceable to research findings; probes days-scale; recommendation framed as GREEN/YELLOW/QUESTION, not a decision.
- **Human decision needed:** No (prepares Task 7's decision).

**Task 6**
- **Task name:** Independent review of synthesis packet
- **Purpose:** catch smuggled assumptions, hidden complexity, and SoT conflicts before the human gate.
- **Assigned role:** Independent Reviewer (model that produced none of Tasks 2–5).
- **Allowed files:** new file `artifacts/reviews/0001-synthesis-review.md`.
- **Forbidden files:** SoT files; the synthesis packet and research artifacts read-only.
- **Expected artifact:** independent review per template; all five gates provisionally scored per candidate.
- **Authority level:** REVIEW ONLY.
- **Acceptance checks:** separate artifact; every YELLOW/RED has a concrete reason; forbidden-assumption check explicitly performed.
- **Human decision needed:** No.

**Task 7**
- **Task name:** Candidate selection dashboard
- **Purpose:** assemble the human's decision packet for the Phase 3 gate.
- **Assigned role:** Orchestrator / Synthesis Model (assembly only).
- **Allowed files:** new file `artifacts/dashboards/0002-candidate-selection.md`.
- **Forbidden files:** all SoT files; all prior artifacts read-only.
- **Expected artifact:** decision dashboard per template, with **no** pre-filled ratification section.
- **Authority level:** DECISION SUPPORT.
- **Acceptance checks:** faithfully represents both the synthesis packet and the review's dissent; QUESTIONs framed with options and stakes.
- **Human decision needed:** **Yes** — select 1–3 candidates; the Source-of-Truth Maintainer then records the result in `DECISION_LOG.md`.

**Task 8**
- **Task name:** Feasibility packet for selected candidate #1
- **Purpose:** deep-dive the first human-selected candidate.
- **Assigned role:** Focused Research / Feasibility Model.
- **Allowed files:** new file `artifacts/research/0005-feasibility-<candidate>.md`.
- **Forbidden files:** SoT files, templates.
- **Expected artifact:** feasibility packet: analogues, audience fit, degenerate-strategy hypotheses, probe cost, one sharpened probe question with pre-registered GREEN/RED criteria.
- **Authority level:** DRAFT ONLY.
- **Acceptance checks:** exactly one probe question; degenerate hypotheses map to the balance failure list; no new mechanics invented.
- **Human decision needed:** No (repeat as 8b/8c for other selected candidates).

**Task 9**
- **Task name:** Probe brief and paper prototype for candidate #1
- **Purpose:** build the smallest testable version of the candidate's core loop.
- **Assigned role:** Prototype / Probe Model.
- **Allowed files:** new files `artifacts/probes/0001-<candidate>-loop-probe.md` and `prototypes/<candidate>-v0/` (one-page rules + components list).
- **Forbidden files:** all SoT files; `rules/` (reserved for post-ratification drafts); `src/`.
- **Expected artifact:** probe brief per template with hypothesis and success criteria completed *before* test content; one-page ruleset; a worked 3-turn example.
- **Authority level:** PROBE.
- **Acceptance checks:** rules fit one page; tests exactly the Task 8 probe question; success criteria pre-registered; PROBE label present.
- **Human decision needed:** No.

**Task 10**
- **Task name:** Simulated playtests + independent probe review
- **Purpose:** exercise the probe (novice-heuristic run and greedy/exploit run) and review it against all five gates.
- **Assigned role:** Worker Model Pool (two separate bounded simulation tasks) + Independent Reviewer (distinct model from Task 9's author).
- **Allowed files:** new files `playtests/0001-<candidate>-sim-*.md` and `artifacts/reviews/0002-<candidate>-probe-review.md`.
- **Forbidden files:** all SoT files including `PLAYTEST_LOG.md` (summaries enter it only after review acceptance, via the maintainer); the probe artifact read-only.
- **Expected artifact:** ≥2 full simulated game transcripts with decision commentary; independent review scoring all five gates with degenerate-strategy check.
- **Authority level:** PROBE (sims) / REVIEW ONLY (review).
- **Acceptance checks:** sims play by written rules only — rule gaps logged as QUESTIONs, never house-ruled; the exploit sim genuinely tries to break the game; review by a non-author model.
- **Human decision needed:** Yes at the end — these outputs feed the Phase 7 dashboard and ratification.

## 5. Artifact Plan

In priority order, with review requirements:

1. **Game shape artifact** (first — Tasks 2–3). Defines the possibility space everything downstream inherits. Review: diversity check (are shapes genuinely distinct?), forbidden-assumption check, completeness of the seven criteria. Two independent passes protect against single-model imagination limits.
2. **Analogue research artifact** (parallel — Task 4). The cheapest evidence available: decades of real games encode what survives contact with players. Review: verify claims about cited games are accurate and each analogue yields a transferable principle.
3. **Core loop artifact** (per selected candidate). The loop is the product, and `GAME_TRUTH.md` lists it as the central TBD. Must state the repeated action cycle, the decision inside each cycle, and why cycle N+1 differs from cycle N. Review: Simplicity + Replayability gates; can a reviewer simulate a turn from the text alone?
4. **Mastery ceiling artifact** (per selected candidate). Names concretely what experts get better at — reads, timing, valuation, counters — and what *visible* skill expression looks like. Review: Mastery Gate; reject ceilings that are just memorization or content volume.
5. **Beginner onboarding artifact** (with the probe). A 2-minute teach script; if it can't be written, the Simplicity Gate is already failing — cheaper to learn before prototyping. Review: read it cold to someone unfamiliar; log every stumble.
6. **Degenerate strategy review** (against every probe). The failure modes in `BALANCE_NOTES.md` kill exactly this genre of design. Review note: this is itself a review artifact — it must be adversarial, and a finding-free report is a red flag about the reviewer, not evidence of balance.
7. **Micro-probe** (Task 9 pattern). Converts argument into evidence at days-scale cost — the pipeline's whole premise. Review: pre-registered success criteria honored; scope stayed bounded; independent gate review before any dashboard.
8. **Playtest scenario** (feeding `PLAYTEST_LOG.md`). Standardized scenarios (first-timer, repeat pair, adversarial) make results comparable across iterations. Review: confirm the scenario tests a stated question and the transcript followed written rules only.
9. **Decision dashboard** (before every human gate). The interface between model output and human authority. Review: fidelity check by a non-author model — does the dashboard represent dissent and uncertainty honestly, with no pre-filled ratification?

## 6. Model Routing Plan

Roles first; vendor names below are illustrative only, consistent with `MODEL_WORKFLOW.md`.

- **Broad Research / Ideation role** (e.g., Gemini-style): wide possibility generation, analogue gathering. Phases 1 and 4. Run **at least two uncorrelated instances** for ideation. Authority: DRAFT ONLY.
- **Synthesis / Architecture role** (e.g., Opus-style): converts breadth into decision packets, probe designs, dashboards. Phases 2, 5, 7. Authority: DRAFT ONLY / DECISION SUPPORT. Never reviews its own packets.
- **Focused Research / Feasibility role** (e.g., Gemini-style): evidence-oriented deep dives. Phases 4 and 10. Authority: DRAFT ONLY.
- **Prototype / Probe role** (e.g., Opus-style): rules-as-systems construction. Phases 5 and 8. Authority: PROBE.
- **Independent Reviewer role** (e.g., GLM/Sonnet-style): must be a *different model family* from whatever produced the artifact under review. Cheaper models are fine and even preferable — the role needs skepticism and consistency-checking, not creativity. Authority: REVIEW ONLY.
- **Worker Model Pool** (e.g., Sonnet/Haiku-style): bounded tasks — simulations, exploit hunting, variant generation, teach-script drafting. Never asked to decide anything. Authority: BOUNDED EXECUTION.
- **Fable-style Specialist role:** held back until briefs are bounded (post-Phase 3 at the earliest; primary entry at Phase 8), matching dashboard 0001's YELLOW flag. Late-stage design synthesis and final critique. Authority: DRAFT ONLY / REVIEW ONLY.

**Hard routing rules:** (1) creator ≠ reviewer for the same artifact, enforced per-artifact, not per-phase; (2) only the human ratifies; (3) only the Source-of-Truth Maintainer touches SoT files, and only with a ratified decision entry in hand; (4) if only one model is available in practice, separate sessions with disjoint context is the minimum substitute for separate models — flag this weakened independence on the review itself.

## 7. Decision Gates

The first five map to `docs/design-gates.md`; the sixth is ratification itself. No candidate reaches Phase 8 without GREEN (or human-accepted YELLOW) on all five, and nothing enters SoT files without the sixth.

- **Simplicity Gate.** *Pass:* objective explainable in ≤2 minutes; a first-time player chooses a sensible first action unaided; early mistakes are recoverable; rules fit one page at probe stage. *Fail:* teaching requires a rules-dependency chain; the first turn requires strategy knowledge to be non-miserable; beginners report confusion about the goal itself.
- **Mastery Gate.** *Pass:* a named, concrete list of things experts do better; an observed skill gap in playtests (the experienced player reliably wins while both enjoy it); best move depends on game state, not a memorized script. *Fail:* a solved or near-solved line emerges; skill expression is invisible to observers; depth comes only from memorization or content volume.
- **Replayability Gate.** *Pass:* ≥3 strategies remain viable after repeated play; consecutive games produce distinguishable stories; players voluntarily ask for another game. *Fail:* games converge on one opening or route; outcomes feel predetermined early; repeat players report sameness.
- **Social Appeal Gate.** *Pass:* players spontaneously narrate moments afterward; a spectator can tell what's at stake; a player who just learned it successfully teaches it to someone else. *Fail:* post-game silence; downtime dominated by others' bookkeeping; nobody can explain why they won or lost.
- **Production Feasibility Gate.** *Pass:* the next test is buildable in days with cheap materials; complexity fits the current build stage; the core promise is testable without the full product. *Fail:* the smallest meaningful test requires software, art, or content volume; the candidate only works "once everything is in."
- **Human Ratification Gate.** *Pass:* the human decision authority explicitly accepted or modified the proposal; a `DECISION_LOG.md` entry exists; the `CONTRIBUTING.md` checklist is satisfied; the SoT text contains no speculative material. *Automatic fail:* any SoT change without a decision entry; a GREEN review or dashboard treated as approval; ratification inferred from silence.

## 8. Risks and Anti-Patterns

Ranked by expected damage to this project specifically:

1. **Model output becomes truth by repetition.** The eight game shapes in research brief 0001 are the likeliest vector — they are a placeholder suggestion list that will feel canonical by Phase 2. Mitigation: Tasks 2–3 require shapes beyond the list; reviewers check for citation-laundering of unratified ideas.
2. **Building before the core loop is proven.** `src/`, `rules/`, and `prototypes/` are sitting there inviting it. Mitigation: those directories are off-limits before Phase 7 except the bounded probe prototype; the MPP is gated behind ratification.
3. **Same model generating and reviewing high-stakes work.** Mitigation: hard routing rules in Section 6; every review artifact records which model produced the work under review (auditable via the proposed backlog log).
4. **Too much complexity too early.** Synthesis and probe models naturally design full games. Mitigation: one-page rules cap at probe stage; "no complexity without payoff" as a named veto reason on every review.
5. **Overfitting to expert depth and losing beginner appeal — and its mirror, over-simplifying and losing mastery.** Mitigation: every playtest campaign includes both first-timer and repeat-player scenarios; a change that improves one gate must be re-tested against the other; the two gates may never be traded off silently.
6. **Broad ideation jumping directly to implementation.** Mitigation: the Phase 3 human gate is mandatory; no feasibility or probe work on unselected candidates.
7. **Specialist models used before the brief is bounded.** Already flagged YELLOW in dashboard 0001. Mitigation: the specialist role is locked out until post-Phase 3, primary entry at Phase 8.
8. **Governance theater** (the opposite failure: process so heavy no game gets designed). Mitigation: only two human gates before the first probe exists; probe cost capped at days; if a full Phase 1→7 cycle exceeds a few calendar weeks, the process itself gets a review artifact.
9. **Simulated playtests mistaken for real ones.** Model self-play underestimates confusion and overestimates fun. Mitigation: the mandatory `Type:` field in `PLAYTEST_LOG.md`; no candidate passes Phase 7 on simulated evidence alone — at least one human paper playtest required.
10. **Theme lock-in via the project name.** Mitigation: treat "Big Game Hunting" as codename (per forbidden assumptions) until Phase 10 ratifies theme and name.

## 9. Proposed Repository Improvements

**Recommendations only — no changes made; each requires authorization at Phase 0 / Task 1.**

1. **`git init` + baseline commit.** Highest priority. "One artifact, one commit" and reviewable diffs are unenforceable without version control; `.gitignore`/`.gitattributes` already anticipate it.
2. **`workflows/big-game-hunting-roadmap.md`.** Houses the ratified version of this roadmap so phases and gates are citable by task briefs instead of living in a chat transcript.
3. **`docs/artifact-conventions.md`.** Codifies the ID scheme already in use (`NNNN-slug.md`, per-directory sequences), required metadata headers, and authority-label placement, so worker models produce consistent artifacts without re-deriving conventions.
4. **`templates/feasibility-packet.md`.** Phase 4 currently borrows the research template; feasibility has distinct required fields (analogue failures, probe cost, pre-registered probe question) worth enforcing.
5. **`templates/core-loop-artifact.md` and `templates/mastery-ceiling-artifact.md`.** These target the two central TBDs in `GAME_TRUTH.md`; templated structure makes candidate loops directly comparable at the Phase 3 and 7 gates. A separate `game-shape-artifact.md` is *not* needed — `research-artifact.md` plus brief 0001's criteria already cover it; avoid template sprawl.
6. **`templates/playtest-scenario.md`.** Standardizes first-timer / repeat / adversarial scenarios so Phase 9 results are comparable across iterations.
7. **`artifacts/BACKLOG.md` (orchestrator log).** A lightweight queue recording issued briefs, status, producing model, and reviewing model — this is where creator≠reviewer becomes auditable. Explicitly *not* source of truth.
8. **`artifacts/ideation/` — recommend against.** Broad ideation fits `artifacts/research/` with DRAFT ONLY labels; a new directory adds a classification decision to every artifact without adding governance. Decide and record either way so the question stops recurring.
9. **Minor README fix.** Sync the structure diagram with reality (`docs/first-run.md` is missing from it) in the Phase 0 commit.

## 10. Executive Summary

**GREEN:**
The governance layer is genuinely ready. Source-of-truth files, authority levels, gates, templates, role routing, and the contribution checklist are complete, mutually consistent, and sufficient to start Phase 1 ideation immediately. Nothing beyond Task 1 needs to block content generation.

**YELLOW:**
(1) The repository is not under version control, which quietly disables the "one artifact, one commit" rule — fix before the first real artifact lands. (2) The eight suggested game shapes in research brief 0001 risk hardening into canon by familiarity; ideation tasks must be required to go beyond them. (3) Feasibility, core-loop, mastery-ceiling, and playtest-scenario templates are missing and cheap to add. (4) The real number of independent model families available will determine whether creator≠reviewer is enforced across models or only across sessions.

**RED:**
Nothing blocks the project. However: do **not** start anything in `src/`, `rules/`, or full-game design before Phase 7 ratifies a core loop — the repo's own non-goals forbid it, and it is the most tempting failure mode from here.

**QUESTIONS:**
1. Do you ratify this roadmap (as-is or modified) and authorize `git init` plus the Section 9 additions?
2. How many independent model families/instances are actually available for routing? (Determines the strength of the creator≠reviewer guarantee.)
3. Will you personally participate in paper playtests at Phase 5, or should external testers be recruited earlier?
4. Should "Big Game Hunting" be formally logged as a codename, deferring theme, to neutralize theme lock-in now?

**PROPOSED NEXT ACTION:**
Execute Task 1: ratify this roadmap with any modifications, record the decision in `DECISION_LOG.md`, initialize git with a baseline commit — then immediately issue Tasks 2 and 3 (two independent broad game-shape research passes) so the pipeline starts producing real design evidence this week.

---

One-line summary: the repository is a well-built engine with no fuel in it yet — this roadmap feeds it artifacts quickly while keeping exactly two early human gates (candidate selection at Phase 3, core-loop ratification at Phase 7) as the only points where anything becomes true.