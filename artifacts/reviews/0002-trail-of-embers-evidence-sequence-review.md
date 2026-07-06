# Review: Trail of Embers Evidence Sequence (0002)

## 1. Title
Review: Trail of Embers Evidence Sequence

## 2. Scope
This is an independent evidence-sequence review for Big Game Hunting. Its purpose is to evaluate the cumulative playtest and design evidence for the "Trail of Embers" prototype and assess whether it should be elevated to the project's current leading candidate. It is a review artifact, not a ratification, and makes no updates to source-of-truth files.

## 3. Materials Reviewed
**Core Prototype:**
- `prototypes/trail-of-embers/index.html`
- `prototypes/trail-of-embers/README.md`
- `prototypes/trail-of-embers/validate-levels.js`

**Playtest Evidence:**
- `0001-trail-of-embers-first-playtest.md` (Initial probe)
- `0002-trail-of-embers-challenge-pass-1-playtest.md` (Difficulty tuning)
- `0003-trail-of-embers-scale-pass-1-playtest.md` (Scale pass 1)
- `0004-trail-of-embers-fullscreen-maze-playtest.md` (Fullscreen / Width variation)
- `0005-trail-of-embers-pixel-art-visual-pass.md` (Visual pass)
- `0006-trail-of-embers-coiled-maze-playtest.md` (Level 6 tightening)

**Research/Review Context:**
- `trail-of-embers-visual-design-language-directions.md`
- `0001-bulk-raw-ideation-synthesis-review.md`
- `0001-bulk-raw-ideation-synthesis.md`

## 4. Current Prototype Status
The prototype is a fully playable, single-file HTML/JS implementation featuring six hand-authored levels. It has successfully undergone six distinct iteration loops (Initial -> Challenge -> Scale -> Fullscreen -> Visuals -> Coiled Maze), all of which have yielded GREEN playtest signals from the creator. The mechanics are simple (move, drop ember as bait, avoid wall-clipping beast), and difficulty scales through maze complexity and timing constraints rather than new systems.

## 5. Evidence Sequence Summary
The evidence sequence demonstrates a disciplined, bounded approach to de-risking the core concept:
1. **Core Loop:** Playtest 0001 verified the "light as bait" mechanic was intuitive and tense.
2. **Challenge / Fairness:** Playtest 0002 verified that making the game harder (via maze structure and emergent ember caps) felt fair and learnable, not cheap.
3. **Scale:** Playtests 0003, 0004, and 0006 verified that expanding the physical size of the map (up to a 1800x1000 coiled maze) retained the core tension without diluting into boredom, proving the concept has "legs."
4. **Visuals:** Playtest 0005 verified that moving away from abstract programmer art to a pixel-art aesthetic amplified the mood without harming legibility.

## 6. Strengths
- **Mechanic Legibility:** The core interactions (light attracts beast, beast ignores walls) are instantly understood and create immediate spatial tension.
- **Systemic Elegance:** The game generates increasing difficulty through level layout and emergent constraints (e.g., ember cooldown vs. lifetime creating a 3-ember cap) rather than bolting on complex new systems or enemies.
- **Feasibility:** The implementation is extremely lightweight (zero dependencies, single file), aligning perfectly with the constraint of a small, Mac-local, indie-scale production footprint.

## 7. Weaknesses / Unresolved Risks
- **Overfitting / Survivorship Bias:** *Every single playtest has been conducted by the creator.* There is zero blind-tester data. The game feels "fair" and "intuitive" to the person who programmed the beast's AI state machine.
- **Content Treadmill:** The current vector for increasing difficulty is "bigger, tighter hand-authored mazes." This directly risks violating the project's goal of deriving replayability from systems rather than content volume. If the game requires 50 hand-crafted mazes to be a full product, the production burden changes significantly.
- **The Fragility of "Good Lost":** The distinction between "I don't know the map yet but I can learn it" (Good Lost) and "I am hopelessly confused and frustrated" (Bad Lost) is narrow. As mazes get larger, crossing into Bad Lost becomes highly probable for new players.

## 8. Fit Against Big Game Hunting North Star
Trail of Embers strongly aligns with the North Star:
- **Easy to start:** Yes. Minimal controls, instantly readable core interaction.
- **Harder to master:** Yes. Mastery comes from spatial memory, route planning, and precise bait-timing.
- **Replayability:** Mostly yes, though heavily reliant on the player wanting to perfect a run. (See content treadmill risk above).
- **Mac-local feasibility:** Excellent. The tech stack is as simple as it gets.

## 9. Governance Assessment
The sequence of playtests provides robust, cumulative evidence that Trail of Embers is a highly viable concept that has survived multiple vectors of stress-testing (difficulty, scale, visual representation). It has decisively outperformed the bulk raw ideation concepts (which were largely deemed shallow or mathematically trivial). 

However, it is premature to ratify this as the final game. It must survive a blind playtest, and the content-treadmill risk must be addressed before final ratification.

## 10. Verdict
**LEADING_CANDIDATE**

The evidence supports treating Trail of Embers as the current leading candidate for Big Game Hunting, but it is not yet final-game ratified.

## 11. Recommended Next Step
**Blind Playtest Pass:** Before any further mechanical expansion, conduct a playtest with at least one external player who has no prior knowledge of the game's mechanics or AI rules.

## 12. Explicit Non-Ratifications
- **Final Game Selection:** Trail of Embers is not the ratified final game.
- **Visual Direction:** The pixel art pass (0005) is an exploratory prototype, not the ratified final visual style.
- **Beast Identity:** Whether the pursuer is a physical beast or a supernatural ghost remains unratified.
- **Source of Truth:** No updates are authorized to `GAME_TRUTH.md` or any other governance files based on this review.
