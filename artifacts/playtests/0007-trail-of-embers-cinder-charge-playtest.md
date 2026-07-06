# Playtest Evidence: Trail of Embers Cinder Cache & Cinder Charge (Level 7)

## Context
Level 7, "The Ember Ring," introduced a new positive collectible mechanic designed to offer strategic depth. Unlike previous maze levels, Level 7 features a distinct arena/two-lane layout to test player movement and resource utilization in a non-coiled environment. 

## Change under test
*   **Cinder Cache collectible:** A new positive item placed within Level 7.
*   **Cinder Charge state:** Collecting a Cinder Cache grants the player one held Cinder Charge (a true extra ember).
*   **Input logic:** 
    *   Pressing `Space` when the normal ember cooldown is ready drops a normal ember and retains the Cinder Charge.
    *   Pressing `Space` during the normal cooldown spends the Cinder Charge to drop an extra ember immediately.
    *   Spending the Cinder Charge does not reset, extend, or mutate the normal cooldown.
    *   Restarting the level or changing levels clears the charge state.
*   **Controls change:** The control scheme for dropping embers was updated globally in the prototype to be edge-triggered/tap-based (holding `Space` no longer auto-repeats ember drops) to prevent accidental double-spending of charges.

## Review/audit sequence
1.  **Mechanical Audit:** A Gemini Pro mechanical audit was performed on the uncommitted code, returning a status of **PASS** (confirming that the Cinder Charge behaves as a non-mutating additive mechanic respecting all cooldown invariants).
2.  **Validation:** The automated level validator was executed, passing all 7 levels. This verified cinder cache bounds, obstacle clearance, and player reachability.
3.  **Design Review:** An Opus design review was completed, returning a status of **PLAYTEST_GREEN** with a recommendation for a README doc-accuracy fix.
4.  **Documentation Update:** The README was updated to reflect that `Space` is now edge-triggered/tap-based globally. No source-of-truth files were modified.

## Playtest procedure/result
Ian conducted manual playtesting of the prototype containing Level 7 to verify integration, controls, and overall mechanical correctness.
*   **Result:** *"Everything works as expected and everything is implemented as intended."*

## Interpretation
*   The Cinder Charge probe is mechanically successful and functions correctly under playtest conditions.
*   The stored-charge version (active expenditure during cooldown) is preferred over an immediate cooldown refresh.
*   This artifact represents positive playtest evidence supporting the mechanics under test, but does **not** constitute source-of-truth ratification.

## Remaining risks
*   **Accidental expenditure:** Players may accidentally double-tap `Space` and spend the charge prematurely.
*   **Discoverability:** Some players may not discover that pressing `Space` mid-cooldown is the specific action to spend the charge.
*   **HUD Clarity:** The status of the held charge in the HUD and UI may require validation with blind testers to ensure it is obvious.
*   **Visual Feedback:** The visual distinction between a ready charge and a spent charge may be too subtle during fast gameplay.
*   **Permanence:** While promising, the Cinder Charge is still a prototype mechanic and should not yet be ratified as a permanent addition to the final game.

## Recommendation
*   Retain Level 7, the Cinder Cache, and the Cinder Charge mechanic in the Trail of Embers prototype.
*   Conduct subsequent playtests with blind testers to address HUD discoverability and control feedback.
*   Keep Trail of Embers as the leading prototype candidate without promoting it to final-game status yet.

## Explicit non-ratifications
*   **Cinder Charge:** The Cinder Charge mechanic is **NOT** final-ratified as a permanent game mechanic.
*   **Trail of Embers:** The Trail of Embers prototype remains the leading candidate for the project but is **NOT** final-game ratified.
