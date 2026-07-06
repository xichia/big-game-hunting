# Playtest: Sailor and Bupa: Go to the Beach — First Controller/Visual Playtest (0010)

ARTIFACT TYPE: Playtest
AUTHORITY: EVIDENCE
STATUS: Complete
SYNTHESIZED BY: Fable (skeptical playtest synthesis / design-direction reviewer)

## 1. Metadata

- **Prototype:** Sailor and Bupa: Go to the Beach (separate exploratory prototype; not a Trail of Embers replacement; not source-of-truth ratified)
- **Date:** 2026-07-06
- **Playtester:** Ian
- **Build/state caveat:** Played after the visual-simplification pass and follow-up fixes cleared review 0007 (`VISUAL_READY_FOR_PLAYTEST`) and controller support cleared audit 0008 (`CONTROLLER_READY_FOR_PLAYTEST`). Known residuals going in, none blocking: Sailor's sprite lattice unsnapped, fractional camera softening, tidepool-as-plain-circle, dark console HUD chrome. Exact commit not recorded; the working state corresponds to the post-0007/0008 build.

## 2. Summary Verdict

**DIRECTION_SHIFT — the playtest succeeded at its real job.**

This was not a failed playtest, and it should not be read as one. The prototype was built to probe a specific hypothesis — that Bupa's wander/pause rhythm plus shell scarcity would create watch-the-cat attention and "one more shell" greed tension. The playtest gave a clear, useful answer: the greed half of the hypothesis is not landing, the low-pressure half is *more* interesting than expected, and the cat needs to be more of a cat. A prototype that cleanly redirects the design question is doing exactly what prototypes are for. The signal here is a direction shift, not a quality failure.

The shift, in one line: Ian's notes plus his follow-up direction point away from "greed-pressure timing game" and toward "low-pressure whimsical companion game," with **whimsy as a primary focus, not incidental flavor.**

## 3. What Worked

- **Controller movement feels way better than keyboard.** The controller pass (audit 0008) paid off immediately. Controller should be treated as the primary input for future Sailor/Bupa playtests, with keyboard preserved as a fallback.
- **The visual baseline holds up in motion.** Ian described the beach style as "okay in motion" — consistent with review 0007's assessment that the restrained Trail-of-Embers-but-beach-themed look (flat fills, blocky foam edge, chunky sprites, one pixel buffer) is a sound foundation. The complaint is about *aliveness*, not about the style being wrong.
- **Bupa is partially legible as an agenda-driven cat.** "Kind of feels like a cat with an agenda, but not really" is a partial success worth naming: the wander/pause/interest-point rhythm reads as intentional behavior. The skeleton works; it lacks flesh.
- **Low pressure did not feel bad.** Ian explicitly flagged that the lack of pressure is "not necessarily bad." The calm loop is a live design space, not a defect to patch.

## 4. What Did Not Work

- **Bupa's personality is too thin.** He follows his agenda but doesn't feel like a *cat* — no affection, no annoyance, no distractibility, nothing funny or surprising. The probe question asked whether his behavior makes the player "watch and care about the cat"; the honest answer right now is "watch, somewhat; care, not yet."
- **Shell greed does not create interesting decisions.** The scarcity/forfeit rule (shells left behind are lost) was supposed to generate "one more shell" tension. It doesn't. Ian went further: maybe shell greed should not be the philosophy of the game at all.
- **The prototype feels empty.** Ian's words: "quite empty," needing "more complexity and depth." Important caveat carried into §10: this playtest does *not* say what kind of depth, and it explicitly should not be read as "add pressure."
- **The beach doesn't move enough.** Trees are static and need motion; the water is too simple and needs more complexity. This is a liveliness deficit, not a style rejection — the flat, restrained look is fine; a flat, *inert* world is not.

## 5. Major Design Implication

**Sailor and Bupa may want to become a low-pressure whimsical companion game rather than a greed-pressure timing game.**

The original probe framed shells as scarce, forfeitable, and tension-generating. The playtest suggests the prototype's actual pull — to the extent it has one — is the companion fantasy: wandering a beach with a cat. Ian's follow-up direction makes this explicit: whimsy, Bupa's personality, beach life, moving trees, richer water, and small surprising events are the likely next design center. "Very low pressure: collect shells" is now a candidate philosophy in its own right, not a degenerate case of the greed design.

This is stated as a *live hypothesis*, not a ratified pivot. Ian's own notes preserve uncertainty ("maybe," "not necessarily bad"), and this artifact preserves it too. But the next investigation should test the low-pressure whimsical framing, not double down on greed tuning.

## 6. Whimsy as Primary Focus

Per Ian's direction, whimsy is a **central design requirement for the next pass**, not garnish to sprinkle on afterward. That means the next pass should be evaluated on whether the game feels charming, alive, and gently funny — not merely on whether features shipped.

What "whimsy" plausibly means in this prototype, as testable categories rather than a feature list:

- **Small surprising events:** rare, brief, unprompted moments — something scuttles, something washes up, something glints — that reward simply being present.
- **Catlike interruptions:** Bupa doing cat things that briefly derail the loop in a charming way (chasing something, refusing to move, sudden zoomies) without becoming a fail state.
- **Environmental animation:** trees that sway, water with layered motion, grass that reacts — the world behaving as if it has weather and time.
- **Funny Bupa behaviors:** poses, reactions, and timing that land as humor — the check-back sit (already the best sprite moment in the game, per review 0007) is the existing proof that a single well-observed cat pose carries charm.
- **Charming shell discoveries:** shells as small moments of delight (an odd one, a hidden one, one Bupa is sitting on) rather than units of pressure.
- **Beach life:** small creatures and ambient inhabitants that make the beach feel occupied.
- **Cozy visual motion:** the overall sense that the scene idles pleasantly — that standing still and watching is rewarded.

A skeptical guardrail: whimsy is easy to over-scope into a content treadmill. The next pass should probe whether a *small number* of well-made whimsical elements changes the feel, not attempt all seven categories at once.

## 7. Bupa Personality Notes

Bupa is the central next design problem. The target, in Ian's framing: **staying near Bupa should feel like a combination of affectionate and annoying — like a real cat.** More broadly: affectionate, annoying, curious, distractible, agenda-driven, and occasionally funny.

What this is *not*: a mandate for rescue mechanics, trouble states, or Bupa-in-danger loops. Do not jump there. The out-of-scope list (rescue beyond check-back, hazards, health, timers) still stands for the next pass.

Bounded personality probes that add no fail states — candidates, not commitments:

- **Affection behaviors:** Bupa occasionally approaches *Sailor* — rubs past her, flops near her, sits on the exact spot she's standing — inverting the current one-way proximity pull.
- **Annoyance behaviors:** Bupa walks directly through Sailor's path, sits on or near a shell she's heading for, or stops dead at the least convenient moment.
- **Distractibility:** Bupa occasionally abandons his current interest point mid-route for something else (a bug, a glint), then resumes his agenda.
- **Reaction variety at interest points:** different pause *performances* per point type — batting at a tidepool, scratching driftwood — rather than the same three-posture cycle everywhere.
- **Idle-time payoff:** if Sailor stands still near Bupa, something small and warm happens (a slow blink, a tail curl) — testing whether "watch and care" can be earned through observation alone.

Each of these is behavior/animation-layer work that leaves the state machine's *purpose* (wander, pause, check-back) intact and adds no lose condition.

## 8. Shell / Collection Philosophy Notes

The scarcity/forfeit design did not produce "one more shell" tension, and this artifact deliberately does not treat that as a failure to be fixed by turning the pressure knob up. Ian's read — that shell greed may simply not be the philosophy of this game — is the more interesting interpretation, and it should not be overfit *against* either: greed hasn't been disproven, it just isn't earning its keep.

Alternative framings for shells worth holding open:

- **Cozy collection:** shells as a gentle accumulating pleasure — the pull is "I like picking these up," not "I'll lose these."
- **Discovery:** occasional unusual shells (odd shape, odd spot, half-buried) that make finding one an event. Note: shell *rarities* as a stats system remain out-of-scope; this is about moments, not tiers.
- **Expression:** shells as something the player chooses among rather than sweeps up — though this likely needs a "what are shells *for*" answer that doesn't exist yet, so it's a later question.
- **Whimsy carrier:** shells as a delivery mechanism for small surprises (see §6), including Bupa interacting with them.

The forfeit rule can stay in the build for now — removing it is a mechanics change this artifact doesn't recommend — but the next pass should not invest further in sharpening greed pressure.

## 9. Visual-Motion Notes

- **Trees need motion.** Static dune vegetation is the most-named liveliness gap. Sway/idle animation on the existing simplified two-tone plants is the shape of the fix — animating what's there, not redrawing it.
- **Water needs more complexity.** The single blocky foam edge was the right *simplification* answer (review 0007) but reads as inert in extended play. More complexity here means motion and layering — an animated foam edge, subtle water movement — not a return to the banned dense-texture vocabulary (banded waves, speckle fields, tile shading).
- **Complexity through clever pixel art, not busy texture.** Ian's phrasing sets the constraint precisely: the next visual pass should add *animation and well-chosen detail*, not density. A few pixels that move beat many pixels that don't.
- **Preserve the baseline.** The restrained Trail-of-Embers-but-beach look — flat fills, unified sand, chunky few-tone sprites, the half-res pixel buffer — survived the playtest and stays. Review 0007's "things not to change" list (§8 there) remains in force except where Ian's notes explicitly supersede it: the *plain flat water* and static vegetation are now sanctioned targets for motion, while the pipeline, palette, sand tone, and sprite designs are not.

Moving trees and richer water are **liveliness needs, not polish**. They are part of the whimsy thesis: a world that moves is a precondition for a world that charms.

## 10. Emptiness / Depth Notes

"It feels quite empty" and "needs more complexity and depth" are the vaguest notes in the set, and the easiest to misread. Four distinct kinds of depth are in play, and the playtest evidence points at three of them:

- **Mechanical depth** (more systems, more pressure, more decisions): *not* what the evidence asks for. Ian explicitly said low pressure is not necessarily bad and warned against interpreting depth as pressure, hazards, rescue, or fail states.
- **Personality depth** (Bupa behaving like a real cat): directly named. The strongest signal in the playtest (§7).
- **Environmental depth** (beach life, small events, things to notice): directly implied by "empty" plus the whimsy direction (§6).
- **Presentation depth** (motion, animation, visual richness): directly named — trees, water, visual complexity (§9).

The working hypothesis for the next pass: the emptiness is mostly a personality + environment + presentation deficit, and it should be attacked there first. If the world moves, the cat charms, and small things happen, and it *still* feels empty — that's when mechanical depth becomes the open question, not before.

## 11. Recommended Next Investigation

**One bounded investigation: a whimsical-life pass — Bupa personality + living beach motion.**

Framing question: *does a small set of whimsical Bupa behaviors plus environmental motion (moving trees, livelier water, sparse beach life) make the existing low-pressure loop feel charming, alive, and gently funny — without any new pressure mechanics?*

Shape of the pass — categories, not prescriptions:

1. **Bupa personality layer:** a small selection from §7's bounded probes (affection, annoyance, distractibility), chosen for charm-per-effort, with no fail states.
2. **Living-world motion:** tree/vegetation sway and a more complex, animated water edge, within the clever-pixel-art constraint of §9.
3. **A small dose of whimsy events:** one or two kinds of small surprises or ambient beach life, enough to test the category, not populate the beach.

Explicitly deferred, as later possibilities only: rescue/trouble mechanics, moving tide, hazards, fail states, shell-economy redesign, and any heavy mechanical addition. The existing out-of-scope list stays intact except where the motion work requires touching the (currently decorative) water's *appearance*.

The pass should go through the usual probe-brief → review → playtest loop, and the playtest after it should ask one question: does it feel alive and charming now, or still empty?

## 12. Things NOT to Conclude Yet

- **Do not conclude Sailor/Bupa is weak overall.** One playtest redirected the design center; it did not indict the prototype. The loop skeleton, controller feel, and visual baseline all held.
- **Do not conclude shell collection must be pressure-driven** — and equally, do not conclude the greed framing is permanently dead. It underperformed once, pre-whimsy; it's demoted, not deleted.
- **Do not conclude rescue/tide/trouble is required.** "Annoying like a real cat" is not "cat in danger." Trouble mechanics stay a later possibility, contingent on the whimsical-life pass's results.
- **Do not conclude source-of-truth should change.** This is one playtest of one exploratory prototype.
- **Do not conclude Sailor/Bupa should compete with or replace Trail of Embers.** Its relationship to the main game is unchanged and undecided.
- **Do not conclude "empty" means "under-mechanized."** See §10; the pressure interpretation is explicitly ruled out as the *first* response.

## 13. Source-of-Truth Status

This artifact is **prototype evidence only**. It records one playtest and one direction signal from Ian. It ratifies nothing.

No source-of-truth files were updated, and none should be updated on the basis of this artifact:

- `GAME_TRUTH.md` — untouched
- `DESIGN_PRINCIPLES.md` — untouched
- `MECHANICS.md` — untouched
- `DECISION_LOG.md` — untouched
- `PLAYTEST_LOG.md` — untouched
- `BALANCE_NOTES.md` — untouched

If the whimsical-life pass validates the low-pressure companion direction across further playtests, ratification can be considered then — not now.
