# Product Specification: Marginalia

> Generated from brief: "A single-page quote-of-the-day web app — pure static HTML/CSS/JS only, ONE file `index.html` at project root."

## Vision

Marginalia is a quote-of-the-day page that feels like the inside cover of a well-loved hardcover book — handwritten annotations, deckled paper, the quiet authority of a library. Not a "card UI with a gradient." It opens once a day and rewards a slow read, not a scroll.

## Design Direction

- **Color palette**:
  - Paper: `#f3ece1` (warm cream, not pure white)
  - Ink: `#1b1714` (near-black with brown undertone, never `#000`)
  - Margin red: `#a8321f` (annotation accent, used sparingly for the date stamp and one underline)
  - Faded ink: `#6b5b4a` (metadata, attribution)
  - Edge shadow: `rgba(40, 25, 15, 0.18)` (page depth)
- **Typography**:
  - Display quote: a serif with personality — `"EB Garamond", "Hoefler Text", Garamond, serif`, italic, large (clamp 2.4rem → 5rem), tight leading (1.1)
  - Attribution: small caps, letter-spaced, `"EB Garamond", serif`, `font-variant: small-caps`
  - Annotations / UI labels: a monospace `"JetBrains Mono", "Courier New", monospace` at 11–12px, faded ink color
  - Drop cap on the opening glyph of the quote (4-line CSS `::first-letter`)
- **Layout philosophy**: Single asymmetric page. Quote sits left-of-center on a textured "paper" surface; the right margin holds handwritten-style metadata (date stamp, quote number, tags). Generous whitespace top/bottom, deliberate ragged right edge. No cards. No shadows-on-shadows.
- **Visual identity**:
  - Subtle SVG paper grain (inline `<svg>` filter with `feTurbulence`, low opacity)
  - A single red ink underline under one keyword in the quote (chosen per-quote in data)
  - A faux rubber-stamp "READ" mark in margin red, rotated -7deg, with the date
  - Thin hairline rule (`1px solid #1b1714` at 30% opacity) separating quote from attribution
- **Inspiration**: Are.na, NYRB book covers, Edward Tufte handouts, Penguin Classics colophons. Explicitly NOT: Medium, Notion templates, dribbble "quote app" results.

### Anti-AI-slop directives (must avoid)
- No purple/blue gradients anywhere
- No rounded glassmorphic cards
- No centered-everything layout
- No emoji
- No "Get inspired today" generic copy
- No Inter / system-ui font
- No floating action button
- No dark mode toggle disguised as a sun/moon icon

## Features (tight scope: 4)

### 1. Daily quote selection (deterministic)
- Hardcoded JS array of **12 quotes**, each: `{ text, author, source?, year?, highlight (substring to underline), tags[] }`
- Selection is deterministic by date (day-of-year mod N), so the same quote shows all day, and refreshing doesn't reroll
- Acceptance: opening `index.html` twice on the same day shows identical quote; opening on different days shows different quote

### 2. Margin metadata block
- Right margin shows: today's date (formatted `17 MAY 2026`), quote number (`№ 07 / 12`), tags rendered as monospace `#tag` tokens, and a faux rubber stamp
- Acceptance: visible at viewport ≥ 720px; collapses below quote on narrow screens

### 3. "Shuffle" affordance (subtle)
- Small monospace link in the bottom margin: `[ draw another ↩ ]`
- Clicking picks a different random quote (not the daily one), updates URL hash `#q=3` so it's shareable/reload-stable
- Acceptance: clicking changes quote without page reload; reloading with `#q=3` restores that quote

### 4. Copy-to-clipboard on quote tap
- Clicking the quote body copies `"text" — author` to clipboard
- Brief inline confirmation in the margin: `copied ✓` in margin red, fades after 1.5s (CSS transition on opacity, no JS animation library)
- Acceptance: clipboard contains formatted text; confirmation appears and fades

## Technical Stack

- **One file**: `/Users/tom/Codes/self-promotion/index.html`
- Inline `<style>` and inline `<script>` — no external CSS, no external JS, no CDN
- No fonts loaded from Google Fonts (would be a network call); rely on system serif fallback stack, document the preferred face first
- SVG paper-grain filter inline in the document
- Vanilla JS only, no framework

## Evaluation Criteria

### Design Quality (weight: 0.35)
- Uses the specified cream/ink/red palette (not generic white + blue)
- Serif typography with italic display quote and small-caps attribution
- Asymmetric layout, not centered card
- Visible paper texture or grain effect
- Drop cap on first letter of quote

### Originality (weight: 0.20)
- Has the "book margin" identity (rubber stamp, monospace annotations, red underline on one keyword)
- Does NOT look like a generic quote-card template
- No banned patterns (gradients, glass cards, emoji, FAB, Inter font)

### Craft (weight: 0.30)
- Hover/focus state on the shuffle link is intentional (not browser default)
- Copy confirmation transitions smoothly (opacity, not display:none flash)
- Responsive: readable at 360px width, elegant at 1440px
- Hairline rules are actually 1px and semi-transparent
- No layout shift when shuffling quotes

### Functionality (weight: 0.15)
- 12+ quotes in the array
- Daily quote is deterministic by date
- Shuffle works and updates URL hash
- Reloading with `#q=N` restores that quote
- Copy-to-clipboard works

## Sprint Plan

### Sprint 1: Structure & data
- HTML skeleton, quotes array (12 entries with real, well-attributed quotes — Borges, Didion, Calvino, Sontag, Berger, etc.; no Einstein-misattributions, no LinkedIn-bait)
- Daily selection logic, hash-based override
- Definition of done: opens in browser, shows a quote, refreshes deterministically

### Sprint 2: Visual identity
- Paper background, typography, drop cap, asymmetric layout
- Margin block with date, number, tags, rubber stamp
- Red underline on highlighted keyword
- Definition of done: looks like Marginalia, not like a Tailwind starter

### Sprint 3: Interaction polish
- Shuffle link with hover state
- Copy-to-clipboard with fading confirmation
- Responsive collapse for narrow viewports
- Definition of done: all 4 features pass acceptance criteria
