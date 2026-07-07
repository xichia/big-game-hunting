# Sailor and Bupa Beach Points of Interest Brief

ARTIFACT TYPE: Probe Brief
AUTHORITY: PROBE
STATUS: Draft — Human-gated probe input
CREATED BY: Manager (routing + drafting)
REVIEWED BY: not yet reviewed
DATE: 2026-07-07
RELATED TASK: Sailor and Bupa: Go to the Beach — beach points-of-interest pass (post-playtest-0011 direction)
SOURCE-OF-TRUTH FILES TOUCHED: none

This brief documents a direction for an exploratory prototype only. It is not a replacement for *Trail of Embers*, does not update `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, or `BALANCE_NOTES.md`, and is not a ratified final game. No design choice in this artifact is ratified.

---

## Purpose

The goal of this pass is to add **depth and charm** to the Sailor and Bupa beach prototype by making the beach more **legible** (recognizable beach objects instead of abstract natural features) and giving Bupa more **authored things to investigate**, while preserving the low-pressure companion feel that playtest 0011 confirmed is working.

This is a bounded design-planning artifact. It does not specify final mechanics, ratify any system, or commit to implementation. Its job is to make the next prototype slice easy to choose by listing candidate objects, candidate Bupa moments, and a deliberately tiny recommended first slice.

## Playtest Basis

From `artifacts/playtests/0011-sailor-and-bupa-whimsical-life-polish-playtest.md`:

- The build now feels **cozy, chill, and charming**, but is **still somewhat boring and needs depth**.
- **Bupa works emotionally** (more cat-like, makes Ian smile, "mrrp!"/"meow?" is charming) but personality can continue to develop.
- **Beach visuals are now a good baseline** — waterline motion, sand/water/dunes/vegetation, and the chunky pixel sensibility all read as a platform to build on, not a problem to fix.
- **Current abstract/natural POIs can be hard to identify** — Ian does not always know what Bupa is investigating.
- **Tidepool/puddle is not especially liked** as a common object; if used at all, it should be occasional, larger, and connected to the ocean — not the default common POI.
- **Low-pressure shell collecting remains pleasant** and should not be replaced with hazards or fail pressure.
- **More cute Bupa noises would help** (visual chips today; audio still out of scope per README).
- **Single biggest missing ingredient:** depth and a bigger variety of identifiable objects on the beach.
- **Next opportunity:** richer, legible beach objects and authored Bupa interactions — **not** rescue/tide/hazard mechanics.

## Design Principles for This Pass

- **Beach-legible before clever.** A reader should recognize the object as a beach thing in under a second at gameplay scale. If an object needs a label, it is the wrong object for this pass.
- **Bupa-first.** Objects matter because **Bupa reacts to them**. An object with no authored Bupa behavior is set dressing; an object with a one-beat Bupa reaction is a moment. Prefer the latter.
- **Small authored moments over new systems.** No new state machine, no new economy, no new fail axis. Each moment is a branch inside the existing investigate cycle (per `target.type`), the same pattern 0005's A1 already established.
- **Low pressure, no fail state.** Nothing added may punish, threaten, time-limit, or fail the player. Every new element is charming, optional, and consequence-free.
- **Preserve controller-friendly movement.** No input changes, no new buttons, no menus. Sailor's movement and Bupa's wander/pause/check-back rhythm stay as they are.
- **Avoid content treadmill.** A small number of strong object types with distinct Bupa beats beats a large catalog of shallow ones. The pass is judged on feel, not feature count.
- **One or two strong object types are better than many shallow ones.** If scope forces a cut, cut breadth, not depth per object.
- **Stay inside the protected visual vocabulary.** Plain fills, sparse detail, chunky even-rect grid, no new tones on protected sprites, no banned texture vocabulary (per reviews 0007/0008 and 0005 §6). New objects are drawn in the established beach palette, not a new one.

## Candidate Beach Objects

A practical menu, grouped by category. "First-slice safe" means: small asset cost, single-beat Bupa behavior, no new system, no protected-system touch.

### A. Beach-life props (human-made, recognizable)

#### Beach ball
- **Visual readability:** High. Round, bright, striped — reads instantly even at chunky pixel scale. Distinct from any existing object.
- **What Bupa might do:** Bat it with a paw (the existing tidepool-bat performance, retargeted), watch it roll a short distance, then lose interest. Optionally a tiny bounce on first contact.
- **What Sailor might notice:** The ball moves slightly when Bupa hits it — a readable cause-and-effect moment without being a toy Sailor controls.
- **First-slice safe:** Yes. Strongly recommended.

#### Umbrella
- **Visual readability:** High. Triangular canopy on a stick, bright color. Reads as "beach umbrella" at a glance.
- **What Bupa might do:** Circle the umbrella's shadow, or sit in its shade and slow-blink. A "cat found a sun/shade patch" beat.
- **What Sailor might notice:** A clear landmark on the beach — helps spatial orientation without a map.
- **First-slice safe:** Yes. Recommended as a second object.

#### Deck chair
- **Visual readability:** High. Striped rectangular seat on a frame. Reads as "beach chair."
- **What Bupa might do:** Hide/sit underneath it (only the head/tail visible), or rub against the leg. A "cat found a hiding spot" beat.
- **What Sailor might notice:** A place where Bupa disappears briefly — a small "where did he go" beat that rewards watching.
- **First-slice safe:** Yes. Alternate to umbrella if only one shade-object fits.

#### Towel
- **Visual readability:** Medium-high. Flat rectangle with a stripe, on sand. Could be mistaken for a sand patch if drawn poorly — needs a clear edge and a corner that lifts.
- **What Bupa might do:** Paw at a lifted corner, or knead/paddle on it (cat kneading behavior).
- **What Sailor might notice:** A small domestic detail that makes the beach feel visited.
- **First-slice safe:** Yes, but lower priority than ball/umbrella/chair — the towel's Bupa beat overlaps with the chair's.

#### Sandcastle
- **Visual readability:** Medium. Needs a clear bucket-shaped tower and base to read at pixel scale. Risk of reading as "lumpy sand."
- **What Bupa might do:** Investigate without destroying — sit beside it, nose the tower, tail very still (a "cat being careful" beat). **Do not** let Bupa destroy it; that turns whimsy into a consequence.
- **What Sailor might notice:** Evidence of other people/kids — light worldbuilding.
- **First-slice safe:** Borderline. The "investigate without destroying" beat is charming but the asset cost is higher than the ball. Defer unless the first slice grows.

#### Bucket and spade
- **Visual readability:** Medium. Small, low to the ground. Best paired with a sandcastle as a single prop cluster.
- **What Bupa might do:** Sit inside the bucket (if sized to fit), or bat the spade handle.
- **What Sailor might notice:** Same as sandcastle — visited-beach evidence.
- **First-slice safe:** No as a standalone; bundle with sandcastle if that is picked.

#### Picnic basket / cooler
- **Visual readability:** Medium-high. Rectangular with a handle/lid. Reads as "picnic thing."
- **What Bupa might do:** Sniff intently, paw at the lid, sit on top of it (very cat). A "cat wants what's inside" beat.
- **What Sailor might notice:** A small mystery — what's in there? (Never answered; the question is the point.)
- **First-slice safe:** Borderline. Good charm-per-effort but a third human-made prop risks crowding the first slice. Defer.

### B. Natural objects (washed-up)

#### Washed-up seaweed
- **Visual readability:** Medium. Dark green clump with a few trailing strands. Risk of reading as "dark sand patch."
- **What Bupa might do:** Sniff, recoil slightly, then sniff again (a "cat deciding about a smell" beat). Charming and very cat.
- **What Sailor might notice:** A natural-detail moment.
- **First-slice safe:** Borderline. Readability risk pushes it below the human-made props for a first slice.

#### Driftwood (only if made more readable)
- **Visual readability:** Currently exists in the prototype. Playtest 0011 did not single it out as a problem, but it is not strongly beach-legible either — it can read as "log" or "stick."
- **What Bupa might do:** Already has a scratch/rub performance (per README). Keep, but consider enlarging/re-stylizing for legibility if revisited.
- **What Sailor might notice:** Already a known object.
- **First-slice safe:** Keep as-is; do not invest in it this pass unless the first slice grows.

#### Crab (decorative / reactive)
- **Visual readability:** High. Already exists as an ambient decorative critter (per README and 0005 C1).
- **What Bupa might do:** Startle at a crab (a brief hop-back, then re-approach), or track it with eyes only. A "cat meets a small animal" beat.
- **What Sailor might notice:** A moment of life.
- **First-slice safe:** The crab already exists; adding a Bupa-startle beat is cheap **if** the crab and Bupa are ever near each other. Not a new object — a new Bupa reaction to an existing object. Optional garnish.

### C. Characters

#### Other kids
- **Visual readability:** Medium-high. Small back-facing sprites like Sailor, varied hair/outfit colors. Risk of reading as "more Sailors" — need silhouette variety.
- **What Bupa might do:** Approach, sniff, get petted (a brief animation), then move on. Or ignore them entirely (also very cat).
- **What Sailor might notice:** The beach feels populated; light social world.
- **First-slice safe:** No. New character sprites plus authored social beats are too much for the first slice. Strong candidate for a later pass.

#### Mum and Dad at the start
- **Visual readability:** High. Two adult-sized back-facing sprites at the bottom of the beach, near where Sailor begins.
- **What Bupa might do:** Pause near them on the way up the beach, look back at Sailor, then continue. A "this is home base" framing beat.
- **What Sailor might notice:** A start framing — "I came from here" — without any text.
- **First-slice safe:** Yes, as **non-interactive start-area anchors only**. Lowest-cost worldbuilding. Optional add-on to the first slice.

## Scripted Bupa Investigation Ideas

A menu of small authored Bupa moments. Each is a single beat inside the existing investigate cycle (the middle 40% stage per 0005 A1 / README), not a new system.

### 1. Batting a beach ball
- **Player-facing beat:** Bupa trots to a beach ball, paws it, watches it roll a short distance, sits.
- **Required assets/code complexity:** New beach-ball sprite + retarget the existing tidepool-bat performance. Low.
- **Risk:** Ball physics could become a toy Sailor must interact with — keep it cosmetic, no player control, no score.
- **Why it helps depth:** Gives Bupa a recognizable object to "be a cat" at; the most legible possible Bupa moment.

### 2. Hiding under a deck chair
- **Player-facing beat:** Bupa trots to a deck chair, ducks underneath, only head/tail visible for the pause, then emerges.
- **Required assets/code complexity:** New deck-chair sprite + a "hidden" Bupa draw variant. Low-medium.
- **Risk:** Bupa disappearing could read as a bug if the chair sprite is too opaque — keep head/tail clearly visible.
- **Why it helps depth:** A "where did he go" beat rewards watching; adds a hide/seek texture to the investigate cycle.

### 3. Sniffing a picnic basket
- **Player-facing beat:** Bupa sniffs intently, paws the lid, sits on top.
- **Required assets/code complexity:** New basket sprite + a sniff/sit-on-top performance. Low-medium.
- **Risk:** Implies contents the game never delivers — fine if framed as mystery, risky if it reads as a promise.
- **Why it helps depth:** A "cat wants what's inside" beat is universally legible cat comedy.

### 4. Pawing at a towel corner
- **Player-facing beat:** Bupa paws a lifted towel corner, then kneads/paddles on the towel.
- **Required assets/code complexity:** New towel sprite + a knead performance. Low.
- **Risk:** Knead animation could read as stuck/looping — keep it brief (one or two cycles).
- **Why it helps depth:** Kneading is a deeply cat behavior that reads even at pixel scale.

### 5. Startling at a crab
- **Player-facing beat:** Bupa hops back from a crab, re-approaches, tracks it with eyes, loses interest.
- **Required assets/code complexity:** Uses the existing crab; new Bupa startle + eye-track performance. Low.
- **Risk:** Must not become a hazard or a chase — the crab stays decorative and the startle is cosmetic.
- **Why it helps depth:** A "cat meets critter" beat adds life without a new system.

### 6. Slow-blinking near Sailor
- **Player-facing beat:** Already exists (idle-affection, per 0005 A2 / README). Reinforce, do not rebuild.
- **Required assets/code complexity:** None new.
- **Risk:** None if left as-is.
- **Why it helps depth:** Already the cheapest "watch and care" payoff; keep it.

### 7. Meowing back toward Sailor
- **Player-facing beat:** During a check-back, Bupa meows; if Sailor is close, Bupa meows again (a "conversation" beat) instead of just sitting.
- **Required assets/code complexity:** Reuses the existing meow chip; adds a second-chip branch on proximity. Very low.
- **Risk:** Could spam chips if tuned wrong — cap at one reply per check-back.
- **Why it helps depth:** Turns the check-back from one-way worry into two-way exchange (extends 0005 A3).

### 8. Investigating a sandcastle without destroying it
- **Player-facing beat:** Bupa sits beside a sandcastle, noses the tower, tail very still, then leaves it intact.
- **Required assets/code complexity:** New sandcastle sprite + a careful-investigate performance. Medium.
- **Risk:** Any destruction turns whimsy into consequence — must be non-destructive.
- **Why it helps depth:** A "cat being careful" beat is rare and charming; adds restraint as character.

### 9. Circling an umbrella shadow
- **Player-facing beat:** Bupa trots a slow circle around the umbrella's shadow, then sits in it and slow-blinks.
- **Required assets/code complexity:** New umbrella sprite + a shadow shape + a circle-then-sit performance. Low-medium.
- **Risk:** Shadow must read as shade, not as a separate object — keep it clearly attached to the umbrella.
- **Why it helps depth:** "Cat found a shade patch" is a universally legible cat beat.

### 10. Pausing near Mum/Dad at the start
- **Player-facing beat:** On the first part of the beach, Bupa pauses near the two adult sprites, looks back at Sailor, then continues up the beach.
- **Required assets/code complexity:** Two new adult sprites (back-facing, larger than Sailor) + a look-back performance (already exists in check-back). Low.
- **Risk:** Must not become a tutorial or a dialogue — they are silent anchors.
- **Why it helps depth:** Frames the start as "from home" without a word of text.

## Recommended First Slice

A deliberately tiny, testable first implementation slice. **2–3 object/interactions maximum.**

1. **Retire the common tidepool-like POI as the default common object.** Tidepools, if they remain, become occasional, larger, and connected to the ocean (per playtest 0011). The default common POI slot is freed for a beach-legible object.
2. **Add the beach ball** with Bupa's batting/nosing behavior (Idea 1). This is the single most legible Bupa moment and the cheapest strong win.
3. **Add the deck chair OR the umbrella** with Bupa's hide/circle/shade behavior (Idea 2 or 9). Pick one, not both. The umbrella's shade-circle beat is slightly more distinctive; the deck chair's hide beat is slightly more charming. Either is fine.
4. **Optionally add Mum and Dad** as non-interactive start-area anchors (Idea 10). Lowest-cost worldbuilding; cut if scope tightens.

**Cut from this slice:** towel, sandcastle, bucket-and-spade, picnic basket, seaweed, other kids, crab-startle. These remain on the menu for a later pass if the first slice lands.

**Test for the slice:** the follow-up playtest asks one question — *"Does the beach feel less empty, and can you tell what Bupa is investigating?"* If the answer is yes, the direction is validated and the menu can be expanded. If no, the diagnosis (legible objects + authored Bupa beats) is wrong and should be revisited before adding more objects.

## Explicit Non-Decisions

- **No fail state ratified.**
- **No rescue mechanic ratified.**
- **No tide/waterline mechanic ratified.**
- **No hazard system ratified.**
- **No scoring/economy redesign ratified.** Shell collection rules, forfeit-on-scroll, spawn counts, and collection radius stay exactly as they are.
- **No source-of-truth update ratified.** `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, `BALANCE_NOTES.md` are untouched by this artifact.
- **No commitment that Sailor/Bupa replaces Trail of Embers.** Sailor/Bupa remains exploratory.
- **No audio ratified.** Bupa noises remain visual chips; audio stays out of scope per the prototype README.
- **No new menus, no new input, no new systems.**

## Open Questions

- Should objects be **mostly decorative/reactive**, or should they **gently route Bupa** (i.e., bias his target selection toward recognizable props)? The latter adds depth but edges toward scripting the cat; the former keeps him autonomous.
- Should **Mum and Dad** exist only as start framing, or become a **home-base** Sailor can return to? Home-base implies a return-loop the prototype does not currently have.
- Should **other kids** be **background life** (silent sprites) or **interactable moments** (Bupa approaches, gets petted)? Background is cheaper; interactable is warmer.
- How much **authored scripting** can be added before it feels like a **content treadmill** — i.e., before the beach feels like a checklist of Bupa beats rather than a place Bupa explores? The "one or two strong object types" principle is a guardrail, not a proven limit.
- What is the **minimum slice** that makes the beach feel less empty? Is the recommended first slice (ball + one shade object) enough, or does it need Mum/Dad to read as "visited"?
- Should the **tidepool** be retired entirely, or kept as an occasional large ocean-connected feature? Playtest 0011 leaves both options open.
- Should Bupa's **per-object performances** stay single-beat, or is there room for a two-beat performance (e.g., bat → watch → sit) on the strongest object? Two-beat risks the content treadmill; one-beat is safer.

## Source-of-Truth Status

This is a **prototype direction brief only**. It specifies a bounded exploratory pass on one prototype and ratifies nothing about the game, the shell philosophy, the low-pressure direction, or the object catalog.

Do not update, and this artifact does not update:

- `GAME_TRUTH.md` — untouched
- `DESIGN_PRINCIPLES.md` — untouched
- `MECHANICS.md` — untouched
- `DECISION_LOG.md` — untouched
- `PLAYTEST_LOG.md` — untouched
- `BALANCE_NOTES.md` — untouched

If this pass and its playtest validate the legible-objects + authored-Bupa direction, ratification is a later, separate decision — not part of this artifact.
