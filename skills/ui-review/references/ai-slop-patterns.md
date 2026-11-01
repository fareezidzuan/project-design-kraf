# Generic and generated-looking patterns

The full list lives in the `design-direction` skill: `references/defaults.md`. This file covers how to **review** for them.

## How to flag

1. **Check for a reason first.** If `.design/system.md`, the brief or the brand calls for the pattern, it is not a finding.
2. **Flag the pattern, not the taste.** "Every section uses the same fade-up entrance and identical icon cards" is a finding. "I'd prefer a serif" is not.
3. **Severity is usually Polish.** It becomes Major when generic structure hurts the task: a KPI row that buries the screen's actual answer, identical cards that flatten hierarchy, decorative motion that slows a frequent action.
4. **It's a Blocker only when it's dishonest**: invented proof, fake product screenshots presented as real, success states with nothing behind them.

## Quick specificity tests

| Test | How | A finding when |
|---|---|---|
| **Competitor swap** | Replace the product name with a competitor's | Nothing on the screen would need to change |
| **Font swap** | Imagine the usual default font and a template layout | The screen would look the same |
| **Signature** | Point to the elements that belong only to this product | You can't point to any |
| **Token names** | Read the design tokens aloud | They describe values (`gray-700`) and nothing in the system reflects the product |

## The most common patterns to look for

- Icon-in-a-tinted-square feature cards in rows of three; KPI tiles with icons in coloured circles.
- Everything in identical rounded cards with the same soft shadow; cards inside cards.
- Decorative tracked-uppercase labels above every heading; pill badges above heroes.
- One word of a headline set apart in italic or colour.
- Gradient text, glow halos, blurred blobs, glass panels as decoration.
- Monospace used as a "technical" costume for labels.
- Middle-dot meta strings and arrows appended to every link.
- Fade-and-rise on every section; hover lift on every card.
- Fake dashboards of grey bars; hand-drawn browser chrome around non-screenshots.
- Placeholder names and filler words in shipped copy ("seamless", "unlock", "empower").
