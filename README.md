# ai-workflows

Personal workflow templates for working with Codex-first coding agents across software projects.

This repo is intentionally small. It is not a framework, plugin system, or installer. It stores reusable prompts, role templates, and Codex-compatible skills that can be synced across machines.

## Setup

After cloning this repo:

```bash
cd ai-workflows
bash setup.sh
```

This links all skills under `skills/` into the local agent skill discovery directory.

## Usage

This repo is currently Codex-first. Skills and setup scripts are designed for Codex-style local skill discovery, while prompts and role templates remain plain Markdown.

Recommended workflow:

1. Create one planning thread with GPT-5.4.
2. Use GPT-5.4 for reasoning, discussion, review, and implementation planning.
3. Include a memory and delegation recommendation in the final plan when useful.
4. Copy the final implementation plan into a GPT-5.3-Codex execution thread.
5. Ask Codex to use the relevant skills, such as `implementation-flow` and `project-memory`.
6. Let Codex validate the plan against the actual repo, decide whether delegation is useful, then implement and verify.

Planner recommends memory and delegation strategy; Executor decides the actual sub-agent usage after validating the repo.

For planning, use:

```text
prompts/planner-gpt5.4.md
```

For execution, ask Codex to use:

```text
skills/implementation-flow/SKILL.md
skills/project-memory/SKILL.md
```

## Workflow

Default model split:

- GPT-5.4: planning, reasoning, review
- Codex / GPT-5.3: implementation and verification

Typical flow:

1. Planner creates or reviews the plan.
2. Executor validates the plan against the actual repo.
3. Executor may delegate Explorer for read-only investigation.
4. Executor may delegate Implementer for scoped code changes.
5. Executor may delegate Verifier for targeted validation.
6. Main executor reconciles sub-agent output and owns the final result.

## Decision Matrix

Use the simplest workflow that fits the task.

| Task type | Memory | Sub-agents |
| --- | --- | --- |
| Tiny docs or text edit | Skip | Skip |
| Isolated code change with obvious scope | Optional | Skip |
| Existing logic bug or unclear behavior | Use `project-memory` first | Delegate Explorer if useful |
| Multi-file or risky implementation | Use `project-memory` first | Delegate Explorer, Implementer, and Verifier |
| Verification-heavy change | Optional | Delegate Verifier |
| Architecture or behavior decision | Use `project-memory` first | Add extra specialist sub-agents if useful |

Explorer, Implementer, and Verifier are the default roles. For complex cases, Codex may spawn additional focused sub-agents when the extra scope is clear and useful.

## Using Skills

Skills live in:

```text
skills/<skill-name>/SKILL.md
```

Current skills:

```text
skills/implementation-flow/SKILL.md
skills/project-memory/SKILL.md
```

Use `implementation-flow` for implementation work across supported project types.
Use `project-memory` when MemPalace context may help before coding.

Skills are self-contained. They should still work if copied without the `agents/` or `prompts/` folders.

## Optional Project Memory

`project-memory` is an optional skill for using MemPalace as supporting context before coding.

Prerequisite: install MemPalace from https://github.com/mempalace/mempalace.

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

Link one specific skill:

```bash
bash setup.sh implementation-flow
```

Link multiple specific skills:

```bash
bash setup.sh implementation-flow project-memory
```

Use an explicit repo path only when running setup from outside the repo:

```bash
bash setup.sh /absolute/path/to/ai-workflows
bash setup.sh /absolute/path/to/ai-workflows implementation-flow
```

If you prefer running it directly:

```bash
chmod +x setup.sh
./setup.sh
./setup.sh implementation-flow
```

Note:
- If the first argument is a valid directory, it is treated as the repo path.
- Otherwise, arguments are treated as skill names.
