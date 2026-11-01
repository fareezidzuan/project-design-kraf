# Typography review checklist

Report: **Severity · Where · Now · Change to · Why**, one row per root cause listing every location.

## High (blocks shipping)

| Check | Fix |
|---|---|
| Text clips, overlaps or disappears at 200% zoom, largest Dynamic Type, or Android font scale 1.3 | Let containers grow; wrap instead of fixed heights |
| Truncated content with no way to read the full text | Add expand, tooltip or detail view |
| Body or UI text below the floor (web 12px, iOS 11pt) or unreadable contrast | Raise size or contrast |
| Font scaling disabled (`allowFontScaling={false}`, fixed point sizes in SwiftUI, px-only body) | Re-enable; cap growth only where layout truly can't adapt |
| Inputs under 16px on iOS web with no override | Apply one of the 16px input fixes |

## Medium (breaks the system)

| Check | Fix |
|---|---|
| Sizes outside the scale (13, 15, 17, 23px scattered) | Map to roles |
| Adjacent roles too similar to read as different | Merge, or separate by size + weight + colour |
| Subordinate heading larger or heavier than its parent | Re-map heading levels |
| Body line height under 1.4 on wrapping text | 1.5–1.65 |
| Long-form text with no max width | Cap at 45–75 characters |
| Light weights (100–300) under 28px | 400+ |
| Faux bold/italic (weight not loaded) | Load the face, or use a shipped weight |
| More than one family without a named job | Remove or justify |
| Changing numbers without tabular figures | Tabular figures |
| Money or dates built by string concatenation | Locale formatting |
| Weight change on hover | Change colour or underline instead |

## Low (polish)

| Check | Fix |
|---|---|
| No negative tracking on large headings | −0.01 to −0.03em by size |
| Tracked uppercase eyebrow above every heading | Sentence case, or fold into the heading |
| Unbalanced headings, lone last words | `text-wrap: balance` / `pretty` |
| `...`, `--`, straight quotes, hyphen ranges in UI copy | Typographic characters |
| Justified text in UI | Align to start |
| Px line heights or tracking on the web | Unitless / em |
| Font smoothing set per component | Root only |
| Text unselectable without reason | Remove `user-select: none` |

## Verification

State how each check was verified (source, computed styles, device or simulator at large text sizes). List anything **not verified**.
