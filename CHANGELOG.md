# Changelog

## 0.2.0 — 2026-11-03
For designers with no GitHub experience.
- README install steps for the Claude desktop and web app, Cowork and Claude Code; updating without Claude Code; "No Git? No problem" section with starter prompts
- Release ZIPs (one per skill, plus a plugin ZIP) built and attached to each GitHub release by `.github/workflows/release-zips.yml` (`scripts/build-skill-zips.sh`); every ZIP carries LICENSE, NOTICE.md and licenses/
- `ui-review`: reviews from a Figma link or screenshot alone; "review my changes" without Git uses before/after; plain-language reports (Where by screen and layer, code locations in a "For developers" line) when `Explain: plain` is set or the reader is a designer
- `design-direction`: saves to the project folder root when there is no repo, prefers `DESIGN.md` there, and offers a download when Claude has no folder access

## 0.1.0 — 2026-11-02
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
- `fintech-review` skill: amounts and balances, sensitive data, step-up, moving money, receipts and statements, money errors, Islamic-banking terminology (reads project rules, never invents them); six money blockers; linked from `ui-review`
- fintech-review decision notes and 7 eval cases
