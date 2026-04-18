---
name: react-implementation-flow
description: Execute ReactJS, React Native, and NextJS tasks from a validated plan using focused exploration, minimal implementation, and targeted verification.
---

# React Implementation Flow

Use this skill to execute a React ecosystem task from an existing request or plan.

Supported targets:

- ReactJS
- React Native
- NextJS

Supported task types:

- bugfix
- feature implementation
- refactor
- investigation

## Core Rule

Keep the work small, factual, and tied to the target repository's existing patterns.

This skill is self-contained. The `agents/` and `prompts/` folders may provide useful templates, but they are not required.

## Environment Detection

Before implementing, identify the project type from repo files and conventions.

ReactJS indicators:

- `package.json` with React dependencies
- Vite, CRA, Webpack, or similar web tooling
- `src/`, `public/`, browser-focused components

React Native indicators:

- `react-native` dependency
- Expo config, Metro config, native folders, or mobile entrypoints
- platform-specific files such as `.ios.*`, `.android.*`, `ios/`, `android/`

NextJS indicators:

- `next` dependency
- `next.config.*`
- `app/` or `pages/` routing
- server/client component boundaries

Adapt implementation accordingly:

- ReactJS: preserve component boundaries, browser behavior, routing, state, and build tooling.
- React Native: preserve platform behavior, navigation patterns, native constraints, and device-specific UX.
- NextJS: respect server/client components, route conventions, data fetching boundaries, caching, and runtime constraints.

## Workflow

### 1. Validate Plan

- Compare the request or plan with the actual repository.
- Identify wrong assumptions, missing files, missing dependencies, or unclear behavior.
- Confirm the target framework: ReactJS, React Native, or NextJS.
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

For React Native, prefer targeted platform checks when the change is platform-sensitive.

For NextJS, verify client/server boundaries and route behavior when affected.

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
