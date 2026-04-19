# Agent Rules

- Keep this repo small and practical.
- Skills must live at `skills/<name>/SKILL.md`.
- Skills should be self-contained and reusable across machines.
- Prompts are templates, not runtime dependencies.
- Agents are reusable role definitions, not auto-loaded runtime agents.
- Prefer plan-first for non-trivial work.
- Prefer minimal safe changes over broad refactors.
- Follow the target repo's existing patterns.
- Do not add framework machinery unless it solves a real daily-use problem.
- Final output must include verification results and remaining risks.
- If project memory tooling such as MemPalace is available, consult it before modifying unfamiliar or existing logic.
- Prefer MCP memory tools over shell commands when available.
- Current code, tests, user request, and project-specific instructions override retrieved memory.
