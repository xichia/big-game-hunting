# Review: Sailor and Bupa: Go to the Beach — Visual Cohesion Pass (0005)

ARTIFACT TYPE: Review
AUTHORITY: REVIEW
STATUS: Complete
CREATED BY: Fable (skeptical visual/design reviewer)
DATE: 2026-07-06
REVIEWS: visual-cohesion pass in `prototypes/sailor-and-bupa-go-to-the-beach/index.html` and `README.md`
VISUAL REFERENCE INSPECTED: `prototypes/sailor-and-bupa-go-to-the-beach/assets/visual-reference.png`
METHOD: Code read plus headless-Chrome renders of the actual file — live opening frame, a jumped-ahead in-context scene (Bupa investigating the first interest point among shells), and a scratchpad sprite-gallery harness that draws every shell type, interest point, and Bupa pose at true gameplay scale using the prototype's own draw functions. No source files were modified.
SOURCE-OF-TRUTH FILES TOUCHED: none

This review evaluates an exploratory prototype's visual pass only. It ratifies nothing and changes no source-of-truth or Trail of Embers files.

---

## 1. Verdict

**SMALL_VISUAL_FIXES_BEFORE_PLAYTEST**

The pass is a real improvement — the shared half-resolution pixel buffer genuinely unifies the visual language, the terrain texture work is tasteful rather than noisy, and Sailor now unambiguously reads as back-facing. But two of Ian's six explicit requests are not actually delivered at gameplay scale, and I verified both against rendered output, not the code's intentions:

1. **Shells still don't read as shells.** The most common silhouette (fan/scallop) renders as a small tan *teepee/cone*, and two of the six shell colors are nearly the same value as the sand, so many shells are both ambiguous and hard to see.
2. **The pigtails don't read as pigtails.** They are large, but the 1–2 world-pixel gaps separating them from the head are destroyed by the half-resolution downscale, so head + pigtails fuse into one brown mass that reads as a puffy hat.

Additionally, one new readability bug: **Bupa's body gray and the rock interest point are the identical hex (`#808285`, lines 954 and 1109)**, and Bupa stops within 10px of the point's center — so at every third stop, the cat visually merges into the rock exactly when the player most needs to read his posture tell.

All fixes are small (color swaps, a shape flip, a few pixels of spacing). If Ian playtests now, he will very likely repeat the same "shells should look like shells" note, which wastes the playtest. Fix first, then playtest.

## 2. Assessment against the review questions

| # | Question | Read |
|---|---|---|
| 1 | Shells read as shells? | **No, mostly.** Fan/scallop reads as a cone/teepee (it's drawn apex-up — inverted relative to the iconic fan-spreading-up scallop in the reference). Spiral reads as a pebble with a smudge at small sizes. Clam-arc reads as a mushroom cap. Color + ground shadow make them read as *pickups*, but not as *shells*. |
| 2 | Cohesive pixel-art surfaces? | **Yes.** Ocean bands + sparkles, blocky foam edge, wet-sand dapples, dry-sand speckles, and dune tone all read as one language through the shared buffer. Best part of the pass. |
| 3 | Texture helpful or noisy? | **Helpful.** Speckle density is restrained; the 48px tile shading reads as subtle ground variation, only faintly grid-like. Not noise. |
| 4 | Sailor back-facing? | **Yes, clearly.** No face pixels; nape sliver + collar sell it. |
| 5 | Pigtails prominent? | **Prominent but illegible as pigtails.** They fuse with the head into a single hat-like mass (see §4.2). Hair ties are nearly invisible after downscale. |
| 6 | Reads as small child? | **Yes.** Big head-to-body ratio, tiny dress/socks/shoes — reads as a little kid, not a teen. |
| 7 | Bupa mostly gray, little white? | **Yes.** Gray body, dark-gray legs/tail/ears, small white paws + chest patch. Correct. |
| 8 | Bupa's read preserved? | **Mostly yes.** The check-back sitting sprite (facing the viewer, green eyes, white chest) is the strongest sprite in the game. Trot reads as a small quadruped, slightly generic but fine. Exception: gray-on-gray fusion at rock stops (§4.1). |
| 9 | Vegetation richer without competing? | **Yes.** Tufts and dune plants are layered and confined to the dune strip. Minor: they repeat at fixed x-positions every 120px, so they form visibly regular columns. |
| 10 | Interest-point types readable? | **Yes as types** — gray rock, brown log (+tuft), blue pool are cleanly distinct at a glance. The unvisited "•" marker is invisible at pixel scale (harmless). But posture staging is *proportional* to pause length, not per-type (see §5.2), so posture alone doesn't distinguish short from long — the type itself carries the tell, which is acceptable. |
| 11 | One cohesive visual language? | **In-world, yes** — the biggest win of the pass. The remaining break is the DOM chrome: dark "console" HUD/debug/restart panels and the dark meow-bubble chip vs. the reference's warm parchment panels. Pre-existing style, not part of Ian's asks; noted, not blocking. |
| 12 | Visual changes undermine readability? | **Two hits:** Bupa/rock gray fusion, and sand-toned shells (`#f5dbb5` on `#f0e3c5` sand) that nearly vanish. Also the opening viewport shows zero shells and zero interest points (first point spawns ~560px above Bupa's start) — an empty first impression; likely pre-existing, but Ian will see it first. |
| 13 | Mechanics changed? | **Cannot be verified — and that's a process problem.** `index.html` is *untracked*; the first playable was never committed and has been overwritten in place, so there is no diff to check the "no mechanics changed" claim against. The code as it stands matches the README's mechanics (states, tells, check-back, scarcity, 10 stops, WASD/R), and the required grep found no hearts/health/lives/countdown — only internal `pauseTimer`/`meowTimer` variables and the out-of-scope list itself. |

## 3. Strongest visual improvements (do not lose these)

- **The shared half-res pixel buffer with nearest-neighbor upscale.** This single decision is what makes the scene feel like one piece of pixel art instead of vector primitives with pixel decorations. It is the correct architecture and must survive any revision.
- **Terrain layering:** ocean bands + blocky animated foam edge + wet-sand strip + speckled dry sand + darker dune band reads as a real beach cross-section, faithful to the reference's left-to-right structure.
- **Bupa's check-back sit** — instantly reads as "cat sitting, looking back at you." This is the emotional core of the proximity mechanic and it works.
- **The consistent ground-shadow rule** under every object grounds the whole scene.
- **Restraint:** no new mechanics smuggled in under the visual pass banner (as far as the code shows), no hearts, no timers, README out-of-scope list intact.

## 4. Exact small fixes recommended before Ian playtests

Ordered by impact; all are minutes of work.

### 4.1 Un-fuse Bupa from the rock (1-line color change)
Rock fill at line 954 and Bupa's `gray` at line 1109 are both `#808285`. Change the rock to a warmer/darker stone (e.g. `#6e6a63` with highlights/shadows shifted to match) — or have Bupa stop ~24px short of the point center. The color change is safer (no behavior touch). Without this, the posture tell is unreadable at every rock stop.

### 4.2 Separate the pigtails from the head
The gaps between head block and pigtail blocks are 1–2 world px, which is 0.5–1 px in the half-res buffer — they antialias away. Widen the inner gap to 3–4 world px (or draw a `hairShadow` column on each pigtail's inner edge), and enlarge/brighten the hair ties (currently 3px tall amber bands that all but disappear). Target read: head, then two distinct bunches hanging at the sides, as in the reference.

### 4.3 Flip the fan/scallop shell the right way up
The fan is drawn apex-up, curved edge down — it reads as a teepee/sand cone. The iconic scallop (and the reference image's shells) has the hinge at the *bottom* with the fan spreading *up*. Mirror the shape vertically. This is the single highest-leverage shell fix because shapeType 0 is a third of all spawns and the most-seen silhouette.

### 4.4 Cut the sand-toned shell colors
`#f5dbb5` and `#dfbeab`/`#e8dfd8` are close in value to the dry sand (`#f0e3c5`). Keep the pink (`#e8a9a0`), lavender (`#c9b8d9`), and one bright cream, and consider nudging shell `size` min from 7 to ~9. Shells are the greed objects; they must pop at a glance for the detour decision to be a decision.

### 4.5 (Optional, cheap) Soften the "Shells Missed" red
The live-HUD missed counter in red (`#c95c5c`) is the only punitive-feeling signal in the game. Neutral gray in the HUD (keep "Forfeited" on the end card) better fits "no penalty, just tide-of-life scarcity." Not blocking.

### 4.6 (Optional) Nudge one interest point + a few shells into the opening viewport
The first stop spawns ~560px above Bupa's start, so the opening frame is bare sand. Seeding the first point ~250–300px up (or scattering 2–3 shells near the start) makes the first five seconds show the game instead of an empty beach. Only if trivially safe — this touches `generateLevel`, so if there's any doubt about mechanics drift, skip it and let the playtest speak.

## 5. Things Sonnet must NOT change if asked to revise

- **The half-res pixel buffer pipeline** (`PIXEL_SCALE`, nearest-neighbor blit). Everything cohesive flows from it.
- **Bupa's palette and sprites** — mostly gray, small white paws/chest, green eyes, and especially the check-back sitting pose. Ian signed off on Bupa's read; only the *rock's* color moves in fix 4.1.
- **Any tuning constant or mechanic:** speeds, radii, pause-duration table, 10 stops, scarcity/forfeit rule, controls, session structure. This remains a visual-only revision.
- **Terrain texture density.** The current speckle/tile restraint is correct; do not "enrich" it further — more texture becomes noise.
- **The README's out-of-scope list** and the probe question.
- Do not reintroduce anything from the banned list: hearts/health, countdown UI, labeled comfort meter, shell rarities.

### 5.2 README accuracy note (fix the doc, not the code)
The README states rock = "standing sniff" and driftwood = "sniff then sitting stare," but the code stages postures by *fraction* of any pause (40%/40%/20%), so even a 2-second rock stop cycles sniff → sit → alert in ~2s, which can look twitchy. Either the README line should describe the actual behavior, or (post-playtest, if Ian confirms the twitch) stages could be gated by absolute time. For now this is a documentation mismatch, not a required code change.

### 5.3 Process hygiene (for Ian)
The first playable was never committed — `index.html` is untracked and has been overwritten in place by the visual pass. The "no mechanics changed" claim is therefore unverifiable by diff. Recommend committing the prototype after each pass going forward so review gates can actually check such claims.

## 6. Playtest / aesthetic signals Ian should watch for (after fixes)

- **Shell naming test:** ask a fresh viewer "what are those?" pointing at the beach. "Shells" without hesitation = pass. "Little tents / rocks / candy?" = the shape language still isn't there.
- **Pigtail test:** same — "a girl with pigtails" vs. "a kid in a hat."
- **Rock-stop visibility:** when Bupa investigates a rock, can you still instantly say what he's doing? If your eye loses him, fix 4.1 didn't go far enough.
- **Texture at motion:** while walking, does the sand speckle/tile pattern shimmer or crawl distractingly? (Static renders look clean; motion is the remaining unknown — I could not exercise sustained real-time play headlessly.)
- **Meow-bubble tone:** does the dark chip read as UI or as Bupa speaking? If it breaks immersion during the check-back — the game's key emotional beat — a white comic-style bubble is the follow-up.
- **First five seconds:** does the empty opening stretch make the game feel unstarted? If Ian comments on it unprompted, promote fix 4.6 from optional to required.
- **Whole-language check:** with the world now cohesive, does the dark console HUD start to feel like the odd one out? If yes, a parchment-styled HUD (per the reference) is the natural next cosmetic pass — world art should not be touched for it.

## 7. Decision block

- [ ] Apply fixes 4.1–4.4 (+4.5/4.6 optional), then playtest
- [ ] Override: playtest as-is
- [ ] Send back for broader visual revision
- [ ] Park
