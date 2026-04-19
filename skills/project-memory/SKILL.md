---
name: project-memory
description: Use MemPalace memory before modifying unfamiliar, existing, or context-heavy project logic. Prefer MCP tools when available; fall back to CLI when needed.
---

# Project Memory

Use this skill to retrieve relevant project memory before coding.

This skill is optional and works best when MemPalace is configured as an MCP server. It can also fall back to the MemPalace CLI.

## When To Use

Use project memory when:

- debugging bugs
- modifying existing logic
- working in unfamiliar code
- resuming paused work
- task references prior behavior, bugs, decisions, or architecture
- requirements are unclear and past context may help

Do not use memory for tiny, isolated edits where current code is already sufficient.

## Source Of Truth

Memory is supporting context, not authority.

Priority order:

1. Current user request
2. Project `AGENTS.md`
3. Actual code and tests
4. Retrieved memory

If memory conflicts with code, trust the code and mention the mismatch.

## Preferred MCP Workflow

When MemPalace MCP tools are available:

1. For broad or unclear work, call `mempalace_status` first.
2. Search with `mempalace_search` using a natural-language query.
3. If results are noisy, inspect structure with `mempalace_list_wings` or `mempalace_list_rooms`.
4. Summarize only the retrieved context relevant to the task.
5. Use the memory as input to exploration, not as a replacement for reading code.

Useful query style:

- "authentication flow decisions"
- "pricing calculation bug"
- "navigation state management"
- "why we changed API error handling"

## CLI Fallback

If MCP tools are not available, use the CLI:

```bash
mempalace wake-up
mempalace search "<natural language query>"
mempalace status
```

For project-specific context, prefer scoped queries when available:

```bash
mempalace wake-up --wing <project-name>
mempalace search "<query>" --wing <project-name>
```

## Saving Memory

Only save memory when it is useful later.

Good candidates:

- architecture decisions
- bug root causes
- behavior contracts
- important tradeoffs
- completed task summaries
- surprising project constraints

Avoid saving:

- generic progress notes
- temporary guesses
- duplicated code snippets
- secrets or private credentials
- noise that can be recovered directly from code

When MCP diary tools are available, prefer them for session summaries. Otherwise, leave saving to the user or project-specific workflow.

## Output Behavior

Before coding, briefly report:

- whether memory was checked
- what relevant context was found
- any conflict between memory and current code

Final output should include any memory-related risk if retrieval was unavailable, stale, or conflicting.
