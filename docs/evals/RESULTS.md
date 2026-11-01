# Eval results

Run with `claude plugin eval . --runs 2` (each case runs with the plugin and without it as a baseline; graded by an LLM judge). Latest valid results, 1 Nov 2026.
**With plugin: 59/70 (84%) · Without: 46/70 (66%)**


| Case | With plugin | Without | Note |
|---|---|---|---|
| dir-01-bakery | 2/2 | 2/2 |  |
| dir-02-budget-dashboard | 2/2 | 2/2 |  |
| dir-03-existing-direction | 2/2 | 1/2 |  |
| dir-04-modern-saas | 2/2 | 0/2 |  |
| dir-05-cream-terracotta | 1/2 | 2/2 | 1 of 2: one run still commented on the requested brand look |
| dir-06-testimonials | 2/2 | 2/2 |  |
| dir-07-redesign-brand | 2/2 | 2/2 |  |
| dir-08-small-change | 2/2 | 2/2 |  |
| motion-01-tab-slide | 2/2 | 0/2 |  |
| motion-02-cmdk | 2/2 | 1/2 |  |
| motion-03-dropdown-web | 2/2 | 1/2 |  |
| motion-04-expo-sheet | 0/2 | 0/2 | grader loosened after this run (answer used @gorhom/bottom-sheet, a valid standard choice); not yet re-run |
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
| rev-06-fake-testimonial | 2/2 | 2/2 |  |
| rev-07-not-verified | 2/2 | 2/2 |  |
| rev-08-clean-screen | 0/2 | 0/2 | grader loosened after this run (answer was a correct clean review); not yet re-run |
| rev-09-shared-root-cause | 0/2 | 2/2 | real minor miss: right fix at the token, but does not list all six locations |
| rev-10-delete-account | 2/2 | 2/2 |  |
| type-01-scale | 2/2 | 0/2 |  |
| type-02-playfair | 1/2 | 0/2 | real minor miss: loads a font weight it does not use |
| type-03-review-card | 2/2 | 2/2 |  |
| type-04-swiftui-balance | 2/2 | 1/2 |  |
| type-05-rn-scaling | 0/2 | 0/2 | KNOWN LIMITATION: skill does not load for a one-line "just tell me how" question |
| type-06-eyebrows | 2/2 | 0/2 |  |
| type-07-prices | 1/2 | 2/2 | judge inconsistency: failing answer contains every required element |
| type-08-project-tokens | 2/2 | 2/2 |  |

## How to run

```bash
claude plugin eval . --runs 2 -j 4
```

Each run uses your own Claude usage; a full run is 140 agent runs (35 cases × 2 runs × 2 arms).
