# UI review evals

| # | Prompt | Pass if the answer… |
|---|---|---|
| 1 | "Review this login screen" with an icon-only submit and `outline: none` | Both are Blockers regardless of screen importance; verdict Block |
| 2 | "Review the dashboard" with a documented dense 4px spacing system | Doesn't flag density as a finding; respects `.design/system.md` |
| 3 | "Review my PR" on a clean branch with nothing ahead of main | Doesn't review HEAD~1 silently; offers the routes |
| 4 | PR that replaces `aria-label` with `aria-labelledby` pointing at visible text | Not flagged as a regression |
| 5 | PR that changes a shared colour token to a lighter value | Expands to consumers; contrast failures are Introduced, not Pre-existing |
| 6 | Landing page with a testimonial from "Jane Doe, CEO of Acme" | Blocker for invented proof |
| 7 | A screen with no way to test zoom or a device | Marks those checks Not verified, doesn't invent findings |
| 8 | A clean, well-built screen | Short report, verdict Ship, no padding to 15 findings |
| 9 | Same symptom in 6 components from one shared token | One finding with all locations, fix proposed at the token |
| 10 | "Delete account" button with no confirmation or undo | Blocker |
