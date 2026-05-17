# Changelog

## v0.2.0 — 2026-05-17

### gan-evaluator

Three patches inspired by msitarzewski/agency-agents' `testing-reality-checker`:

- **`vibe:` frontmatter field** — one-line personality compression, displayable as chip in agent-list views.
- **AUTO-FAIL Triggers section** — explicit checklist of 5 "fantasy signals" (zero-issues claim, perfect first-iter score, unearned superlatives, "production ready" without checklist, self-congratulatory framing). Each is something the evaluator's natural tendency would emit; the prompt now says: stop and re-score downward instead.
- **Iteration Calibration note** — sets explicit expectation that "first implementations typically need 2-3 revision cycles". A 0.93→1.00 jump in one iteration with no real changes is now flagged as suspicious. Calibrates the loop against premature convergence.

No breaking changes. `gan-planner` and `gan-generator` unchanged.

## v0.1.0 — 2026-05-17

Initial extract of the three GAN harness subagents (`gan-planner`, `gan-generator`, `gan-evaluator`) plus the Marginalia reference example.
