# Eval results

**With plugin: 62/70 (89%) · Without: 46/70 (66%)**

Full suite, 2 Nov 2026: 35 cases × 2 runs, each run with the plugin and without it as a baseline, graded by an LLM judge (Claude Haiku). No run errors.

| Skill | With plugin | Without |
|---|---|---|
| design-direction | 15/16 | 12/16 |
| motion | 17/18 | 13/18 |
| typography | 11/16 | 5/16 |
| ui-review | 19/20 | 16/20 |

| Case | With plugin | Without | Note |
|---|---|---|---|
| dir-01-bakery | 2/2 | 2/2 |  |
| dir-02-budget-dashboard | 2/2 | 1/2 |  |
| dir-03-existing-direction | 2/2 | 1/2 |  |
| dir-04-modern-saas | 2/2 | 0/2 |  |
| dir-05-cream-terracotta | 1/2 | 2/2 | Grader inconsistency: failing answer keeps the requested brand look without comment |
| dir-06-testimonials | 2/2 | 2/2 |  |
| dir-07-redesign-brand | 2/2 | 2/2 |  |
| dir-08-small-change | 2/2 | 2/2 |  |
| motion-01-tab-slide | 1/2 | 0/2 | Grader inconsistency: failing answer recommends against the slide and ships the indicator-only alternative |
| motion-02-cmdk | 2/2 | 1/2 |  |
| motion-03-dropdown-web | 2/2 | 2/2 |  |
| motion-04-expo-sheet | 2/2 | 2/2 |  |
| motion-05-swiftui-balance | 2/2 | 0/2 |  |
| motion-06-loading-list | 2/2 | 2/2 |  |
| motion-07-review-css | 2/2 | 2/2 |  |
| motion-08-onboarding-success | 2/2 | 2/2 |  |
| motion-09-project-tokens | 2/2 | 2/2 |  |
| rev-01-login-blockers | 2/2 | 0/2 |  |
| rev-02-dense-documented | 2/2 | 2/2 |  |
| rev-03-nothing-to-review | 2/2 | 2/2 |  |
| rev-04-aria-swap | 2/2 | 2/2 |  |
| rev-05-token-lighter | 2/2 | 2/2 |  |
| rev-06-fake-testimonial | 2/2 | 1/2 |  |
| rev-07-not-verified | 2/2 | 2/2 |  |
| rev-08-clean-screen | 2/2 | 2/2 |  |
| rev-09-shared-root-cause | 1/2 | 1/2 | Partial: right fix at the token, but does not always list every affected location |
| rev-10-delete-account | 2/2 | 2/2 |  |
| type-01-scale | 1/2 | 0/2 | Grader inconsistency: failing answer delivers the default role-based scale |
| type-02-playfair | 0/2 | 1/2 | Real minor miss: requests a Playfair weight it does not use |
| type-03-review-card | 2/2 | 1/2 |  |
| type-04-swiftui-balance | 2/2 | 0/2 |  |
| type-05-rn-scaling | 0/2 | 0/2 | Known limitation: the skill does not load for a one-line "just tell me how" question |
| type-06-eyebrows | 2/2 | 0/2 |  |
| type-07-prices | 2/2 | 1/2 |  |
| type-08-project-tokens | 2/2 | 2/2 |  |

## How to run

```bash
claude plugin eval . --runs 2 -j 4
```

Each run uses your own Claude usage. A full run is 140 agent runs (35 cases × 2 runs × 2 arms) and cost about $8 on 2 Nov 2026.
