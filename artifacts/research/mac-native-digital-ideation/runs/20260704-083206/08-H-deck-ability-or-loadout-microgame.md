# Mac-Native Digital Ideation — Lane H: Deck, ability, or loadout microgame

ARTIFACT TYPE: Research Artifact
AUTHORITY: DRAFT ONLY — EXPLORATORY
STATUS: Draft
CREATED BY: deepseek-v4-flash (mac-native digital ideation pilot runner via https://opencode.ai/zen/go/v1/chat/completions)
REVIEWED BY: (not yet reviewed)
DATE: 2026-07-04
RELATED TASK: Mac-native digital ideation pilot, batch 8/12, lane H (Deck, ability, or loadout microgame)
SOURCE-OF-TRUTH FILES TOUCHED: (none — this artifact does not update project truth; it does not ratify a Mac-native-digital pivot)

---

## Batch Metadata

- **Run ID:** 20260704-083206
- **Batch:** 8 of 12
- **Lane:** H — Deck, ability, or loadout microgame
- **Model:** deepseek-v4-flash
- **Transport:** https://opencode.ai/zen/go/v1/chat/completions
- **Finish reason:** stop
- **Generated:** 2026-07-04 16:35:22

## Candidate

Candidate title:
Cull the Hand

Batch / lane:
H — Deck, ability, or loadout microgame

One-sentence player-facing hook:
You share a hand of cards with your opponent, and every turn you must discard one of them—but you don’t control the hand, you only control your reaction to what’s left.

Core fantasy:
You are a cold-blooded operative in a shadow duel, forced to sacrifice your own tools and read your opponent’s intentions from the shrinking pool of options.

Core loop:
Both players see a shared 5-card hand. Each round, you privately choose one of those cards to “retain” for your side; the opponent does the same. Simultaneous reveal: each retained card is played for its effect (attack, block, resource, trick). The remaining cards are discarded, and the hand is reshuffled with one new card added. Over 5–7 rounds, life totals dwindle and the game tightens.

First five minutes:
A beginner sees a brief screen: “You share a hand of 5 cards. Each round, pick one to keep. The one you leave behind is lost.” They click a card. It resolves. They see the result and immediately understand the tension of picking the same card as the opponent or bluffing them out of a good pick.

Native-digital reason:
Simultaneous card selection with hidden intents requires server or deterministic peer resolution; on a Mac-native app this is handled locally with a short timer. The “shared hand” mechanic also needs digital bookkeeping—reshuffling, tracking retains, and animating reveals—that a tabletop version would bog down in.

Mac-native feasibility:
Low. Solo developer can build in Swift/SpriteKit or C++/SDL. No networking, no large assets. Card art can be simple geometry and colors. The whole game is one window with a few buttons.

Input model:
Keyboard/mouse only—click a card, confirm choice. No trackpad gestures needed.

Beginner appeal:
The shared hand makes the first decision obvious: pick the scariest card for the opponent. The rules are 3 lines. After one round, you understand the core tension.

Mastery engine:
At 10 plays: you learn card types and start tracking which cards have been burned. At 50 plays: you begin to recognize patterns—opponents always keep a block if one is available, so you bait. At 200 plays: you can reliably predict opponent picks based on hand composition and past rounds, and you can force a “lose-small, win-big” trap.

Replayability driver:
Procedural card generation—each game draws from a pool of 30+ cards with different effects; no two hands are the same. Player skill in reading the shared pool creates emergent depth.

Watchability / readability:
Highly watchable: both players’ choices are revealed simultaneously with clear animations; spectators can see the hand and guess who took what. A replay mode could show each round’s picks.

Scope risk:
Low. Core loop is implemented in a few hundred lines. No AI needed for single-player—simple scripted opponent or random picker for early builds.

Implementation risk:
Low. Card effects are simple (damage X, heal Y, block next attack, steal one resource, etc.). No physics, no complex state machine.

Art/content burden:
Low. 30 cards with simple geometric icons and colored borders. No animation beyond card flip and burn.

Main failure mode:
The game feels samey after 10 rounds because the shared hand reduces meaningful choice—players just grab the best card every time.

Smallest playable prototype:
A one-window Mac app with 5 cards dealt from a pool of 10, two human players on the same machine, round resolution, and a life counter. No AI needed.

Kill criterion:
If after 5 playtests, players report that the choice is always obvious (i.e., there is a clear “best” card in every hand), the core decision is broken.

Soft-decision note:
This is an exploratory candidate for batch 8. It is not project truth. Before it could be taken seriously, a paper-playtest variant should be run with 5 human participants to confirm that the shared hand produces at least 3 distinct viable strategies per round—otherwise the mechanic collapses into a no-brainer.
