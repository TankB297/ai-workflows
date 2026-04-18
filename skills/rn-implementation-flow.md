# rn-implementation-flow

Use this skill to execute a React Native task from an existing plan.

## Supported task types
- bugfix
- feature implementation
- refactor
- investigation

---

## Workflow

### Step 1 — Validate plan
- Use plan mode
- Compare plan with actual repository
- Identify wrong assumptions or missing dependencies
- Refine plan if needed

---

### Step 2 — Execute with sub-agents

#### Explorer
- Trace data flow
- Identify source of truth
- Inspect state management and transformations
- DO NOT modify code

#### Implementer
- Apply minimal safe fix or implementation
- Follow existing architecture
- Avoid unrelated refactors

#### Verifier
- Reproduce reported scenario
- Test edge cases
- Highlight unverified areas

---

### Step 3 — Finalize

Main agent must:
- reconcile sub-agent outputs
- choose final solution
- ensure consistency

---

## Output format

- root cause / design decision
- files changed
- summary of changes
- verification result
- remaining risks

---

## Rules

- keep changes minimal
- preserve naming conventions
- avoid unnecessary refactor
- prefer targeted verification
