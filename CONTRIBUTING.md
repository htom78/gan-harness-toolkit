# Contributing

## What's worth contributing

- Improvements to the three agent prompts (`agents/*.md`)
- New example briefs under `examples/`
- Rubric additions or scoring methodology changes
- Bug fixes in `install.sh`
- New agent types (e.g. a Critic agent, a Refactor agent)

## Before opening a PR

### For agent prompt changes

Any change to `agents/gan-planner.md`, `agents/gan-generator.md`, or `agents/gan-evaluator.md` must be tested with at least one complete GAN loop iteration before submitting. A "complete iteration" means:

1. Install your modified agent(s) via `install.sh`
2. Run a full planner → generator → evaluator pass on a real brief
3. Include the output diff in your PR — specifically the `feedback-NNN.md` file the evaluator produced and the before/after `generator-state.md`

PRs that only assert "this prompt sounds better" without a tested output will not be merged.

### For new examples

Add the full `gan-harness/` directory output from a real run under `examples/<name>/`. Include at minimum: `spec.md`, `eval-rubric.md`, `feedback/feedback-001.md`, and `generator-state.md`. The built artifact is optional but welcome.

### For new agent types

Open an issue first describing the role, what tools it needs, and where it fits in the loop. Align on the design before writing the prompt.

## PR checklist

See `.github/pull_request_template.md` — it's short.

## Issues

Use the issue templates in `.github/ISSUE_TEMPLATE/`. For evaluator behavior questions ("why did it score X so low?") attach the relevant `feedback-NNN.md` and `eval-rubric.md`.

## Style

- Keep agent prompts under ~120 lines. The current three fit in a single screenful — that's intentional.
- No external dependencies. The harness is deliberately zero-runtime.
- If you change file-system conventions (paths, filenames), update the README protocol diagram too.
