# Agent Rules

## Repo Rules

- Keep this repo small and practical.
- Skills must live at `skills/<name>/SKILL.md`.
- Skills should be self-contained and reusable across machines.
- Prompts are templates, not runtime dependencies.
- Agents are reusable role definitions, not auto-loaded runtime agents.
- Do not add framework machinery unless it solves a real daily-use problem.

## Planning And Memory

- Prefer plan-first for non-trivial work.
- If project memory tooling such as MemPalace is available, consult it before scanning deeply or modifying unfamiliar existing logic.
- Prefer MCP memory tools over shell commands when available.
- Current code, tests, user request, and project-specific instructions override retrieved memory.

## Change Safety

- Keep changes minimal and scoped to the task.
- Do not modify existing logic unless required by the task.
- If a change may impact existing behavior, call out the risk before modifying.
- Do not refactor unrelated areas.
- Prefer stability and predictability over clever solutions.

## Code Consistency

- Follow the target repo's existing patterns, naming, structure, and state management.
- Prefer modifying existing files over creating new files when practical.
- Avoid duplicate logic; reuse existing helpers, hooks, components, and utilities when available.
- Do not introduce new patterns if similar ones already exist.

## Debugging And Verification

- Identify the root cause before applying a fix.
- Avoid temporary or hacky fixes.
- Consider edge cases such as async flows, conditional rendering, and empty or null states.
- Final output must include verification results and remaining risks.
