# Routed Agent Workflow

Use this file as attached context when running an agent through a routed or cost-sensitive model setup, such as Cline, Kilo Code, or 9Router.

## Default Mode

- Treat Planner and Executor as workflow roles, not fixed model IDs.
- Prefer one agent doing the work sequentially for small and routine tasks.
- Keep context small and avoid unnecessary restatement.
- Make the smallest safe change that satisfies the request.
- Verify before final response.

## Planning Workflow

Use planning when the task is non-trivial, risky, cross-file, or unclear.

Planner output must include:

- goal and success criteria
- current-state assumptions to validate
- files or areas to inspect
- proposed implementation steps
- risks and edge cases
- verification checklist
- memory and delegation recommendation

Planning rules:

- Keep the plan short and decision-complete.
- Do not write code during planning.
- Prefer repo facts over guesses.
- Ask only for product intent or tradeoffs that cannot be discovered from the repo.
- Default to no memory for small repos with clear source files.
- Default to no sub-agents unless the user requests delegation or the task complexity justifies it.

## Execution Workflow

Executor must:

1. Validate the plan against the actual repo.
2. Inspect the relevant files before editing.
3. Identify the source of truth.
4. Implement the smallest scoped change.
5. Run the narrowest meaningful verification.
6. Report changed files, verification, and remaining risks.

Execution rules:

- Do not refactor unrelated areas.
- Do not introduce new patterns when existing patterns are sufficient.
- Do not overwrite user changes.
- Prefer existing helpers, components, hooks, utilities, and commands.
- If verification cannot run, state exactly what was not verified and why.

## Delegation Policy

- Default to single-agent execution.
- Do not spawn sub-agents for routine implementation.
- Spawn sub-agents when the user explicitly requests it.
- Spawn sub-agents when the task is complex or risky enough that parallel investigation, scoped implementation, or independent verification will reduce meaningful risk or rework.
- Keep each sub-agent scope narrow and concrete.
- Avoid duplicate work between the main agent and sub-agents.
- Prefer one focused sub-agent when token budget is tight.

## Routed Model Policy

When using a dynamic model route:

- Do not assume one fixed backend model.
- Prefer reasoning-capable models for planning.
- Prefer coding-capable models for execution.
- If the route falls back to a weaker model, reduce task scope and verify more carefully.
- Avoid broad refactors, migrations, or multi-file rewrites after fallback unless the model quality is known to be sufficient.
- Record the actual routed model in final notes when the tool exposes it.

## Memory Policy

- Use project memory only when the task depends on past decisions, recurring bugs, project-specific constraints, or unclear existing behavior.
- Skip memory for tiny repos, isolated docs edits, and changes where source files are clear.
- Current code and the user's latest request override memory.

## Final Response

Keep the final response concise and include:

- summary of changes
- files changed
- verification result
- remaining risks, if any
