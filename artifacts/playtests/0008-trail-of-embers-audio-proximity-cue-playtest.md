# Trail of Embers — Audio Proximity Cue Playtest

## Status
Draft evidence artifact. Not source-of-truth ratification.

## Context
This playtest followed the committed audio/proximity cue probe and tested whether subtle non-directional proximity audio improved the prototype without changing gameplay.

## Setup
- Tester: Ian
- Input method: not formally isolated
- Playback device: unknown / not recorded
- Commit tested: b77a9ea
- Validation: passed before commit

## Observations
- Everything still worked after the audio/proximity cue pass.
- Keyboard, controller, Cinder Charge, mute, ember tick, and win/loss stingers still worked as expected.
- After adjusting the carrier frequency, the proximity cue worked, described by the tester as pretty subtle.
- The tester thinks this subtlety is a good thing.

## Issue Found
Initially, the proximity rumble did not seem to work. The issue was identified as the original 55 Hz carrier likely being too low/sub-bass for ordinary speakers. The carrier was changed to 110 Hz. After that, the proximity cue worked.

## Interpretation
- The cue appears technically functional after the 110 Hz adjustment.
- Subtle proximity audio has an initial positive signal.
- This does not yet answer blind-tester readability or hardware variability.
- This does not ratify audio as final direction.

## Verdict
GREEN_FOR_CONTINUING

## Recommended Next Step
Recommend a blind or external tester pass using the GitHub Pages link, with notes on playback device and whether the cue feels tense, helpful, too precise, or unnoticed.
