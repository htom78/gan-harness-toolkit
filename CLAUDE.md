# gan-harness-toolkit

This is a Claude Code subagent toolkit — three Markdown files that install as subagents into `~/.claude/agents/`.

**No runtime. No build step. No dependencies.**

## If you're working on agent prompts

Before committing any change to `agents/*.md`, test it by running a full loop on the Marginalia brief or a similarly small brief:

```
1. ./install.sh                              # install modified agents
2. (in Claude Code) "Use the GAN harness to build a single-page quote-of-the-day app"
3. Let it run at least one full planner → generator → evaluator pass
4. Check that feedback-001.md looks sane and scores reflect the rubric
```

The reference output lives in `examples/marginalia/`. If your change alters evaluator scoring behavior, compare against `feedback-002.md` (the 1.00 closeout) to confirm the bar hasn't shifted accidentally.

## Key paths

```
agents/          ← the three subagent prompts (source of truth)
examples/        ← reference runs (do not modify)
install.sh       ← copies agents/ → ~/.claude/agents/
```

## Installing

```bash
./install.sh
```

Verify with `/agents` in Claude Code or look for `gan-planner`, `gan-generator`, `gan-evaluator` in the Agent tool subagent list.
