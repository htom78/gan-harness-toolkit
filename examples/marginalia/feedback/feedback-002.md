# Evaluation — Iteration 002

Artifact: `/Users/tom/Codes/self-promotion/index.html` (single file, 665 lines)
Method: source inspection against `gan-harness/eval-rubric.md`. No build, no network, no external assets — verified.

## Verification of iteration-001 fixes

Every claim in `generator-state.md` was checked against source, not taken on faith.

| Claim | Verified? | Evidence |
|---|---|---|
| B1: dead `linear-gradient` on `.page` removed | YES | `grep gradient(` returns only line 242 (`repeating-linear-gradient` inside the stamp — legitimate texture, explicitly allowed by rubric). Line 52 is now `background: var(--paper);` with no gradient layer. |
| Minor #2: inset shadow strengthened | YES | Lines 53–55 now `inset 0 0 220px rgba(120,85,50,0.22)` + 1px inner hairline. Was `120px @ 0.08`. Vignette is now perceptible against the cream + grain. |
| Minor #3: stamp date differentiated | YES | Line 569 `datestamp` → `formatDate` ("17 MAY 2026"); line 581 `stampDate` → new `shortDate()` ("17 MAY"). No more verbatim duplication. |
| Minor #4: quote max-width relaxed | YES | Line 120 `max-width: min(28ch, 100%)`. Was `22ch`. |
| Minor #5: `.hl white-space: nowrap` scoped to wide screens | YES | Lines 140–142 wrap the nowrap rule in `@media (min-width: 760px)`. Narrow viewports can now wrap inside the highlight. |
| Minor #6: fragile `margin-top: -0.6rem` on `.copied` removed | YES | Line 267 now `margin-top: 0`. `aside.margin`'s flex `gap: 1.6rem` handles placement. |
| Minor #7: `.copied` starts empty, re-announce reliable | YES | Line 390 markup has empty `<div class="copied" …>`. `flashCopied()` (lines 614–624) writes `textContent` on show, then clears it ~420ms after the hide transition completes so the next show actually mutates the live region. |

No claimed fix is a no-op. No claimed fix introduces a visible regression.

## Scores

### A. Design Quality (weight 0.35)

| # | Check | Result | Notes |
|---|-------|--------|-------|
| A1 | Cream `#f3ece1` background | 1.0 | `--paper: #f3ece1` exact |
| A2 | Warm near-black body text | 1.0 | `--ink: #1b1714` exact |
| A3 | Red accent present | 1.0 | `--red: #a8321f`; stamp, hl, tag `#`, hover, focus outline |
| A4 | Serif stack, no Inter/system-ui lead | 1.0 | EB Garamond → Hoefler → Garamond → Times → serif |
| A5 | Display quote italic + large | 1.0 | `italic`, `clamp(2.4rem, 1rem + 4vw, 5rem)` |
| A6 | Drop cap via `::first-letter` | 1.0 | Float, 4.6em |
| A7 | Asymmetric layout | 1.0 | `1.65fr` / `0.85fr` |
| A8 | Paper texture | 1.0 | `feTurbulence` multiply at 0.55 |

A subtotal: **8/8 → 0.350**

### B. Originality / Anti-Slop (weight 0.20)

| # | Check | Result | Notes |
|---|-------|--------|-------|
| B1 | No gradient on main surface | 1.0 | Dead `.page` gradient removed. Only remaining `gradient(` hit is `repeating-linear-gradient` inside `.stamp` — explicit small-accent exception per rubric. **Improved from 0.5 → 1.0.** |
| B2 | No `backdrop-filter` | 1.0 | Absent |
| B3 | No emoji in visible copy | 1.0 | `✓` (U+2713) and `↩` (U+21A9) are dingbats, not emoji |
| B4 | No Inter/system-ui primary | 1.0 | Garamond throughout |
| B5 | Rubber stamp present | 1.0 | Rotated -7°, red, dated short form |
| B6 | Monospace margin annotations | 1.0 | JetBrains Mono on date, entry №, tags, toast, shuffle, imprint |
| B7 | Per-quote red underline | 1.0 | `.hl::after` with skew + 0.25px blur |

B subtotal: **7/7 → 0.200**

### C. Craft (weight 0.30)

| # | Check | Result | Notes |
|---|-------|--------|-------|
| C1 | Custom shuffle `:hover` | 1.0 | Color → red, letter-spacing 0.06→0.09, arrow translates 3px + rotates -12° |
| C2 | CSS transition on opacity for toast | 1.0 | `transition: opacity 380ms ease` |
| C3 | Hairline 1px rgba rules | 1.0 | `--rule: rgba(27,23,20,0.30)`; red-tinted column hairline `rgba(168,50,31,0.18)` |
| C4 | Responsive `@media` | 1.0 | 760px (grid collapse, margin row) + 380px (tighter, smaller dropcap) |
| C5 | No `console.log` | 1.0 | Confirmed via grep |
| C6 | No external network | 1.0 | Only `https://www.w3.org/2000/svg` xmlns identifier |
| C7 | Semantic HTML | 1.0 | `<main>`, `<blockquote>`, `<cite>`, `<footer>`, `<header>`, `<aside>`, `<section>` |
| C8 | Single file at root | 1.0 | Verified |

C subtotal: **8/8 → 0.300**

### D. Functionality (weight 0.15)

| # | Check | Result | Notes |
|---|-------|--------|-------|
| D1 | ≥ 12 quotes | 1.0 | 12 |
| D2 | text + author fields | 1.0 | Plus source, year, highlight, tags on every entry |
| D3 | Date-based daily selection | 1.0 | `dayOfYear(today) % QUOTES.length` |
| D4 | `location.hash` `q=N` override | 1.0 | `parseHashIndex()` with regex + bounds check |
| D5 | `navigator.clipboard.writeText` | 1.0 | Used, with `execCommand('copy')` fallback for `file://` |
| D6 | Click handler on quote | 1.0 | Click + Enter/Space keyboard |

D subtotal: **6/6 → 0.150**

---

## Total

| Dimension | Weighted |
|-----------|----------|
| A Design | 0.350 |
| B Originality | 0.200 |
| C Craft | 0.300 |
| D Functionality | 0.150 |
| **TOTAL** | **1.000 / 1.00** |

Pass threshold: 0.75 — **PASS**
Strong-pass threshold: 0.85 — **STRONG PASS**

## Verdict: PASS (Perfect, 1.00)

All seven minor issues from feedback-001 are resolved with real fixes, not cosmetic ones. The single rubric point that was at 0.5 last round (B1) is now cleanly 1.0. No new regression introduced by any of the patches — verified by re-grep on every anti-pattern the rubric cares about (`gradient(`, `backdrop-filter`, `console.log`, external `http(s)://` in `href`/`src`, emoji ranges, Inter/system-ui as primary font).

## Regression scan

Searched for fixes-that-broke-something:

- `gradient(` count dropped from 3 → 1 (only the intentional stamp texture). No collateral.
- `max-width` change from `22ch` → `min(28ch, 100%)` doesn't widen past container — `min()` guards it. Safe.
- `.hl` nowrap scoping doesn't affect desktop appearance; narrow-screen wrap behavior is now defined rather than fragile. Safe.
- `.copied` empty-then-fill pattern: timing is `1500ms show → remove .show → 420ms wait → clear textContent`. The 420ms matches the 380ms CSS transition with 40ms slack. Re-clicking before the clear correctly re-runs `setTimeout`s without losing the visible state (old timer cleared with `clearTimeout(copyTimer)`). The inner `setTimeout` for clearing is not tracked, but the `if (!classList.contains("show"))` guard prevents a stale clear from wiping a freshly-shown toast. Defensive enough.
- Inset shadow at `220px @ 0.22` could in theory crowd the content edge on very narrow viewports, but `inset` shadows don't affect layout, and the 220px radius on a viewport <420px will just feel like a soft burnt vignette, which matches the editorial direction. Not a regression.

## Closeout

This is a 1.00. There is nothing left in the rubric to score against. Stopping here is the correct call — further iteration would be polish for its own sake, not correction.

### Optional polish (NOT issues, NOT required, do not pursue inside this harness run)

These are observations only; none affect the score and none should trigger another iteration:

1. **Duplicate `padding-left` on `.quote-col`** (lines 103 and 105). The first declaration (`clamp(0rem, 3vw, 2rem)`) is immediately overridden by the second (`clamp(1rem, 3vw, 2.5rem)`). Cosmetic dead code, no rendering impact. A linter would flag it.
2. **Inner `setTimeout` in `flashCopied`** (line 620) isn't tracked in a variable. If the user spam-clicks the quote across the 420ms window, multiple stale clears can queue up. The `classList.contains("show")` guard makes this functionally safe, but a tracked timer would be slightly tidier.
3. The colophon's `border-top` plus the page's inset shadow stack slightly at the bottom edge — visually fine, just worth knowing if someone later tunes the vignette darker.

None of the above warrants another generator pass.
