# Generator State — Iteration 002

## What Was Built
- Single-file `index.html` Marginalia quote-of-the-day page (carried over from iteration 001)
- 12 quotes, deterministic daily selection, hash override, shuffle, copy-to-clipboard
- Paper grain, drop cap, asymmetric grid, red highlight, rubber stamp, monospace marginalia

## What Changed This Iteration
- **Fixed B1**: Removed dead no-op `linear-gradient` on `.page`. Now `background: var(--paper);` only.
- **Fixed minor #2**: Strengthened inset box-shadow on `.page` so the vignette is actually visible (`220px @ 0.22 alpha` instead of `120px @ 0.08`).
- **Fixed minor #3**: Stamp date now uses `shortDate()` ("17 MAY") to differentiate from the filed long date ("17 MAY 2026") above it — eliminates the verbatim duplication.
- **Fixed minor #4**: Quote `max-width` bumped from `22ch` to `min(28ch, 100%)` so mid-width screens don't fragment long quotes into 5+ short lines.
- **Fixed minor #5**: `.hl white-space: nowrap` is now scoped to `@media (min-width: 760px)` so narrow viewports can wrap inside the highlight.
- **Fixed minor #6**: Removed the fragile `margin-top: -0.6rem` on `.copied`; the flex `gap` on `aside.margin` now handles placement.
- **Fixed minor #7**: `.copied` starts empty in the DOM; `flashCopied()` writes textContent on show and clears it after the fade so `aria-live="polite"` re-announces reliably.

## Known Issues
- None outstanding from feedback-001.

## Dev Server
- URL: `file:///Users/tom/Codes/self-promotion/index.html`
- Status: no server needed (single static file)
- Command: open the file directly in a browser
