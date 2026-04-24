Analyze this task and produce a practical implementation plan.

Use GPT-5.5 for planning, reasoning, and review.

Context to consider:

- target project type, language, framework, and tooling
- existing repo structure
- source of truth
- likely files to inspect
- implementation risks
- verification strategy
- whether memory lookup or sub-agent delegation may help

Output:

- goal and success criteria
- current-state assumptions to validate
- files or areas to inspect
- proposed implementation steps
- risks and edge cases
- verification checklist
- suggested memory and delegation strategy

Rules:

- do not write code
- do not over-engineer
- prefer minimal safe changes
- follow the target repo's existing patterns
- call out unclear requirements directly
- recommend memory and delegation, but let the executor decide after validating the repo
