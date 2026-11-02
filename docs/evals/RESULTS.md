# Eval results

## Release run (2 Nov 2026, Sonnet judge)

**With plugin: 76/84 (90%) · Without: 47/84 (56%)** — 42 cases × 2 runs, each run with and without the plugin, graded by Claude Sonnet (`--judge-model sonnet`). No run errors.

| Skill | With plugin | Without |
|---|---|---|
| design-direction | 14/16 | 10/16 |
| motion | 18/18 | 9/18 |
| typography | 13/16 | 7/16 |
| ui-review | 17/20 | 11/20 |
| fintech-review | 14/14 | 10/14 |

Below 2/2 with the plugin: dir-02 (1/2), dir-03 (1/2, asked for the missing code first but applied the project direction), rev-05 (0/2, correct finding and fix but not labelled Blocker/Introduced), rev-09 (1/2), type-02 (1/2, loads an unused font weight), type-05 (0/2, known limitation: the skill does not load for a one-line "just tell me how" question).

---

## Earlier run (Haiku judge)

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

## fintech-review (added 2 Nov 2026)

| Case | With plugin | Without | Note |
|---|---|---|---|
| fin-01-transfer-review | 2/2 | 2/2 | |
| fin-02-card-number | 2/2 | 0/2 | |
| fin-03-timeout-success | 2/2 | 2/2 | |
| fin-04-loading-balance | 2/2 | 2/2 | |
| fin-05-money-out-red | 2/2 | 2/2 | Haiku judge failed both with-plugin runs; re-graded with `--judge-model sonnet`: 2/2. Answer meets every criterion |
| fin-06-missing-rules | 2/2 | 0/2 | |
| fin-07-balance-vs-limit | 2/2 | 1/2 | |

**fintech-review: 14/14 with plugin · 9/14 without** (fin-05 re-graded with Sonnet).

## Judge model

The default judge (Claude Haiku) sometimes fails correct answers, especially long ones that open with a note about the empty test workspace. For release checks, grade with a stronger judge:

```bash
claude plugin eval . --runs 2 -j 4 --judge-model sonnet
```

## How to run

```bash
claude plugin eval . --runs 2 -j 4
```

Each run uses your own Claude usage. A full run is 140 agent runs (35 cases × 2 runs × 2 arms) and cost about $8 on 2 Nov 2026.
