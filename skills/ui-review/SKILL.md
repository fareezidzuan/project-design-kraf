---
name: ui-review
description: Review a screen, flow, page, component, copy or code change for usability, accessibility, hierarchy, typography, colour, motion, states and craft, and return one scored, ranked report with concrete fixes. Use when asked to review, critique, audit or QA a design, UI, landing page copy, pull request or branch that touches interface code, or before shipping.
---

# UI review

One review, one report. Findings are backed by evidence, ranked by user impact, and each comes with the cheapest fix that works. Reviewing is read-only: don't edit files unless the user also asks you to fix things.

## 1. Set the scope

- **A screen, flow, page or component:** state exactly what you reviewed, including loading, empty, error and narrow-width states where they exist. If the scope is too big to inspect properly, narrow it to one complete flow and say what you left out.
- **A pull request, branch, commit range or uncommitted work:** this is a change review. Follow [references/change-review.md](references/change-review.md).
- **"Review my changes" with no Git** (no repo, or the user doesn't use Git): don't ask for a branch or diff. Ask for the before and after (two Figma links, frames, screenshots or exports) and review the after, focusing on what changed. Otherwise review the current design as a screen or flow.
- **A Figma link, screenshot or image only:** review it as a screen; no repo or code is needed. Code-only checks (lint, a11y tests) are "Not verified", not findings.

## 2. Learn the project first

- Stack, styling system, components, tokens, supported platforms and viewports.
- What the project has already decided: `.design/system.md`, `DESIGN.md`, a design-system doc, `AGENTS.md`/`CLAUDE.md`, Storybook. Name what you found.
- **Documented choices settle taste.** A deliberate density, radius or voice you'd do differently is not a finding, unless it triggers a blocker (step 4).
- Write fixes in the project's own idiom. Never ask it to switch stacks.

## 3. Review every area, foundations first

Work through [references/checklist.md](references/checklist.md) in this order, so polish never hides a broken foundation:

1. **Usability and accessibility**: can people complete the task, with any input method and ability?
2. **Hierarchy and layout**: is it obvious what matters and where to go?
3. **Content and states**: copy, forms, feedback, loading, empty, error.
4. **Typography**: use the `typography` skill's review checklist.
5. **Colour and depth**: contrast, meaning, consistency.
6. **Motion**: use the `motion` skill's review checklist.
7. **Craft and specificity**: does it feel designed for this product? See [references/ai-slop-patterns.md](references/ai-slop-patterns.md).

**Money on screen?** If the screen shows balances, amounts or cards, or moves money, also apply the `fintech-review` skill and add its **Money** area to the scorecard.

## 4. Rank by user impact

| Severity | Means |
|---|---|
| **Blocker** | Stops a task, misleads, excludes someone, risks data or money, or is a systemic failure. Don't ship. |
| **Major** | Meaningfully hurts comprehension, efficiency, consistency or trust. Fix before or right after release. |
| **Polish** | Isolated craft detail with little task impact. |

**Automatic blockers.** Once confirmed, these are Blockers wherever they appear, however minor the screen:

- A button, link or input that assistive tech can't name.
- Focus that can't be seen, or anything a mouse can reach that a keyboard can't.
- Text or a control's essential edge failing its contrast requirement.
- Meaning or state shown by colour alone.
- Content or controls clipped, overlapping or unreachable at 320px width, 200% zoom, or the largest system text size.
- Motion or autoplay that ignores reduced-motion settings; a state change shown only by animation.
- A destructive or irreversible action with no confirmation, undo or distinct treatment.
- An error that doesn't say how to recover.
- Text cut off with no way to see the rest.
- Invented proof (customers, quotes, logos, metrics) or a fake success ("Sent!") with nothing behind it.
- A semantic colour used against its meaning (danger red on a harmless action).

Within a severity, rank by reach: a fix to a shared token or component outranks the same symptom in one place.

## 5. Require evidence

Every finding cites a location (`path/to/file:line`, a component, or a screenshot region) and shows what's there now. Visual claims need a render or screenshot; code claims need the code. **Anything you couldn't check is "Not verified", never a finding.** Run the safe checks the project offers (lint, a11y tests, a preview) and report the exact command and result.

## 6. Propose the cheapest fix

Take the first that works:

1. **Delete** it (a divider space would do, an animation on a frequent action, redundant ARIA).
2. **Use the platform** (the native element, control or focus ring).
3. **Reuse the project's own** token, component or curve.
4. **Correct the value** (the right easing, gap, contrast pair).
5. **Add** something new.

One root cause is one finding, with every location in the same row.

## 7. Score and decide

Score the seven areas 0–4 using [references/scoring.md](references/scoring.md). Mark areas that don't apply as n/a and rescale the total. The verdict comes from findings, not the score:

- **Block**: any Blocker remains.
- **Ship after fixes**: no Blockers, but Majors remain.
- **Ship**: Polish only, or nothing to report.

Never approve what you didn't inspect.

## Plain language

If the project's `CLAUDE.md` has `Explain: plain`, or the reader is a designer reviewing a design rather than code:
- Write **Where** as the screen, frame or layer ("Checkout › Pay button"), not `path/to/file:line`. Put code locations, if any, in one "For developers" line under the finding.
- Write **Change to** as the design change ("raise the label to 16 px, Text/Body style"), not a code diff.
- Explain an unavoidable technical term in a few words the first time.
Severities, evidence rules and the scorecard stay the same.

## Report format

```md
## UI review: <scope>
**Verdict:** Ship after fixes · **Score:** 20/28
Reviewed: <screens, states, widths, devices> · Not reviewed: <…>
Project conventions found: <files>

### Fix these first
1. … 2. … 3. …

### Scorecard
| Area | Score | Note |
|---|---|---|
| Usability & accessibility | 2 | … |
| Hierarchy & layout | 3 | … |
| Content & states | 3 | … |
| Typography | 3 | … |
| Colour & depth | 3 | … |
| Motion | 3 | … |
| Craft & specificity | n/a | … |

### Findings
| Severity | Area | Where | Now | Change to | Why |
|---|---|---|---|---|---|

### What's working
2–3 specific things to keep.

### Verification
What you ran or rendered, and its result. What is not verified.
```

At most 15 findings. A short report, or "No actionable findings", is a valid result; never pad.
