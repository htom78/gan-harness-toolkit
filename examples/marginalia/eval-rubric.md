# Evaluation Rubric: Marginalia

Evaluator opens `/Users/tom/Codes/self-promotion/index.html` in a browser AND inspects the raw HTML source as text. No Playwright. No build step. Score each item 0 (absent), 0.5 (partial), 1 (clearly present).

Total score = weighted sum, max 1.0.

---

## A. Design Quality (weight 0.35)

Inspect source + visual render.

| # | Check | How to verify |
|---|-------|---------------|
| A1 | Background is a warm cream (`#f3ece1` or within 5% of it), NOT white or off-white-gray | grep CSS for `#f3ec` or `oklch`/`rgb` near that value; visually confirm |
| A2 | Body text color is warm near-black (`#1b1714` or similar brown-black), NOT `#000` or `#111` | grep CSS; confirm no `color: #000` or `color: black` on body |
| A3 | A red accent (`#a8321f` or close) appears at least once (stamp / underline / hover) | grep for `#a` red hex; visual |
| A4 | Serif font stack in use — contains Garamond, Hoefler, or generic `serif`; does NOT lead with Inter / system-ui / Helvetica / Arial | grep `font-family` declarations |
| A5 | Display quote is italic and large (font-size clamp or ≥ 2rem) | grep `font-style: italic` near quote selector; visual |
| A6 | Drop cap on first letter of quote via `::first-letter` or equivalent | grep `::first-letter` or `first-letter` |
| A7 | Layout is asymmetric (quote NOT horizontally centered as a card) — uses grid/flex with off-center placement or asymmetric margins | visual; grep for `grid-template-columns` with unequal tracks |
| A8 | Paper texture / grain present (inline SVG `feTurbulence` filter, or noise via CSS) | grep `feTurbulence` or `noise` |

**A score = (sum / 8) × 0.35**

---

## B. Originality / Anti-Slop (weight 0.20)

| # | Check | How to verify |
|---|-------|---------------|
| B1 | NO linear-gradient / radial-gradient on the main surface (small accents OK) | grep `gradient(` — should be 0 or only inside SVG/stamp |
| B2 | NO `backdrop-filter: blur` (no glassmorphism) | grep `backdrop-filter` — should be absent |
| B3 | NO emoji in visible copy | grep source for common emoji ranges; visual |
| B4 | NO Inter / system-ui as the primary display font | grep first `font-family` declaration |
| B5 | Rubber-stamp element present (rotated text, red, with date) | grep for `rotate(` near margin/stamp class; visual |
| B6 | Monospace annotations in margin (date / quote number / tags) | grep `monospace` in CSS; visual |
| B7 | A keyword in the quote is underlined in red (per-quote highlight) | grep for `highlight` field in JS data or underline span; visual |

**B score = (sum / 7) × 0.20**

---

## C. Craft (weight 0.30)

| # | Check | How to verify |
|---|-------|---------------|
| C1 | Shuffle link has custom `:hover` (not browser default underline only) | grep `:hover` near shuffle/link selector |
| C2 | Copy confirmation uses CSS `transition` on opacity (not abrupt show/hide) | grep `transition:` involving opacity |
| C3 | Hairline rule(s) at 1px with reduced opacity (rgba or opacity prop) | grep `1px solid rgba` or similar |
| C4 | Responsive: a `@media` query exists for narrow screens; layout reflows | grep `@media`; resize browser to 360px |
| C5 | No `console.log` left in script | grep `console.log` in script tag |
| C6 | No external network calls — no `<link rel="stylesheet" href="http`, no `<script src="http`, no `fonts.googleapis` | grep `https?://` in source; should only appear in quote sources/attribution text, not in href/src |
| C7 | HTML uses semantic elements: `<main>`, `<blockquote>`, `<cite>`, `<footer>` | grep tags |
| C8 | File is a single `index.html` at project root, no external assets referenced | `ls /Users/tom/Codes/self-promotion/index.html` exists; no `<link href="./"` or `<script src="./"` |

**C score = (sum / 8) × 0.30**

---

## D. Functionality (weight 0.15)

| # | Check | How to verify |
|---|-------|---------------|
| D1 | Quotes array has ≥ 12 entries | grep / count objects in the quotes array |
| D2 | Each quote has `text` and `author` fields | inspect array literal |
| D3 | Daily selection logic uses date (Date object + modulo) | grep `getDate`/`getDay`/`Date(` in selection function |
| D4 | Hash override implemented: parsing `location.hash` for `q=N` | grep `location.hash` |
| D5 | Clipboard API used: `navigator.clipboard.writeText` | grep `clipboard.writeText` |
| D6 | Click handler on quote element exists | grep `addEventListener('click'` near quote |

**D score = (sum / 6) × 0.15**

---

## Total

`final = A + B + C + D` (max 1.0)

Pass threshold: **0.75**
Strong pass: **0.85+**

## Hard Fails (auto-zero regardless of other scores)

- File doesn't exist at `/Users/tom/Codes/self-promotion/index.html`
- File fails to render (blank page, JS exception on load)
- Requires a build step, npm install, or dev server beyond `python -m http.server`
- Makes external network requests (CDN fonts, analytics, image hotlinks)
- More than one file required to run
