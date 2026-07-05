# Trail of Embers — Visual Design Language Directions

## Status

Exploratory design artifact. Not source-of-truth. Not implementation approval.

## Current Prototype Read

`prototypes/trail-of-embers/index.html` is entirely programmer-art, drawn
fresh every frame with plain canvas primitives:

- **Player** — a single filled circle, radius 10, warm pale yellow (`#e8d27a`). No facing, no animation, no state change (moving, idle, near-death all look identical).
- **Beast/ghost** — a single filled circle, radius 13, dull red (`#b23a3a`). Same no-state-change treatment. Only visible at all when it happens to stand inside a lit hole in the fog — there is no separate "beast glow" or silhouette, it's just the same disc under the same fog rules as everything else.
- **Embers** — small (radius 10) radial gradient blobs, orange (`rgba(255,140,40,…)`) fading to transparent, drawn at each drop point, alpha fading out after the ember goes cold.
- **Torch/light** — not drawn as an object at all; it exists only as a hole punched in the fog layer (a radial-gradient "destination-out" composite). There's no visible torch flame, halo, or flicker — the player is just standing in a lit disc.
- **Darkness/fog** — one full-screen black canvas layer with soft-edged circular holes punched at the player and any hot embers; this is the entire lighting model, and it doubles as monster-visibility (the beast is only seen when standing in a punched hole).
- **Walls/maze** — flat-filled brown-grey rectangles (`#3a2f22`), no texture, no distinction between wall types (dead-end wall vs. baffle vs. landmark block all look the same).
- **Safe zone** — a flat grey-green filled circle with a lighter stroke ring (`#8a8a78` fill, `#cfcfae` stroke) — reads as "a stone circle" only because the README says so.
- **Debug overlay** (`G` key) — dashed white circles for torch/ember radii, a yellow outline + text label on the beast, and a yellow line from the beast to its current AI target point. Not part of the play experience, but worth preserving as-is since it's the facilitator's primary diagnostic tool.
- **Background** — flat dark green-black fill (`#0e1a10`) under the fog, plus a page background of near-black (`#0a0a08`) and a monospace HUD line at the top (`Menlo, Consolas, monospace`, muted mauve-grey text with amber key-hints).

Everything is opaque, flat-shaded, and static except the fog holes and the ember fade. There is no glow on the player or beast, no motion trail, no directional facing, no silhouette distinction between "hunter" and "hunted."

## Design Problem

**What the dots do well:** they are instantly legible. Nothing is ambiguous — player, beast, ember, wall, and goal are five different shapes/colors with zero overlap in visual grammar, which is very likely part of why every playtest so far reports understanding the scene "without instruction." The flat, low-detail style also means every level — however large or maze-like — costs zero art time to add, which has let five levels ship in five passes without a single art task on the critical path. That production-free elasticity is a real asset, not just a placeholder to be tolerated.

**What they may lack:**

- **Mood ceiling.** The palette and shapes carry almost no atmosphere beyond "dark screen, colored dots." The prototype's own playtest notes already describe strong emergent mood ("good mood," "map memorization," "controlled lost") — that's coming from the *mechanic* (fog + AI + bait), not from the visuals reinforcing it. The visuals are currently a neutral vessel, not a mood amplifier.
- **Player attachment.** A tan circle has no identity. Nothing on screen says "this is a small vulnerable person carrying fire" versus "this is a token." There's no visual reinforcement of the core fantasy (fire-bearer, prey, survivor).
- **Enemy identity.** The beast is a red circle. It carries no read on *what* it is — beast, ghost, wraith, hound — and the brief itself is ambivalent (probe brief says "beast," README says "beast/ghost" interchangeably). Right now the game hasn't had to answer that question because the dot doesn't ask it.
- **Watchability.** If this were shown to someone else (a demo, a trailer frame, a screenshot for a pitch), the current build reads as an engineering test harness, not a game moment — which is fine for a probe, but is a real gap if/when the goal shifts from "prove the mechanic" to "show someone this is worth building."
- **Long-term distinctiveness.** "Light as tool and bait" is genuinely the hook. Visually, nothing about the current build telegraphs that the *light itself* is the main character. The torch has no rendered presence at all (it's implicit, not drawn) and the ember is a small blob that looks decorative rather than load-bearing.

None of this is a readability failure today — it's a ceiling. The mechanic has outgrown the visuals faster than the visuals have kept up, per Ian's own trajectory notes across playtests (wanting "bigger," "tighter," "more distinctive," "a very good game if scaled carefully").

## Visual Direction Principles

1. **Restrained, not ornate.** Add presence through light and silhouette, not through detail. Every new visual element should be justifiable as "makes the core loop clearer or more felt," not "makes the scene busier."
2. **Warm light against deep, near-black darkness.** Keep the fog absolute — the game's entire tension depends on "you can only see what's lit." Push the *lit* areas warmer and richer instead of touching the dark.
3. **Character through silhouette, not detail.** No faces, no textures, no sprites. A recognizable *shape* (say, a small hooded figure vs. a low four-legged hunched form) reads at a glance and costs nothing beyond a `path`/`arc` composition.
4. — **Clarity over decoration.** Any glow, trail, or particle effect must never reduce the crispness of the collision-relevant edges (player position, beast position, wall edges, safe-zone boundary). Decorative effects sit *behind* or *around* the functional shape, never on top of it.
5. **Motion and glow as identity, not animation-as-labor.** A flicker, pulse, or trail can be done with a sine wave and a canvas gradient — no sprite sheets, no keyframes. Identity comes from *how something moves/glows*, not from drawn detail.
6. **The maze as negative space.** Walls are currently "things that block." They could instead read as *the shape carved out of the dark by the torch* — i.e., lean into fog-and-silhouette instead of flat-fill blocks, so the maze itself feels like part of the darkness rather than a separate UI layer.
7. **Technical elegance with handmade tension.** Keep geometry precise and intentional (clean arcs, deliberate color relationships) but let something feel slightly unstable or alive — a flicker, an irregular pulse, a faint jitter — so the "quiet premium tool" feel doesn't tip into sterile/corporate.
8. **One accent color family, used sparingly.** Warm amber/ember as the *only* saturated, glowing color in the frame. Everything else (walls, fog, UI text) stays desaturated and dark so the light — the actual subject of the game — is the only thing that visually pops.

## Player Visual Directions

### 1. "Ember-Bearer" (recommended baseline)

- **Description:** A small dark silhouette (a rounded triangle or teardrop shape, point-up, like a cloaked figure) with a single warm ember-core glow at its center/chest, radiating a soft short-range gradient halo that sits just inside the torch radius.
- **Silhouette/readability:** Very high — a pointed shape reads as "facing" for free (can orient the point toward last movement direction, giving implicit directional facing with zero extra state beyond last dx/dy already tracked in input handling).
- **Animation/glow:** A slow sine-wave pulse (period ~1.5–2s) on the core glow's radius/alpha — "breathing ember" — using `Math.sin(elapsedMs / k)` already available in the frame loop. No sprite needed.
- **Production cost:** Very low — one path fill + one radial gradient + one sine term.
- **Risk:** A pointed shape is very slightly larger/more complex to collide-test visually against the existing circular hit-radius; keep the *collision* circle unchanged and purely cosmetic-shape the fill.

### 2. "Torch-Carrier"

- **Description:** Keep the circular body, but add a small thin line/wedge extending from the body toward last-movement-direction, tipped with a tiny brighter dot — an implied torch held out in front.
- **Silhouette/readability:** High, though slightly busier than a pure silhouette; the "held light" reads immediately as "this is the light source," reinforcing the tool-and-bait theme directly on the player model.
- **Animation/glow:** The tip dot could flicker independently of the body (small random-ish jitter via a low-amplitude noise function or two overlaid sine waves at different frequencies) to sell "flame," while the body stays a stable, calm dark silhouette — light is precious and separate from the person carrying it.
- **Production cost:** Low — one extra line/wedge, one extra small radial gradient.
- **Risk:** The extended wedge could be misread as a hitbox or weapon; needs a clearly non-threatening, thin, warm-colored treatment to avoid signaling "attack range."

### 3. "Ash-Ember Trail"

- **Description:** Body stays a simple dark disc/silhouette, but moving leaves a very short, fast-fading trail of tiny ember-colored particles/afterimages behind it (3–5 fading circles keyed to recent position history).
- **Silhouette/readability:** High for the body itself; the trail is a secondary read that reinforces "you are made of embers, you leave a trace" — thematically strong (the beast literally follows your trail, so a visual trail is a direct metaphor, even though the trail itself must NOT be a real gameplay light-event).
- **Animation/glow:** Trail segments fade in alpha over ~300–500ms using a small ring buffer of past positions — cheap, frame-loop-native.
- **Production cost:** Low-medium — needs a small position-history array (new but trivial state) and a fade loop.
- **Risk:** Easy to confuse players into thinking the visual trail is a *mechanical* light event the beast can smell (it explicitly is not, since only real embers create AI targets) — would need to be visually clearly distinct from real embers (cooler tint, much smaller, much faster fade) to avoid teaching a false mental model.

## Beast / Ghost Visual Directions

### 1. "The Hollow Hound" (beast-leaning)

- **Description:** A low, elongated, hunched quadruped silhouette — a simple flattened ellipse body with two small angular triangle "ears/hackles," no visible legs (implied motion via silhouette lean/tilt toward its current target).
- **Silhouette/readability:** High and instantly distinguishes from the player's compact upright shape — long and low vs. small and upright.
- **Attraction-to-light tell:** Silhouette leans/stretches slightly toward its current AI target point (the same vector already drawn in the debug overlay's target line) — i.e., a subtle stretch/skew transform toward `targetPt`, present but faint, so it's a texture, not an obvious tell.
- **Beast vs. ghost read:** Reads clearly as **beast** — physical, predatory, grounded.
- **Production cost:** Low — one path (ellipse + two triangles), one skew transform driven by existing target-vector math.
- **Risk:** A skew/stretch effect that's too strong risks turning into an unintentional gameplay tell (revealing AI state more clearly than the debug view does) — keep it subtle enough that it reads as texture, not as a readout.

### 2. "The Wraith" (ghost-leaning)

- **Description:** A soft, translucent, vertically-elongated teardrop/flame-shaped form with no hard edge — rendered as a radial-gradient blob (dark violet-grey core fading to transparent) rather than a flat fill, so it visually "belongs" to the darkness even when lit.
- **Silhouette/readability:** Medium-high — deliberately softer-edged than the player, which is itself a design statement ("the hunter is less solid, less real, than you are") but needs a consistent minimum-opacity core so it never becomes genuinely hard to see when lit.
- **Attraction-to-light tell:** Since it's translucent, could subtly brighten/tighten its gradient core when actively "locked on" to a hot ember vs. drifting toward the torch — cheap (two gradient-stop presets swapped by AI state, already tracked as `beast.state`).
- **Beast vs. ghost read:** Reads clearly as **ghost/wraith** — eerie, ethereal, ambiguous.
- **Production cost:** Low-medium — gradient fill instead of flat fill, plus a state-driven color swap using existing `beast.state` values (`idle`/`patrol`/`chase-ember`/`chase-torch`).
- **Risk:** Translucency plus the black fog layer could compound to make it too hard to spot in the frantic tail-end of a chase — needs a guaranteed-visible minimum alpha at its core regardless of glow state, tested directly against actual fog-hole brightness.

### 3. "The Ember-Eyes" (minimal-change direction)

- **Description:** Keep the current flat disc almost as-is, but add two small, bright dot "eyes" offset toward the current movement direction, using the same warm ember color family as the player's light (visually implying "it's hunting your fire specifically" — its eyes are lit *by* what it's chasing).
- **Silhouette/readability:** Very high — closest to the current shape, so this is the lowest-risk, lowest-novelty option.
- **Attraction-to-light tell:** The eye color/brightness could shift slightly (dim ember → bright ember) when `beast.state === "chase-ember"` vs. `"chase-torch"` vs `"idle"`, giving a tiny in-fiction readout of intent without touching the debug overlay.
- **Beast vs. ghost read:** Ambiguous by design — could be beast or ghost, which may be the right call at this stage since the design brief itself hasn't committed to one (see comparison below).
- **Production cost:** Very low — two small filled circles added to the existing draw call.
- **Risk:** Smallest visual delta of the three — good as a safe first pass, but may not move the needle enough on "watchability"/distinctiveness that Ian is asking for.

**Beast vs. ghost/wraith as an identity choice:** the brief and README use "beast" and "beast/ghost" interchangeably, meaning this has never actually been decided. A **beast** framing (Direction 1) reads as primal/animal threat — grounded, physical, "something is hunting you in the woods." A **ghost/wraith** framing (Direction 2) reads as uncanny/supernatural — ambiguous, eerie, "something not fully of this world is drawn to your fire." Both are compatible with the existing wall-clipping "ghost mode" behavior that playtests have already validated as *feeling fair* — wall-clipping reads naturally as ghostly regardless of which visual direction is chosen, so this is a free identity decision, not a mechanic-constrained one. Given Ian's own language across playtests ("ghost mode," "the beast," used loosely) and the theme's forest/campfire framing, either committing clearly to one, or deliberately keeping Direction 3's ambiguity a little longer until more of the game's fiction firms up, are both reasonable — this is a call worth flagging back to Ian rather than presuming.

## Shared Visual System

A cohesive first system, buildable entirely with primitives already used in the file (`arc`, `fillRect`, `createRadialGradient`, `globalCompositeOperation`):

- **Player** — dark silhouette + warm ember-core glow (Direction 1, "Ember-Bearer").
- **Beast/ghost** — one of the three directions above, sized clearly larger/lower than the player to keep the predator-vs-prey size read intact.
- **Embers** — keep the existing radial-gradient blob approach, but tie its color/size more explicitly to the player's own core glow color, so embers visually read as "pieces of the player's light left behind," not a separate game object.
- **Torch radius** — currently invisible (implicit in the fog hole). Consider drawing a very faint warm ring or gradient wash at the *edge* of the torch radius on the lit ground itself (not on the fog layer) so the player can feel the light's edge without needing the debug overlay — this is a clarity win, not decoration.
- **Walls** — keep flat and legible, but shift the fill toward a cooler, deeper charcoal (distinct from the warm ember family) so the one warm hue in the whole frame stays exclusively "light and light-adjacent things" (player, embers, torch edge) — a clean, cheap color-grammar rule.
- **Safe zone** — keep as a distinct ring/circle, but consider giving it a faint, slow, cool-toned pulse (distinct from the warm ember pulse) so it visually reads as "the opposite of the hunt" — calm, stable, waiting.
- **Darkness/fog** — unchanged mechanically; consider a very subtle darkest-navy-vs-pure-black tint (e.g. `#050507` instead of flat `#000`) so the fog has a hint of atmosphere without giving up any concealment.
- **UI text/HUD** — already fairly restrained (monospace, muted mauve, amber key-hints) — keep as-is; it already fits the "quiet technical tool" register asked for.

## Claude-Code-Inspired Translation

The brief asks to take *inspiration* from Claude Code / developer-tool aesthetics without copying any specific asset, icon, or branding. Concretely, that means borrowing the *underlying design instincts*, translated into game terms:

- **Dark matte background → the existing near-black fog/canvas**, kept intentionally under-lit rather than moody-gradient or skybox-lit. No change needed, just don't dilute it.
- **Warm amber/ember focus color → the single accent hue rule** (Principle 8): amber/ember is the *only* saturated glow color in the frame, exactly like an editor's single accent color against a neutral UI.
- **Restrained contrast → the wall/fog/UI palette staying desaturated** so the eye is drawn only to the lit, warm elements — mirrors how a quiet developer tool keeps chrome neutral so content (here: light, threat, safety) pops.
- **Clean geometry → circles, arcs, and simple polygons only** — no jagged/organic sprite work, consistent with the crisp vector-like feel of good CLI/editor UI.
- **Quiet UI labels → the HUD stays small, monospace, unobtrusive** — already true, worth explicitly preserving as a constraint on any future HUD changes.
- **Subtle glow, not chrome → glow effects are functional (torch, embers, core) not cosmetic chrome** — a glow always marks something mechanically real (light radius, hot ember, active core), never pure decoration, matching how a good dev tool's subtle highlight always marks something meaningful (active line, focused pane) rather than being decorative.
- **Precision over ornamentation → no textures, gradients used only where they encode information** (falloff of light, state of an ember) — never as backdrop dressing.

## Recommended Direction

**First implementation pass recommendation:** combine Player Direction 1 ("Ember-Bearer") with Beast Direction 1 ("The Hollow Hound"), plus the shared-system ember/torch-edge treatment. This is the smallest step that meaningfully changes mood and identity while touching only `drawWorld()`/`drawFog()`:

- **Player look:** replace the flat tan circle with a small dark silhouette (rounded triangle/teardrop, point oriented toward last movement direction) with a warm ember-core glow at its center, pulsing gently (slow sine on alpha/radius). Collision circle radius stays exactly `PLAYER_RADIUS` — only the fill/silhouette changes.
- **Beast/ghost look:** replace the flat red circle with a low, elongated dark silhouette (ellipse + two small angular triangles), subtly leaning/stretching toward its current AI target vector (already computed for the debug line). No change to `BEAST_RADIUS` or collision.
- **Ember look:** keep the existing radial-gradient blob mechanic unchanged in behavior, but recolor it to visually match the player's own core-glow color family so it reads as "the player's light, left behind."
- **Light/fog styling:** add one subtle, purely cosmetic warm-tinted ring drawn at the torch radius's edge (on the lit ground, not the fog composite), and a barely-off-black tint to the fog fill (`#050507` instead of `#000`).
- **What not to change:** `PLAYER_RADIUS`, `BEAST_RADIUS`, `TORCH_RADIUS`, `EMBER_RADIUS`, all speeds, all AI logic/state machine, all level data, all collision math, the debug overlay's function and content, the HUD text/layout, controls, and win/lose logic. This pass is `drawWorld()`/`drawFog()` cosmetics only.

This keeps the exact same read distances and hit-radii (so no level needs re-validation against `validate-levels.js`), touches only draw calls, and gives the clearest signal on whether the stronger identity helps or hurts before committing further.

## Implementation Pass Proposal

A future bounded pass, **not authorized by this artifact**:

- **Allowed files:** `prototypes/trail-of-embers/index.html` (draw functions only: `drawWorld`, `drawFog`, and the constant color/style values they reference).
- **Allowed visual changes:** player silhouette + glow, beast silhouette + subtle target-lean, ember recoloring to match player glow, torch-edge cosmetic ring, fog base-color tint, wall fill recolor toward cooler charcoal, safe-zone pulse.
- **Forbidden changes:** any radius/speed/cooldown/lifetime constant, `LEVELS` data (obstacles, starts, safe zones, per-level tuning), beast AI state logic (`updateBeast`), collision functions (`circleRectCollide`, bounds clamping), win/lose conditions (`checkWinLose`), controls/input handling, the debug overlay's diagnostic content (cosmetic restyle of debug lines only if desired, but its information must stay identical), HUD text/copy, and anything in `GAME_TRUTH.md`, `DESIGN_PRINCIPLES.md`, `MECHANICS.md`, `DECISION_LOG.md`, `PLAYTEST_LOG.md`, or `BALANCE_NOTES.md`.
- **Validation command:**
  ```
  node prototypes/trail-of-embers/validate-levels.js prototypes/trail-of-embers/index.html
  ```
  (confirms no level data or collision-relevant constant was accidentally touched — should still report identical results to the Scale Pass 1 run above).
- **Manual playtest questions:** see below.

## Playtest Questions

1. Is the player easier or harder to track than the flat-circle version?
2. Does the player feel more characterful without becoming noisy or distracting?
3. Does the beast/ghost feel more threatening than the flat red circle?
4. Is the beast/ghost still clearly readable in darkness and inside a lit fog hole?
5. Does the new style improve the mood, or does it feel like decoration for its own sake?
6. Does the style preserve the elegant, low-noise simplicity that's worked so far?
7. Does the visual language feel distinctive enough to be worth continuing to develop?
8. Did any single visual effect (glow, lean, pulse, trail) reduce gameplay clarity at any point — especially during a close chase?

## Risks / Open Questions

- **Visual noise** — glow/pulse/silhouette effects could accumulate into a busier frame than the current flat-dot clarity, especially with multiple hot embers on screen at once (up to three, per emergent tuning).
- **Over-stylizing too early** — Trail of Embers is still a probe, not a ratified game; investing in visual identity before the core loop/level-design depth is proven risks anchoring effort on the wrong layer.
- **Reducing readability** — any softness (translucent wraith, gradient trails) risks undercutting the exact instant-legibility that every playtest so far has credited as a strength.
- **Making the prototype feel more finished than it is** — a stronger visual pass could read as "this is basically done," which risks discouraging further mechanical/level-design iteration or misrepresenting the project's actual maturity to anyone shown a build.
- **Spending effort on art before proving level-design depth** — Ian's own playtest notes consistently ask for "bigger, more maze-like, more complicated," a level-design/scale question, not a visual one; visuals should not displace that work.
- **Confusing player/beast readability** — a stylistic choice (e.g., too-similar silhouette proportions, colors too close in the same warm family) could blur the player-vs-beast distinction that currently has zero ambiguity.
- **Weakening the abstract elegance** — some of the prototype's charm reportedly comes from its plain, almost diagrammatic honesty; a visual language pass should be judged against whether it *earns* its added complexity, not assumed to be a strict improvement.
- **Beast/ghost identity is still undecided** — "beast" vs. "ghost/wraith" is a real fork with different emotional tones; picking one visually is itself a small but real creative commitment that hasn't been asked for yet and should be flagged back to Ian rather than decided silently inside an implementation pass.
