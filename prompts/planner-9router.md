Analyze this task and produce a concise implementation plan for a 9Router-based workflow.

Use 9Router as a dynamic model route. Do not assume one fixed model.

Context to consider:

- target project type, language, framework, and tooling
- existing repo structure
- source of truth
- likely files to inspect
- implementation risks
- verification strategy
- whether memory lookup is actually useful
- whether sub-agent delegation is worth the token cost

Output:

- goal and success criteria
- current-state assumptions to validate
- files or areas to inspect
- proposed implementation steps
- risks and edge cases
- verification checklist
- memory and delegation recommendation

Rules:

- keep the plan short and decision-complete
- do not write code
- do not over-engineer
- prefer minimal safe changes
- follow the target repo's existing patterns
- call out unclear requirements directly
- default to no memory for small repos with clear source files
- default to single-agent execution
- recommend at most one narrow sub-agent only when it clearly reduces risk or rework
- account for model fallback by reducing scope and requiring stronger verification
