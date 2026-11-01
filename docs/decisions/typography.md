# Typography: where sources disagree and what we chose

Sources: Jakub Krehel (`better-typography`), Impeccable (`typeset`, `ios`, `android` references; the platform files derive from ehmo's `platform-design-skills`), Taste Skill, Hallmark, Refactoring UI (Wondel.ai), Vercel Web Interface Guidelines. Commits pinned in NOTICE.md.

| # | Topic | What sources say | Our rule | Why |
|---|---|---|---|---|
| 1 | Line length (measure) | Jakub 60–75 characters; Impeccable and Hallmark 45–75 | **45–75 characters; aim for ~65 in long-form reading.** | 45 is a fair floor for narrow columns and mobile; the ideal sits in Jakub's range. |
| 2 | Body line-height | Jakub 1.5–1.6; Hallmark 1.5–1.65; Refactoring UI 1.75 | **1.5–1.65; go higher as the measure gets wider or the text gets lighter on dark.** | 1.75 suits wide editorial columns only; Impeccable's point that leading tracks measure resolves the spread. |
| 3 | Number of families | Jakub ≤ 3; Refactoring UI ≤ 2; Taste Skill: a second face only with one job | **One family by default. A second only with a named job (mono for figures/IDs, a display face for headlines). Three only on marketing pages.** | Combines all three; the "named job" test is the most useful filter. |
| 4 | Uppercase labels | Jakub: small caps labels get +0.05em; Taste Skill and Hallmark ban tiny tracked uppercase "eyebrows" | **Sentence case by default. Uppercase only for short labels (≤ 3 words) that carry real information, tracked +0.02–0.06em. No decorative eyebrow above every heading.** | Both sides are right about different things: tracking fixes legibility of caps; the eyebrow ban fixes a cliché. |
| 5 | Display tracking | Jakub −0.01 to −0.02em at ≥ 24px; Hallmark −0.02 to −0.04em on display | **24–40px: −0.01 to −0.02em. Above 40px: −0.02 to −0.03em. Condensed or very heavy faces: 0 to −0.015em. Letters must never touch.** | Scales tightening with size; Hallmark's condensed caveat prevents collisions. |
| 6 | Body size floor | Jakub 16px long-form, UI 14px, captions 13px, rarely < 12px; iOS 17pt body, 11pt floor | **Web: 16px body, 14px dense UI, 12px absolute floor. iOS: system text styles (Body 17pt), 11pt floor. Android: Material roles in sp.** | Each platform keeps its own conventions. |
