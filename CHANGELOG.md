# Changelog

## 0.1.0 (unreleased)
- Repo scaffold, sources pinned
- `motion` skill: decision steps, tokens, CSS / Expo / SwiftUI references, loading states, choreography, review checklist
- Decision log for motion conflicts (docs/decisions/motion.md)
- Motion evals
- `typography` skill: roles, line height, tracking, measure, floors, families, numbers, wrapping; web / SwiftUI / Expo references; numbers & punctuation; review checklist
- Decision log for typography conflicts; typography evals
- Credit ehmo/platform-design-skills in NOTICE
- `design-direction` skill: brief, subject inventory, signature, plan, review, build, checks; app-screen and page references; dated list of generated-look defaults; shared `.design/system.md` template
- Decision log for design-direction conflicts; design-direction evals
- `ui-review` skill: scope, project conventions, seven-area review, Blocker/Major/Polish with automatic blockers, evidence rules, cheapest-fix ladder, /28 scorecard and verdict; checklist, scoring rubric, generic-pattern review guide, change (PR/branch) review mode
- Decision log for ui-review conflicts; ui-review evals
- Eval suite: 35 runnable cases for `claude plugin eval` (prompt + LLM grader each); readable tables moved to docs/evals/; results in docs/evals/RESULTS.md
- Fixes from eval findings: motion gate rule for requested-but-rejected animation; typography pushback rules for disabling text scaling and decorative uppercase labels; design-direction keeps brand names and uses brief-requested looks without commentary; wider skill descriptions so skills load on real phrasing
