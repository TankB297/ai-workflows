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
- Do not modify unrelated files.
- If a change may impact existing behavior, call out the risk before modifying.
- If existing behavior is impacted after the change, explicitly report it in the final answer.
- Do not refactor unrelated areas.
- Prefer stability and predictability over clever solutions.

## Code Consistency

- Think like a senior engineer: simple, maintainable, reusable, and scalable.
- Follow the target repo's existing patterns, naming, structure, and state management.
- Prefer modifying existing files over creating new files when practical.
- Avoid duplicate logic; reuse existing helpers, hooks, components, and utilities when available.
- Extract reusable logic only when it removes real duplication or complexity.
- Do not introduce new patterns if similar ones already exist.
- Keep code clean without adding abstraction for its own sake.

## Debugging And Verification

- Identify the root cause before applying a fix.
- Avoid temporary or hacky fixes.
- Verify the narrowest meaningful scenario first, then broaden only when risk requires it.
- Consider edge cases such as async flows, conditional rendering, and empty or null states.
- Final output must include verification results and remaining risks.
