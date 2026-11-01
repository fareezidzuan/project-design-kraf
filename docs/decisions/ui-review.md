# UI review: where sources disagree and what we chose

Sources: Impeccable (`critique`, `audit`, `craft-floor`), Hallmark (`gates`), Refactoring UI (Wondel.ai), Vercel Web Interface Guidelines, Jakub Krehel (`better-interface`, `interface-review`). Commits pinned in NOTICE.md.

| # | Topic | What sources say | Our rule | Why |
|---|---|---|---|---|
| 1 | Score | Impeccable: Nielsen's 10 heuristics, 0–4 each (/40). Refactoring UI: 8 yes/no checks → /10. Hallmark: 6 axes, 1–5, before building. Jakub: no score; Block/Approve verdict | **Seven areas scored 0–4 (/28) plus a verdict: Ship · Ship after fixes · Block.** Nielsen's heuristics are the lens for the Usability area. Areas that don't apply are marked n/a and the total is rescaled. | One number people can track over time, while the verdict stays driven by blockers, not averages. |
| 2 | Severity levels | Impeccable P0–P3; Jakub HIGH/MEDIUM/LOW; Hallmark Floor/Reflex/Finish | **Blocker · Major · Polish.** | Three levels are enough to decide what ships; P0/P1 collapse well into Blocker/Major. |
| 3 | Automatic blockers | Jakub's escalation triggers; Hallmark's Floor gates | **A fixed list of triggers is a Blocker wherever it appears** (no accessible name, no focus, keyboard trap, contrast fail, colour-only meaning, clipped at 320px/200% zoom, ignored reduced motion, destructive action without confirm/undo, unrecoverable error, truncation with no way back, invented proof, fake success). | Jakub's list plus Hallmark's honesty gates (invented metrics, fake send). |
| 4 | Eyebrows and tracked caps | Impeccable and Hallmark: banned, no brief earns them back. Frontend Design: a default | **Polish finding when decorative; no finding when the label carries information or the brand requires it.** | Consistent with the `typography` and `design-direction` decisions. |
| 5 | Pure black and white | Hallmark: floor ban outside tokens. Refactoring UI: prefer near-black | **Polish suggestion only.** | Not a usability or accessibility failure. |
| 6 | Off-scale values | Hallmark: raw spacing where a token exists fails | **Major when the project has a scale and a value bypasses it; Polish when no scale exists (recommend creating one).** | Rewards systems without punishing early projects. |
| 7 | Length of report | Jakub: max 15 findings, one row per root cause. Impeccable: 3–5 priority issues | **Lead with "fix these first" (top 3), then up to 15 findings, one per root cause.** | Combines a quick read with completeness. |
| 8 | Taste disagreements | Jakub: evidence, not taste; documented conventions settle taste | **A deliberate, documented project choice is not a finding unless it trips a trigger.** | Reviews must respect `.design/system.md`. |
| 9 | Proposing fixes | Jakub's ladder: delete → platform → reuse → correct → add | **Adopted as is.** | Cheapest correct fix first. |
| 10 | Reviewing a change (PR/branch) | Jakub: scoped to the diff; read removed lines; Introduced / Regression / Pre-existing; never check out or modify files | **Adopted.** Pre-existing findings capped at three. | Answers the author's real question: "did I make this worse?" |
