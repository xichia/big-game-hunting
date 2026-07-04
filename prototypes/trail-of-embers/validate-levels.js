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
  src + "\n;({ LEVELS, LEVEL_DEFAULTS, PLAYER_RADIUS, circleRectCollide, W, H })",
  sandbox,
  { filename: "index.html<script>" }
);
const { LEVELS, LEVEL_DEFAULTS, PLAYER_RADIUS, circleRectCollide, W, H } = exports_;
console.log(`script evaluated OK; ${LEVELS.length} levels; base field ${W}x${H}`);

let failures = 0;
function check(cond, msg) {
  if (cond) console.log(`  ok   ${msg}`);
  else { console.log(`  FAIL ${msg}`); failures++; }
}

function bfsReachable(level) {
  const step = 5;
  const cols = Math.floor(level.fieldW / step), rows = Math.floor(level.fieldH / step);
  const blocked = (x, y) =>
    x < PLAYER_RADIUS || y < PLAYER_RADIUS ||
    x > level.fieldW - PLAYER_RADIUS || y > level.fieldH - PLAYER_RADIUS ||
    level.obstacles.some(o => circleRectCollide(x, y, PLAYER_RADIUS, o));
  const key = (cx, cy) => cy * cols + cx;
  const start = [Math.round(level.playerStart.x / step), Math.round(level.playerStart.y / step)];
  const seen = new Uint8Array(cols * rows);
  const queue = [start];
  seen[key(...start)] = 1;
  while (queue.length) {
    const [cx, cy] = queue.shift();
    const x = cx * step, y = cy * step;
    if (Math.hypot(x - level.safeZone.x, y - level.safeZone.y) < level.safeZone.r + PLAYER_RADIUS) return true;
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
  check(bfsReachable(level), "safe zone reachable from player start (BFS, player-radius clearance)");
});

if (failures) { console.error(`\n${failures} check(s) FAILED`); process.exit(1); }
console.log("\nall checks passed");
