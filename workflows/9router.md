# 9Router Cost-Saving Workflow

Use this workflow when cost or free quota matters more than maximum model stability.

9Router may route requests to different models as quotas, availability, or fallback rules change. Treat Planner and Executor as workflow roles, not fixed model IDs.

## Roles

- Planner: produces a short, practical implementation plan with clear scope, risks, and verification.
- Executor: validates the plan against the repo, implements the smallest safe change, and verifies the result.

Use separate Planner and Executor threads when useful, but keep both concise. If one thread is enough for a small task, use one thread.

## Model Policy

- Do not hardcode one model as the workflow requirement.
- Prefer reasoning-capable models for planning.
- Prefer coding-capable models for execution.
- If 9Router falls back to a weaker model, reduce task scope and increase verification.
- Avoid broad refactors, migrations, or multi-file rewrites after a fallback unless the model quality is known to be sufficient.
- Record the actual routed model in final notes when the tool exposes it.

## Execution Policy

- Default to single-agent execution.
- Do not spawn sub-agents for routine implementation.
- Spawn at most one focused sub-agent only when it clearly reduces risk or rework.
- Keep any sub-agent scope narrow, such as read-only root-cause analysis or final diff review.
- Prefer sequential verification over parallel exploration.

## Memory Policy

- Skip memory for tiny repos, isolated docs edits, and changes where source files are clear.
- Use project memory only when the task depends on past decisions, recurring bugs, project-specific constraints, or unclear existing behavior.
- Current code and the user's latest request override memory.

## Verification Policy

- Verify the narrowest meaningful scenario first.
- For fallback or weaker models, add one extra regression check before finishing.
- If verification cannot run, state exactly what was not verified and why.
- Keep final notes concise: changed files, verification, and remaining risk.
