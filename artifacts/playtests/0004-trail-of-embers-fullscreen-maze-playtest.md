# Trail of Embers — Fullscreen Maze Pass Playtest Notes

## Status

Draft playtest evidence. Not source-of-truth. Not ratification.

## Implementation Under Test

- Commit: `89ae3b0 Add Trail of Embers fullscreen maze pass`
- Prototype: `prototypes/trail-of-embers/index.html`
- Level under test: Level 5, "The Deep Maze"

## Playtest Focus

Summarize the pass goal:
- larger/fullscreen map
- corridor-width variation
- tiny squeeze passage
- whether Level 5 feels meaningfully different from Level 4
- whether "good lost" remains fair and learnable
- whether beast ghosting remains fair
- whether CSS scale-to-fit is comfortable

## Raw Notes

Question: Did Level 5 actually feel meaningfully different from Level 4?

Answer:
It did. It was a little bigger, and the variation in widths of the corridor was a new element. These are both positive. I think we should keep going.

Question: Did the narrow/tiny corridor feel cool, fair, and intentional?

Answer:
Yeah, cool and intentional and a bonus, more than fair.

Question: Did the larger map create good lost or just more of the same?

Answer:
Yeah, I think we can still go bigger. I think almost having this as a maze type thing with an added element seems like the right way to go.

Question: Did CSS scale-to-fit feel comfortable?

Answer:
I didn’t notice any discomfort from the scaling. The full level was visible and playable.

Question: Did beast ghosting remain fair at this scale?

Answer:
Yeah, still the same fair.

## Interpretation

Summarize the signal:
- GREEN for continuing the larger maze direction
- corridor-width variation is a positive new design vocabulary
- tiny squeeze passage is promising
- larger map remains playable and can go bigger
- CSS scale-to-fit did not create discomfort
- beast ghosting remains fair at this scale

## Risks / Open Questions

Include:
- Level 5 is still somewhat similar to Level 4
- larger/maze direction still needs stronger differentiation
- future levels should lean harder into spatial texture, width variation, chambers, squeeze points, and route learning
- "good lost" still needs careful protection from bad confusion
- not yet final-game ratification

## Recommended Next Bounded Step

Recommend a next bounded pass, not source-of-truth ratification:

`Bigger Maze / Width Variation Pass`

Goal:
Test whether Trail of Embers can become more distinctive by expanding the maze scale and making spatial texture — wide chambers, medium corridors, narrow squeeze passages, landmarks, bailout loops, and planned bait pockets — the main design vocabulary.
