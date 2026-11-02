# project-design-kraf

Design craft for AI agents. Five skills that take UI from "works" to "well made":

| Skill | What it does |
|---|---|
| `design-direction` | Commits to a clear visual direction before any code |
| `typography` | Type scale, line height, measure and font loading by role |
| `motion` | Easing, durations, springs and loading states for CSS, Expo and SwiftUI |
| `ui-review` | One scored review, findings ranked by severity |
| `fintech-review` | Extra checks for screens that show or move money: balances, masking, step-up, transfers, receipts, and the project's own banking rules |

Pure Markdown: no scripts, hooks or installers.

## Install

In Claude Code (2.1.275 or later):

```
/plugin install project-design-kraf --marketplace fareezidzuan/project-design-kraf
```

Or add the marketplace first, then install from it:

```
/plugin marketplace add fareezidzuan/project-design-kraf
/plugin install project-design-kraf@project-design-kraf
```

Works well alongside [project-workflow-skills](https://github.com/fareezidzuan/project-workflow-skills), whose `brand-style-profile` skill writes the `DESIGN.md` these skills read.

## Project config

Put your own tokens and decisions in `DESIGN.md` (or `.design/system.md`) at your project root and every skill will use them. The format is in `skills/design-direction/references/system-template.md`. Keep client-specific rules in the client's own repo, not here.

## Tests

42 eval cases run with `claude plugin eval`. Latest results are in [docs/evals/RESULTS.md](docs/evals/RESULTS.md).

## Credits

Built on the work of Emil Kowalski, LottieFiles, Wondel.ai, Vercel Labs, Paul Bakaus (Impeccable), Anthropic, Leonxlnx (Taste Skill), Hallmark, Damola Akinleye (Interface Design), Jakub Krehel, ehmo (platform-design-skills) and Lochie Axon (Skullet). See [NOTICE.md](NOTICE.md).

## License

Apache 2.0
