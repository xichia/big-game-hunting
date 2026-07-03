# Bulk Raw Ideation Synthesis

ARTIFACT TYPE: Synthesis Packet
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft (not ratified)
CREATED BY: Synthesis / Architecture role (Claude, synthesis assistant)
REVIEWED BY: (not yet reviewed — requires an independent, non-author reviewer)
DATE: 2026-07-04
RELATED TASK: Synthesize `artifacts/research/*bulk-raw-ideation*` into one decision-support artifact
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth)

---

## Scope and method

This synthesizes the bulk raw ideation corpus in `artifacts/research/` (files `0002`–`0055`, plus `INDEX.md`). It reads that corpus against the north star (`GAME_TRUTH.md`), `DESIGN_PRINCIPLES.md`, the five design gates (`docs/design-gates.md`), the authority rules (`docs/artifact-authority.md`, `docs/artifact-conventions.md`), and the roadmap (`workflows/big-game-hunting-roadmap.md`).

Coverage: all 54 artifacts scanned; ~18 read in full across the full batch range (batches 1, 2, 3, 7, 11, 15, 20, 25, 33, 40, 45, 50, plus the four early standalone runs). Reading was sampled rather than exhaustive because the corpus is highly self-similar (see §3); additional full reads did not change the cluster structure.

**Corpus size:** ~250 concept instances in the main run (50 batches × 5) plus ~45 in four earlier standalone runs = **roughly 250–300 concept instances**, but the number of *distinct mechanics* is far smaller — an estimated **30–50** once near-duplicates are collapsed.

**Provenance caveat (important):** every artifact was produced by a single model (`deepseek-v4-flash`) via one runner. This is **not** the uncorrelated multi-model ideation the roadmap's Phase 1 calls for (roadmap §3 Phase 1; Task 3 "independent second pass from a different model"). The corpus is one model's imagination, sampled 250+ times — treat its blind spots as systematic, not random.

---

## 1. Executive summary

The corpus is broad in surface variety but **narrow in underlying structure**. Nearly every concept is a materially-light, hidden-information social game for 2–4 players, testable on paper in under 30 minutes — which fits the project's "simple entry / low material / cheap probe" constraints well. That is the good news, and it is real.

The bad news: the corpus is **heavily duplicated, self-similar, and systematically weak on exactly the dimension the north star cares most about — a legible, *learnable* mastery ceiling**. The single most common concept name, "Echo Chamber," recurs in a large fraction of batches attached to at least three unrelated games. A recurring self-diagnosis appears verbatim across dozens of concepts: *"becomes purely random if players have no meaningful agency,"* *"analysis paralysis,"* *"rewards verbal fluency over strategy,"* *"dominant/most-creative player takes over." * These are the model telling us where its own ideas break — and they cluster on mastery and fairness, not on entry or cost.

The "forbidden assumptions avoided" footer on every concept is **boilerplate and unreliable**: it is near-identical across all ~300 concepts and frequently self-contradictory (declares "no cards" while dealing cards; "no economy" while running token auctions). Reviewers should ignore it and re-check forbidden assumptions independently.

Net recommendation: **do not treat volume as signal.** A handful of clean, mechanically-elegant candidates are worth probing; the bulk should be deduplicated and set aside. Priority next step is a small number of pre-registered micro-probes on the cleanest mechanics, plus a genuine second-model ideation pass to correct single-model bias.

---

## 2. Major concept families / clusters

The corpus collapses into ~10 recurring families. (Representative concept names in parentheses; most appear multiple times under different names.)

1. **Telephone / message-mutation / rumor** — pass a phrase, distort it, score on survival or reconstruction. (Echo Chamber [many], The Echo, The Rumor Chain, The Public Record.) *By far the most overrepresented.*
2. **Rhythm / tempo / shared-pulse / music** — tap, hum, or clap a shared beat and subtly disrupt it. (The Pulse, Living Lullaby, Beat the Boot, Word Clock, The Unfinished Symphony, The Pattern Breaker.)
3. **Hidden-goal shared-structure building / token placement with cascades** — add/remove tokens on a grid/stack/line; scoring cascades or "bursts." (Crowd Sourcing, Containment, The Scaffold, Tilt, Pyramid Scheme, Ripple, Magnetic Drift, Weather Vane, The Sundial, Stained Glass, Echo grid variants.)
4. **Collaborative storytelling with a secret agenda** — build a shared story/sentence/melody; each player secretly steers toward a hidden genre/emotion/meaning. (Thread the Needle, The Frame, Last Conversation, The Thread of Fate, The Weight of a Word, The Last Day of Summer, The Last Museum.)
5. **Social deduction / hidden role / silent signaling / positioning** — read who is doing what without open information. (The Signal and the Noise, The Turing Test, The Witness, Affect/Receiver, The Great Silence, The Opposite Game.)
6. **Negotiation / promises / auction / bidding / voting** — allocate a scarce right through offers or sealed bids. (Negotiator, Silent Auction, The Presentation, The Slow Auction, The Turnstile, The Auction of Consequences, Tipping Point, The Patron's Purse.)
7. **Prediction / calibration / "guess the average" / confidence betting.** (The Balancing Act, The Slow Count, Verdict, The Price of Certainty, The Inheritor's Dilemma, The Long Game, Word Weight.)
8. **Spatial deduction / hidden-position inference.** (Hollow Pawn, The Longest Shadow, The Folding Map, Liar's Dice Without Dice.)
9. **Emergent rule-making** — players invent the rules as they go under a constraint. (The Anchoring Rule, Architect of Fate, The Unraveling, The Scaffold.)
10. **Constrained / non-verbal communication** — convey a concept under a restriction (taboo words, reversed speech, sound-only, gestures). (The Weight of Silence/taboo, Echo Arena, Shadow Puppet, Catch & Release, Tag Team.)

Cross-cutting traits present in ~90% of concepts: 2–4 players; a **secret objective/goal card**; a **simultaneous-reveal or "aha reveal at the end"** beat; explicit "paper-and-pennies" probe; heavy reliance on *social reading* as the claimed mastery source.

---

## 3. Repeated patterns and overused ideas

- **"Echo Chamber" name collision.** Recurs in a large share of batches, attached to at least three mechanically distinct games (telephone-mutation; grid sound-interference; memory-phrase recall). Strong evidence of mode collapse in the generator, not convergent design insight.
- **The "secret goal card + steer the shared thing + reveal at the end" template.** This single skeleton underlies families 3, 4, 5, and 7. Most "different" concepts are re-skins of it (steer a story / a melody / a sentence / a token / a wind direction / a history).
- **"Reading the room / reading opponents" as the universal mastery source.** Cited as the depth engine in the overwhelming majority of concepts. It is asserted, almost never *mechanically grounded* — i.e., the concepts rarely specify what concrete, improvable skill produces the read.
- **Boilerplate "forbidden assumptions avoided" footer.** Near-identical text on every concept; frequently wrong (claims to avoid cards/economy while using them). Checkbox theater — **do not rely on it.**
- **Self-flagged failure modes repeat verbatim:** "purely random without agency," "analysis paralysis," "rewards verbal fluency," "dominant/creative player dominates," "awkwardness with silence/physical proximity," "physics calibration too fiddly." These recur so consistently they should be read as **structural risks of whole families**, not one-off caveats.
- **Simultaneous "guess the average / hit the median" mechanic** appears many times (Balancing Act, Silent Auction median, Word Weight). Known to be shallow and quick to solve as a standalone.

---

## 4. Surprisingly promising outliers

Concepts that rise above the re-skin template with a genuinely distinctive, low-cost, plausibly-deep mechanic:

- **The Turnstile** (batch 25) — bid to advance on a track, but the winner *pays in position* (discards tokens equal to the gap to the second-highest bid). A clean, near-novel auction: winning too hard is self-harming. One page, 2 players, 10 tokens + a paper track, deep bluff/timing layer. The strongest single mechanic in the corpus.
- **Magnetic Drift** (batch 1/0004) — secretly place one "attract" + one "repel" on a number line; simultaneous reveal; a shared token moves by net force; score by hidden zones. Clean vector tug-of-war with hidden information; fully testable on paper.
- **The Price of Certainty** (batch 40) — declare a confidence level, then *spend* confidence to act; being sure but wrong costs everything. Calibration-as-skill is a rare, genuinely *legible and improvable* mastery axis — most of the corpus lacks one.
- **The Opposite Game** (batch 40) — secretly try to *lose* while appearing to try to win. Interesting because it is a **parasitic modifier** that can bolt onto any trivially simple surface game to manufacture a hidden-read layer cheaply. Worth testing as a technique, not just a game.
- **The Last Key** (batch 45) — silent, no-communication coordination on the *order* to act, with permanent loss for acting wrong. Tense and cheap; distinct from the deduction pack.
- **Containment** (batch 1/0005) — place tokens on a node web; a cluster that exceeds a threshold "bursts" and resets. Burst-timing gives a concrete, teachable expert skill (bait overcommitment, burst to deny points).

---

## 5. Concepts that best match the north star

North star = simple entry + wide appeal + **hard, learnable mastery** + replayability + low friction + low material. Weighting the scarce dimension (learnable mastery from interaction, not content or talent) and cheap testability:

| Rank | Concept | Why it fits | Main risk |
|------|---------|-------------|-----------|
| 1 | **The Turnstile** | 1-sentence rule; obvious first move (bid low); depth from positional bluffing; ~zero material | Could solve to a narrow bid range |
| 2 | **Magnetic Drift** | Instant physical intuition (push/pull); simultaneous reads; hidden zones drive replay | Symmetric play may collapse to the middle |
| 3 | **The Price of Certainty** | Rare *legible* mastery (calibration); trivially cheap dice probe | Everyone hedges to 50% |
| 4 | **Containment** | Simple placement; burst-timing is a real, watchable expert skill | Late-game opacity / analysis paralysis |
| 5 | **Chain of Custody** | Smallest possible meaningful unit (±1/0 with hidden targets) | May be too shallow / solvable |

These share the corpus's genuine strength — cheap, teachable, materially light — while having the least-hand-wavy mastery claims.

---

## 6. Concepts with high beginner appeal but weak mastery

These onboard instantly and are fun for one session, but the claimed depth is talent-based, random, or shallow — they mostly fail the Mastery and Replayability gates:

- **Telephone / Echo Chamber family.** Universally understood; but the model itself repeatedly admits the failure mode is *"purely random if players have no meaningful agency."* "Strategic corruption of a whisper" is not a demonstrated, improvable skill, and it excludes players with hearing/speech differences.
- **Rhythm / hum / clap family** (The Pulse, Living Lullaby, Beat the Boot, Pattern Breaker). Primal appeal and real watchability, but mastery is largely *innate rhythm*, not a skill you build through repeated play; plus a social-awkwardness onboarding tax.
- **Guess-the-majority / guess-the-average party games** (Word Weight, The Balancing Act). Fun reveal, but shallow and quickly solved as standalones.
- **Shadow Puppet, Echo Arena (reverse-speech), The Last Object.** Good party laughs; thin and subjective skill ceiling.

---

## 7. Concepts with strong mastery but likely onboarding problems

Real depth potential, but they fail the Simplicity/Social gates on teachability, adjudication, or first-game misery:

- **Negotiator** (promises as the only currency). Elegant and deep, but enforcing *written binding promises* and the "must trade to act" rule is a heavy teach; first game can be miserable and cynical-locked.
- **The Thread** (build a shared logic proof-tree). High ceiling; but requires logic literacy and invites analysis paralysis — the model flags exactly this.
- **The Turing Test / glitch-signaling** and **Verdict / The Last Argument.** Rich social layers, but depend on a shared *standard of evidence* / adjudication the group must negotiate, and reward verbal fluency over learnable skill (self-flagged).
- **Emergent rule-making** (Anchoring Rule, Architect of Fate, The Unraveling). Deep in principle, but unbounded scope, hard to adjudicate, and prone to collapsing into arguments — poor teachability, violates "no complexity without payoff."
- **Cascade-placement games** (Ripple, Echo grids, Pyramid Scheme). Genuine forward-planning depth, but late-game state opacity and analysis paralysis are repeatedly self-flagged.

---

## 8. Concepts that are probably traps / not worth pursuing

Skeptical view — these look appealing but carry structural problems that the design gates would likely fail, and that are expensive to fix:

- **Physical real-time balance games** (Tilt, The Weight of Silence balance-scale). The model itself flags *"physics calibration too fiddly / too much randomness from imperfect hardware."* The interesting version is a discrete-zone abstraction — a different game — so the physical framing is a trap.
- **The telephone/whisper family as a "hard-mastery" game.** Ubiquity here is generator bias, not merit. Repeated self-diagnosis of randomness + accessibility exclusion = high trap risk. Fine as a party game; wrong for this north star.
- **Freeform rule-invention games.** Content/adjudication burden, unbounded scope, degeneration into rules-lawyering. Violates teachability and "no complexity without payoff."
- **Emotional-vulnerability storytelling** (The Last Museum, The Last Day of Summer). Obscure appeal; depends on players enjoying emotional exposure; not objectively testable — penalized by the brief's "obscure appeal" filter.
- **Content-hungry narrative/genre/scenario games.** Any concept whose replayability depends on a large deck of prompts/scenarios/patrons (The Frame, Verdict, The Patron's Purse, The Archive) leans on **content production**, which the project's non-goals explicitly forbid as a substitute for loop quality.
- **Pure "guess the average/median"** as a standalone — solved fast.

---

## 9. Top 10 candidates for further investigation

Ordered by (learnable-mastery plausibility × cheap-testability), penalizing content dependence, adjudication burden, and talent-based skill:

1. **The Turnstile** — positional-cost bidding race.
2. **Magnetic Drift** — hidden attract/repel vector tug-of-war.
3. **The Price of Certainty** — confidence-calibration betting.
4. **Containment** — cluster-burst placement.
5. **Chain of Custody** — ±1 token with secret targets (minimal-unit test).
6. **The Opposite Game** — hidden-failure-condition overlay (test as a *modifier*).
7. **The Long Game** — hidden-objective commitment (needs a concrete substrate before it means anything).
8. **The Last Key** — silent coordinated ordering with permanent loss.
9. **Pressure Cooker** — push-your-luck shared gauge (simple, watchable; verify depth).
10. **Hollow Pawn / The Longest Shadow** — hidden-position spatial deduction (pick one; test whether it resists being solved by pure information theory).

Deliberately excluded from the top 10 despite popularity: all telephone/Echo Chamber variants, all rhythm/hum games, all freeform rule-making games — for the reasons in §6–§8.

---

## 10. Top 3 candidates for immediate micro-probes

Chosen to (a) each test a *different* depth engine, (b) run in **under 30 minutes** with paper + coins, and (c) come with a **pre-registerable pass/fail** the model already hinted at. Each probe's job is to answer one bounded question: *does skilled play beat naive play, without the game being solved or feeling random?*

1. **The Turnstile** *(depth engine: positional bidding / bluff)*
   - Setup: 2–3 players, 10 tokens each, 20-space paper track. Each round, secret bid; highest advances 1 and discards tokens equal to the gap to the 2nd-highest bid.
   - GREEN if: a consistent bidder does *not* dominate and interesting bid-timing tradeoffs emerge across 5 rounds. RED if: optimal play collapses to "always bid 0" or "always bid max."

2. **Magnetic Drift** *(depth engine: simultaneous spatial reads)*
   - Setup: 3 players, number line 1–10, token at 5, hidden 3-number scoring zones. Each round secretly place +1 attract and −1 repel; reveal; move token by net; score.
   - GREEN if: players who *read opponents* outperform random placement and the token does not just sit at the middle. RED if: symmetric placement always centers the token (no agency).

3. **The Price of Certainty** *(depth engine: probabilistic calibration)*
   - Setup: 2 players, one die, 10 rounds. Declare confidence (0–100%) that the roll beats 3, then commit stakes scaled to confidence; wrong-but-confident loses big.
   - GREEN if: better-calibrated players reliably win and the confidence choice feels meaningful. RED if: everyone defaults to ~50% and the game goes flat.

Rationale for this trio: they are the three cleanest, lowest-material mechanics with the *least* hand-wavy mastery claims, and each already carries a self-flagged failure mode that makes a decisive probe possible. If none survive, that itself is a strong, cheap finding about the whole corpus.

---

## 11. Recommended next artifacts to generate

In priority order (all DRAFT ONLY / PROBE / REVIEW until human-ratified):

1. **Deduplication + canonical mechanic map** (`artifacts/research/…`). Collapse the ~250–300 instances into the ~30–50 distinct mechanics with a family tag, so downstream work stops re-reading near-duplicates. Cheapest high-value step.
2. **Independent second-model ideation pass** (roadmap Task 3). The entire corpus is one model; correct the single-model blind spots before treating any cluster as "the space." Flag weakened independence explicitly if only one family is available.
3. **Analogue-map artifact** (roadmap Task 4) for the top 3–5 families: for each, the real games that achieve easy-entry/hard-mastery, *why* they work, and their known degenerate failures — the cheapest evidence available and currently missing.
4. **Three probe briefs** for §10, with hypotheses and GREEN/RED criteria pre-registered *before* any prototype content (roadmap Phase 5 discipline).
5. **Mastery-ceiling artifacts** for the surviving candidates. This is the corpus's weakest dimension; force each survivor to name concretely *what an expert does better* and *how it is visible to a beginner*, or drop it.
6. **An independent review of this synthesis** by a non-author model (required by `MODEL_WORKFLOW.md` — creator ≠ reviewer), checking for smuggled assumptions and for candidates I over- or under-rated.

Not recommended: generating *more* raw ideation from the same model — the marginal batch is near-duplicate.

---

## 12. Status: this synthesis is not ratified project truth

This artifact is **DRAFT ONLY — EXPLORATORY**. Per `docs/artifact-authority.md`, `MODEL_WORKFLOW.md`, and `docs/artifact-conventions.md`:

- It **does not** update or override `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, or `BALANCE_NOTES.md`, and it touches none of them.
- It **ratifies nothing**, selects nothing, and vetoes nothing. Rankings, "GREEN/RED" probe criteria, and the top-3 recommendation are analysis and opinion, not decisions.
- It is model-produced synthesis and **must be independently reviewed** (creator ≠ reviewer) and then taken to a **human gate** before any candidate advances. Only a human-ratified decision, recorded in `DECISION_LOG.md`, may change project truth.
- The underlying corpus is itself DRAFT ONLY and single-model; nothing here should be cited as evidence that a concept "works" — only that it may be *worth a bounded test.*
