// Validation harness for prototypes/trail-of-embers/index.html
// Extracts the inline game script, runs it under Node with DOM stubs, then
// checks level data: spawns in bounds, player start & safe zone clear of
// obstacles, and safe zone reachable from player start (BFS with player
// radius clearance). Exits nonzero on any failure.
"use strict";
const fs = require("fs");
const vm = require("vm");

const html = fs.readFileSync(process.argv[2], "utf8");
const m = html.match(/<script>([\s\S]*?)<\/script>/);
if (!m) { console.error("FAIL: no <script> block found"); process.exit(1); }
const src = m[1];

// --- minimal DOM stubs ---------------------------------------------------
function noopCtx() {
  return new Proxy({}, {
    get(t, prop) {
      if (prop === "createRadialGradient") return () => ({ addColorStop() {} });
      return () => undefined;
    },
    set() { return true; },
  });
}
function stubEl() { return { style: {}, textContent: "", width: 0, height: 0, getContext: noopCtx }; }

const sandbox = {
  document: {
    getElementById: () => stubEl(),
    createElement: () => stubEl(),
  },
  window: { addEventListener() {} },
  performance: { now: () => 0 },
  requestAnimationFrame() {},
  console,
  Math,
  Infinity,
};
sandbox.globalThis = sandbox;
vm.createContext(sandbox);

// Run the game script, then pull out what we need via an appended expression.
const exports_ = vm.runInContext(
  src + "\n;({ LEVELS, LEVEL_DEFAULTS, PLAYER_RADIUS, CACHE_RADIUS, EMBER_BLOOM_PICKUP_RADIUS, EMBER_BLOOM_RADIUS, EMBER_BLOOM_DROP_RADIUS, EMBER_RADIUS, TORCH_RADIUS, circleRectCollide, W, H })",
  sandbox,
  { filename: "index.html<script>" }
);
const { LEVELS, LEVEL_DEFAULTS, PLAYER_RADIUS, CACHE_RADIUS, EMBER_BLOOM_PICKUP_RADIUS, EMBER_BLOOM_RADIUS, EMBER_BLOOM_DROP_RADIUS, EMBER_RADIUS, TORCH_RADIUS, circleRectCollide, W, H } = exports_;
console.log(`script evaluated OK; ${LEVELS.length} levels; base field ${W}x${H}`);

let failures = 0;
function check(cond, msg) {
  if (cond) console.log(`  ok   ${msg}`);
  else { console.log(`  FAIL ${msg}`); failures++; }
}

// BFS from the player start over a player-radius-clearance grid, stopping
// as soon as it gets within `targetR + PLAYER_RADIUS` of `target`. Shared by
// the safe-zone reachability check and the Cinder Cache reachability check
// below -- same clearance logic, different destination.
function bfsReachable(level, target, targetR, gateClosed = false) {
  const step = 5;
  const cols = Math.floor(level.fieldW / step), rows = Math.floor(level.fieldH / step);
  const gateBlocks = (level.gate && gateClosed) ? [level.gate] : [];
  const obstaclesToUse = level.obstacles.concat(gateBlocks);
  const blocked = (x, y) =>
    x < PLAYER_RADIUS || y < PLAYER_RADIUS ||
    x > level.fieldW - PLAYER_RADIUS || y > level.fieldH - PLAYER_RADIUS ||
    obstaclesToUse.some(o => circleRectCollide(x, y, PLAYER_RADIUS, o));
  const key = (cx, cy) => cy * cols + cx;
  const start = [Math.round(level.playerStart.x / step), Math.round(level.playerStart.y / step)];
  const seen = new Uint8Array(cols * rows);
  const queue = [start];
  seen[key(...start)] = 1;
  while (queue.length) {
    const [cx, cy] = queue.shift();
    const x = cx * step, y = cy * step;
    if (Math.hypot(x - target.x, y - target.y) < targetR + PLAYER_RADIUS) return true;
    for (const [dx, dy] of [[1,0],[-1,0],[0,1],[0,-1]]) {
      const nx = cx + dx, ny = cy + dy;
      if (nx < 0 || ny < 0 || nx >= cols || ny >= rows) continue;
      if (seen[key(nx, ny)]) continue;
      seen[key(nx, ny)] = 1;
      if (!blocked(nx * step, ny * step)) queue.push([nx, ny]);
    }
  }
  return false;
}

// Directed BFS that respects one-way passages: a passage only blocks movement
// in the direction opposite to its allowed direction. `treatPassagesAsWalls`
// makes every passage a solid obstacle (used to verify the no-passage route).
// `gateClosed` controls whether the gate is treated as solid (default true).
function directedBfsReachable(level, target, targetR, treatPassagesAsWalls = false, gateClosed = true) {
  const passages = level.oneWayPassages || [];
  const step = 5;
  const cols = Math.floor(level.fieldW / step), rows = Math.floor(level.fieldH / step);
  const gateBlocks = (level.gate && gateClosed) ? [level.gate] : [];
  const wallPassages = treatPassagesAsWalls ? passages : [];
  const obstaclesToUse = level.obstacles.concat(gateBlocks).concat(wallPassages);
  const blocked = (x, y) =>
    x < PLAYER_RADIUS || y < PLAYER_RADIUS ||
    x > level.fieldW - PLAYER_RADIUS || y > level.fieldH - PLAYER_RADIUS ||
    obstaclesToUse.some(o => circleRectCollide(x, y, PLAYER_RADIUS, o));
  const inAnyPassage = (x, y) => passages.find(p => circleRectCollide(x, y, PLAYER_RADIUS, p));
  const key = (cx, cy) => cy * cols + cx;
  const start = [Math.round(level.playerStart.x / step), Math.round(level.playerStart.y / step)];
  const seen = new Uint8Array(cols * rows);
  const queue = [start];
  seen[key(...start)] = 1;
  while (queue.length) {
    const [cx, cy] = queue.shift();
    const x = cx * step, y = cy * step;
    if (Math.hypot(x - target.x, y - target.y) < targetR + PLAYER_RADIUS) return true;
    for (const [dx, dy] of [[1,0],[-1,0],[0,1],[0,-1]]) {
      const nx = cx + dx, ny = cy + dy;
      if (nx < 0 || ny < 0 || nx >= cols || ny >= rows) continue;
      if (seen[key(nx, ny)]) continue;
      const nxPos = nx * step, nyPos = ny * step;
      if (blocked(nxPos, nyPos)) continue;
      const p = inAnyPassage(x, y) || inAnyPassage(nxPos, nyPos);
      if (p) {
        const against =
          (p.direction === "right" && dx < 0) ||
          (p.direction === "left" && dx > 0) ||
          (p.direction === "up" && dy > 0) ||
          (p.direction === "down" && dy < 0);
        if (against) continue;
      }
      seen[key(nx, ny)] = 1;
      queue.push([nx, ny]);
    }
  }
  return false;
}

// BFS to verify if the player can reach/overlap a specific target rectangle
function bfsReachableToRect(level, rect, gateClosed = true) {
  const step = 5;
  const cols = Math.floor(level.fieldW / step), rows = Math.floor(level.fieldH / step);
  const gateBlocks = (level.gate && gateClosed) ? [level.gate] : [];
  const obstaclesToUse = level.obstacles.concat(gateBlocks);
  const blocked = (x, y) =>
    x < PLAYER_RADIUS || y < PLAYER_RADIUS ||
    x > level.fieldW - PLAYER_RADIUS || y > level.fieldH - PLAYER_RADIUS ||
    obstaclesToUse.some(o => circleRectCollide(x, y, PLAYER_RADIUS, o));
  const key = (cx, cy) => cy * cols + cx;
  const start = [Math.round(level.playerStart.x / step), Math.round(level.playerStart.y / step)];
  const seen = new Uint8Array(cols * rows);
  const queue = [start];
  seen[key(...start)] = 1;
  while (queue.length) {
    const [cx, cy] = queue.shift();
    const x = cx * step, y = cy * step;
    
    // Check if player circle overlaps the target rectangle
    const nearestX = Math.max(rect.x, Math.min(x, rect.x + rect.w));
    const nearestY = Math.max(rect.y, Math.min(y, rect.y + rect.h));
    if (Math.hypot(x - nearestX, y - nearestY) < PLAYER_RADIUS) return true;
    
    for (const [dx, dy] of [[1,0],[-1,0],[0,1],[0,-1]]) {
      const nx = cx + dx, ny = cy + dy;
      if (nx < 0 || ny < 0 || nx >= cols || ny >= rows) continue;
      if (seen[key(nx, ny)]) continue;
      seen[key(nx, ny)] = 1;
      if (!blocked(nx * step, ny * step)) queue.push([nx, ny]);
    }
  }
  return false;
}

LEVELS.forEach((raw, i) => {
  const level = Object.assign({}, LEVEL_DEFAULTS, raw);
  console.log(`level ${i + 1}: ${level.name} (${level.fieldW}x${level.fieldH})`);
  const inBounds = p => p.x > 0 && p.y > 0 && p.x < level.fieldW && p.y < level.fieldH;
  check(inBounds(level.playerStart), "player start in bounds");
  check(inBounds(level.beastStart), "beast start in bounds");
  check(inBounds(level.safeZone), "safe zone in bounds");
  check(!level.obstacles.some(o => circleRectCollide(level.playerStart.x, level.playerStart.y, PLAYER_RADIUS, o)),
    "player start clear of obstacles");
  check(!level.obstacles.some(o => circleRectCollide(level.safeZone.x, level.safeZone.y, level.safeZone.r, o)),
    "safe zone clear of obstacles");
  check(level.beastSpeed < 175, `beast (${level.beastSpeed}) slower than player (175)`);
  
  // Optional one-way passages (Level 9 probe)
  (level.oneWayPassages || []).forEach((p, pi) => {
    const rectInBounds = r => r.x >= 0 && r.y >= 0 && r.x + r.w <= level.fieldW && r.y + r.h <= level.fieldH;
    check(rectInBounds(p), `one-way passage ${pi + 1} in bounds`);
    check(["up", "down", "left", "right"].includes(p.direction), `one-way passage ${pi + 1} has valid direction`);
    check(p.w >= 20 && p.h >= 20, `one-way passage ${pi + 1} is wide/tall enough for the player`);
    const overlapsObstacle = level.obstacles.some(o =>
      !(p.x + p.w <= o.x || o.x + o.w <= p.x || p.y + p.h <= o.y || o.y + o.h <= p.y)
    );
    check(!overlapsObstacle, `one-way passage ${pi + 1} does not overlap obstacles`);
  });

  if (level.gate) {
    check(inBounds(level.gate) && inBounds({ x: level.gate.x + level.gate.w, y: level.gate.y + level.gate.h }),
      "gate in bounds");
    check(level.triggerZone && inBounds(level.triggerZone) && inBounds({ x: level.triggerZone.x + level.triggerZone.w, y: level.triggerZone.y + level.triggerZone.h }),
      "trigger zone in bounds");

    const gateOverlapsObstacles = level.obstacles.some(o => {
      return !(level.gate.x + level.gate.w <= o.x ||
               o.x + o.w <= level.gate.x ||
               level.gate.y + level.gate.h <= o.y ||
               o.y + o.h <= level.gate.y);
    });
    check(!gateOverlapsObstacles, "gate not overlapping obstacles");

    const hasPassages = level.oneWayPassages && level.oneWayPassages.length > 0;

    // Trigger zone reachability
    // For levels with one-way passages, check the bottom of the trigger zone
    // (which should be in the lure chamber, below any separating wall)
    let tzReachable;
    if (hasPassages) {
      const tzTarget = { 
        x: level.triggerZone.x + level.triggerZone.w / 2, 
        y: level.triggerZone.y + level.triggerZone.h 
      };
      tzReachable = directedBfsReachable(level, tzTarget, 0, false, true);
    } else {
      tzReachable = bfsReachableToRect(level, level.triggerZone);
    }
    check(tzReachable, "trigger zone reachable by player" + (hasPassages ? " (directed BFS)" : " (BFS)"));

    // Gate closed: safe zone should NOT be reachable
    // For levels with one-way passages, use directed BFS to respect passage rules
    const closedReachable = hasPassages
      ? directedBfsReachable(level, level.safeZone, level.safeZone.r, false, true)
      : bfsReachable(level, level.safeZone, level.safeZone.r, true);
    check(!closedReachable, "gate closed: safe zone not reachable");

    // Gate open: safe zone SHOULD be reachable
    const openReachable = hasPassages
      ? directedBfsReachable(level, level.safeZone, level.safeZone.r, false, false)
      : bfsReachable(level, level.safeZone, level.safeZone.r, false);
    check(openReachable, "gate open: safe zone reachable");

    // For levels with one-way passages, verify directed reachability to trigger zone
    // (already checked above, but explicit message for clarity)
    if (hasPassages) {
      check(true,
        "trigger zone reachable via directed BFS (respecting one-way rules) [verified above]");
    }
  } else if (level.oneWayPassages && level.oneWayPassages.length) {
    const directedReachable = directedBfsReachable(level, level.safeZone, level.safeZone.r, false);
    check(directedReachable, "safe zone reachable with one-way rules (directed BFS)");
    const noPassageReachable = directedBfsReachable(level, level.safeZone, level.safeZone.r, true);
    check(noPassageReachable, "safe zone reachable without using one-way passages (passages as walls)");
  } else {
    check(bfsReachable(level, level.safeZone, level.safeZone.r),
      "safe zone reachable from player start (BFS, player-radius clearance)");
  }

  (level.cinderCaches || []).forEach((c, ci) => {
    check(inBounds(c), `cinder cache ${ci + 1} in bounds`);
    check(!level.obstacles.some(o => circleRectCollide(c.x, c.y, CACHE_RADIUS, o)),
      `cinder cache ${ci + 1} clear of obstacles`);
    check(bfsReachable(level, c, CACHE_RADIUS),
      `cinder cache ${ci + 1} reachable from player start (BFS, player-radius clearance)`);
    
    // For levels with one-way passages, verify cache is reachable WITHOUT going through them
    // (cache should be before the one-way commitment, not after)
    if (level.oneWayPassages && level.oneWayPassages.length > 0) {
      check(directedBfsReachable(level, c, CACHE_RADIUS, true),
        `cinder cache ${ci + 1} reachable without using one-way passages (before commitment)`);
    }
  });

  // Ember Bloom pickup (Level 11 probe): at most one per level, in the
  // same style as the Cinder Cache checks above. The validator has no
  // concept of light/visibility (see the probe brief), so this only
  // sanity-checks the pickup's position and the light-radius constants,
  // not anything about what the bloomed radius illuminates.
  if (level.emberBloom) {
    const b = level.emberBloom;
    check(inBounds(b), "ember bloom pickup in bounds");
    check(!level.obstacles.some(o => circleRectCollide(b.x, b.y, EMBER_BLOOM_PICKUP_RADIUS, o)),
      "ember bloom pickup clear of obstacles");
    check(bfsReachable(level, b, EMBER_BLOOM_PICKUP_RADIUS),
      "ember bloom pickup reachable from player start (BFS, player-radius clearance)");
    check(EMBER_BLOOM_RADIUS > TORCH_RADIUS,
      `ember bloom radius (${EMBER_BLOOM_RADIUS}) is larger than the normal torch radius (${TORCH_RADIUS})`);

  }

  // Level 11 revision (post-first-playtest): the field must match level 10's
  // dimensions exactly -- Ian's call was that the level should never have
  // been smaller than the rest of the back half of the game. This is a
  // structural/geometric check only; it says nothing about whether the
  // larger maze is itself fair or fun (see README).
  if (i === 10) {
    const level10 = Object.assign({}, LEVEL_DEFAULTS, LEVELS[9]);
    check(level.fieldW === level10.fieldW && level.fieldH === level10.fieldH,
      `level 11 field (${level.fieldW}x${level.fieldH}) matches level 10's field (${level10.fieldW}x${level10.fieldH})`);
  }
});

// Ember Bloom + dropped-ember synergy (Level 11 revision): once collected,
// a newly dropped ember must peak at a radius unmistakably larger than the
// player's own bloomed torch -- at least ~1.35x EMBER_BLOOM_RADIUS -- so the
// ember-drop mechanic stays genuinely useful for route planning even after
// the torch upgrade. This is a static constant-relationship check only; it
// cannot verify runtime state transitions (see README for what's playtest-
// gated instead).
check(EMBER_BLOOM_DROP_RADIUS >= EMBER_BLOOM_RADIUS * 1.35,
  `bloom-boosted ember radius (${EMBER_BLOOM_DROP_RADIUS}) is at least 1.35x the bloomed torch radius (${EMBER_BLOOM_RADIUS})`);
check(EMBER_BLOOM_DROP_RADIUS > EMBER_RADIUS,
  `bloom-boosted ember radius (${EMBER_BLOOM_DROP_RADIUS}) is larger than the normal ember radius (${EMBER_RADIUS})`);

if (failures) { console.error(`\n${failures} check(s) FAILED`); process.exit(1); }
console.log("\nall checks passed");
