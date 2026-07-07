# Playtest Protocol: Trail of Embers Blind Playtest

ARTIFACT TYPE: Playtest Protocol
AUTHORITY: PROBE
STATUS: Draft — Human-gated playtest preparation
CREATED BY: Antigravity (Gemini 3.5 Flash)
REVIEWED BY: not yet reviewed
DATE: 2026-07-07
RELATED TASK: Trail of Embers Blind Playtest Protocol
SOURCE-OF-TRUTH FILES TOUCHED: none

---

## 1. Purpose of the Playtest
To assess how a fresh player with zero exposure to the project interacts with and understands the layered mechanics of the *Trail of Embers* prototype. By testing the game with a blind player, we aim to combat creator/survivorship bias and determine whether the core loops—specifically Cinder Charge, beast-activated gates, controller support, and audio/proximity cues—are readable, fair, and engaging without explanation.

---

## 2. What This Test is Trying to Validate (Falsifiable Hypotheses)

| Hypothesis Area | Successful/Positive Signal (GREEN) | Failure/Negative Signal (RED) |
|---|---|---|
| **Ember Bait Loop** | Player understands they are dropping bait to divert the beast and uses it to clear routes. | Player spams Space/A blindly for light or fails to realize the beast reacts to embers. |
| **"Good" vs. "Bad" Lost** | Maze disorientation is a motivating puzzle; player is eager to try again and learn the map. | Maze layout feels frustrating, arbitrary, or boring; player loses interest quickly. |
| **Cinder Charge** | Player detours to get the Cinder Cache, notices it is held, and uses it as a tactical escape option. | Cache pickup goes unnoticed, is ignored as a gimmick, or the Cinder Charge is never used. |
| **Beast-Gate (Level 8)** | Player links the beast's presence inside the trigger sigil to the gate status and executes the bait/lure. | The gate relationship is unreadable; player does not understand why the gate is closed/open. |
| **Audio/Proximity Cues** | The dynamic 110Hz rumble increases tension and lets the player track the beast in the dark. | The synthesized rumble is distracting, annoying, makes the beast too predictable, or is ignored. |
| **Controller Support** | The gamepad improves fluid 8-directional movement and makes the physical loop feel premium. | Gamepad mapping feels clumsy, unresponsive, or does not improve the feel over keyboard. |

---

## 3. Participant Assumptions
- **Fresh Player:** The participant has never played *Trail of Embers*, seen screen captures, or had the game's mechanics explained.
- **Independence:** Preferably someone who is not involved in the project or familiar with its development details.
- **Play Style:** Willing to "think out loud" (verbalize reactions, plans, and points of confusion).

---

## 4. Test Setup

- **Local Build Execution:**
  - Launch the game by opening `prototypes/trail-of-embers/index.html` in a modern web browser.
  - Set the browser viewport size to comfortable fullscreen/near-fullscreen. (The CSS aspect ratio scaling is active, meaning it will scale down to fit smaller screens safely without breaking collision math).
- **Physical Controls:**
  - Provide both a standard keyboard and a standard dual-analog gamepad (e.g., PlayStation/Xbox controller) to compare input methods.
  - **Keyboard:** Arrows/WASD to move, Space to drop ember/Cinder Charge, R to restart level, N to advance level.
  - **Gamepad:** Left Stick / D-pad to move, Button 0 (A/Cross) to drop ember, Button 9 (Start) to restart.
- **Audio Settings:**
  - Ensure system audio is turned ON. The synthesized audio proximity cues must be unmuted at launch (`sound: on` in the HUD).
  - Do not mention the mute control (`M` key) to the participant unless they ask to turn it off.

---

## 5. Facilitator Script

### The Opening Speech (Exact Intro Ian Should Say):
> *"I've built a game prototype in the dark. I want to see if it is fun and easy to understand without my help. I'm going to have you play it. The basic controls are listed at the top of the screen. Beyond that, I won't explain how the game works or what the elements do. Please try to survive, reach the goal, and talk out loud about what you're thinking, what you think is happening, and how you feel as you play."*

### What Not to Explain Upfront:
1. **The Beast:** Do not tell them what it is, that it is hunting them, or that it ghosts/clips through walls.
2. **Ember Mechanics:** Do not explain that dropping an ember acts as a bait to lure the beast away.
3. **Cinder Cache/Charge:** Do not explain the pulsing diamond, the stored charge, or how to spend it.
4. **Beast-Gate:** Do not explain Level 8's gate and trigger zone sigil connection.
5. **Audio Cues:** Do not mention the proximity rumble or ember drop clicks.

### Handling Questions:
- **If they ask, *"What is my goal?"***
  - *Response:* "Try to figure it out by exploring the screen." (Let them locate the stone circle safe zone).
- **If they ask, *"What is chasing me / why did I die?"***
  - *Response:* "What did it look like? What do you think happened?"
- **If they ask, *"What does this pickup / status text mean?"***
  - *Response:* "Try picking it up / using your actions and see what changes."
- **If they ask, *"How do I restart?"***
  - *Response:* Points to the HUD at the top of the screen (`R retry`).
- **If they are stuck mechanically:**
  - *Response:* Only assist if there is a technical problem (e.g., gamepad mapping failed, browser lost focus).

### When to Stay Silent:
- **During failure loops:** Do not nudge them to press R to restart unless they stare blankly at a "lost" screen for more than 15 seconds.
- **During navigation confusion:** Do not point them toward the correct path. Let them navigate and find dead ends.
- **When they are cornered:** Do not give advice on when to drop embers. Let them learn the timing through death.

---

## 6. Play Session Structure

### Phase 1: Blind Keyboard Run (Levels 1–3)
- **Goal:** Establish the baseline ember-bait loop and difficulty progression.
- **Method:** Let the player start on Level 1 with keyboard controls. Play through Level 3.
- **Look for:** Organically discovering that Space drops an ember, discovering the beast's reaction, and navigating Level 2's cornering and Level 3's high-pressure serpentine.

### Phase 2: Scale & Maze Navigation (Levels 4–6)
- **Goal:** Evaluate the transition from single-screen puzzles to larger scrolled/scaled mazes.
- **Method:** Continue progression to Level 4 ("The Ember Maze"), Level 5 ("The Deep Maze"), and Level 6 ("The Coiled Maze").
- **Look for:** Map-memory retention, usage of bait pockets/bail-out loops, wall-clipping fairness, and whether they reach a state of frustration.

### Phase 3: Optional Controller Swap (Any Level)
- **Goal:** Isolate controller feel and responsiveness.
- **Method:** At any point after Level 3 (or on a retry of Level 3), plug in the gamepad and let them play.
- **Look for:** Changes in movement fluidity (analog vs. digital), speed of ember drops, and verbal feedback on "feel".

### Phase 4: Focused Cinder Charge & Gate Observation (Levels 7–8)
- **Goal:** Evaluate the advanced mechanics added in the latest prototype passes.
- **Method:** Let them play Level 7 ("The Ember Ring") and Level 8 ("The Gatekeeper's Keep").
- *Note:* If the player gets stuck or exhausted in the middle mazes (Levels 4–6), the facilitator may use the testing shortcut (press key `7` or `8` on the keyboard) to jump them straight to these levels.
- **Look for:** Cinder Cache detouring, Cinder Charge spending, Gate triggers, and beast-luring execution.

---

## 7. Observation Checklist

During play, Ian should watch and document:

### The Basics
- [ ] **First Ember:** How long does it take for them to press Space? Do they press it by accident or on purpose?
- [ ] **First Bait:** When do they realize the beast goes toward the ember? (Look for a lightbulb moment: *"Oh, it wants the fire!"*).
- [ ] **Death Loop Flow:** After dying, do they immediately hit R to restart, or do they hesitate, sigh, or look frustrated?

### The Mazes (Levels 4–6)
- [ ] **Dead Ends:** What is their reaction when they hit the sealed shafts in Level 4 or Level 5? Do they turn back calmly or express annoyance?
- [ ] **Bail-out Loops:** Do they discover and use the narrow gaps to escape the beast, or do they miss them in the dark?
- [ ] **Beast Wall-Clipping:** When the beast passes through a wall to catch them, do they call it "fair ghost behavior" or "broken cheating"?

### Advanced Elements (Levels 7–8)
- [ ] **Cinder Cache Detour:** Do they notice the pulsing warm diamond in Level 7's eastern alcove? Do they choose to detour for it, or avoid it to stay safe?
- [ ] **Cinder Charge Use:** Do they realize they have a stored charge? Do they use it under pressure, or does it go forgotten?
- [ ] **Audio Proximity Reaction:** Does their playstyle change when the proximity rumble speeds up (do they slow down, panic, or navigate away)?
- [ ] **Gate Comprehension (Level 8):** When they reach the closed gate, do they understand they must get the beast into the rune trigger zone? How many attempts does it take to deduce this?
- [ ] **Lure Execution:** Can they execute the loop: detour to cache $\rightarrow$ bait beast into trigger zone $\rightarrow$ escape through gate $\rightarrow$ spend Cinder Charge to survive?

---

## 8. Post-Playtest Interview Questions

Ask the participant these exact questions at the end of the session:

1. **The Goal:** *"In your own words, what was the main objective in each level?"*
2. **The Embers:** *"What did you think dropping an ember did? Did you notice if the beast reacted to you, the embers, or both?"*
3. **Beast Fairness:** *"Did the beast moving through walls feel like a fair game mechanic, or did it feel like the game was cheating?"*
4. **Maze Disorientation:** *"When you were navigating the larger mazes, did you feel lost in a good way (like a puzzle you could learn) or a bad way (just frustrating and dark)?"*
5. **Cinder Cache/Charge:** *"On the level with the collectible diamond, did you understand what picking it up did? Did you ever use the stored 'extra ember'?"*
6. **Beast-Gate:** *"On the last level, how did you figure out how to open the gate? Did the connection between the beast's position and the gate make sense?"*
7. **Audio/Proximity:** *"Did you notice the low rumbling sound? Did it help you figure out where the beast was, or did it distract you?"*
8. **Input Method:** *"If you tried both, did you prefer the keyboard or the controller? Why?"*
9. **Engagement:** *"Would you play more levels of this game if it was expanded?"*

---

## 9. Signal Interpretation (GREEN / YELLOW / RED)

Use this scoring rubric to evaluate the playtest results:

### GREEN Signals (Keep and polish current direction):
- Organized decoy planning: The player deliberately drops an ember away from their target route to draw the beast.
- The player reacts to the proximity rumble by altering their path or moving more cautiously.
- Death is met with an immediate, rapid tap of `R`/`Start` to retry (classic flow state).
- The player executes Level 8's gate baiting puzzle within 5–7 attempts and feels a sense of achievement upon escape.

### YELLOW Signals (Keep mechanics but tune / clarify HUD):
- The player understands the Cinder Charge mechanic but misses the persistent `"cinder charge: held"` text because they are looking at the center screen.
- Level 8's escape timing is slightly too tight, leading to repetitive deaths at the final stretch, but the logic is fully understood.
- The player finds the 3-ember emergent limit in Level 3 restrictive but adapts.

### RED Flags (Stop / Redesign the specific element):
- **Core Loop Failure:** The player never realizes embers attract the beast and assumes the beast's movement is random/buggy.
- **Tedious Darkness:** The player gets lost in the large mazes, finds it boring, and stops retrying.
- **Gate Confusion:** The player fails to link the beast to the gate trigger zone and quits Level 8 in frustration.
- **Audio Fatigue:** The player complains about the synthesized audio rumble or asks to mute it.

---

## 10. Pre-Playtest Code Freeze Recommendations

To protect the validity of this playtest, **DO NOT change any of the following before the test:**
- **No speed/mechanic tweaks:** Preserve the player speed (175 px/s), beast speed (130–150 px/s), and ember cooldowns.
- **No level data changes:** Keep obstacle positions, gate triggers, and cache locations exactly as they are currently coded.
- **No visual polish:** Do not replace the blocky, programmer-art shapes or clean up the HUD styling.
- **No new mechanics:** Do not add additional UI panels, menus, or tutorials. We need to evaluate the raw game state as-is.

---

## 11. Recommended Post-Playtest File
After Ian runs this playtest, he should document the detailed logs, observer notes, and interview quotes in a new playtest report.

To maintain sequential indexing in the playtest directory, the suggested filename is:
`artifacts/playtests/0012-trail-of-embers-blind-playtest-report.md`
