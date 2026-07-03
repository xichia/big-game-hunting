# Bulk Raw Ideation Batch 22: Game Concepts

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (bulk raw ideation runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Bulk raw ideation batch 22/50
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth)

---

## Batch Metadata

- **Batch:** 22 of 50
- **Concepts requested:** 5
- **Model:** deepseek-v4-flash
- **Endpoint:** https://opencode.ai/zen/go/v1/chat/completions
- **Generated:** 2026-07-04 02:05:38
- **Total concepts across all batches (planned):** 250

## Concepts

# Batch 22 — Five Raw Game Concepts

---

**Concept name:** The Last Lightkeeper

**One-sentence pitch:** Players take turns extinguishing and relighting a shared lantern in a dark tower, where the current light level determines what actions are possible and who can see whom.

**Core player action:** Adjust the shared light level (up or down one step per turn) to enable or deny actions for yourself and other players — you can only perform an action if the light is in the specific "window" that action requires.

**Beginner appeal:** The rule is one sentence: "The light level is 1–6; your action card tells you which light level lets you use it, and you can change the light by 1 each turn." First-turn choice is obvious: move the light toward the level you need.

**Mastery source:** Reading which light levels opponents are angling for, baiting them into moving the light away from their own goals, and sequencing multi-turn setups where you move the light through several levels to chain actions in a single burst.

**Replayability driver:** The action deck is drawn from a larger pool each game; the initial light level changes; the tower's "echo" rule (if the light stays at the same level two turns in a row, something happens) shifts incentives each game.

**Social / watchability hook:** The light level is a single visible state everyone watches — every move visibly changes who is empowered and who is blocked. Tension builds as players approach or avoid the same number.

**Likely failure mode:** Analysis paralysis on the first turn because the optimal light level is unclear; solved by giving each player a simple personal goal card that suggests a target range.

**Smallest probe:** Three players, six face-down tokens (two per player), a six-position sliding paper strip for the light level. On your turn, move the strip ±1, then reveal a token if the light matches your token's number. First to reveal both tokens wins.

**Forbidden assumptions avoided:** Not digital-only (paper probe works). Not tabletop-only (adaptable to digital). Not competitive-only (coop variant possible). Not cooperative-only (default is competitive). No literal hunting, animals, cards as primary mechanic (light level is primary), map/board, combat, or economy system.

---

**Concept name:** The Auction of Echoes

**One-sentence pitch:** You bid not with currency but with promises about your future moves — and must fulfill those promises or lose standing, creating a web of commitments that grows tighter each round.

**Core player action:** Place a sealed "promise bid" stating what you will do on your next turn (e.g., "I will move clockwise," "I will pass my turn," "I will target the player on my left"), then reveal all bids simultaneously; the player whose promise best matches the current situation wins priority, but everyone must attempt their promise on their upcoming turn.

**Beginner appeal:** The objective is simple: make a promise, try to keep it. The first-time move is obvious: pick a promise that's easy to keep (like "I will move to the nearest open space"). Failure is forgiving — broken promises just reduce priority, not eliminate you.

**Mastery source:** Crafting ambiguous promises that could mean multiple things depending on how the board shifts, reading opponents' likely promises and positioning to make theirs harder to keep, and bluffing — promising something you don't intend to fulfill to bait others into wasted positioning.

**Replayability driver:** The promise deck (or list) of available promise templates shifts each game; player positions and the shared state are dynamic; meta-game evolves as players learn each other's promise habits.

**Social / watchability hook:** The reveal moment is inherently dramatic — everyone sees who committed to what, and whether anyone overreached. Players narrate their reasoning afterward: "I knew you'd promise to block me, so I promised something I could keep from the other side."

**Likely failure mode:** Promise templates that are too narrow produce boring identical bids; too broad make evaluation impossible. The sweet spot is about 8–12 promise templates per game, drawn from a larger pool.

**Smallest probe:** Four players, eight promise cards (simple actions like "move left," "move right," "stay still," "target player A"), and four position tokens on a line of 5 spaces. Each round: bid secretly, reveal, then everyone moves according to their promise. First to reach either end wins. Play 3 rounds, observe whether players learn to bait or bluff.

**Forbidden assumptions avoided:** Not digital-only. Not tabletop-only. Not competitive-only (coop possible: "we all promise to move toward the same zone"). Not cooperative-only. No literal hunting, animals, cards as primary mechanic (promises are primary), map/board (line is not a map), combat, or economy system.

---

**Concept name:** The Resonant Chain

**One-sentence pitch:** Every action you take echoes forward — the exact same action will be available to the next player, but with a small distortion that grows with each pass, so you must choose actions knowing they will become someone else's problem.

**Core player action:** Choose one of three available action tokens (Move, Block, Collect), perform it, then pass the chosen token to the next player — but the token's effect slightly changes each time it's passed (e.g., Move becomes Move-Left, then Move-Left-2, then Move-Left-2-If-Unblocked).

**Beginner appeal:** The rule is: "Pick a token, do what it says, hand it to the next player." The first turn choice is obvious — pick whichever token helps you right now. The distortion is gradual and visible.

**Mastery source:** Predicting the chain of distortions — if I take Move now, it becomes Move-Left for the next player, which might help them reach their goal, so I might take Block instead to give them a weaker option. Long-term chain planning across 4–6 turns.

**Replayability driver:** The distortion rules change per game (different transformation tables); the starting set of three tokens varies; players can discover new distortion patterns through experimentation.

**Social / watchability hook:** Watching a simple action get weird over multiple passes is inherently interesting. "Oh no, Collect has picked up three modifiers and now it's Collect-From-Farthest-Player-Twice — who's going to get that?"

**Likely failure mode:** The distortion rules become too complex to track after 5–6 passes. Solution: each token has a visible "history strip" showing its modification path, so the current state is always readable at a glance.

**Smallest probe:** Three players, three token cards (Move, Block, Collect) with a shared distortion table of 6 simple modifications. Each token starts unmodified. Play 6 rounds: each round, a player picks a token, performs its current effect (gain/lose position on a 5-space track), applies the next modification from the table, and passes it clockwise. First to reach position 5 wins.

**Forbidden assumptions avoided:** Not digital-only. Not tabletop-only. Not competitive-only (coop: chain actions toward a shared goal). Not cooperative-only. No literal hunting, animals, cards as primary mechanic (token-passing is primary), map/board (track is not a map), combat, or economy system.

---

**Concept name:** The Unspoken Rule

**One-sentence pitch:** Players collectively create a rule by playing examples of it — but the rule is never stated aloud, so you must infer what's allowed from what others do, and you lose if you violate the emerging norm.

**Core player action:** On your turn, place a token on a shared grid, and the group silently judges whether your placement follows the "unspoken rule" — if it does, you stay in; if it violates the rule, you're out for that round and must guess what the rule is.

**Beginner appeal:** The first round has no rule at all (anything goes), so players just place tokens freely. The rule emerges gradually from patterns. Beginners can survive several rounds by simply copying what others did.

**Mastery source:** Reading subtle patterns — does the rule care about color, position, parity, adjacency, or action sequence? Expert players can intentionally place tokens that test the rule's boundaries without violating it, and can deduce the rule faster than novices.

**Replayability driver:** The rule is never the same twice; it's generated by the sequence of player placements themselves. Different player groups produce different rules. The game can be played with purely conceptual rules (no components needed).

**Social / watchability hook:** The moment someone incorrectly places a token and is eliminated produces a burst of social energy — everyone tries to explain what the rule "obviously" was. The game generates post-round discussion naturally.

**Likely failure mode:** Rules that are too ambiguous (anything/nothing fits) or too specific (only one placement pattern works). Mitigation: the rule must be deducible from the first 3–4 examples, which means the starting player has an implicit constraint (they create the first pattern).

**Smallest probe:** Four players, a 4x4 grid (drawn on paper), tokens of two colors. No verbal communication. Round 1: each player places one token anywhere. Round 2: each player places one token; if it violates the rule (as judged by all other players silently voting), they're out. After round 2, eliminated players guess the rule aloud. Play multiple rounds with different starting players. Observe: how long until all players deduce the rule?

**Forbidden assumptions avoided:** Not digital-only. Not tabletop-only (works in pure conversation: "name a number, others judge if it follows the rule"). Not competitive-only. Not cooperative-only (it's a deduction game that can be played competitively or as a group challenge). No literal hunting, animals, cards as primary mechanic, map/board (grid is not a map), combat, or economy system.

---

**Concept name:** The Threshold

**One-sentence pitch:** You don't control your own pieces — you control the invisible "threshold" that determines what counts as a valid move for everyone, and you win by making your threshold the one that defines the game's final victory condition.

**Core player action:** Each round, secretly set a numerical threshold (between 1 and 10). Then all players simultaneously reveal their thresholds. The player whose threshold is closest to the round's "target number" (determined by the previous round's outcomes) gets to define what a "valid move" is for the next round.

**Beginner appeal:** The rule is: "Write a number, reveal it, the closest to the target wins the right to make a rule for this round." First-turn choice is obvious: pick 5 (the middle). The target numbers start simple.

**Mastery source:** Anticipating what thresholds others will set, knowing when to set a threshold that won't win but will shift the target for next round, and designing rules that benefit you without being so restrictive they trigger a revolt (players can collectively ignore a rule if it's too unfair).

**Replayability driver:** Each game produces a different sequence of target numbers and rule sets. Players develop meta-strategies about how to manipulate the target. The rule-design phase is creative and unpredictable.

**Social / watchability hook:** The rule-design phase is visible to all — watching someone construct a rule that technically benefits them but is so clever that everyone accepts it is a memorable moment. The negotiation ("is this rule fair?") creates social engagement.

**Likely failure mode:** Rules become too complex or unfair, causing players to disengage. Mitigation: any rule can be vetoed by a 2/3 majority, and vetoed rules reduce the designer's score. This self-regulates toward interesting-but-fair rules.

**Smallest probe:** Three players, paper slips, and a shared board of 9 spaces. Round 1: each writes a threshold (1-10). Target is 5. Winner defines: "Moves must go to an adjacent space." Play 2 moves under this rule. Round 2: new target is the average of last round's thresholds. Winner defines a new rule (overriding or adding to the old one). First to collect 3 tokens (placed by making valid moves) wins. Play 4 rounds total.

**Forbidden assumptions avoided:** Not digital-only. Not tabletop-only. Not competitive-only. Not cooperative-only (can be played as co-op: all players try to define rules that help the group reach a shared target). No literal hunting, animals, cards as primary mechanic, map/board (9 spaces is not a map), combat, or economy system.
