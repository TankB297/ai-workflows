# ai-workflows

Personal workflow templates for working with coding agents across React, React Native, and Next.js projects.

This repo is intentionally small. It is not a framework, plugin system, or installer. It stores reusable prompts, role templates, and Codex-compatible skills that can be synced across machines.

## Workflow

Default model split:

- GPT-5.4: planning, reasoning, review
- Codex / GPT-5.3: implementation and verification

Typical flow:

1. Planner creates or reviews the plan.
2. Executor validates the plan against the actual repo.
3. Explorer role investigates without editing code.
4. Implementer role makes the smallest safe change.
5. Verifier role tests the reported scenario and relevant edge cases.
6. Main executor reconciles results and gives the final summary.

## Using Skills

Skills live in:

```text
skills/<skill-name>/SKILL.md
```

Current skills:

```text
skills/react-implementation-flow/SKILL.md
skills/project-memory/SKILL.md
```

Use `react-implementation-flow` for React, React Native, and Next.js implementation work.
Use `project-memory` when MemPalace context may help before coding.

Skills are self-contained. They should still work if copied without the `agents/` or `prompts/` folders.

## Optional Project Memory

`project-memory` is an optional skill for using MemPalace as supporting context before coding.

MemPalace setup is local per machine. This repo stores the reusable skill, but it does not configure MCP servers or mine project memory.

To enable local MemPalace MCP for Codex:

```bash
codex mcp add mempalace -- python3 -m mempalace.mcp_server
codex mcp list
```

`setup.sh` only links skills into the local agent skill discovery directory.

## Folders

```text
skills/
```

Codex-compatible skills. These are the primary reusable units.

```text
agents/
```

Reusable role templates. These are not runtime agents and are not auto-loaded. Copy or reference them when useful.

```text
prompts/
```

Planner prompt templates. These are examples for planning and review. They are not runtime dependencies.

## Syncing Across Machines

Push this repo to GitHub and clone it on each machine.

Recommended use:

1. Keep this repo as the source of truth.
2. Install or symlink skills into your local agent skill discovery directory.
3. Keep local machine-specific config outside this repo.
4. Do not commit generated files, OS metadata, secrets, or project-specific state.

## Local Consumption

This repo is the source of truth.
Install or symlink skills locally when needed.
Keep machine-specific setup outside the repo.

Run setup with Bash:

```bash
bash setup.sh
```

This works even if `setup.sh` is not executable.

If you prefer running it directly:

```bash
chmod +x setup.sh
./setup.sh
```

Note:
- The first argument is interpreted as the repo path if it points to a valid directory.
- To link specific skills, always pass the repo path first: `./setup.sh /absolute/path/to/ai-workflows react-implementation-flow`
- Running `./setup.sh react-implementation-flow` alone will be treated as a repo path and may fail.
