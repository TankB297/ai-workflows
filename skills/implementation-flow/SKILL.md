---
name: implementation-flow
description: Execute implementation tasks from a validated plan using focused exploration, scoped implementation, targeted verification, and optional sub-agent delegation.
---

# Implementation Flow

Use this skill to execute implementation tasks from an existing request or plan.

Supported project types:

- frontend
- mobile
- backend
- full-stack
- scripts and tooling
- documentation and configuration

Supported task types:

- bugfix
- feature implementation
- refactor
- investigation

## Core Rule

Keep the work small, factual, and tied to the target repository's existing patterns.

This skill is self-contained. The `agents/` and `prompts/` folders may provide useful templates, but they are not required.

## Sub-Agent Delegation

Codex may use real sub-agents when the environment supports delegation.

Use sub-agents for non-trivial tasks where parallel investigation, scoped implementation, or independent verification will reduce risk or save time.

Do not delegate tiny changes where sub-agent coordination adds more overhead than value.

Recommended delegation:

- Explorer: read-only investigation, data flow tracing, source-of-truth discovery, and risk identification.
- Implementer: scoped code changes that follow the agreed plan and existing architecture.
- Verifier: targeted validation, edge-case checks, command results, and remaining risk reporting.

The main executor remains responsible for:

- validating the plan before delegation
- deciding whether delegation is useful
- giving each sub-agent a clear scope
- integrating sub-agent findings
- reviewing final code consistency
- producing the final answer

## Environment Detection

Before implementing, identify the project type, language, framework, and tooling from repo files and conventions.

General indicators:

- manifests such as `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `Gemfile`, or similar
- framework config files
- app entrypoints, routing, services, packages, modules, scripts, or docs
- test, lint, typecheck, and build commands

Adapt implementation accordingly:

- preserve existing architecture, naming, state management, and module boundaries
- respect framework-specific constraints and runtime boundaries
- use the repo's existing test and build tools when available
- avoid introducing new tooling unless explicitly required

For React, React Native, and Next.js projects, also preserve component boundaries, platform constraints, route conventions, and client/server boundaries.

## Workflow

### 1. Validate Plan

- Compare the request or plan with the actual repository.
- Identify wrong assumptions, missing files, missing dependencies, or unclear behavior.
- Confirm the target project type, language, framework, and tooling.
- Refine the approach before editing code.
- For non-trivial work, state the implementation plan before making changes.

### 2. Explore

Exploration is read-only.

- Trace the relevant data flow.
- Identify the source of truth.
- Inspect related components, hooks, stores, routes, services, tests, and styles.
- Check existing naming, structure, error handling, and testing patterns.
- Do not modify code during exploration.

### 3. Implement

Make the smallest safe change that satisfies the request.

- Follow existing architecture and naming.
- Avoid unrelated refactors.
- Avoid new abstractions unless they remove real complexity.
- Keep changes local to the affected behavior.
- Preserve public APIs unless the task explicitly requires changing them.
- Update tests only where useful for the changed behavior.

### 4. Verify

Use the target repo's existing verification tools where available.

Verify the most relevant combination of:

- reported scenario
- expected behavior
- regression path
- edge cases
- typecheck
- lint
- unit tests
- integration tests
- app build

For platform-sensitive projects, prefer targeted platform checks.

For frameworks with runtime boundaries, verify affected boundaries such as client/server, mobile platform, routing, worker, API, or build-time behavior.

If verification cannot be completed, state exactly what was not verified and why.

### 5. Finalize

The main executor owns the final result.

- Reconcile exploration, implementation, and verification findings.
- Make sure the final answer matches the actual changes.
- Do not overstate verification.
- Call out remaining risks clearly.

## Output Contract

Final output must include:

- root cause or design decision
- files changed
- summary of changes
- verification result
- remaining risks
