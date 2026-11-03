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

**New to GitHub?** You don't need an account, Git, or the terminal. Pick the Claude app you use. Download links work once a release has been published.

| Download | Use it for |
|---|---|
| [All five skills (plugin)](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/project-design-kraf-plugin.zip) | Cowork, or any Claude app that installs plugins |
| [design-direction](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/design-direction.zip) · [typography](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/typography.zip) · [motion](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/motion.zip) · [ui-review](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/ui-review.zip) · [fintech-review](https://github.com/fareezidzuan/project-design-kraf/releases/latest/download/fintech-review.zip) | Claude desktop or web app: upload one skill at a time |

### Claude desktop or web app (claude.ai)
1. Download the skill ZIPs you want. Don't unzip them.
2. In Claude, open **Settings → Capabilities** and make sure code execution and file creation is on.
3. Under **Skills**, choose **Upload skill** and pick one ZIP. Repeat for each skill.
4. Try: "Review this screen" with a screenshot or Figma link.

### Claude Cowork
1. Download the **All five skills (plugin)** ZIP.
2. In Cowork, open the plugins area, choose upload, and pick the ZIP.
3. Give Claude access to your project folder so it can read `DESIGN.md`.

### Claude Code (terminal, 2.1.275 or later)

```
/plugin install project-design-kraf --marketplace fareezidzuan/project-design-kraf
```

Or add the marketplace first, then install from it:

```
/plugin marketplace add fareezidzuan/project-design-kraf
/plugin install project-design-kraf@project-design-kraf
```

Menu names in the Claude apps change from time to time. If a step doesn't match what you see, search the Claude help centre for "upload skill" or "install plugin".

### Updating
Claude Code can auto-update from the marketplace. In the desktop and web app or Cowork, check [CHANGELOG.md](CHANGELOG.md), download the new ZIP, and upload it in place of the old one.

Works well alongside [project-workflow-skills](https://github.com/fareezidzuan/project-workflow-skills), whose `brand-style-profile` skill writes the `DESIGN.md` these skills read.

## No Git? No problem
None of these skills need Git or code. Share a Figma link, screenshot or export and ask for a review; `ui-review` writes findings by screen and layer instead of file and line. To review changes, give the before and after.

Starter prompts:
- "Review this checkout screen" (with a screenshot or Figma link)
- "Here's the old and new version of our home page. Did the change make it worse?"
- "We're designing a bakery website. Help me pick a visual direction."
- "Is this type scale OK for a banking app?"
- "Should this button animate when tapped?"

If a technical term comes up, the [plain-language glossary](https://github.com/fareezidzuan/project-workflow-skills/blob/main/skills/project-repo-setup/references/plain-language.md) explains Git terms with Figma comparisons.

## Project config

Put your own tokens and decisions in `DESIGN.md` (or `.design/system.md`) at your project root (the repo, or your project folder if you don't use Git) and every skill will use them. The format is in `skills/design-direction/references/system-template.md`. Keep client-specific rules in the client's own repo, not here.

## For maintainers

Release ZIPs are built by `.github/workflows/release-zips.yml` when a GitHub release is published (`scripts/build-skill-zips.sh` builds them locally). Each ZIP includes `LICENSE`, `NOTICE.md` and `licenses/`.

## Tests

42 eval cases run with `claude plugin eval`. Latest results are in [docs/evals/RESULTS.md](docs/evals/RESULTS.md).

## Credits

Built on the work of Emil Kowalski, LottieFiles, Wondel.ai, Vercel Labs, Paul Bakaus (Impeccable), Anthropic, Leonxlnx (Taste Skill), Hallmark, Damola Akinleye (Interface Design), Jakub Krehel, ehmo (platform-design-skills) and Lochie Axon (Skullet). See [NOTICE.md](NOTICE.md).

## License

Apache 2.0
